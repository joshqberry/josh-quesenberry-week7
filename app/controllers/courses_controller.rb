class CoursesController < ApplicationController


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
    @course = Course.new(course_params)
    @user = User.find_by(id: session[:user_id])
            if @user == nil
            flash[:danger] = "You're blocked from this class, newb! (You have to sign in first.)"
            redirect_to login_path
          else
            @course.save
              redirect_to @user
  end
end


  def update
      @course = Course.new(course_params)
      @user = User.find_by(id: session[:user_id])
          if @user == nil
            flash[:danger] = "Hey newb, you have to sign in before you can change class details."
            redirect_to login_path
          else
              @course.update
              flash[:success] = "You have successfully changed class details."
              redirect_to courses_path

    end
  end

  def destroy
    @course = Course.find(params[:id])
    @user = User.find_by(id: session[:user_id])
        if @user == nil
          flash[:danger] = "Hey newb, you can't delete a class unless you've signed in."
          redirect_to login_path
        else
    @course.destroy
    redirect_to courses_path, notice: 'That class is no more. It has ceased to be.'
  end
end



  private

def course_params
      params.require(:course).permit(:title, :day_or_night)
    end






end
