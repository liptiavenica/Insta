class PhotosController < ApplicationController
  def index
   @photos = Photo.all
  end

  def new
	@photo = Photo.new
  end

  def edit
   @photo = Photo.find_by_id(params[:id])
  end
  
  def create
   @photo = Photo.new(params_photo)
   if @photo.save
     redirect_to photos_path, :notice => "Upload photo #{@photo.name} success"
   else
    render "new", :error => "Upload photo #{@photo.name} failed"
   end
  end
  
  def update
   @photo = Photo.find(params[:id])
   if @photo.update(params_photo)
    redirect_to photos_path, :notice => "Update photo #{@photo.name} success"
   else
    render "new", :error => "Update photo #{@photo.name} failed"
   end
  end
  
  def show
   @photo = Photo.find_by_id(params[:id])
  end
  
  def destroy
   @photo = Photo.find_by_id(params[:id])
   if @photo.destroy
    flash[:notice] = "Photo Deleted"
    redirect_to action: 'index'
   else
    flash[:error] = "Failed to delete photo"
    redirect_to action: 'index'
   end
  end
  
  private
  def params_photo
   params.require(:photo).permit(:name, :photo_file_name)
  end
  
end
