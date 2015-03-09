class RegistrationsController < ApplicationController
  def new
    if logged_in?
      user = @current_user
      flash[:danger] = "Uh, sorry, you can't create a new account. You've already got one."
      redirect_to user_path(user)
    else
    @user = User.new
  end
end

  def create

          @user = User.new(params.require(:user).permit(:user_name, :about,
          :password, :password_confirmation))
          if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "You have successfully signed up"
else
  render :new

end
  end

end
