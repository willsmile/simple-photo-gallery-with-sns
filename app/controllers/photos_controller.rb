class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to photos_path, notice: '写真はアップロードしました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @photos = current_user.photos
  end

  def upload_to_mytweet
    raise Forbidden unless my_tweet_authorized?

    photo = current_user.photos.find(params[:id])
    data = tweet_data(photo)
    resp = MyTweetApp.new(session[:access_token]).tweet(data)

    if resp&.code == '201'
      redirect_to photos_path, notice: 'MyTweetAppへの写真投稿は成功しました'
    else
      redirect_to photos_path, alert: 'MyTweetAppへの写真投稿は失敗しました'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(
      :title,
      :image_file
    )
  end

  def tweet_data(photo)
    {
      text: photo.title,
      url: photo.image_url
    }
  end
end
