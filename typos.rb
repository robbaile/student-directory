# Global Symbols 
@students = []

def interactive_menu
  load_students()  
  loop do
    print_menu()
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students()
    when "2"
      show_students()
    when "3"
      save_students()  
    when "4"
      puts "What file would you like to load in?"
      file = gets.chomp  
      load_students(file)  
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
  puts "successful operation"
  puts "--------------------"
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
      push_student_to_students(name, :november)
      puts "Now we have #{@students.count} students"
      name = STDIN.gets.chomp
    end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    push_student_to_students(name, cohort.to_sym)
  end
  file.close
end

def push_student_to_students(name, cohort)
    @students << {name: name, cohort: cohort}
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "4. Load the students from a file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header()
  print_student_list()
  print_footer()
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students()
interactive_menu()