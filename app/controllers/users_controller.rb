# frozen_string_literal: true

# This controller provides the overall control on Users
class UsersController < ApplicationController
  include Pundit::Authorization

  before_action :authenticate_user!

  def index
    @pagy, @users = pagy(User.all, items: 10)
    authorize @users
  end

  def my_profile
    @user = current_user
    authorize @user
  end

  def show
    user
  end

  def edit
    user
    authorize @user
  end

  def new
    authorize @user
  end

  def destroy
    user
    authorize @user

    if @user.destroy
      flash[:notice] = 'User deleted successfully.'
    else
      flash[:alert] = 'Unable to delete user.'
    end
    redirect_to root_path
  end

  def user
    @user = User.find(params[:id])
  end
end
