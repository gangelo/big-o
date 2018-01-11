require_relative 'helpers'

# BIG-O Examples

=begin
  An equation that describes how an algorithm's run-time scales with respect to
  some input variables.
=end

# http://bigocheatsheet.com/
# https://stackoverflow.com/questions/487258/what-is-a-plain-english-explanation-of-big-o-notation
# https://www.youtube.com/watch?v=__vX2sjlpXU
# https://www.youtube.com/watch?v=v4cd1O4zkGw

module BigO
  class Test
    include Helpers

    private

    attr_accessor :n

    public

    def initialize(n)
      print_header("Running examples (n = #{n})...")
      @n = n
    end

    # O(1) examples.
    #
    # When we say that something is O(1) it means that its speed doesn't depend on
    # the size of its data set.

    # These should all take the same amount of time.
    def o1
      hasher = {}
      (0...@n).each do |n|
        sym = n.to_s.to_sym
        hasher[sym] = n
      end

      print_header('O(1) examples')

      hash_count = hasher.count
      do_benchmark("O(1) - Hash with #{hash_count} items") do
        hasher[hash_count.to_s.to_sym]
      end

      self
    end


    # O(n) examples.
    #
    # Array#find is O(n). That means Array#find depends linearly on the number of
    # items in the array. An array with 100 items will take 100 times longer to
    # search than an array with one item.
    #
    # A lot of code that iterates over arrays follows the O(n) pattern.
    def on
      print_header('O(n) examples')

      array = (0...@n)
      array_count = array.count
      do_benchmark("O(n) - Array with #{array_count} items") do
        array.each do |n|
          ; # noop
        end
      end

      self
    end

    # O(n^2) examples.
    #
    # Code that fits an O(n^2) profile tends to involve nested loops. That makes
    # sense if you think about it. One loop gives you O(n), a second nested loop
    # gives you O(n^2). If — for some unholy reason — you had a 5-level nested
    # loop, it'd be O(n^5).

    def on2
      print_header('O(n^2) examples')

      array = (0...@n)
      array_count = array.count
      do_benchmark("O(n^2) - Array with #{array_count} items within nested loop") do
        array.each do |n1|
          array.each do |n2|
            ; # noop
          end
        end
      end

      self
    end

    # O(n log n) examples (none available)
    #
    # O(n log n) code is often the result of someone finding a clever way to reduce
    # the amount of work that an otherwise O(n^2) algorithm would do.
    #
    # You wouldn't be able to just look at a piece of code and tell it's O(n log n).
    # This is where the higher math comes in, and it's also where I bow out.
    #
    # But it is important to know about O(n log n) because it describes a lot of
    # common search algorithms. Ruby's Array#sort uses the venerable quicksort
    # algorithm, which on average is O(n log n) and worst-case is O(n^2).
    #
    # http://me.dt.in.th/page/Quicksort/
    def on_log_n
      print_header('O(n log n) examples')
      puts 'No tests available.'
      self
    end

    private

    def print_header(header)
      puts "\n\n*** #{header} ***\n\n"
    end
  end
end

print 'Enter n: '
n = $stdin.gets.strip.to_i

big_o = BigO::Test.new(n)
big_o.o1.on.on2.on_log_n

puts 'Done.'













