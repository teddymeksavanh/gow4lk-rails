# app/models/user.rb
class User < ApplicationRecord
    # encrypt password
    has_secure_password
    has_one_attached :avatar
    # Model associations
    has_many :strolls, foreign_key: :created_by
    # Validations
    validates_presence_of :name, :email, :password_digest
    # Validations specification
    validates :email, uniqueness: true
  end