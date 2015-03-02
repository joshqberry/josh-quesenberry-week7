class UsersController < ApplicationController
  



  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
          if @user.save
            redirect_to users_path
          else
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
    @user = User.new(user_params)
    @user.destroy
  end


  private

def user_params
      params.require(:user).permit(:user_name, :about)
    end

end
