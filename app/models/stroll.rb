class Stroll < ApplicationRecord
  # has_many :types, dependent: :destroy
  # has_and_belongs_to_many :types, join_table: :strolls_types, dependent: :delete_all
  has_many :paths, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :strolltypes, dependent: :destroy

  mount_base64_uploader :gallery, PictureUploader

  # validates :length, :latitude, :longitude, presence: false
  validates_presence_of :name, :description, :city, :created_by
  private
    def parse_image
      image = Paperclip.io_adapters.for(image_base)
      image.original_filename = "file.jpg"
      self.picture = image
    end
end
