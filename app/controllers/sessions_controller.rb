class SessionsController < ApplicationController

  def new
  end

  def create

    render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #algo
      flash[:success] = 'Felicidades!'
    else
      flash[:error] = 'Invalid email/password combination'
      render new
    end
  end

  def destroy
  end

end
