class UsersController < ApplicationController

    def index
        @users = User.all
        @user = User.new
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to user_url(@user)
        else
            render '/'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
