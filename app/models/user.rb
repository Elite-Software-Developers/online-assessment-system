class User < ApplicationRecord
    has_many :invitations
    has_many :student_results
    has_many :feedbacks
end
