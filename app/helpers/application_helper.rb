module ApplicationHelper


    def addHandlesToBody(body)
        # Takes a tweet body and returns the same body but with mentions replaced by links to the mentioned user 
        words = body.split(' ')
        words = words.map do |word|
            if word[0] == '@'
                potentialUser = word[1..-1]
                potentialUser = User.find_by(username: potentialUser)
                if potentialUser
                    "<a class=\"mention\" href=\"/users/#{potentialUser.id}\">@#{potentialUser.username}</a>"
                else
                    word
                end
            else
                word
            end
        end
        words.join(' ')
    end

    def createMentions(tweet) 
        # Takes a tweet and creates mentions that occur within its body.
        body = tweet.body
        words = body.split(' ')
        words = words.map do |word|
            if word[0] == '@'
                potentialUser = word[1..-1]
                potentialUser = User.find_by(username: potentialUser)
                if potentialUser
                    Mentioning.create(mentioner_id: tweet.author.id, tweet_id: tweet.id, mentioned_user_id: potentialUser.id)
                end
            end
        end
    end

end
