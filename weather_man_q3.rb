# frozen_string_literal: true

require 'csv'
require 'colorize'
# class for task 3
class TaskThree
  def initialize(year, month, city)
    @year = year
    @month = month
      @contents = CSV.parse(File.read("./#{city}/#{city}_#{year}_#{month}.txt"),
                            headers: true, converters: :numeric)
  end

    def barchart_temp(question_num)
      puts "#{@month} #{@year}"
      max_temperature =  @contents.by_col[1].compact
      min_temperature =  @contents.by_col[3].compact
      length = max_temperature.length
      (0..length - 1).each do |index|
        str_max = '+'.red * max_temperature[index]
        str_min = '+'.blue * min_temperature[index]
        if question_num == 'three'
          puts "#{index + 1}  #{str_max} #{max_temperature[index]}"
          puts "#{index + 1}  #{str_min} #{min_temperature[index]}"
        else
          puts "#{index + 1} #{str_min}#{str_max} #{min_temperature[index]} - #{max_temperature[index]}C"
        end
      end
    end
end
