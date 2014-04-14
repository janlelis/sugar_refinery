require "zucker"

module Zucker
  module ArrayStats
    refine Array do
      def mean
        inject(&:+) / length.to_f
      end

      def stdev(type = :population)
        case type
        when :population then stdev_population
        when :sample     then stdev_sample
        else raise ArgumentError.new("%s is not a valid argument" % type)
        end
      end

      def stdev_sample
        Math.sqrt(inject(0.0) { |sum, x| sum + (mean - x) ** 2 } / (length - 1))
      end

      def stdev_population
        Math.sqrt(inject(0.0) { |sum, x| sum + (mean - x) ** 2 } / length)
      end

      def z_score(type = :population)
        map { |x| (x - mean) / stdev(type) }
      end
    end
  end
end
