class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        unless params[:search]
            @users = User.all.includes(:followings).sort{|a,b| a.followers.count <=> b.followers.count}.reverse
            @users = User.where(id: @users.map(&:id)).paginate(:page => params[:page])
        else
            @users = helpers.userSearch(params[:search])
            @users = User.where(id: @users.map(&:id)).paginate(:page => params[:page])
        end
    end


    def show
        @user = User.find(params[:id])
        if params[:replies]
            retweets = Retweet.where(retweeter_id: @user.id).map do |retweet| retweet.retweeted_tweet end
            retweeted_tweets = Tweet.where(id: retweets.map(&:id))
            @tweets = Tweet.where(author_id: @user.id).or(retweeted_tweets)
        elsif params[:likes]
            @tweets = @user.liked_tweets
        else 
            retweets = Retweet.where(retweeter_id: @user.id).map do |retweet| retweet.retweeted_tweet end
            retweeted_tweets = Tweet.where(id: retweets.map(&:id))
            @tweets = @user.tweets.or(retweeted_tweets)
        end
    end

    def create
        super
        @user.handle = "@" + @user.username
        @user.save
        redirect_to 'root'
    end

end