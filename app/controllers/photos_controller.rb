class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def index
  end

  def create
  end

  private

  def photo_params
    params.require(:photo).permit(
      :title,
      :image_file
    )
  end
end
