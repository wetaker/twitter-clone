class Tweet < ApplicationRecord
  self.per_page = 10

  # Tweet author
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  # Parent tweet
  belongs_to :parent, class_name: 'Tweet', optional: true

  # Tweet replies
  has_many :children, class_name: 'Tweet', foreign_key: :parent_id, dependent: :destroy

  # Mentions
  has_many :mentionings, class_name: 'Mentioning', foreign_key: :tweet_id, dependent: :destroy
  has_many :mentioned_users, through: :mentionings, source: :mentioned_user

  # Likes
  has_many :likes, class_name: 'Like', foreign_key: :liked_tweet_id, dependent: :destroy

  # Retweets
  has_many :retweets, class_name: 'Retweet', foreign_key: :retweeted_tweet_id, dependent: :destroy
  has_many :retweeters, through: :retweets, source: :retweeter
end
