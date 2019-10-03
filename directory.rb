def input_students
    students = []
    puts "Please enter the details of the students"
    puts "To finish, just hit return twice after completing a students information"
    student_getter = ask_questions()
     while !student_getter[:name].empty? do
      students << student_getter
      puts "Now we have #{students.count} #{students.count===1? "student":"students"}"
      student_getter = ask_questions()
     end
   students
   end
  
   def ask_questions
     cohort_list = ["February", "April", "November"]
     puts "Please enter the name of the next student"
     name = gets.chomp
     return {name: "", height: "", country_of_birth: "", hobbies: "", cohort: ""} if name.empty?
     puts "Please enter the height of the student"
     height = gets.chomp
     puts "Please enter the student's hobbies"
     hobbies = gets.chomp
     puts "Please enter the student's country of birth"
     country_of_birth = gets.chomp
     puts "Please enter the student's cohort"
     cohort = gets.chomp
     cohort_vailidator = !cohort.empty? && cohort_list.include?(cohort) ? cohort : "Unknown"
     student={name: name, height: height, country_of_birth: country_of_birth, hobbies: hobbies, cohort: cohort_vailidator}
     return student
   end
  
  
  
  
  def print_header
    puts "The Students of Villains Academy"
    puts "-----------"
  end
  
  def print_using_while(students)
    count=0
    while count<students.length
      puts "#{count+1}.#{students[count][:name]} (#{students[count][:cohort]} cohort)"
      count+=1
    end
  end
  
  def print_sorted_by_cohort(students)
    students.sort_by { |student| student[:cohort]}.map { |student| puts "#{student[:name]}, #{student[:cohort]}"   }
  end
  
  
  def print(students)
    students.each.with_index {|student, index|
      if student[:name].length<12
      puts "#{index+1}.#{student[:name]}"
      puts "#{student[:height]}" .center(18)
      puts "#{student[:country_of_birth]}" .center(18)
      puts "#{student[:hobbies]}" .center(18)
      puts "#{student[:cohort]}" .center(18)
    end
    }
  end
  
  def print_footer(names)
  puts "Overall, we have #{names.count} great #{names.count===1? "student":"students"}"
  end
  
  students = input_students
  print_header
  print_sorted_by_cohort(students)
  print_footer(students)