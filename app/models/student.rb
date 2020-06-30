class Student
    attr_accessor :first_name
    @@all =[]

    # should initialize with first_name
    def initialize (first_name)
        @first_name = first_name
        @@all << self
    end

    # Student.all should return all of the student instances
    def self.all
        @@all
    end

    # Student#add_boating_test should initialize a new boating test with a Student (Object), 
    # a boating test name (String), a boating test status (String), and an Instructor (Object)
    def add_boating_test(name, status, instructor)
        test = BoatingTest.new(self, name, status, instructor)
    end

    # Student.find_student will take in a first name and output the student (Object) with that name
    def self.find_student(name)
        self.all.find {|students| students.first_name == name}
    end
    
    # Student#grade_percentage should return the percentage of tests that the student has passed, 
    # a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return the Float 33.33)
    def grade_percentage
        test_status = BoatingTest.all.select{|tests| tests.student == self}.map {|tests| tests.status}
        ((test_status.count("passed").to_f/test_status.size)*100.to_i).round(2)
    end
end
