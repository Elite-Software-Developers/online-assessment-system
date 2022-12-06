class CorrectAnswersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :correct_answer_not_found

    # GET all correct answers
    def index 
        correct_answers = CorrectAnswer.all 
        render json: correct_answers
    end

    # GET one answer
    def show 
        correct_answer = find_correct_answer
        render json: correct_answer
    end 

    # POST the correct answer
    def create 
        correct_answer = CorrectAnswer.create(correct_answer_params) 
        render json: correct_answer, status: :created
    end 

    # PATCH the  correct answer
    def update 
        correct_answer = find_correct_answer
        correct_answer.update(correct_answer_params)
        return json: correct_answer, status: :accepted
    end 

    # DELETE the correct answer
    def destroy 
        correct_answer = find_correct_answer 
        correct_answer.destroy
        head :no_content
    end 


    # Private methods 
    private 

    def correct_answer_params 
        params.permit(:content, :question_id)
    end 

    def find_correct_answer 
        CorrectAnswer.find(params[:id])
    end 

    def correct_answer_not_found 
        render json: {errors: ["Correct answer not found"]}, status: :not_found
    end 

end
