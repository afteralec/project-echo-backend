class SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email]);

    if !!user
      render json: { id: user.id }
    else
      render json: { message: "User with that email doesn't exist in the database" }
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
