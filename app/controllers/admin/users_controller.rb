class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i(show edit update archive)

  def index
    @users = User.active.order(:email)
  end

  def new
    @user = User.new
  end

  def show
  end

  def archive
    if @user == current_user
      flash[:alert] = "You cannot archive yourself!"
    else
      @user.archive!
      flash[:alert] = "User has been archived."
    end
    redirect_to admin_users_path
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      redirect_to admin_users_url, notice: "User has been updated."
    else
      flash.now[:alert] = "User has not been updated."
      render :edit
    end
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "User has been created."
    else
      flash.now[:alert] = "User has not been created."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
