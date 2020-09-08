class Api::V1::EchosController < ApplicationController
    def index
      echos = Echo.all
      render json: echos
    end
  
    def show
      echos = User.find(params[:id]).echos_received

      render json: echos, include: [ :user ]
    end
  end
  