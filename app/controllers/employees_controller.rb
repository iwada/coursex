class EmployeesController < ApplicationController
  skip_before_filter :require_login, :only => [ :new,:create,:activate] #put here to avoid Login
  before_filter :correct_employee,:only =>[:show,:edit]
   before_filter :admin_user, :only => [:destroy,:index]

  def index
    @title = "Employees Listing"
    @employee =  Employee.search(params[:search]).page(params[:page]).per(3)
  end

  def dashboard
    @title = "Employee Details"
  end

  def results
    @title = "Your Results"
  end

  def classes
    @title = "Your Classes"
    @classes = Progress.where(:employee_id => current_employee.id)
  end


  def new
    @title = "New Employee Registration"
    @employee = Employee.new
  end

  def register
     @temp = Course.all
    @employee= Employee.new(params[:employee])
    @title = "Course Registration"
    if request.post?
      if params['commit'] == "Register"
       Progress.create(:course_id => params[:employee][:temp])
      UserMailer.course_registered(current_user).deliver
      redirect_to employees_dashboard_path , :notice => "You have successfully been Registered"

    else
      Progress.create(:course_id => params[:employee][:temp])
      UserMailer.course_deregistered(current_user).deliver
      redirect_to employees_dashboard_path , :notice => "You have successfully been Registered"
      end
    end
     end

  def edit
    @employee= Employee.find(params[:id])
     @title = "#{@employee.firstname}'s Details"
  end

  def update
    @employee= Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      redirect_to employees_dashboard_path,:notice=>"Update Successfull"
    else
      flash[:success] = "Update Attempt Failed"
      render 'edit'
    end
  end

  def destroy
    if Employee.find(params[:id]).destroy
      redirect_to employees_path, :notice => "Employee Deleted Successfully"
    else
      flash.now.alert = "Error Deleting Course"
      render 'index'
    end
  end

  def show
    @title = "Employee Detail"
    @employee = Employee.find(params[:id])
  end

  def create
    @title = "Employee Registration"
    @employees = Employee.new(params[:employee])
    if @employees.save and current_user.admin?
      redirect_to employees_dashboard_path , :notice => 'Employee successfully Registered'
    elsif @employees.save and !current_user.admin?
      redirect_to employees_dashboard_path, :notice => 'You have been successfully Registered'
    else
      flash.now.alert = "Oops, Something went wrong"
      render :new
    end
  end

  def correct_employee
    @employee = Employee.find(params[:id])
    redirect_to employees_dashboard_path,:alert => "You do not have the Required Priviledge to view this page"  unless current_employee?(@employee) or current_user.admin?

  end

  def admin_user
    if logged_in?  and !current_user.admin?
      redirect_to root_path
      flash[:error] = "You do not have the Required Privilege to View that Page"
    end
  end


end
