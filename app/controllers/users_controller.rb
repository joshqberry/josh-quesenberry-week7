class UsersController < ApplicationController
  before_action :authenticate


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

    if
        @user.save
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
            redirect_to users_path
          else
            flash[:success] = "User information was not updated."
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
