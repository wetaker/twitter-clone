class TweetsController < ApplicationController
  #before_action :authenticate_user!

  def index
    @tweet = Tweet.new
    @tweets = Tweet.where(author_id: current_user.followed_users, parent_id: nil).or(Tweet.where(author_id: current_user, parent_id: nil)).paginate(:page => params[:page]).order('created_at DESC')
    if current_user.followed_users.empty?
      @tweets = Tweet.where(parent_id: nil).paginate(:page => params[:page]).order('created_at DESC')
    end
    
  end

  def show
    @tweet = Tweet.find(params[:id])
    @children = @tweet.children
  end
  
  def new
    @tweet = Tweet.new
    @tweet.parent_id = params[:tweet][:parent_id]
  end
  
  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      helpers.createMentions(@tweet)
      redirect_to request.referrer
    else
      render "new"
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to request.referrer
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to user_path(current_user)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :parent_id)
  end
end
