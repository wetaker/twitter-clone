class FollowingsController < ApplicationController
    before_action :authenticate_user!

    def create
        unless params[:followed_user_id] == current_user.id
            Following.create(followed_user_id: params[:followed_user_id], follower_id: current_user.id)
        end
        redirect_to request.referrer
    end


    def destroy
        @follow = Following.where(follower_id: current_user.id, followed_user_id: params[:followed_user_id])
        @follow.map do |follow| follow.destroy end
        redirect_to request.referrer
    end
    
end