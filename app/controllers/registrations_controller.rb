class RegistrationsController < ApplicationController
    
    def index
        @users = User.all
      end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params.merge password_digest:BCrypt::Password.create(user_params[:password_confirmation]))
        respond_to do |format|
            if @user.save
                    format.html { redirect_to new_sign_in_path, notice: "Successfully created account" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end

