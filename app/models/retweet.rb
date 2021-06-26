class Retweet < ApplicationRecord
  belongs_to :retweeted_tweet, class_name: 'Tweet', foreign_key: :retweeted_tweet_id
  belongs_to :retweeter, class_name: 'User', foreign_key: :retweeter_id
  belongs_to :retweeted_user, class_name: 'User', foreign_key: :retweeted_user_id
end
