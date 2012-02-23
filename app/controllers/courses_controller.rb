class CoursesController < ApplicationController
  def new
    @title = "User Registratoin"
    @course = Course.new
  end

  def index
    @title = "Course Listing"
    @course =  Course.order("name").page(params[:page]).per(2)
  end

  def edit
    @course = Course.find(params[:id])

    @title = "#{@course.name}'s Details"

  end

  def update
    @course= Course.find(params[:id])
    if @course.update_attributes(params[:course])

      redirect_to courses_path,:notice=>"Update Successfull"
    else
      flash[:success] = "Update Attempt Failed"
      render 'edit'
    end
  end

  def destroy
    if Course.find(params[:id]).destroy
      redirect_to courses_path, :notice => "Course Deleted Successfully"
    else
      flash.now.alert = "Error Deleting Course"
      render 'index'
    end
  end
  def show
    @title = "Course Detail"
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_path, :notice => "Course Created Successfully"
    else
      render :new
    end
  end

end
