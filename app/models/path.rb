class Path < ApplicationRecord
    belongs_to :stroll, foreign_key: :id, optional: true
    has_one_attached :media

    validates_presence_of :name, :description, :latitude, :longitude
end
