class Api::V1::EchosController < ApplicationController
    def index
      echos = Echo.all
      render json: echos
    end
  
    def show
      user = User.includes(:echos).find(params[:id])
      echos = []
      user.echos_received.each { |echo| echos << echo }
      user.echos.each { |echo| echos << echo }

      echos.sort_by!(&:created_at).reverse!

      render json: echos, include: [ :user ]
    end
    
    def create
      user_id = echo_params[:user_id]
      echo = Echo.create(user_id: user_id, message: echo_params[:message])
      echo_params[:listeners].each{|listenerId| EchoListener.create(echo_id: echo.id, listener_id: listenerId)}      
      render json: echo, include: [ :user ]
    end 

    def listen
      if EchoListener.create(echo_id: params[:id], listener_id: params[:listener_id])
        render json: { message: "Now listening to this echo!" }
      else
        render json: { message: "Unable to listen to this echo." }
      end
    end
  
    def unlisten
      echo_listener = EchoListener.find_by(echo_id: params[:id], listener_id: params[:listener_id])
      
      byebug

      echo_listener.destroy if !!echo_listener

      render json: { message: "Unlistened successfully." }
    end

    private

    def echo_params
      params.require(:echo).permit(:user_id, :message, listeners: [])
    end
  end
  