class Api::V1::AuthController < Api::V1::BaseController
  before_action :authenticate_user, only: [:profile, :logout]

  def signup
    user = User.new(signup_params)

    if user.save
      token = generate_token(user.id)
      render json: {
        success: true,
        message: 'Account created successfully',
        user: user_body(user),
        token: token
      }, status: :created
    else
      render json: {
        success: false,
        message: 'Account creation failed',
        errors: user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: login_params[:email])

    if user && user.valid_password?(login_params[:password])
      token = generate_token(user.id)
      render json: {
        success: true,
        message: 'Login successful',
        user: user_body(user),
        token: token
      }, status: :ok
    else
      render json: {
        success: false,
        message: 'Invalid email or password'
      }, status: :unauthorized
    end
  end

  def logout
    # If you're storing tokens in database, invalidate them here
    render json: {
      success: true,
      message: 'Logged out successfully'
    }, status: :ok
  end

  def profile
    render json: {
      success: true,
      user: user_body(current_user),
    }, status: :ok
  end

  private

  def generate_token(user_id)
    payload = {
      user_id: user_id,
      exp: 24.hours.from_now.to_i
    }
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def login_params
    params.permit(:email, :password)
  end

  def signup_params
    params.permit(:email, :password, :password_confirmation)
  end

  def user_body(user)
    {
      id: user.id,
      email: user.email,
      language: user.language_id,
      currency: user.currency,
      theme: user.theme
    }
  end
end
