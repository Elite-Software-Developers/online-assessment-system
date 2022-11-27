class Assessment < ApplicationRecord
    has_many :questions
    has_many :invitations
    has_many :student_results
end
