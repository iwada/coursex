class AccesspinsController < ApplicationController
  before_filter :admin_user
  def index
    @title = "Access Pins Listing"
    @accesspin = Accesspin.search(params[:search]).order("status").page(params[:page]).per(3)
  end

  def show

  end

  def new
    @title = "Create Access Pins"
    @accesspin = Accesspin.new
  end

  def create
    t = params[:accesspin][:access_quantity].to_i

    t.times do
      @accesspin = Accesspin.new(params[:accesspin])
    end
      if @accesspin.save
       redirect_to accesspins_path,  :notice => "#{t} Pins Created Successfully"
      else
        render 'new', :notice =>"Something went Wrong"
      end


  end

  def destroy
    if Accesspin.find(params[:id]).destroy
      redirect_to accesspins_path, :notice => "Access Pin Deleted Successfully"
    else
      flash.now.alert = "Error Deleting Pin"
      render 'index'
    end
  end

  def dashboard
    @title = "Access Dashboard"
  end

  def admin_user
    if logged_in?
      redirect_to (root_path), :error => "You do not have the Required Privilege to View that Page" unless current_user.admin?
      #flash[:alert] = "You do not have the Required Privilege to View that Page"
    else
      redirect_to root_path
    end
  end

end
