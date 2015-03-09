class UsersController < ApplicationController
  before_action :authenticate

  def index
    @users = User.all
  end

  def new
    if logged_in?
      user = @current_user
      flash[:danger] = "Uh, sorry, you can't create a new account. You've already got one."
      redirect_to user_path(user)
    else
      @user = User.new
    end
  end

  def show
    if !correct_user?
      flash[:danger] = "Sorry, you're not allowed to see another student's schedule."
      redirect_to user_path(@current_user)
    else
      @user = User.find(params[:id])
      @courses = @user.courses.all
    end
  end

  def edit
    if !correct_user?
      flash[:danger] = "Sorry, you're not allowed to edit another student's schedule."
      redirect_to user_path(@current_user)
    else
      @user = User.find(params[:id])
    end
  end

  def create
      @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        flash[:success] = "You're in, newb!"
        redirect_to @user
    else
        render :new
    end
  end

  def update
      @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "User information has been updated."
       redirect_to user_path(@user)
    else
       flash[:danger] = "User information was not updated."
       render 'users/edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :about, :password, :password_confirmation)
  end

end
