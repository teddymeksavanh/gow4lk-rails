class Path < ApplicationRecord
    belongs_to :stroll, foreign_key: :id, optional: true
    # has_one_attached :media
    mount_base64_uploader :photo, PictureUploader

    # validates :name, :description
    validates_presence_of :latitude, :longitude

private
    def parse_image
    image = Paperclip.io_adapters.for(image_base)
    image.original_filename = "file.jpg"
    self.picture = image
    end
end
