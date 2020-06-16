class UsersController < ApplicationController

    def new
        @user = User.new
        render :new 
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to "/"
        else 
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
        @user_dispatches = @user.dispatches
        render :show
    end

    
    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
