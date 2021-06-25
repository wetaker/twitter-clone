# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Tweet.delete_all
Following.delete_all


# User seeding
10.times do |n|
    u = User.new
    u.email = Faker::Internet.email
    u.handle = '@' + u.email
    u.save(validate: false)
end

# Tweet seeding
u1 = User.first
u1.tweets.create!(body: "body", title: "title")