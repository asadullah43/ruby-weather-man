# frozen_string_literal: true

require 'csv'
# class for task 2
class TaskTwo
  begin
    def read_file(year, month, city)
      @contents = CSV.parse(File.read("../#{city}/#{city}_#{year}_#{month}.txt"),
                            headers: true, converters: :numeric)
    rescue StandardError
      puts 'Data for this month not exist'
      exit(1)
    end

    def calculate_avg(value)
      length = @contents.by_col[value].length
      (@contents.by_col[value].compact.inject(0) { |sum, number| sum + number }) / length
    end

    def printing_data
      puts "Highest Average:#{calculate_avg(1)}C"
      puts "Lowest Average:#{calculate_avg(3)}C"
      puts "Average Humadity:#{calculate_avg(7)}%"
    end
  end
end
