class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:update, :activate, :create]

  def index
    @title = "User Listing"
    @user =  User.order("email").page(params[:page]).per(3)
  end

  def new
    @title = "User Registratoin"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up, Awaiting Admin Approval"
    else
      render :new
    end
  end

  def show
    @title = "User Detail"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])

      redirect_to users_path,:notice=>"Update Successfull"
    else
      flash[:success] = "Update Attempt Failed"
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "#{@user.email}'s Details"

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

