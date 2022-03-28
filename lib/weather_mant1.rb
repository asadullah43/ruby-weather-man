# frozen_string_literal: true

require 'csv'
# class task one
class TaskOne
  def read_file(year, city)
    @files = Dir["../#{city}/#{city}_#{year}_*"]
  end

  def calculate_hig_temp
    max_temperature = []
    date_arra = {}
    @files.each do |file|
      @contents = File.read(file.to_s)
      File.readlines(file.to_s).each do |line|
        max_temperature << line.split(',')[1]
        date_arra[line.split(',')[0]] = line.split(',')[1]
      end
    end
    remove_header = max_temperature.filter { |i| i != 'Max TemperatureC' }

    remove_nil = remove_header.filter { |i| i != '' }
    element_toi = remove_nil.map { |i| i.to_i }
    highest_temp = element_toi.max
    max_temp = date_arra.filter { |_key, value| value.to_i == highest_temp }
    date_max_array = max_temp.keys[0].split('-')
    puts "Highest:#{highest_temp}C on #{date_max_array[1]} #{date_max_array[2]}"
  end

  def calculate_lowest_temp
    max_temperature = []
    date_arra = {}
    @files.each do |file|
      @contents = File.read(file.to_s)
      File.readlines(file.to_s).each do |line|
        max_temperature << line.split(',')[3]
        date_arra[line.split(',')[0]] = line.split(',')[3]
      end
    end
    remove_header = max_temperature.filter { |i| i != 'Min TemperatureC' }

    remove_nil = remove_header.filter { |i| i != '' }
    element_toi = remove_nil.map { |i| i.to_i }
    highest_temp = element_toi.min
    max_temp = date_arra.filter { |_key, value| value.to_i == highest_temp }
    date_max_array = max_temp.keys[0].split('-')
    puts "lowest:#{highest_temp}C on #{date_max_array[1]} #{date_max_array[2]}"
  end

  def calculate_most_humadity
    max_temperature = []
    date_arra = {}
    @files.each do |file|
      @contents = File.read(file.to_s)
      File.readlines(file.to_s).each do |line|
        max_temperature << line.split(',')[7]
        date_arra[line.split(',')[0]] = line.split(',')[7]
      end
    end
    remove_header = max_temperature.filter { |i| i != 'Max Humidity' }

    remove_nil = remove_header.filter { |i| i != '' }
    element_toi = remove_nil.map { |i| i.to_i }
    highest_temp = element_toi.max
    max_temp = date_arra.filter { |_key, value| value.to_i == highest_temp }
    date_max_array = max_temp.keys[0].split('-')
    puts "Humid:#{highest_temp}% on #{date_max_array[1]} #{date_max_array[2]}"
  end
end
