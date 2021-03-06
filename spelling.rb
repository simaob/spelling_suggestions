#!/usr/bin/env ruby

class Spelling

  def initialize(file_name)
    if File.file?(file_name)
      @file_name = file_name
    else
      puts "Invalid file"
    end
  end

  def run
    process_file
    process_blocks
  end

  def process_blocks
    File.open('OUTPUT.txt', 'wb') do |file|
      @blocks.each do |block|
        comparison = block[0]
        file << ((lcs(block[0], block[1]) > lcs(block[0], block[2])) ? block[1] : block[2]) + "\n"
      end
    end
  end

  def lcs(input, hypothesis)
    count = 0
    substring_index = 0
    matching = ""
    for i in 0...input.length
      for h in substring_index...hypothesis.length
        if input[i] == hypothesis[h]
          count += 1
          matching += input[i]
          substring_index = h+1
          break
        end
      end
    end
    #puts count
    #puts matching
    count
  end

  def process_file
    counter = 0
    @blocks = []
    current_case = []
    File.open(@file_name, "rb").each do |line|
      if (counter == 0)
        @cases = Integer(line)
      else
        if line.strip == ""
          if current_case.length == 3
            @blocks << current_case
            current_case = []
          end
        else
          current_case << line.strip
        end
      end
      counter += 1
    end
    if (current_case.length == 3)
      @blocks << current_case
    end
  end

end

ARGV.each do |file_name|
  spelling = Spelling.new(file_name)
  spelling.run
end
