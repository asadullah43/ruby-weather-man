# frozen_string_literal: true

require './weather_mant2'
require './weather_mant1'
require './weather_mant3'
require './weather_mant4'

def calculate_month(yearname)
  months = {
    '1' => 'Jan', '2' => 'Feb', '3' => 'Mar',
    '4' => 'Apr', '5' => 'May', '6' => 'Jun',
    '7' => 'Jul', '8' => 'Aug', '9' => 'Sep',
    '10' => 'Oct', '11' => 'Nov', '12' => 'Dec'
  }
  months[yearname]
end
# puts myfun()
input = ARGV
input[0]
input[2]
year = input[1].split('/')
yearname = year[0]
month = calculate_month(year[1])
switch = input[0]

# using case statement
case switch

# using when
when '-e'
  obj_task_one = TaskOne.new
  obj_task_one.read_file(yearname, input[2])
  obj_task_one.calculate_hig_temp
  obj_task_one.calculate_lowest_temp
  obj_task_one.calculate_most_humadity
when '-a'
  obj_task_two = TaskTwo.new
  obj_task_two.read_file(yearname, month, input[2])
  obj_task_two.printing_data

when '-c'
  obj_task_three = TaskThree.new
  obj_task_three.read_file(yearname, month, input[2])
  obj_task_three.barchart_temp
when '-d'
  obj_task_four = TaskFour.new
  obj_task_four.read_file(yearname, month, input[2])
  obj_task_four.barchart_temp
else
  puts 'Wrong Input'
end
