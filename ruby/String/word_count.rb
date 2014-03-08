#this is an implementation of the unix wc utility in ruby

class WordCount
  def initialize file_name
    @file                = file_name
    read_file
  end

  def read_file
    @string = File.open(@file).read
  end

  def word_count
    @word_count = @string.split.count
  end

  def line_count
    @line_count = @string.split("\n").count
  end

  def byte_count
    @byte_count = @string.bytesize
  end

  def character_count
    @character_count = @string.length
  end

  def longest_line_bytesize
    @longest_line_length =  @string.split("\n").map { |line| line.bytesize }.max
  end
end

def test
  file_name = "test_data/example.txt"
  wc        = WordCount.new(file_name)

  puts wc.word_count            == %x(wc -w #{file_name}).split.first.to_i

  #unix wc returns one less line than a human would consider there to be
  puts wc.line_count            == %x(wc -l #{file_name}).split.first.to_i + 1
  
  puts wc.byte_count            == %x(wc -c #{file_name}).split.first.to_i
  puts wc.character_count       == %x(wc -m #{file_name}).split.first.to_i
  puts wc.longest_line_bytesize == %x(wc -L #{file_name}).split.first.to_i
end
