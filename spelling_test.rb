#!/usr/bin/ruby

require "minitest/autorun"

class TestSpelling < Minitest::Test

  def setup
    Spelling.new("SAMPLE_INPUT.txt")
  end

end
