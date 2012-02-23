class TrainersController < ApplicationController


  def new
    @title = "New Trainer Registration"
    @trainer = Trainer.new
  end

  def index
    @title =" Trainers Listing"
    @trainer = Trainer.page(params[:page]).per(3)
  end

  def edit
    @trainer= Trainer.find(params[:id])
    @title = "Edit Details"
  end

  def update
    @trainer= Trainer.find(params[:id])
    if @trainer.update_attributes(params[:trainer])

      redirect_to trainers_path,:notice=>"Update Successfull"
    else
      flash.now.alert = "Error Updating"
      render 'edit'
    end
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
      redirect_to trainers_path , :notice => 'You have successfully Registered'
    else
      flash.now.alert = "Oops, Something went wrong"
      render :new
    end
  end

end
