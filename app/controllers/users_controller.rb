class UsersController < ApplicationController
  layout "process_account"

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = I18n.t("flash.user.signup_succ")
      redirect_to root_path
    else
      flash[:danger] = I18n.t("flash.user.signup_fail")
      render :new
    end
  end

  def show; end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :address,
      :password_confirmation, :phone_number)
  end
end