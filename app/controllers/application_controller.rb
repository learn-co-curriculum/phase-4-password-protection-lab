class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorized

  def authorized
    return render json: { errors: "authorization"}, status: :unauthorized unless session.include? :user_id
  end

end
