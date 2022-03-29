# frozen_string_literal: true

require 'csv'
# class task one
class TaskOne
  @@months = {
    '1' => 'Jan',
    '2' => 'Feb',
    '3' => 'Mar',
    '4' => 'Apr',
    '5' => 'May',
    '6' => 'Jun',
    '7' => 'Jul',
    '8' => 'Aug',
    '9' => 'Sep',
    '10' => 'Oct',
    '11' => 'Nov',
    '12' => 'Dec'
  }
  def initialize(year, city)
    @files = Dir["./#{city}/#{city}_#{year}_*"]
  end

  def calculate_hig_temp(name, row_num, type, print_statement, degre)
    max_temperature = []
    date_hash = {}
    @files.each do |file|
      File.readlines(file).each do |line|
        max_temperature << line.split(',')[row_num]
        date_hash[line.split(',')[0]] = line.split(',')[row_num]
      end
    end
    remove_name = max_temperature.filter { |i| i != name }
    remove_empty = remove_name.filter { |i| i != '' }
    element_to_integer = remove_empty.map { |i| i.to_i }
    highest_temp = if type == 'max_temp'
                     element_to_integer.max
                   elsif type == 'min_temp'
                     element_to_integer.min
                   else
                     element_to_integer.max
                   end
    max_temp = date_hash.filter { |_key, value| value.to_i == highest_temp }
    date_max_array = max_temp.keys[0].split('-')
    puts "#{print_statement}:#{highest_temp}#{degre} on #{@@months[date_max_array[1].to_s]} #{date_max_array[2]}"
  end

  def printing_data
    calculate_hig_temp('Max TemperatureC', 1, 'max_temp', 'Higest', 'C')
    calculate_hig_temp('Min TemperatureC', 3, 'min_temp', 'Lowest', 'C')
    calculate_hig_temp('Max Humidity', 7, 'humid', 'Humaid', '%')
  end
end
