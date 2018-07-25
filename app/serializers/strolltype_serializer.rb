class StrolltypeSerializer < ActiveModel::Serializer
    attributes :id, :type_id, :created_at, :updated_at, :type
  
    belongs_to :stroll

    def type
      Type.find(object.type_id.to_s)
    end
  end
  