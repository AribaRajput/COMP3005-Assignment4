Rails.application.routes.draw do
  root "main#index"
  get 'students/getAllStudents'
  post 'students/addStudent'
  post 'students/updateStudentEmail'
  post 'students/deleteStudent'
end