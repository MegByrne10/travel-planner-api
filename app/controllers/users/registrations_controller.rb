# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  protected

  def respond_with(current_user, opts = {})
    if resource.persisted?
      render json: {
          status: {
            code: 200,
            message: 'Signed up successfully.',
            data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
          }
        }, status: :ok
    else
      render json: { message: "User couldn't be created successfully. #{current_user&.errors.full_messages&.to_sentence}" }, 
        status: :unprocessable_entity
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
