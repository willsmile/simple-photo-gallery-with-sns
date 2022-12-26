class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :my_tweet_authorized?
  before_action :authenticate!

  class Unauthenticated < StandardError; end
  class Forbidden < StandardError; end

  rescue_from Unauthenticated, with: :rescue_unauthenticated
  rescue_from StandardError, with: :rescue_unexpected_exception

  def rescue_unauthenticated(err = nil)
    render 'errors/unauthenticated', status: 401, layout: 'error', formats: [:html]
  end

  def rescue_forbidden(err = nil)
    render 'errors/forbidden', status: 403, layout: 'error',  formats: [:html]
  end

  def rescue_unexpected_exception(err = nil)
    render 'errors/server_error', status: 500, layout: 'error',  formats: [:html]
  end

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def my_tweet_authorized?
    session[:access_token].present?
  end

  def authenticate!
    raise Unauthenticated unless current_user
  end
end
