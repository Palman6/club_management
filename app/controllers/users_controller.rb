class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    authorize @users
  end

  def my_profile
    @user = current_user
    authorize @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    authorize @user
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user

    if @user.destroy
      flash[:notice] = "User deleted successfully."
    else
      flash[:alert] = "Unable to delete user."
    end

    redirect_to root_path
  end

  # def update
  #   @user = current_user
  #   if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  #     params[:user].delete(:password)
  #     params[:user].delete(:password_confirmation)
  # end
  
  #   Rails.logger.debug "Params: #{params.inspect}"
  #   if @user.update_without_password(user_params)
  #     redirect_to users, notice: 'Profile updated successfully.'
  #   else
  #     Rails.logger.debug "Errors: #{@user.errors}"
  #     render :edit
  #   end
  # end

  # def getUserById(id)
  #   @user = User.find(id);
  # end
end
