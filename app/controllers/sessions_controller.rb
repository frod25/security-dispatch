class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(login_params[:password])
      login(user)
      redirect_to root_path
      flash[:notice] = "Logged in as #{current_user.username}."
    else
      flash[:notice] = "Login Failed.. Try Again"
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    redirect_to root_path
    flash[:notice] = "Logged Out"
  end

  private
  def login_params
    params.require(:session).permit(:username, :password)
  end
end
