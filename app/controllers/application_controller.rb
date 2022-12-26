class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate!

  class Unauthenticated < StandardError; end

  rescue_from Unauthenticated, with: :rescue_unauthenticated

  def rescue_unauthenticated(err = nil)
    render 'errors/unauthenticated', status: 401, layout: 'error', formats: [:html]
  end

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def authenticate!
    raise Unauthenticated unless current_user
  end
end
