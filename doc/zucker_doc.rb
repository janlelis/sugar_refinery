# Ruby 1.9, encoding: utf-8
#  creates the documentation for Zucker

require 'yaml'
require 'coderay'

class ZuckerDoc
  PACKAGES     = %w|default debug|
  ORDER        = %w|summary why methods info spec source versions discussion|
  DESCRIPTIONS = {
    'summary'  => 'Summary',
    'why'      => 'Why?',
    'methods'  => 'Methods/Usage',
    'info'     => 'Further information',
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
      @changelog = File.read File.join( @path, 'CHANGELOG' )
      @changelog.gsub! /\| Zucker (?<version>\d+)/ do
        version = $~[:version].to_i
        if version && version > 0
          %{| <a href="http://rubyzucker.info/#{version}/">Zucker #{version}</a>}
        elsif version && version == 0
          %{| <a href="http://rubyzucker.info/rubyzucker.pdf">Zucker 0<a>}
        else
          $& # no changes
        end
      end


      # collect description files and turn them to html
      cubes = Dir[ File.join(path, 'desc', '*.yaml') ].inject({}) do |res, cube_file; a|
        a = YAML.load_file cube_file
        if a.instance_of? Hash
          res.merge a
        else
          res
        end
      end

      output_path = File.join(path, 'doc', 'zucker_doc.html')

      result = DATA.read

      cubes_html = PACKAGES.map{ |pkg_name|
        package pkg_name, cubes.select{|name, hash| hash['package'] == pkg_name }
      }.join

      # insert cubes
      result.sub! '....', cubes_html
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
    end

  protected

    def package(name, cubes)
      cube_html = cubes.sort.map{ |name, hash|
        cube name, hash
      }.join

      %{
      <h2 title="require 'zucker/#{name}'">Cubes[#{name}]</h2>
        <div class="cubes">
        #{cube_html}
        </div> }
    end

    def cube(name, hash)
      @cube_name = name
      %{ <h3 title="require 'zucker/#{name}'">#{ name }</h3>
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
        "<h5>#{name}</h5>" +
        "<pre class=\"usage source\" style=\"display:block\">#{ syntax_highlight usage }</pre>"
      }.join
    end

    def info(i)
      convert_html_chars i.join '<br/>'
    end

    def authors(a)
      a.map{ |author|
        author +
        ( (tmp = @meta[author]) ? " | #{ tmp }" : '' )
      }.join '<br/>'
    end

    def why(w)
      if w.is_a? Array
        w = w.map{|e| "<p>#{e}</p>"}.join
      end
      convert_html_chars w
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

    def convert_html_chars(string, protect_spaces = false)
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
    <img src="ruby.png" class="rubylogo" />
    <h1>Ruby Zucker ..version..</h1>
      <h2 style="clear:both">What is it?</h2>
      <p class="text">Zucker (<a href="http://www.forvo.com/word/zucker/">pronunciation</a>) is the German word for sugar. It adds syntactic sugar in the form of independent, small scripts that make Ruby even more sweet. It adds a lot of useful helper methods for an improved readability and usage. Everything is documented on this page.</p>
      <p class="text">Read <a href="http://rbjl.net/32-introducing-ruby-zucker-a-new-syntactical-sugar-gem">this blog post</a> for some more examples. See the <a href="http://wiki.github.com/janlelis/zucker">github wiki</a> for discussion and information about contributing.</p>

      <h2>Install</h2>
      <p class="text">
        <code class="scode">gem install zucker # might need sudo</code>
      </p>

      <h2>Usage / organisation</h2>
      <p class="text">The gem consists of many small snippets, called <em>cubes</em>, which are bundled in <em>packages</em>. Currently, there are two packages available: <strong>default</strong> and <strong>debug</strong>. You can use a package by requiring it in this way:
      <code class="scode">require 'zucker/default'</code>
      and
      <code class="scode">require 'zucker/debug'</code>

      Since there aren't any dependencies within the gem, you could also pick only the cubes you want:

      <code class="scode">require 'zucker/egonil'</code>

      You can also lock your ⇧require⇧ to a specific version of Zucker by simply putting the version before the cube name in this way:

      <code class="scode">require 'zucker/1/egonil'</code>

      Future releases of the gem will include all previous (main) versions, so the behaviour of these directly required cubes will not change (except for critical bugs)</p>

      <h3 style="padding-left:1.3em">What methods and constants are added directly to the global namespace by the <em>default</em> package?</h3>
      <p class="text">

      <code class="scode">Info, RubyVersion, RubyEngine, OS, Infinity, NaN, alias_for, aliases_for, egonil, nn, iterate, instance_variables_from, ivars, activate_warnings!, deactivate_warnings!, executed_directly?, standalone?, library?, ignore_sigint!, sandbox, square_brackets_for, tap_on, make_new</code>
      </p>

       ....

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

