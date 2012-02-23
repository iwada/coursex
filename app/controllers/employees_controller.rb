class EmployeesController < ApplicationController
  def index
    @title = "Employees Listing"
    @employee =  Employee.page(params[:page]).per(3)
  end

  def new
    @title = "New Employee Registration"
    @employee = Employee.new

  end

  def edit
    @employee= Employee.find(params[:id])
     @title = "#{@employee.firstname}'s Details"

  end

  def update
    @employee= Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])

      redirect_to employees_path,:notice=>"Update Successfull"
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
    if @employees.save
      redirect_to employees_path , :notice => 'You have successfully Registered'
    else
      flash.now.alert = "Oops, Something went wrong"
      render :new
    end
  end

end
