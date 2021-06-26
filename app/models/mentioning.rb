class Mentioning < ApplicationRecord
  belongs_to :mentioned_user, class_name: 'User'
  belongs_to :mentioner, class_name: 'User'
  belongs_to :tweet, class_name: 'Tweet'
end
