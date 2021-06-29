class LikesController < ApplicationController

    def create
        liked_tweet = Tweet.find(params[:tweet_id])
        tweet_likes = Like.where(liked_tweet: liked_tweet, liker: current_user)
        if tweet_likes.empty?
            Like.create(liked_tweet: liked_tweet, liked_user_id: liked_tweet.author.id, liker: current_user)
        else
            tweet_likes.map do |tweet|
                tweet.destroy
            end
        end
        redirect_to request.referrer
    end





end