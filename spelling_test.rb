#!/usr/bin/ruby

require "minitest"
require "minitest/autorun"
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
