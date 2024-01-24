# frozen_string_literal: true

class UsersController < ApplicationController
  include Pundit::Authorization

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
    get_user_by_id
  end

  def edit
    get_user_by_id
    authorize @user
  end

  def new
    authorize @user
  end

  def destroy
    get_user_by_id
    authorize @user

    if @user.destroy
      flash[:notice] = 'User deleted successfully.'
    else
      flash[:alert] = 'Unable to delete user.'
    end
    redirect_to root_path
  end

  def get_user_by_id
    @user = User.find(params[:id])
  end
end
