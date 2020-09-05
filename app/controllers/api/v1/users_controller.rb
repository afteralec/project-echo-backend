class Api::V1::UsersController < ApplicationController
  def index
    users = User.includes(:listeners).all

    render json: users, include: [ :listeners ]
  end

  def show
    user = User.includes(:listeners).find(params[:id])

    render json: user, include: [ :listeners ]
  end
end
