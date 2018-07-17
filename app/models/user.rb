# app/models/user.rb
class User < ApplicationRecord
    mount_base64_uploader :picture, PictureUploader

    # encrypt password
    has_secure_password
    has_one_attached :avatar

    # has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    # validates_attachment :picture, presence: true
    # do_not_validate_attachment_file_type :picture

    # Model associations
    has_many :strolls, foreign_key: :created_by
    has_many :comments, foreign_key: :created_by
    has_many :notes, foreign_key: :created_by
    # Validations
    validates_presence_of :name, :email, :password_digest
    # Validations specification
    validates :email, uniqueness: true

    private
      def parse_image
        image = Paperclip.io_adapters.for(image_base)
        image.original_filename = "file.jpg"
        self.picture = image
      end

  end