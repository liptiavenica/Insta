class Photo < ActiveRecord::Base
validates :name, presence: true, length: { minimum: 5 }

has_attached_file :photo_file_name, :styles => {:medium => "400x200>", :thumb => "200x100>", :default_url => ""}
validates_attachment_content_type :photo_file_name, :content_type => /\Aimage\/.*\Z/
end
