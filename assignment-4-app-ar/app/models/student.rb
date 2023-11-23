class Student < ApplicationRecord
    self.table_name = "students"

    # Add in validation during creation and update mutation

    # These attributes cannot be NULL
    validates :first_name, :last_name, :email, presence: true

    # Email must be unique
    validates :email, uniqueness: true
end

