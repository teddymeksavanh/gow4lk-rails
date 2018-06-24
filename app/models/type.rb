class Type < ApplicationRecord
    belongs_to :stroll, foreign_key: :id, optional: true
    
    validates_presence_of :name, :description, :color
end
