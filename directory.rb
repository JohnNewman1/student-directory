=begin
In the input_students method the cohort value is hard-coded.
How can you ask for both the name and the cohort? What if one of the values is empty?
Can you supply a default value? The input will be given to you as a string? How will you convert it to a symbol?
What if the user makes a typo?
=end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.length
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count +=1
  end

end

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

def input_students
  #method to see if input is empty and ask for it again
  def ifempty(name)
    count = 0
    while name.empty?
      if count == 1
        break
      end
      puts "Please enter data or press return to exit"
      name = gets.chomp
      count +=  1
    end
    name
  end
  #method to check date is correct
  def datecheck(string)
    if string.empty?
      return string
    end
    until ["January", "Febuary", "March", "April", "May", "June",
          "July", "August", "September", "October", "November", "December"  ].include?(string.capitalize)
      puts "That is not a valid date"
      string = gets.chomp
    end
    string.capitalize
  end
  #method to get data
  def getdata
    puts "Enter a name"
    name = gets.chomp
    name = ifempty(name)
    puts "Enter the date"
    cohort = gets.chomp
    cohort = ifempty(cohort)
    cohort = datecheck(cohort)
    return [name,cohort]
  end
  students = []
  puts "Please enter the names of the students and then the date they start"
  puts "To finish, just hit return twice/n"

  array = getdata

  while !array.empty? do
    students << {name: array[0], cohort: array[1]}
    puts "Now we have #{students.count} students"
    getdata
  end

  students
end

students = input_students
print_header
print(students)
print_footer(students)

hello
