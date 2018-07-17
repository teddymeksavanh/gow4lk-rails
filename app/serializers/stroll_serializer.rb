class StrollSerializer < ActiveModel::Serializer
  attributes :id, :name, :gallery, :description, :length, :city, :country, :latitude, :longitude, :created_by, :created_at, :updated_at, :is_active

  has_many :paths
  has_many :comments
  has_many :notes
end
