class Stroll < ApplicationRecord
  has_many :types, dependent: :destroy
  has_many :paths, dependent: :destroy

  validates_presence_of :name, :description, :created_date, :length, :city, :country, :latitude, :longitude, :created_by
end
