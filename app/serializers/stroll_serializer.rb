class StrollSerializer < ActiveModel::Serializer
  attributes :id, :name, :gallery, :description, :length, :city, :country, :latitude, :longitude, :created_by

  has_many :paths
  has_many :comments
  has_many :notes
end
