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
    flash[:notice] = "Success Upload Photo"
    redirect_to action: 'index'
   else
    flash[:error] = "Masukan nama untuk foto!"
    render 'new'
   end
  end
  
  def update
   @photo = Photo.find_by_id(params[:id])
   if @photo.update(params_photo)
    flash[:notice] = "Success Update Photo"
    redirect_to action: 'index'
   else
    flash[:error] = "Input data dengan benar"
    render 'edit'
   end
  end
  
  def destroy
   @photo = Photo.find_by_id(params[:id])
   if @photo.destroy
    flash[:notice] = "Success Delete a Photo"
    redirect_to action: 'index'
   else
    flash[:error] = "fails delete a photo"
    redirect_to action: 'index'
   end
  end
  
  private
  def params_photo
   params.require(:photo).permit(:name)
  end
  
end
