class StrollSerializer < ActiveModel::Serializer
  attributes :id, :name, :gallery, :description, :length, :city, :country, :latitude, :longitude, :created_by, :created_at, :updated_at, :is_active, :user, :gallery_seed

  has_many :paths
  has_many :comments
  has_many :notes
  has_many :strolltypes

  def user
    User.find(object.created_by.to_s)
  end
end
