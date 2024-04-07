require 'digest'
def most_common_content(directory)
  Dir.glob("#{directory}/**/*").each do |file_path|
    next unless File.file?(file_path)
    file_content = File.read(file_path)
    file_content_counts[file_content] += 1
  end
  most_common_content, count = file_content_counts.max_by { |_, count| count }
  return most_common_content, count
end

puts "Enter the path of the directory to scan:"
directory_path = gets.chomp

if directory_path.empty?
  puts "directory path cannot be empty."
  exit
end

most_common, count = most_common_content(directory_path)
puts "Most common content: #{most_common}, count: #{count}"