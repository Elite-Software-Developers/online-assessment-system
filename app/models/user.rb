class User < ApplicationRecord
    has_many :invitations
    has_many :assessments, through: :invitations
    has_many :student_results
    has_many :feedbacks
    has_many :questions, through: :feedbacks
end
