if defined? BasicObject # 1.9 only
  require 'zucker/case'

  describe 'String#to_camel' do
    it 'should turn a snake_cased string to CamelCase' do
      'was_snake_case'.to_camel.should == 'WasSnakeCase'
    end
  end

  describe 'String#to_snake' do
    it 'should turn a CamelCased string to snake_case' do
      'WasCamelCase'.to_snake.should == 'was_camel_case'
    end
  end
end
