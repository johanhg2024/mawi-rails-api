class Api::V1::UsersController < ApplicationController
  def index
    user = User.all
    render json: user, status: 200
  end

  def show
  end

  def create
  end
  
end
