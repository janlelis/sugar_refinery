require "sugar_refinery/array_stats"
using SugarRefinery::ArrayStats

describe "doing statistics on arrays" do
  let(:list) { (2..5).to_a }

  describe "Array#mean" do
    it "should return the average" do
      list.mean.should == 3.5
    end
  end

  describe "Array#stdev_sample" do
    it "should return the standard deviation of the sample" do
      list.stdev_sample.should be_close(1.2909944487358056, 1e-8)
    end
  end

  describe "Array#stdev_population" do
    it "should return the standard deviation of the population" do
      list.stdev_population.should be_close(1.118033988749895, 1e-8)
    end
  end

  describe "Array#stdev" do
    it "should default to population" do
      list.stdev.should be_close(list.stdev_population, 1e-8)
    end

    it "should delegate sample correctly" do
      list.stdev(:sample).should be_close(list.stdev_sample, 1e-8)
    end

    it "should delegate population correctly" do
      list.stdev(:population).should be_close(list.stdev_population, 1e-8)
    end

    it "should raise an error with any other key" do
      expect { list.stdev(:pony) }.to raise_error(ArgumentError)
    end
  end

  describe "Array#z_score" do
    it "should default to population" do
      list.z_score.zip(list.z_score(:population)).each do |value, actual|
        value.should be_close(actual, 1e-8)
      end
    end

    it "should delegate sample correctly" do
      sample_z_score = [
        -1.161895003862225,
        -0.3872983346207417,
        0.3872983346207417,
        1.161895003862225
      ]

      p list

      list.z_score(:sample).zip(sample_z_score).each do |value, actual|
        value.should be_close(actual, 1e-8)
      end
    end

    it "should delegate population correctly" do
      population_z_score = [
        -1.3416407864998738,
        -0.4472135954999579,
        0.4472135954999579,
        1.3416407864998738
      ]

      list.z_score(:population).zip(population_z_score).each do |value, actual|
        value.should be_close(actual, 1e-8)
      end
    end

    it "should raise an error with any other key" do
      expect { list.z_score(:pony) }.to raise_error(ArgumentError)
    end
  end
end
