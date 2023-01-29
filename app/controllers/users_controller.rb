class UsersController < ApplicationController
    before_action :authorize, only: [:user_logged_in ]



# create a new user; save their hashed password in the database; save the user's ID in the session hash; and return the user object in the JSON response.
    def signup
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
#Add a show method to your UsersController that responds to a GET /me request. If the user is authenticated, return the user object in the JSON response. shows the user is logged in and has authrization 
    def user_logged_in 
        user = User.find_by(id: session[:user_id])
        render json: user
    end

 




    private

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end
    def user_params
        params.permit(:username, :password, :password_confirmation)
      end
end
