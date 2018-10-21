class AnswersController < ApplicationController
    def create
        question = Question.find(params[:answer][:question_id])
        Answer.create(answer_params)
        redirect_to question
    end

    private
    def answer_params
        params.require(:answer).permit(:question_id, :email, :body)
    end
end
