# COMP3005-Assignment4
Repository for Assignment 4, Ariba Rajput, 101228808

This is a rails app that implements the Students database for Assignment 4, 3005. 

Database creation:


Compile and Run: 
1. Clone this repository
2. Navigate to this repo, and navigate inside of "/assignment-4-app"
3. Run rails server
4. Interact with app

Functions Explanations:
getAllStudents() - uses CRUD[Read] in Ruby on Rails in order to index all students in the Student table

addStudent() - uses CRUD[Create] operation in Ruby on Rails in order to add a student. Uses flash to append errors to the top of the screen if errors are received from the database

updateStudentEmail - uses CRUD[Update] in Ruby on Rails in order to update a students email. Uses flash to append errors to the top of the screen if errors are received from the database

deleteStudent = uses CRUD[Delete] in Ruby on Rails in order to delete a student given a student id (passed in through a form). Uses flash to append errors to the top of the screen if errors are received from the database