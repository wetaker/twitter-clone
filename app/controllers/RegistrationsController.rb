class RegistrationsController < Devise::RegistrationsController

    def create
        super
        @profile = @user.create_profile
        @profile.save
        @user.save
    end




end