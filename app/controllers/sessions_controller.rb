class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to :root, notice: t("sessions.create.logged_in", user: user)
    else
      flash[:error] = t("sessions.create.error")
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to :root, notice: t("sessions.create.logged_out")
  end
end
