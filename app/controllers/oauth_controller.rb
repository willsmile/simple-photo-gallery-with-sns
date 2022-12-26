class OauthController < ApplicationController
  def authorize
    redirect_to MyTweetApp.auth_endpoint, allow_other_host: true
  end

  def callback
    if params[:code].blank?
      redirect_to root_url, alert: 'MyTweetAppとの連携は失敗した' and return
    end

    resp = MyTweetApp.token_request(params[:code])
    result = JSON.parse(resp.body)
    session[:access_token] = result['access_token']

    redirect_to root_url, notice: 'MyTweetAppとの連携は成功した'
  end
end
