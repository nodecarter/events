class EventsController < ApplicationController
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @calendar = CalendarPresenter.new(@date)
    @events = Event.hash_for_period(@calendar.range)
  end
end
