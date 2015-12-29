require 'sugar_refinery/dir_utils'
require 'securerandom'
using SugarRefinery::DirUtils


describe Dir do
  describe '.join' do
    it 'delegates to File.join' do
      a = %w[some file path]
      expect( Dir.join(a) ).to be == File.join(a)
    end
  end

  describe '.split' do
    it 'delegates to File.split' do
      a = 'some/file/path'
      expect( Dir.split(a) ).to be == File.split(a)
    end
  end

  describe '.rm' do
    it 'removes directories with content' do
      path = "tmp_#{SecureRandom.uuid}"
      FileUtils.mkdir path
      FileUtils.touch "#{path}/123"
      expect{
        Dir.rm path
      }.not_to raise_error
      expect( Dir['*'] ).to_not include(path)
    end
  end
end
