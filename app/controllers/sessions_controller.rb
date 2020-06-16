class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(username: login_params[:username])
    if user && user.authenticate(login_params[:password])
      login(user)
      redirect_to root_path, notice: "Logged in as "
    else
      flash[:notice] = "Username / Password combination invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged Out"
  end

  private
  def login_params
    params.require(:session).permit(:username, :password)
  end
end
