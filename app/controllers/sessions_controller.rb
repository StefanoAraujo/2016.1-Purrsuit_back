class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    begin
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        puts "login successfull!"
        puts user
        render json: user
      else
        raise "login failed!"
      end
    rescue RuntimeError => error_login
      puts "#{error_login}"
      redirect_to 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
