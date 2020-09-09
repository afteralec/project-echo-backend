class Api::V1::UsersController < ApplicationController
  def index
    users = User.includes(:listeners).all

    render json: users, include: [ :listeners ]
  end

  def show
    user = User.includes(:listeners).find(params[:id])

    render json: user, include: {
      listeners: {
        except: [ :created_at, :updated_at ]
      }
    }
  end

  def listen
    # user = User.find(params[:id])
    # listener = User.find(params[:listener_id])

    UserListener.create(user_id: params[:id], listener_id: params[:listener_id])
  end
end
