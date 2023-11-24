class StudentsController < ApplicationController
    before_action :getAllStudents, only: [:getAllStudents, :addStudent, :updateStudentEmail, :deleteStudent]

    def show
        @student = Student.find(student_params)
    end
    # Return all students 
    def getAllStudents
        @students = Student.all
    end

    # Add a student
    def addStudent
        emailTaken = Student.find_by(email: params[:student][:email])
        errors = []
        
        if emailTaken
            errors <<  "The email is already taken"
        end

        @student = Student.new(student_params)
        unless @student.save
            errors << @student.errors.full_messages
        end

        if errors.any?
            redirect_to root_url, flash: {error: errors.join(", ")}
        else
            redirect_to root_url, notice: "Added successfully"
        end
    end 

    # Update a students email given student_id and uniqueness
    def updateStudentEmail
        @student = Student.find_by(student_id: params[:student][:student_id])  
        emailTaken = Student.find_by(email: params[:student][:email])
        errors = []

        if emailTaken 
            errors <<  "The email is taken"
        end
        
        if @student.nil?
            errors <<  "Student id is not valid"
        else 
            @student.update(email: params[:student][:email])

            unless @student.save
                errors << @student.errors.full_messages
            end
        end
        
        if errors.any?
            redirect_to root_url, flash: {error: errors.join(", ")}
        else
            redirect_to root_url, notice: "Updated successfully"
        end
    end

    # Delete a student given student id
    def deleteStudent
        @student = Student.find_by(student_id: params[:student][:student_id])  
        errors = []

        if @student.nil?
            errors <<  "Student id is not valid"
        else 
            @student.destroy
            unless @student.save
                errors << @student.errors.full_messages
            end
        end
   
        if errors.any?
            redirect_to root_url, flash: {error: errors.join(", ")}
        else
            redirect_to root_url, notice: "Updated successfully"
        end
    end

    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :enrollment_date)
      end
end
