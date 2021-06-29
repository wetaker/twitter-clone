class RetweetsController < ApplicationController


    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.find(params[:tweet_id])
        tweet_retweets = Retweet.where(retweeted_tweet: tweet, retweeter: current_user)
        if tweet_retweets.empty?
            Retweet.create(retweeted_tweet: tweet, retweeted_user_id: tweet.author.id, retweeter_id: current_user.id)
        else
            tweet_retweets.map do |retweet|
                retweet.destroy
            end
        end
        redirect_to request.referrer
    end


end