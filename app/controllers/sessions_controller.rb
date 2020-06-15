class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(login_params[:password])
      # byebug
      login(user)
      redirect_to "/", notice: "Logged In"
    else
      flash[:notice] = "Username / Password combination invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to "/", notice: "Logged Out"
  end

  private
  def login_params
    params.require(:session).permit(:username, :password)
  end
end
