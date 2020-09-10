class Api::V1::EchosController < ApplicationController
    def index
      echos = Echo.all
      render json: echos
    end
  
    def show
      echos = User.find(params[:id]).echos_received
      render json: echos, include: [ :user ]
    end
    
    def create
      user_id = echo_params[:user_id]
      echo = Echo.create(user_id: user_id, message: echo_params[:message])
      echo_params[:listeners].each{|listenerId| EchoListener.create(echo_id: echo.id, listener_id: listenerId)}      
      render json: echo, include: [ :user ]
    end 

    private 
      def echo_params
        params.require(:echo).permit(:user_id, :message, listeners: [])
      end
  end
  