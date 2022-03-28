# frozen_string_literal: true

require 'csv'
require 'colorize'
# class for task 3
class TaskThree
  begin def read_file(year, month, city)
          @my_year = year
          @my_month = month
          @contents = CSV.parse(File.read("../#{city}/#{city}_#{year}_#{month}.txt"),
                                headers: true, converters: :numeric)
  rescue StandardError
    puts 'Data for this month not exist'
    exit(1)
        end

        def barchart_temp
          puts "#{@my_month} #{@my_year}"
          max_temperature =  @contents.by_col[1].compact
          min_temperature =  @contents.by_col[3].compact
          length = max_temperature.length
          (1..length).each do |index|
            str_max = '+'.red * max_temperature[index]
            str_min = '-'.blue * min_temperature[index]
            puts "#{index}  #{str_max} #{max_temperature[index]}"
            puts "#{index}  #{str_min} #{min_temperature[index]}"
          end
        end
  end
end
