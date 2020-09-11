class Api::V1::UsersController < ApplicationController
  def index
    users = User.includes(:listeners).all

    render json: users, include: [ :listeners ]
  end

  def show
    user = User.includes(:listeners).find(params[:id])

    render json: user, include: {
      listeners: {
        include: {
          listeners: {
            only: [ :id ]
          }
        },
        except: [ :created_at, :updated_at ]
      }
    }
  end

  def update
    user = User.find(params[:id])

    user.update(status: params[:user][:status])

    render json: { message: "Status updated successfully." }
  end

  def listen
    if UserListener.create(user_id: params[:id], listener_id: params[:listener_id])
      render json: { message: "Successfully listened user with id of #{params[:id]}"}
    else
      render json: { message: "You can't listen to someone more than once!" }
    end
  end

  def unlisten
    User.includes(:echos).find(params[:id]).echos.first.destroy
    
    userListener = UserListener.find_by(user_id: params[:id], listener_id: params[:listener_id]);
    echoListeners = EchoListener.where(listener_id: params[:listener_id]);

    userListener.destroy if !!userListener
    echoListeners.each { |echoListener| echoListener.destroy }

    render json: { message: "Unlistened successfully." }
  end
end
