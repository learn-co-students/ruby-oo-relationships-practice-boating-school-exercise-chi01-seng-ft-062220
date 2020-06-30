class Instructor
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def pass_student(student, test_name)
        test = self.matching_test?(student, test_name)
        test_status = "passed"
        if result == nil
            result = BoatingTest.new(student, test_name, test_status, self)
        else
            result.test_status = test_status
        end
    end

    def fail_student(student, test_name)
        test = self.matching_test?(student, test_name)
        test_status = "failed"
        if result == nil
            result = BoatingTest.new(student, test_name, test_status, self)
        else
            result.test_status = test_status
        end
    end

    def matching_test?(student, test_name)
        BoatingTest.all.find do |test| 
            test.student == student && test.test_name == test_name
        end
    end
end
