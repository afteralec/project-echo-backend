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
      echos = {
        Hal: "Amelie’s comprehensive knowledge of the course material is surpassed only by her natural talent in conveying it to the students",
        Brad: "Amelie is able to clearly and simply explain the why, they how, the what, and the when.",
        Akiko: "Amelie is a great instructor because she is thorough in her lectures. She has great patience and is always going above and beyond to make sure we as students are learning the material as best as we can",
        Daniel: "Amelie is always willing to lend a hand when needed, very informative and gives structured guidance without just giving the answer.",
        Nathan: "Amelie is a great instructor who cares about her students' success. It's so apparent that she knows her stuff and her love of Javascript is quite contagious. She's a bright and patient with us and continually guides us to do our best.",
        Ronak: "Amelie explains each concept of software engineering with in-depth knowledges. her way of approach to teaching students which is very appropriate for better understanding. Moreover, she is very polite nature and giving more ideas and techniques which helps students to enhancing their knowledge.",
        Brandon: "Amelie is always willing to spend a little extra time with a student answering questions and going over anything that may be unclear. She explains concepts from multiple angles and really seems to have a vested interest in student comprehension. I'm happy to have her as an instructor!",
        Don: "Amelie is willing to delve into rabbit holes",
      }

      user = User.find(params[:id])
      echo = false
      puts user.first_name
      if !!echos[user.first_name.to_sym]
        echo = Echo.create(user: user, message: echos[user.first_name.to_sym])
        EchoListener.create(echo_id: echo.id, listener_id: params[:listener_id])
      end

      if !!echo
        render json: [ echo ], include: [ :user ]
      else
        render json: []
      end
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
