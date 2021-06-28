# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all



# User seeding
2.times do |n|
    u = User.new
    u.email = Faker::Internet.email
    u.handle = '@' + u.email
    u.username="user#{n}"
    u.save(validate: false)
end

u1 = User.first
u2 = User.last
# Create a tweet for u1
u1.tweets.create!(body: "Hi my name is #{u1.email} and this is my first tweet", 
    title: "Title")

tweet = u1.tweets[0]

# u2 likes u1 tweet
Like.create!(liker_id: u2.id, liked_tweet_id: tweet.id, liked_user_id: tweet.author.id)

# u2 retweets u1s tweet
Retweet.create(retweeted_tweet_id: tweet.id, retweeter_id: u2.id,
                retweeted_user_id: tweet.author.id)

# u2 liked u1's tweet so much that u2 follows u1
Following.create(follower_id: u2.id, followed_user_id: u1.id)

# u1 appreciated u2's engagement and so mentioned him in his tweet!
Mentioning.create(mentioned_user_id: u2.id, mentioner_id: u1.id, tweet_id: tweet.id)

