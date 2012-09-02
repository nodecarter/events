require 'test_helper'

class Account::EventsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @event = create :week_event, user: @user
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    attr = attributes_for :week_event
    post :create, event: attr
    assert_response :redirect
    @new_event = @user.events.find_by_name attr[:name]
    assert_equal attr[:date], @new_event.date
  end

  test "should get edit" do
    get :edit, id: @event.id
    assert_response :success
  end

  test "should update event" do
    attr = attributes_for :event
    put :update, id: @event.id, event: attr
    assert_response :redirect
    @event.reload
    assert_equal attr[:name], @event.name
    assert_equal attr[:date], @event.date
  end

  test "should drop event" do
    delete :destroy, id: @event.id
    assert_response :redirect
    deleted_event = Event.find_by_id(@event.id)
    assert_nil deleted_event
  end
end
