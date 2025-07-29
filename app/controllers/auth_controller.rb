class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
      render json: { token: token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def signup
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base)
      render json: { token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def logout
    # No server-side session, so just return success
    render json: { message: 'Logged out' }
  end
end
