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
        
        if emailTaken || params[:student][:email].empty?
            errors <<  "The email is already taken or empty"
        end

        if params[:student][:first_name].empty? 
            errors << "First name cannot be null"
        end

        if params[:student][:last_name].empty?
            errors << "Last name cannot be null"
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
        @student = Student.find_by(params[:student][:student_id])
        emailTaken = Student.find_by(email: params[:student][:email])
        errors = []

        if params[:student][:email].empty? || emailTaken 
            errors <<  "The email is empty or taken"
        end
        
        if params[:student][:student_id].nil? || !params[:student][:student_id].is_a?(Integer) 
            errors <<  "Student id is not valid"
        end

        @student.update(email: params[:student][:email])

        unless @student.save
            errors << @student.errors.full_messages
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

        if params[:student][:student_id].empty? 
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
