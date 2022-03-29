# frozen_string_literal: true

require './weather_man_q2'
require './weather_man_q1'
require './weather_man_q3'

def month_hash(year_number)
  months = {
    '1' => 'Jan', '2' => 'Feb', '3' => 'Mar',
    '4' => 'Apr', '5' => 'May', '6' => 'Jun',
    '7' => 'Jul', '8' => 'Aug', '9' => 'Sep',
    '10' => 'Oct', '11' => 'Nov', '12' => 'Dec'
  }
  months[year_number]
end
input = ARGV
choice = input[0]
city = input[2]
year = input[1].split('/')
year_number = year[0]
month = month_hash(year[1])
case choice
when '-e'
  obj_task_one = TaskOne.new(year_number, city)
  obj_task_one.printing_data
when '-a'
  obj_task_two = TaskTwo.new(year_number, month, city)
  obj_task_two.printing_data

when '-c'
  obj_task_three = TaskThree.new(year_number, month, city)
  obj_task_three.barchart_temp('three')
when '-d'
  obj_task_three = TaskThree.new(year_number, month, city)
  obj_task_three.barchart_temp('four')
else
  puts 'Wrong Input'
end
