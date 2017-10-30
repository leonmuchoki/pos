class Food < ApplicationRecord
  belongs_to :menu
  has_attached_file :image
  
  #do_not_validate_attachment_file_type :image

  has_attached_file :image, style: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
