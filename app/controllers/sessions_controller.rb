class SessionsController < ApplicationController

  def new
    if logged_in?
      user = @current_user
      flash[:danger] = "You're already logged in. No need to log in again."
      redirect_to user_path(user)
  end
end

  def create
    user = User.find_by(user_name: params[:session][:user_name].downcase)

   if user && user.authenticate(params[:session][:password])


     log_in(user)

     redirect_to user_path(user)

   else
     flash.now[:danger] = 'Invalid email/password combination, jackass!'
     render :new
   end

  end



  def destroy
    log_out
  end

end
