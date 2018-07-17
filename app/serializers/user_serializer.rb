class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin, :password_digest, :picture, :created_at, :updated_at

  has_many :strolls
  has_many :comments
  has_many :notes
end
