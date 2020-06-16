class UsersController < ApplicationController

    def new
        @user = User.new
        render :new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user) 
            redirect_to root_path
        else 
            redirect_to new_user_path
            flash[:alert] = @user.errors.full_messages
        end
    end

    def show
        @user = User.find(params[:id])
        @user_dispatches = @user.dispatches
        render :show
    end

    def update 
        user = User.find(params[:id])
        if current_user.id == user.id
            user.update(update_params)
            redirect_to user_path(user)
            flash[:message] = "Profile has been updated."
        else
            flash[:message] = "Current user cannot edit this profile."
            redirect_to user_path(user)
        end
    end
        

    
    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :age, :location)
    end

    def update_params 
        params.delete(:password)
        params.delete(:password_confirmation)
        params.require(:user).permit(:username, :email, :age, :location)
    end 
end
