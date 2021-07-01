# frozen_string_literal: true

class Api::V1::QuestionsController < ApplicationController
# Controller for Question CRUD methods
  def index
    question = Question.all
    render json: question, status: 200
  end

  def create
    if prod_params[:label].present? && prod_params[:active].present?
      question = Question.new(
        label: prod_params[:label],
        active: prod_params[:active]
      )
      if question.save
        render json: question, status: 200
      else
        render json: { error: 'Error creating question.', status: 500 }
      end
    else
      render json: { error: 'Please make sure to include <label> & <active> attributes.', status: 400 }
    end
  end

  private

  def prod_params
    params.require(:question).permit(%i[label active])
  end
end

