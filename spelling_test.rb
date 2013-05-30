#!/usr/bin/ruby

require "minitest"
require "minitest/autorun"
require "minitest/benchmark" #if ENV["BENCH"]
require "./spelling"

class TestSpelling < Minitest::Test

  def setup
    @spelling = Spelling.new("SAMPLE_INPUT.txt")
  end

  def test_lcs_returns_correct_value
    assert_equal 2, @spelling.lcs("abc", "bsdsc")
    assert_equal 0, @spelling.lcs("", "")
  end
end

class BenchSpelling < Minitest::Benchmark
  def setup
    @spelling = Spelling.new("SAMPLE_INPUT.txt")
  end
  def bench_my_algorithm
    assert_performance_linear 0.9999 do |n| # n is a range value
      @spelling.run
    end
  end
end

