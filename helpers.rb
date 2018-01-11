require 'benchmark'

module BigO
  module Helpers
    def do_benchmark(title = nil)
      puts title unless title.nil?
      Benchmark.bm do |benchmark|
        benchmark.report do
          yield
        end
      end
    end
  end
end