class Note < ApplicationRecord
  # belongs_to :user, foreign_key: :id
  belongs_to :stroll, foreign_key: :id, optional: true

  validates_presence_of :description
  validates :created_by
end
