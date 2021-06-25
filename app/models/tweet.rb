class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :parent, class_name: 'Tweet', optional: true
  has_many :children, class_name: 'Tweet', foreign_key: :parent_id
end
