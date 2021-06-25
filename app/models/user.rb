class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, foreign_key: :author_id, class_name: 'Tweet'

  has_many :followings
  has_many :followers, through: :followings
  has_many :followed_users, through: :followings
end
