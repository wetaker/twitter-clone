class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Tweets
  has_many :tweets, foreign_key: :author_id, class_name: 'Tweet'


  # Followings
    # Incoming follows
  has_many :incoming_followings, class_name: 'Following', foreign_key: :followed_user_id
  has_many :followers, through: :incoming_followings, source: :follower

    # Outgoing follows
  has_many :outgoing_followings, class_name: 'Following', foreign_key: :follower_id
  has_many :followed_users, through: :outgoing_followings, source: :followed_user


  # Mentions
    # Incoming mentions
  has_many :incoming_mentionings, class_name: 'Mentioning', foreign_key: :mentioned_user_id
  has_many :mentioned_tweets, through: :incoming_mentionings, source: :tweet


  # Liked tweets
    # Outgoing likes
  has_many :outgoing_likes, class_name: 'Like', foreign_key: :liker_id
  has_many :liked_tweets, through: :outgoing_likes, source: :liked_tweet


  # Retweeted tweets 
  has_many :retweets, class_name: 'Retweet', foreign_key: :retweeter_id
  has_many :retweeted_tweets, through: :retweets, source: :retweeted_tweet
end
