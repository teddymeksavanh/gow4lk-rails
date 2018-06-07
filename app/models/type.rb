class Type < ApplicationRecord
    belongs_to :stroll, foreign_key: :id
    
    validates_presence_of :name, :description, :color
end
