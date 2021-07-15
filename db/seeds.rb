# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all



# User seeding
50.times do |n|
    u = User.new
    u.email = Faker::Internet.email
    u.username=Faker::Name.name
    u.handle = '@' + u.username
    u.save(validate: false)
    p = u.create_profile
    p.save
end


User.all.each do |user|    
    5.times do |n|
        body = Faker::Quote.famous_last_words
        if rand() < 0.5
            tweet = user.tweets.build(body: body, parent_id: nil) 
            tweet.save(validate: false)
        end
    end
end

