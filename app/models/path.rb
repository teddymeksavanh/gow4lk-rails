class Path < ApplicationRecord
    belongs_to :stroll, foreign_key: :id, optional: true
    has_one_attached :media

# validates :name, :description
validates_presence_of :latitude, :longitude
end
