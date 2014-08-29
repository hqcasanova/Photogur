class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @photos_recent_five = Photo.most_recent_five
    @photos_older_month = Photo.created_before(1.month.ago)
  end

  def show
    @photo = Photo.find(params[:id])
    @first_id = Photo.first.id
    @last_id = Photo.last.id
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    redirect_to photos_path
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to photo_path
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  #Honor security restrictions
  private
  def photo_params 
    params.require(:photo).permit(:title, :author, :url)
  end
end
