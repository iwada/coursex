class UsersController < ApplicationController
  #before_filter :require_login, :only => [:new]
  def new
    @title = "User Registratoin"
    @user = User.new;
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up, Awaiting Admin Approval"
    else
      render :new
    end
  end

  def activate
  if (@user = User.load_from_activation_token(params[:id]))
    @user.activate!
    redirect_to(login_path, :notice => 'You have been successfully activated.')
  else
    not_authenticated
  end
  end



  end

