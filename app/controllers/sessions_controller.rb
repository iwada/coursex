class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new

  end

  def create
  user = login(params[:email], params[:password], params[:remember_me])
  users = User.find_by_email(params[:email])
  if user
    redirect_back_or_to root_url
    #redirect_back_or_to root_url, :notice => "Logged in!"
  elsif users != nil && users.activation_state === "pending"
    flash.now.alert = "Your Account is Inactive"
    render :new
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
