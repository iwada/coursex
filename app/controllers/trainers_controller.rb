class TrainersController < ApplicationController


  def new
    @title = "New Trainer Registration"
    @trainer = Trainer.new
  end

  def index
  end

  def edit
    @trainer= Trainer.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
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
