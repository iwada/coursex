class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [ :new,:create,:activate] #put here to avoid Login
  before_filter :admin_user, :only => [:destroy,:index]


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

  def destroy
    if User.find(params[:id]).destroy  #this deletes the Login and not the Employee details
      redirect_to users_path, :notice => "User Deleted Successfully"
    else
      flash.now.alert = "Error Deleting User"
      render 'index'
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
    redirect_to(root_path, :notice => 'You have been successfully activated.')
  else
    not_authenticated
  end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(users_dashboard_path) unless current_user?(@user)
  end

  def admin_user
    if logged_in?
      redirect_to(root_path) unless current_user.admin?
      flash[:alert] = "You do not have the Required Privilege to View that Page"
    else
      redirect_to root_path
    end
  end

  def dashboard

  end





  end

