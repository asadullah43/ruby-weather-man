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

  def calculate_hig_temp(name, row_num, type, printing, degre)
    max_temperature = []
    date_hash = {}
    @files.each do |file|
      @contents = File.read(file)
      File.readlines(file).each do |line|
        max_temperature << line.split(',')[row_num]
        date_hash[line.split(',')[0]] = line.split(',')[row_num]
      end
    end
    remove_header = max_temperature.filter { |i| i != name }
    remove_nil = remove_header.filter { |i| i != '' }
    element_toi = remove_nil.map { |i| i.to_i }
    highest_temp = if type == 'max_temp'
                     element_toi.max
                   elsif type == 'min_temp'
                     element_toi.min
                   else
                     element_toi.max
                   end
    max_temp = date_hash.filter { |_key, value| value.to_i == highest_temp }
    date_max_array = max_temp.keys[0].split('-')
    puts "#{printing}:#{highest_temp}#{degre} on #{@@months[date_max_array[1].to_s]} #{date_max_array[2]}"
  end

  def printing_data
    calculate_hig_temp('Max TemperatureC', 1, 'max_temp', 'Higest', 'C')
    calculate_hig_temp('Min TemperatureC', 3, 'min_temp', 'Lowest', 'C')
    calculate_hig_temp('Max Humidity', 7, 'humid', 'Humaid', '%')
  end
end
