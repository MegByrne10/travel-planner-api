# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
  def respond_with(resource, _opts = {})
    render json: { message: 'You are logged in.' }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened."}, status: :unauthorized
  end

  # def respond_with(current_user, _opts = {})
  #   render json: {
  #     status: { 
  #       code: 200, message: 'Logged in successfully.',
  #       data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
  #     }
  #   }, status: :ok
  # end

  # def respond_to_on_destroy
  #   if request.headers['Authorization'].present?
  #     jwt_payload = JWT.decode(request
  #         .headers['Authorization']
  #         .split(' ')
  #         .last, 
  #       ENV['DEVISE_JWT_SECRET_KEY']
  #     current_user = User.find(jwt_payload['sub'])
  #   end
    
  #   if current_user
  #     render json: {
  #       status: 200,
  #       message: 'Logged out successfully.'
  #     }, status: :ok
  #   else
  #     render json: {
  #       status: 401,
  #       message: "Couldn't find an active session."
  #     }, status: :unauthorized
  #   end
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
