class Api::V1::UsersController < ApplicationController
  def index
    users = User.includes(:listeners).all

    render json: users, include: [ :listeners ]
  end
end
