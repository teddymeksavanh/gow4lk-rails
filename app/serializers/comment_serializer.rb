class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_by, :user, :created_at, :updated_at

  def user
    User.find(object.created_by.to_s)
  end
end
