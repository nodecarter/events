class WelcomeController < ApplicationController
  before_filter :require_login

  def index
    @calendar = CalendarPresenter.new(params[:date])
    @events = Event.hash_for_period(@calendar.range)
  end

  private

  def require_login
    redirect_to new_session_path unless signed_in?
  end
end
