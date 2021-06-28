class RegistrationsController < Devise::RegistrationsController

    def create
        super
        @user.handle = "@" + @user.username
        @user.save
    end


end