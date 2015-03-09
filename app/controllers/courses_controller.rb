class CoursesController < ApplicationController
  before_action :authenticate

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
      @user = User.find_by(id: session[:user_id])
    if @user.courses.create(course_params)
      flash[:success] = "You have successfully added a course to your schedule."
      redirect_to @user
    else
      render :new
    end
  end

  def update
      @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "You have successfully updated course details."
      redirect_to courses_path
    else
      flash[:danger] = "Course details were not updated."
      render 'courses/edit'
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to @user, notice: 'That course is no more. It has ceased to be.'
  end


  private

  def course_params
    params.require(:course).permit(:title, :day_or_night)
  end

end
