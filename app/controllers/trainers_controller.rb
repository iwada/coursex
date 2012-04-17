class TrainersController < ApplicationController
  skip_before_filter :require_login, :only => [ :new,:create,:activate] #put here to avoid Login
  before_filter :admin_user, :only => [:index]
  before_filter :correct_trainer,:only =>[:show,:edit]


  def new
    @title = "New Trainer Registration"
    @trainer = Trainer.new
  end

  def dashboard
    @title = "Trainer DashBoard"
  end

  def index
    @title =" Trainers Listing"
    @trainer = Trainer.search(params[:search]).page(params[:page]).per(3)
  end

  def edit
    @trainer= Trainer.find(params[:id])
    @title = "Edit Trainers Details"
  end

  def update
    @trainer= Trainer.find(params[:id])
    if @trainer.update_attributes(params[:trainer])
    redirect_to trainers_dashboard_path,:notice=>"Update Successfull"

    else
      flash.now.alert = "Error Updating"
      render 'edit'
    end
  end

  def results
   @title = "Upload Students Results"
  end

  def attendance
      @title = "Manage Student's Attendance'"
  end



  def destroy
    if Trainer.find(params[:id]).destroy
      redirect_to trainers_path, :notice => "Employee Deleted Successfully"
    else
      flash.now.alert = "Error Deleting Employee"
      render 'index'
    end
  end

  def show
    @title = "Trainer Detail"
    @trainer = Trainer.find(params[:id])
  end

  def create
    @title = "Trainer Registration"
    @trainer = Trainer.new(params[:trainer])
    if @trainer.save
      redirect_to trainers_dashboard_path , :notice => 'Trainer successfully Registered'
    else
      flash.now.alert = "Oops, Something went wrong"
      render :new
    end
  end

  def admin_user
    if logged_in?  and !current_user.admin?
      redirect_to root_path
      flash[:error] = "You do not have the Required Privilege to View that Page"
    end
  end

  def print
    @title ="Print List"
  end

  def mailout

  end

  def correct_trainer
    @trainer= Trainer.find(params[:id])
    redirect_to(trainers_dashboard_path)  unless current_trainer?(@trainer) or current_user.admin?
  end

end
