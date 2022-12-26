class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
    redirect_to root_path if current_user
  end

  def create
    if invalid_params_messages.present?
      flash[:alert] = invalid_params_messages
      redirect_to login_path and return
    end

    if account_existence?
      if verification?
        session[:user_id] = login_user.id
        redirect_to root_path, notice: 'ログインした'
      else
        redirect_to login_path, alert: 'ユーザーIDとパスワードが一致するユーザーが存在しない'
      end
    else
      redirect_to login_path, alert: 'ユーザーIDとパスワードが一致するユーザーが存在しない'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトした'
  end

  private

  def session_params
    params.require(:session).permit(:login_id, :password)
  end

  def invalid_params_messages
    message = []
    message << 'ユーザーIDを入力してください' if session_params[:login_id].blank?
    message << 'パスワードを入力してください' if session_params[:password].blank?

    message
  end

  def login_user
    User.find_by(login_id: session_params[:login_id])
  end

  def account_existence?
    if login_user.present?
      true
    else
      false
    end
  end

  def verification?
    if login_user.authenticate(session_params[:password])
      true
    else
      false
    end
  end
end
