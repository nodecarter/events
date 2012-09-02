class Account::EventsController < Account::ApplicationController
  def new
    @event = current_user.events.build(date: params[:date])
  end

  def create
    @event = current_user.events.build(params[:event])
    if @event.save
      redirect_to events_url(date: @event.date),
                  notice: t("account.events.create.successfull")
    else
      render action: :new
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_url(date: @event.date),
                  notice: t("account.events.update.successfull")
    else
      render action: :edit
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @date = @event.date
    if @event.destroy
      redirect_to events_url(date: @date),
                  notice: t("account.events.destroy.successfull")
    else
      redirect_to edit_account_event_url(@event),
                  flash: { error: current_user.errors.full_messages }
    end
  end

  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @calendar = CalendarPresenter.new(@date)
    @events = Event.hash_for_period(@calendar.range, current_user.events)
  end
end
