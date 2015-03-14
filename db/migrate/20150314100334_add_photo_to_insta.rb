class AddPhotoToInsta < ActiveRecord::Migration
  def change
   add_attachment :photos, :photo_file_name
  end
end
