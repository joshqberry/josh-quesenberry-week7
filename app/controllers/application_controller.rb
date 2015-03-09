class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def authenticate
  unless current_user
    flash[:danger] = 'Please log in for access.'
    redirect_to '/login'
  end
  end

end
