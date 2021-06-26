class Mentioning < ApplicationRecord
  belongs_to :mentioned_user
  belongs_to :mentioner
  belongs_to :tweet
end
