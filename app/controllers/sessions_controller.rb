class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
       
        if Current.user.nil? 
            if user.present? && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to categories_path
            else
                flash[:alert] = "Invalid email or password"
                redirect_to new_sign_in_path
            end
        else
            flash[:alert] = "Someone is already signed in"
            redirect_to new_sign_in_path
        end

    end
        def destroy
            session[:user_id] = nil
            redirect_to root_path, notice: "Logged out"
        end
end
