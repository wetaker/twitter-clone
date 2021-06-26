class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.where(author_id: current_user.followed_users).or(Post.where(author_id: current_user)).order(created_at: :desc).limit(20)
    if current_user.followed_users.empty?
      @tweets = Tweet.last(20)
    end
    
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params, author_id: current_user.id)

    if @tweet.save
      redirect_to request.referrer
    else
      render :new
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
    params.require(:tweet).permit(:body, :title, :parent_id)
  end
end
