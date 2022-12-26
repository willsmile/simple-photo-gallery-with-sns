require "net/http"

class MyTweetApp
  def initialize(access_token)
    @access_token = access_token
  end

  def tweet(data)
    uri = URI.parse(ENV.fetch('TWEET_PHOTO_API_URL'))
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.request_uri)

    req['Content-Type'] = 'application/json'
    req['Authorization'] = "Bearer #{@access_token}"
    req.body = data.to_json

    resp = http.request(req)

    begin
      resp.value
    rescue Net::HTTPExceptions => e
      logger.error("ツイート投稿失敗: #{e}")
    end

    resp
  end

  class << self
    def auth_endpoint
      uri = URI.parse(ENV.fetch('OAUTH_AUTHORIZE_URL'))
      uri.query = URI.encode_www_form(authorize_request_params)

      uri.to_s
    end

    def token_request(code)
      uri = URI.parse(ENV.fetch('OAUTH_TOKEN_URL'))
      
      resp = Net::HTTP.post_form(uri, token_request_params(code))

      begin
        resp.value
      rescue Net::HTTPExceptions => e
        logger.error("アクセストークン取得失敗: #{e}")
      end

      resp
    end

    private

    def authorize_request_params
      {
        client_id: ,
        response_type: 'code',
        redirect_uri: ,
        scope: ,
        state: 'INTENTIONANLLY_NOT_SET',
      }
    end

    def token_request_params(code)
      {
        code: ,
        client_id: ,
        client_secret: ,
        redirect_uri: ,
        grant_type: 'authorization_code',
      }
    end

    def scope
      ENV.fetch('OAUTH_SCOPE')
    end

    def client_id
      ENV.fetch('OAUTH_CLIENT_ID')
    end

    def client_secret
      ENV.fetch('OAUTH_CLIENT_SECRET')
    end

    def redirect_uri
      ENV.fetch('OAUTH_REDIRECT_URI')
    end
  end
end
