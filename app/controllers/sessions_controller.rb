class SessionsController < ApplicationController

    def login
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user, status: :created
        else
          render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end 
    
    
    def logout
        session.delete :user_id
        head :no_content
    end 
end
