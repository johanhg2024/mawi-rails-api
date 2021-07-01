class Api::V1::AnswersController < ApplicationController
  
  def index
    answer = Answer.joins(:user).joins(:question)
    if search_params[:user_id].present?
      answer = answer.where('users.id = ?', search_params[:user_id])
    end 
    if search_params[:question_id].present?
      answer = answer.where('questions.id = ?', search_params[:question_id])
    end
    if search_params[:label].present?
      answer = answer.where('questions.label like ?', "%#{search_params[:label]}%")
    end
    if search_params[:active].present?
      answer = answer.where('questions.active = ?', "#{search_params[:active] == 'true' ? 1 : 0}")
    end
    if search_params[:answer_id].present?
      answer = answer.where('answers.id = ?', search_params[:answer_id])
    end
    if search_params[:answer].present?
      answer = answer.where('answers.answer like ?', "%#{search_params[:answer]}%")
    end
    if search_params[:name].present?
      answer = answer.where('users.name like ?', "%#{search_params[:name]}%")
    end
    if search_params[:email].present?
      answer = answer.where('users.email like ?', "%#{search_params[:email]}%")
    end
    render json: answer, status: 200
  end

  def show
  end

  def create
    user = User.find(create_params[:user_id])
    question = Question.find(create_params[:question_id])
    if user && question
      answer = Answer.new(
        answer: create_params[:answer],
        user_id: create_params[:user_id],
        question_id: create_params[:question_id]
      )
      if answer.save
        render json: answer, status: 200
      else
        render json: { error: 'Error creating answer.', status: 500 }
      end
    else
      render json: { error: 'Plase make sure to send an existing <user_id> & <question_id>', status: 500 }
    end
  end

  private

  def search_params
    params.permit(%i[answer_id answer user_id question_id label active name email])
  end

  def create_params
    params.permit(%i[answer user_id question_id])
  end
end
