class Like < ApplicationRecord
  belongs_to :liked_tweet, class_name: 'Tweet'
  belongs_to :liker, class_name: 'User'
end
