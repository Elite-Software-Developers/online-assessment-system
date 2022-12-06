class AssessmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :assessment_not_found

    # GET all the assessments 
    def index
        assessments = Assessment.all 
        render json: assessments
    end 

    # GET one assesment 
    def show
        assessment = find_assessment 
        render json: assessment, status: :ok
    end 

    # POST an assessment
    def create
        assessment = Assessment.create(assessment_params)
        render json: assessment, status: :created
    end 

    # PATCH an assessment
    def update 
        assessment = find_assessment
        assessment.update(assessment_params)
        render json: assessment, status: :accepted
    end 

    # DELETE an assessment
    def destroy
        assessment = find_assessment 
        assessment.destroy
        head :no_content
    end 

    # Private methods 
    private 

    def assessment_params
        params.permit(:title, :start_date, :duration, :end_date)
    end

    def find_assessment
        Assessment.find(params[:id])
    end

    def assessment_not_found 
        render json: {errors: ['Assessment not found']}, status: :not_found
    end
end
