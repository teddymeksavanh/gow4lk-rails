class Stroll < ApplicationRecord
  has_many :types, dependent: :destroy
  has_many :paths, dependent: :destroy

  # validates :length, :latitude, :longitude, presence: false
  validates_presence_of :name, :description, :city, :country, :created_by
end
