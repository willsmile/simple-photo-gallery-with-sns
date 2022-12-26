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
    @photos = Photo.all
  end

  private

  def photo_params
    params.require(:photo).permit(
      :title,
      :image_file
    )
  end
end
