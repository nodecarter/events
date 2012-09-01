module AuthHelper
  extend ActiveSupport::Concern

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def current_user
    @current_user ||= (session[:user_id] &&
        User.find_by_id(session[:user_id])) || User::Guest.new
  end
end
