class ApplicationController < ActionController::Base
  protect_from_forgery

  include AccessHelper

  helper_method :signed_in?
  helper_method :current_user
  helper_method :can?

  before_filter :check_access
end
