def file_to_array(file_name)
    text = []
    File.read(file_name).each_line do |line|
      text << line.chop.to_i
    end
    text
end