class Question < ApplicationRecord
    belongs_to :assessment
    has_many :answers
    has_many :feedbacks
end
