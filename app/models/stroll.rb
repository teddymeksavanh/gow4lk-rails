class Stroll < ApplicationRecord
  has_many :types, dependent: :destroy
  has_many :paths, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notes, dependent: :destroy

  mount_base64_uploader :gallery, PictureUploader

  # validates :length, :latitude, :longitude, presence: false
  validates_presence_of :name, :description, :city, :country, :created_by
  private
    def parse_image
      image = Paperclip.io_adapters.for(image_base)
      image.original_filename = "file.jpg"
      self.picture = image
    end
end
