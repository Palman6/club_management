# frozen_string_literal: true

# Devise registration controllers
module Users
  # Devise registration controllers
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    before_action :configure_account_update_params, only: %i[edit update]

    protected

    def update_resource(resource, account_update_params)
      resource.update_without_password(account_update_params)
    end

    # def after_update_path_for(resource)
    #   #redirect_to [current_account, resource]
    #   account_user_path(current_account, current_user)
    # end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, except: %i[current_password password])
    end

    def account_update_params
      params.require(:user).permit(:designation, :company, :address, :role, :name, :gender)
    end

    # def update_resource(resource, account_update_params)
    #   resource.update_without_password(account_update_params)
    # end

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[designation company address role name gender])
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:designation, :company, :address, :role, :name, :gender])
    # end

    # def account_update_params
    #   params.require(:user).permit(:account_update, keys: [:designation, :company, :address, :role, :name, :gender])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    # respond_to :json

    # private

    # def respond_with(resource, options={})
    #   if resource.persisted?
    #     render json: {
    #       status: { code: 200, message: 'Signed up successfully.', data: resource}, status: :ok
    #     }
    #   else 
    #     render json: {
    #       status: {message: 'User not created', errors: resource.errors.full_messages },
    #       status: :unprocessable_entity
    #   }
      
    # end
  end
end
