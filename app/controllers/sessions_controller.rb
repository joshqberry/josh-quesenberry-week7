class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name].downcase)

   if user && user.authenticate(params[:session][:password])


     log_in(user)

     redirect_to user_path(user)

   else
     flash[:danger] = 'Invalid email/password combination, jackass!'
     redirect_to login_path
   end

  end

  def destroy
    log_out



    redirect_to login_path
  end

end
