class Tweet < ApplicationRecord

  # Tweet author
  belongs_to :author, class_name: 'User'

  # Parent tweet
  belongs_to :parent, class_name: 'Tweet', optional: true

  # Tweet replies
  has_many :children, class_name: 'Tweet', foreign_key: :parent_id

  # Mentions
  has_many :mentionings, class_name: 'Mentioning', foreign_key: :tweet_id
  has_many :mentioned_users, through: :mentionings, source: :mentioned_user

  # Likes
  has_many :likes, class_name: 'Like', foreign_key: :liked_tweet_id

  # Retweets
  has_many :retweets, class_name: 'Retweet', foreign_key: :retweeted_tweet_id
  has_many :retweeters, through: :retweets, source: :retweeter
end
