class ApplicationController < ActionController::API
  def current_user
    auth_header = request.headers["Authorization"]
    if auth_header
      token = auth_header.split(" ").last
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      @current_user ||= User.find(decoded["user_id"])
    end
  rescue
    nil
  end
end
