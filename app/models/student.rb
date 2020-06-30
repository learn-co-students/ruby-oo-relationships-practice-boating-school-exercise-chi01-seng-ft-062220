class Student
    attr_reader :first_name
    @@all = []
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end
    
    def self.find_student(first_name)
        self.all.find{|student| student.first_name == first_name}
    end
    
    def grade_percentage
        numerator = self.pass_count
        denominator = BoatingTest.all.select {|test| test.student == self}
        result = numerator.to_f / denominator.size.to_f
        result *= 100
    end

    def pass_count
        BoatingTest.all.count {|test| test.test_status == "passed"}
    end
end