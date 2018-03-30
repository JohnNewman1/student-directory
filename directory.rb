
# inititiates the program and shows menu
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end
# process of what selection is made
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      puts "Enter file name"
      filename = STDIN.gets.chomp
      load_students(filename)
    when "9"
      puts "Goodbye"
      exit
    else
      puts "I don't know what you mean, try again"
  end
  puts "Selection #{selection} was successful"
end
# selection 1 method to add students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  while_name_empty(name)
end

def while_name_empty(name)
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_to_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end
# selection 2 method to print students list.
def show_students
  print_header
  print_student_list
  print_footer
end
# method for show_students
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end
# method for show_students
def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
# method for show_students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
# selection 3 method to save students to students.csv from list
def save_students
  puts "Enter file name"
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    # open the file for writing
    File.open(filename, "w") do |file|
    # iterate over the array of students
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
      end
    end
  else
    puts "File name does not exist"
  end
end
# option 4 loading students into list from students.csv
def load_students(filename = "students.csv")
  if File.exists?(filename)
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_to_students(name, cohort)
      end
    end
  else
    puts "File name does not exist"
  end
end

#load in command line the file
def try_load_students
  @students = []
  filename = ARGV.first # first argument from the command line
  filename_process(filename)
end

def filename_process(filename)
  if filename.nil?
    load_students
    puts "Loaded #{@students.count} from students.csv"# get out of the method if it isn't given
  elsif File.exists?(filename) # if it exists
     load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_to_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
