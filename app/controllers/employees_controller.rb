class EmployeesController < ApplicationController
  def index
  end

  def new
    @title = "New Employee Registration"
    @employee = Employee.new

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show

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
