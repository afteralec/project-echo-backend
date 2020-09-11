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

      echo_listener.destroy if !!echo_listener

      render json: { message: "Unlistened successfully." }
    end

    def seed
      echos = []

      echo_msgs = {
        Hal: "Amelie’s comprehensive knowledge of the course material is surpassed only by her natural talent in conveying it to the students",
        Brad: "Amelie is able to clearly and simply explain the why, they how, the what, and the when.",
        Akiko: "Amelie is a great instructor because she is thorough in her lectures. She has great patience and is always going above and beyond to make sure we as students are learning the material as best as we can",
        Daniel: "Amelie is always willing to lend a hand when needed, very informative and gives structured guidance without just giving the answer.",
        Nathan: "Amelie is a great instructor who cares about her students' success. It's so apparent that she knows her stuff and her love of Javascript is quite contagious. She's a bright and patient with us and continually guides us to do our best.",
        Ronak: "Amelie explains each concept of software engineering with in-depth knowledges. her way of approach to teaching students which is very appropriate for better understanding. Moreover, she is very polite nature and giving more ideas and techniques which helps students to enhancing their knowledge.",
        Brandon: "Amelie is always willing to spend a little extra time with a student answering questions and going over anything that may be unclear. She explains concepts from multiple angles and really seems to have a vested interest in student comprehension. I'm happy to have her as an instructor!",
        Don: "Amelie is willing to delve into rabbit holes",
      }

      first_names = [
        "Don",
        "Brandon",
        "Ronak",
        "Nathan",
        "Daniel",
        "Akiko",
        "Brad",
        "Hal",
      ]

      first_names.each do |first_name|
        user = User.find_by(first_name: first_name);
        echo = Echo.create(user: user, message: echo_msgs[first_name.to_sym])
        EchoListener.create(echo_id: echo.id, listener_id: params[:listener_id])
        echos << echo
      end

      echos.sort_by!(&:created_at).reverse!

      render json: [ echos ], include: [ :user ]
    end

    private

    def echo_params
      params.require(:echo).permit(:user_id, :message, listeners: [])
    end
  end
  