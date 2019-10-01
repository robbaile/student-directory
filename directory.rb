# and then print them
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
  
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    puts "Please enter which cohort you are in"
    cohort = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do  
        # add the student hash to the array
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        # get another name from the user
        puts "Please enter the names of the students"
        name = gets.chomp
        puts "Please enter which cohort you are in"
        cohort = gets.chomp
    end
    # return the array of students
    students
end
  
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end  
  
print_header
input_students
print_footer(students)


# Get the students that start with R and thats names are shorter than 12 characters
def print_with_index(students)
    students.map.with_index(1) {|student, i| puts "#{i} - " + "#{student.values[0]}" if student.values[0][0] === "R" && student.values[0].length < 12 }
end

def print_with_while(students)
    counter = 0
    while counter < students.size 
        keys = students.values_at(counter)
        puts "#{counter} - " + "#{keys[0].values[0]}" 
        counter +=1
    end 
end



