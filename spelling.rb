#!/usr/bin/env ruby

class Spelling

  def initialize(file_name)
    if File.file?(file_name)
      process_file(file_name)
      process_blocks
    else
      puts "Invalid file"
    end
  end

  def process_blocks
    @blocks.each do |block|
      comparison = block[0]
      correct = (lcs(block[0], block[1]) > lcs(block[0], block[2])) ? block[1] : block[2]
  end

  def lcs(input, hypothesis)

  end

  def process_file(file_name)
    counter = 0
    @blocks = []
    current_case = []
    File.open(file_name, "rb").each do |line|
      puts line
      if (counter == 0)
        puts line
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
    puts "cases: " + @cases.to_s
    puts @blocks.inspect
  end

end

ARGV.each do |file_name|
  spelling = Spelling.new(file_name)
end
