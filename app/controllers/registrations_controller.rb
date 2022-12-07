class RegistrationsController < ApplicationController

    def index
        @users = User.all
      end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            respond_to do |format|
                format.html { redirect_to create_registration_path, notice: "Successfully created account" }
            end
        else
            respond_to do |format|
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password_digest )
        end
end
