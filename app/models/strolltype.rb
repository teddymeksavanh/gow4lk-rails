class Strolltype < ApplicationRecord
    # belongs_to :user, foreign_key: :id, optional: true
    belongs_to :stroll, foreign_key: :id, optional: true
    # belongs_to :user, class_name => 'Comment'
    # belongs_to :stroll, class_name =>
  
    validates_presence_of :type_id
  end
  