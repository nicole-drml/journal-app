class RegistrationsController < ApplicationController
    
    def index
        @users = User.all
      end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                format.html { redirect_to categories_path, notice: "Successfully created account" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password_digest )
        end
end

