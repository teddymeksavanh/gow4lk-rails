class Note < ApplicationRecord
  belongs_to :user, foreign_key: :id, optional: true
  belongs_to :stroll, foreign_key: :id, optional: true
  validates_presence_of :description
end
