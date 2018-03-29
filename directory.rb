=begin
In the input_students method the cohort value is hard-coded.
How can you ask for both the name and the cohort? What if one of the values is empty?
Can you supply a default value? The input will be given to you as a string?
How will you convert it to a symbol? What if the user makes a typo?
=end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? || !cohort.empty? do
    # add the student hash to the array
    if name.empty?
      name = "NoNameGiven"
    end
    if cohort.empty?
      cohort = "NoDateGiven"
    else #checking for typos
      until ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July',
       'August', 'September', 'October', 'November','December'].include?(cohort.capitalize)
       puts "you made a typo"
       cohort = gets.chomp
      end
    end


    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  # return the array of students
  students
end
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
