class SessionsController < ApplicationController
  def new

  end

  def create
  user = login(params[:email], params[:password], params[:remember_me])
  users = User.find_by_email(params[:email])
  if user
    redirect_back_or_to root_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid Login Credentials"

    render :new
  end
  end


  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

end
