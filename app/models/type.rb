class Type < ApplicationRecord
    # belongs_to :stroll, foreign_key: :id, optional: true

    has_and_belongs_to_many :stroll, join_table: :strolls_types
    
    # validates_presence_of :name, :description, :color
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 80 }
end
