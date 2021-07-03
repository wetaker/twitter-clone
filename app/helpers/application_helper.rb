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


end
