class AnswersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :answer_not_found

    # GET all the answers 
    def index
        answers = Answer.all
        render json: answers
    end

    # GET one answer
    def show
        answer = find_answer
        render json: answer, status: :ok
    end 

    # POST an answer
    def create
        question = Question.find(params[:question_id])
        answer = question.answers.create(answer_params)
        render json: answer, status: :created
    end

    # PATCH an answer
    def update:
        answer = find_answer
        answer.update(answer_params)
        render json: answer, status: :accepted
    end 

    # DELETE an answer
    def destroy
        answer = find_answer
        answer.destroy
        head :no_content
    end

    def question_answers 
        # question = Question.find(params[:question_id]) 
        answers = Question.find_by(question_id: params[:question_id]) 
        render json: answers, status: :ok 
    end

    # Private methods 
    private 

    def answer_params
        params.permit(:content, :question_id)
    end

    def find_answer
        Answer.find(params[:id])
    end

    def answer_not_found
        render json: {errors: ['Answer not found']}, status: :not_found
    end
end
