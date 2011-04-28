# Ruby 1.9, encoding: utf-8
#  creates the documentation for Zucker

require 'yaml'
require 'coderay'

class ZuckerDoc
  ORDER        = %w|summary why methods info spec source versions discussion|
  DESCRIPTIONS = {
    'summary'  => 'Summary',
    'why'      => 'Why?',
    'methods'  => 'Methods/Usage',
    'info'     => 'Information',
    'spec'     => 'Specification',
    'source'   => 'Source',
    'versions' => 'Compatibility',
    'authors'  => 'Authors',
    'discussion'  => 'Discussion',
  }


  class << self
    def generate(path = '../')
      @path = path

      # get version / date
      require File.join( @path, 'lib/zucker' )
      @version = Zucker::VERSION
      @date    = Zucker::DATE

      # include + format changelog
      @changelog = replace_html_special_chars File.read File.join( @path, 'CHANGELOG' )
      @changelog.gsub! /\| Zucker (?<version>\d+)/ do
        version = $~[:version].to_i
        if version && version > 0
          %{| <a href="http://rubyzucker.info/#{version}/">Zucker #{version}</a>}
        elsif version && version == 0
          %{| <a href="http://rubyzucker.info/rubyzucker.pdf">Zucker 0</a>}
        else
          $& # no changes
        end
      end

      # build package list
      @packages = Zucker::PACKAGES.map{ |pkg, _|
      descriptions = {
        :env        => 'Cubes for collecting information.',
        :to_proc    => 'Adds some ⇧to_proc⇧ extensions to use with ⇧&amp;⇧.',
        :object     => 'Extensions for ⇧Object⇧.',
        :debug      => 'Print debugging tools.',
        :extensions => 'More extensions for Ruby base classes.',
        :control    => 'Cubes that change program behaviour.',
        :shortcuts  => 'Cubes that save you keystrokes or disambiguate things.',
      }
        %{ <li><a href="##{pkg}" style="text-decoration:none;font-weight:bold;">#{pkg}</a>: #{ descriptions[pkg] }</li> }
      }.join "\n"


      # collect description files and turn them to html
      cubes = Dir[ File.join(path, 'desc', '*.yaml') ].inject({}) do |res, cube_file; a|
        begin
          a = YAML.load_file cube_file
        rescue 
          warn "Could not load the yaml file for #{ cube_file }"
        end
        if a.instance_of? Hash
          res.merge a
        else
          res
        end
      end

      output_path = File.join(path, 'doc', 'zucker_doc.html')

      @cubes = Zucker::PACKAGES.map{ |pkg_name, cube_names|
        package pkg_name, cubes.select{|name, _| cube_names.include?( name ) }
      }.join

      result = DATA.read

      # substitute vars
      result.gsub! /\.\.([a-z]+)\.\./i do eval "@#$1" end
      # code needs to be codish ;)
      result.gsub! /⇧(.+?)⇧/, '<code>\1</code>'
      # strong
      result.gsub! /●(.+?)●/, '<strong>\1</strong>'
      # hyper→links
      result.gsub! /→(.+?)→(.+?)→/, '<a href="\2">\1</a>'

      File.open output_path, 'w' do |file|
        file.puts result
      end

      puts "created Zucker documentation at #{File.expand_path(output_path)}"
    end

  protected

    def package(name, cubes)
      cube_html = cubes.sort.map{ |name, hash|
        cube name, hash
      }.join

      %{
      <h2 title="require 'zucker/#{name}'" id="#{name}">Cubes[#{name}]</h2>
        #{ %q|<p class="text">(not included by <code>require 'zucker/default'</code>)</p>| if name == :debug }
        <div class="cubes">
        #{cube_html}
        </div> }
    end

    def cube(name, hash)
      @cube_name = name
      %{ <h3 title="require 'zucker/#{name}'" id="#{name}">#{name}</h3>
         <table class="cube_table"
                id="#{ name }_cube"
                title="require 'zucker/#{name}'"> } +

      ORDER.map{ |th|
        if %w|spec source discussion|.include?(th) || td = hash[th]
          "<tr><th>#{ DESCRIPTIONS[th] }</th>" +
          "    <td>#{ send th, td      }</td></tr>"
        end
      }.join +
      '</table>'
    end

    def methods(m)
      m.map{ |name, usage|
        "<h5>#{replace_html_special_chars name}</h5>" +
        "<pre class=\"usage source\" style=\"display:block\">#{ syntax_highlight usage }</pre>"
      }.join
    end

    def info(i)
      i.map{|e|convert_html_chars e}.join '<br/>'
    end

    def authors(a)
      a.map{ |author|
        author +
        ( (tmp = @meta[author]) ? " | #{ tmp }" : '' )
      }.join '<br/>'
    end

    def why(w)
      if w.is_a? Array
        w.map{|e| "<p>#{convert_html_chars e}</p>"}.join
      else
        convert_html_chars w
      end
    end

    def summary(s)
      convert_html_chars s
    end

    def versions(v)
      v.join ', '
    end

    def discussion(_)
      "→github wiki→http://wiki.github.com/janlelis/zucker/#{@cube_name}→"
    end

    def spec(_)
      source_helper(:spec, File.join( @path, 'spec/' ), '_spec')
    end

    def source(_)
      source_helper(:source, File.join( @path, 'lib/zucker') )
    end

    def source_helper(kind, file_prefix, suffix='')
      %{ <span id="show_#{@cube_name}_#{kind}">(<a href="javascript:show('#{@cube_name}_#{kind}')">show</a>)</span>
         <pre class="source" id="#{@cube_name}_#{kind}">#{
           get_source_file( File.join file_prefix, ( @cube_name + suffix + '.rb' ) )
         }</pre> }
    end

    def get_source_file(filename)
      if File.file? filename
        syntax_highlight( File.read(filename).strip )
      else
        '<em>FIXME: missing (please create a <a href="http://github.com/janlelis/zucker/issues">github issue</a>)</em>'
      end
    end

    def syntax_highlight(string)
      #convert_html_chars
      CodeRay.scan(string, :ruby).html
    end

    def replace_html_special_chars(string)
      # remove html special chars
      string.gsub( /&/, '&amp;' ).
             gsub( /</, '&lt;'  ).
             gsub( />/, '&gt;'  )
    end

    def convert_html_chars(string, protect_spaces = false)
      string = replace_html_special_chars( string )
      string = string.to_s.gsub( "\n", '<br/>' )

      if protect_spaces
        string.gsub(' ',' ')
      else
        string
      end
    end
  end
end

ZuckerDoc.generate *ARGV

__END__
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
       "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />

  <title>Ruby Zucker ..version..</title>
  <script type="text/javascript">
    var show = function(snippet){
      document.getElementById( snippet ).style.display = 'block'
      if( document.getElementById( 'show_'+snippet ) ){
        document.getElementById( 'show_'+snippet ).style.display = 'none'
      }
    }
  </script>
  <style type="text/css">
body{
  background-color:#aaa;
  color:#111;
  font-family:sans-serif;
}

#world{
  background:#fff;
}

h1, h2, h3, h4, h5, h6{
  margin:0px;
  padding:0px;
}

h1{
  color:#222;
  text-align:left;
  padding:0.5em;
}
h2{
  margin-left:0.5em;
  margin-top:0.8em;
  margin-bottom:0.5em;
}

th{
  width:200px;
  color:#444;
}

p{
  margin:0px;
  margin-bottom:0.5em;
}

p.text{
  margin-left:1.5em;
  margin-right:1em;
}

code{
}

.scode{
  display:block;
  margin:0.8em;
#  margin-right:1.8em;
  padding:0.5em;
  border:1px solid black;
  background:#eee;
}

#.cube_table{
#  display:none;
#}
.cubes{
  margin:0px;
  margin-left:1.5em;
  margin-right:1em;
}

a{
  color:#111;
}

table{
  margin:0.8em;
  margin-top:0.2em;
  padding:0.2em;
  border:1px solid #111;
  background:#eee;
  overflow:auto;
  display:block;
}

ul{
  margin:5px 0px !important;
  padding:none;
}

th{
  text-align:left;
  vertical-align:top;
  padding-right:3em;
}

td{
  width:100%;
}

li{
  list-style:none;
}


#foot{
  text-align:left;
  padding:0.3em;
  font-size:70%
}
#foot, #foot a{
  color:#444;
}
#smile{
  font-size:150%;
  float:right;
}
#smile a{
  text-decoration:none;
}

