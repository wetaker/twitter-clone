class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :parent, class_name: 'Tweet'
  has_many :children, class_name: 'Tweet', foreign_key: :parent_id
end
