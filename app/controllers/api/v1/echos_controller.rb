class Api::V1::EchosController < ApplicationController
    def index
      echos = Echo.all
      render json: echos
    end
  
    def show
      echo = Echo.find(params[:id])
      render json: echo
    end

  end