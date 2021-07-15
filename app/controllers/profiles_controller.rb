class ProfilesController < ApplicationController

    def new
        @profile = current_user.profile
    end

    def update
        @profile = current_user.profile
        @profile.description = profile_params()['description'] unless profile_params['description'].nil?
        @profile.avatar.attach(profile_params['avatar']) unless profile_params['avatar'].nil?
        @profile.banner.attach(profile_params['banner']) unless profile_params['banner'].nil?
        if @profile.save
            redirect_to current_user
        else
            render 'profile#new'
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:description, :avatar, :banner)
    end


end
