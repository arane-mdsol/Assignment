module Questions
    class QuestionClass
        attr_accessor :question, :answer
        def self.create
            instance=QuestionClass.new
        end
        def quesList(ques)
            @question=ques
            print "#{@question}"
            @answer=gets.chomp
            self
        end
        def show
            puts "#{@question} your answer: #{@answer}"            
        end
    end
end
class Participant
    attr_accessor :age, :name, :gender
    def initialize 
        print "Enter your Full Name: "
        @name=gets.chomp
        print "Enter your age: "
        @age=gets.chomp.to_i
        print "Enter your gender: "
        @gender=gets.chomp
        self
    end
end

class StudyConduct
    include Questions
    def initialize study_name
        @study_name=study_name
    end
     def study_conduct
        puts "Welcome to #{ @study_name } !"
        @participant=Participant.new
        @questionsArr=[]
        @questionsArr.push(Questions::QuestionClass.create.quesList("Have you attended any Clinical Trial before? "))
        @questionsArr.push(Questions::QuestionClass.create.quesList("Do you Smoke? "))
        @questionsArr.push(Questions::QuestionClass.create.quesList("Are you aware of all the phases involved in Clinical Trial? "))
        @questionsArr.push(Questions::QuestionClass.create.quesList("Do you have specific drug allergies? "))
        puts "Below is your captured details"
        puts "Name : #{@participant.name}"
        puts "Age : #{@participant.age}"
        puts "Gender : #{@participant.gender}"
        result = 0
        @questionsArr.each do |que|
            if que.answer=="yes"
                result +=1
            end
        end
        if @participant.age>18 && result>2
            puts "Congratulations #{ @participant.name } You are eligible for the clinical trial !!!"
            true
        else
           puts "We regret to inform you that you are not eligible for this clinical trial."
           false
        end
      end
end

studyConductObj=StudyConduct.new("Clinical Trial")
studyConductObj.study_conduct