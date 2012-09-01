class UsersController < ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      redirect_to root_url, notice: t("users.create.successfull")
    else
      render action: :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