.small{
  font-size:70%;
}

code, pre{
  font-face:mono;
  margin:0px;
  padding:0px;
}

.source{
  display:none;
  width:98%;
  padding: 3px 5px;
  overflow: auto;
  font-size: 12px;
  background-color: #f8f8f8;
  border:1px solid #005;
  border: 1px solid silver;
  font-family: 'Courier New', 'Terminal', monospace;
  color: #000;
}

# http://coderay.rubychan.de/
.source pre { margin: 0px; }

span.source { white-space: pre; border: 0px; padding: 2px; }

table.source { border-collapse: collapse; width: 100%; padding: 2px; }
table.source td { padding: 2px 4px; vertical-align: top; }

.source .line_numbers, .source .no {
  background-color: #def;
  color: gray;
  text-align: right;
}
.source .line_numbers a:target, .source .no a:target { color: blue; }
.source .line_numbers .highlighted, .source .no .highlighted { color: red; }
.source .no { padding: 0px 4px; }
.source .code { width: 100%; }
.source .code pre { overflow: auto; }

.source .debug { color:white ! important; background:blue ! important; }

.source .an { color:#007 }
.source .at { color:#f08 }
.source .av { color:#700 }
.source .bi { color:#509; font-weight:bold }
.source .c  { color:#888; }
.source .c .dl { color:#444; }
.source .c .ch { color:#444; }

.source .ch { color:#04D }
.source .ch .k { color:#04D }
.source .ch .dl { color:#039 }

.source .cl { color:#B06; font-weight:bold }
.source .cm { color:#A08; font-weight:bold }
.source .co { color:#036; font-weight:bold }
.source .cr { color:#0A0 }
.source .cv { color:#369 }
.source .de { color:#B0B; }
.source .df { color:#099; font-weight:bold }
.source .di { color:#088; font-weight:bold }
.source .dl { color:black }
.source .do { color:#970 }
.source .dt { color:#34b }
.source .ds { color:#D42; font-weight:bold }
.source .e  { color:#666; font-weight:bold }
.source .en { color:#800; font-weight:bold }
.source .er { color:#F00; background-color:#FAA }
.source .ex { color:#C00; font-weight:bold }
.source .fl { color:#60E; font-weight:bold }
.source .fu { color:#06B; font-weight:bold }
.source .gv { color:#d70; font-weight:bold }
.source .hx { color:#058; font-weight:bold }
.source .i  { color:#00D; font-weight:bold }
.source .ic { color:#B44; font-weight:bold }

.source .il { background-color: hsla(0,0%,0%,0.1); color: black }
.source .il .idl { font-weight: bold; color: #666 }
.source .idl { font-weight: bold; background-color: hsla(0,0%,0%,0.1); color: #666; }

.source .im { color:#f00; }
.source .in { color:#B2B; font-weight:bold }
.source .iv { color:#33B }
.source .la { color:#970; font-weight:bold }
.source .lv { color:#963 }
.source .ns { color:#707; font-weight:bold }
.source .oc { color:#40E; font-weight:bold }
.source .op { }
.source .pc { color:#058; font-weight:bold }
.source .pd { color:#369; font-weight:bold }
.source .pp { color:#579; }
.source .ps { color:#00C; font-weight:bold }
.source .pt { color:#074; font-weight:bold }
.source .r, .kw  { color:#080; font-weight:bold }

.source .ke { color: #808; }
.source .ke .dl { color: #606; }
.source .ke .ch { color: #80f; }
.source .vl { color: #088; }

.source .rx { background-color:hsla(300,100%,50%,0.1); }
.source .rx .k { color:#808 }
.source .rx .dl { color:#404 }
.source .rx .mod { color:#C2C }
.source .rx .fu  { color:#404; font-weight: bold }

.source .s { background-color:hsla(0,100%,50%,0.1); }
.source .s .k { color: #D20; }
.source .s .ch { color: #b0b; }
.source .s .dl { color: #710; }

.source .sh { background-color:hsla(120,100%,50%,0.1); }
.source .sh .k { color:#2B2 }
.source .sh .dl { color:#161 }

.source .sy { color:#A60 }
.source .sy .k { color:#A60 }
.source .sy .dl { color:#630 }

.source .ta { color:#070 }
.source .ts { color:#D70; font-weight:bold }
.source .ty { color:#339; font-weight:bold }
.source .v  { color:#036 }
.source .xt { color:#444 }

.source .ins { background: hsla(120,100%,50%,0.2) }
.source .del { background: hsla(0,100%,50%,0.2) }
.source .chg { color: #aaf; background: #007; }
.source .head { color: #f8f; background: #505 }
.source .head .filename { color: white; }

.source .ins .eye { background-color: hsla(120,100%,50%,0.2) }
.source .del .eye { background-color: hsla(0,100%,50%,0.2) }

.source .ins .ins { color: #080; background:transparent; font-weight:bold }
.source .del .del { color: #800; background:transparent; font-weight:bold }
.source .chg .chg { color: #66f; }
.source .head .head { color: #f4f; }

.rubylogo{
  margin-left:20px;
  margin-top:10px;
  margin-right:15px;
  float:left;
}

  </style>
</head>
<body>
  <div id="world">
    <img class="rubylogo" alt="ruby" src="data:image/png;base64,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" />
    <h1>Ruby Zucker ..version..</h1>
      <h2 style="clear:both">What is it?</h2>
      <p class="text">Zucker (<a href="http://www.forvo.com/word/zucker/">pronunciation</a>) is the German word for sugar. It adds syntactic sugar in the form of independent, small scripts that make Ruby even more sweet. It adds a lot of useful helper methods for an improved readability and usage. Almost every Zucker feature comes with specs. Everything is documented on this page. The source is available at <a href="http://github.com/janlelis/zucker">github</a>.</p>

      <h2>Install</h2>
      <p class="text">
        <code class="scode">gem install zucker --no-rdoc --no-ri # might need sudo</code>
      </p>
      <h3 style="padding-left:1.3em">Quickstart</h3>
      <p class="text">
        <code class="scode">require 'zucker/all'</code>
      </p>
      <h2>Usage / organisation</h2>
      <p class="text">The gem consists of many small snippets, called <em>cubes</em>, which are bundled in <em>packs</em>. Since there aren't any dependencies within the gem, you can easily require only the packs or cubes you want:
        <code class="scode">require 'zucker/cube_or_pack_name'</code>
      </p>
      <h3 style="padding-left:1.3em">Packs</h3>
      <ul class="text">
        ..packages..
      </ul>
      <p class="text">
        Furthermore, there are two meta packs available: <strong>all</strong> simply requires all cubes and <strong>default</strong> requires all cubes except <strong>debug</strong>.</p>

      <h3 style="padding-left:1.3em">Which methods and constants are added directly to the global namespace by the <em>default</em> pack?</h3>
      <p class="text">

      <code class="scode">Info, RubyVersion, RubyEngine, OS, Infinity, NaN, alias_for, aliases_for, egonil, nn, iterate, instance_variables_from, ivars, activate_warnings!, deactivate_warnings!, executed_directly?, directly_executed?, standalone?, library?, ignore_sigint!, sandbox, tap_on, make_new, (blank?, present?, mcopy)</code>
      </p>

       ..cubes..
      <h2>Extras</h2>
      <p class="text">
        You can activate some additional aliases for Zucker functionality by executing:
        <code class="scode">Zucker.more_aliases! # => [:copy, :n, :init, :returning, :lib?, :RV, :RE]</code>
      </p>

      <h2>Changelog</h2>
      <div class="cubes">
        <pre class="scode">..changelog..</pre>
      </div>
<br/>
    </div>
  <div id="foot">
    <div id="smile"><a href="http://rbjl.net">J-_-L</a></div>
    This is the Ruby Zucker ..version.. documentation (..date..).
    The current version is always available at <a href="http://rubyzucker.info">rubyzucker.info</a>.
    Source at <a href="http://github.com/janlelis/zucker">github</a>.
    Ruby Logo CC-BY-SA Yukihiro Matsumoto.
  </div>

</body>
</html>

