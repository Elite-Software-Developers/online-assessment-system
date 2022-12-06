class Question < ApplicationRecord
    belongs_to :assessment
    has_many :answers
    has_many :feedbacks
    has_many :users, through: :feedbacks
end
