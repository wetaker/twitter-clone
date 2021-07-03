class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end


    def show
        @user = User.find(params[:id])
        if params[:replies]
            @tweets = Tweet.where(author_id: @user.id)
        elsif params[:likes]
            @tweets = @user.liked_tweets
        else 
            @tweets = @user.tweets
        end
    end

    def create
        super
        @user.handle = "@" + @user.username
        @user.save
    end

end