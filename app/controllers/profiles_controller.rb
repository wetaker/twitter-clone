class ProfilesController < ApplicationController

    def new
        @profile = current_user.profile
    end

    def update
        if current_user.profile.update_attributes(profile_params)
            redirect_to current_user
        else
            render 'profile#new'
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:description, :avatar)
    end


end
