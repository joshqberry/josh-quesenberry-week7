class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @courses = Course.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
          if @user.save
            log_in(@user)
            flash[:success] = "You're in, newb!"
            redirect_to @user
          else
            flash[:danger] = "You're not in, newb!"
            render 'users/new'
          end
  end

  def update
    @user = User.new(user_params)
          if @user.update
            redirect_to users_path
          else
            render 'users/update'
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
