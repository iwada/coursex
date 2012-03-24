class BranchesController < ApplicationController

  def index
    @title = "Branch Listing"
    @branch =  Branch.search(params[:search]).order("name").page(params[:page]).per(5)
  end

  def dashboard
    @title = "Branches Dashboard"
  end


  def create
    @branch = Branch.new(params[:branch])
    if @branch.save
      redirect_to branches_path, :notice => "Branch Created Successfully"
    else
      flash.now.alert = "Error Creating Branch"
      render :new
    end
  end
  def edit
    @branch = Branch.find(params[:id])
    @title = "#{@branch.name}'s Details"
  end

  def show
    @title = "Branch Details"
    @branch = Branch.find(params[:id])
  end

  def new
    @title = "Branch Registratoin"
    @branch = Branch.new
  end

  def destroy
    if Branch.find(params[:id]).destroy
      redirect_to branches_path, :notice => "Branch Deleted Successfully"
    else
      flash.now.alert = "Error Deleting Branch"
      render 'index'
    end
  end

  def update
    @branch= Branch.find(params[:id])
    if @branch.update_attributes(params[:branch])
    redirect_to branches_path,:notice=>"Update Successfull"
    else
      flash.now.alert = "Update Attempt Failed"
      render 'edit'
    end
  end

  def admin_user
    if logged_in?
      redirect_to(root_path) unless current_user.admin?
      flash[:alert] = "You do not have the Required Privilege to View that Page"
    else
      redirect_to root_path
    end
  end

end
