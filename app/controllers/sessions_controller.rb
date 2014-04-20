class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(secure_params)
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      @session.no_match
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private
  def secure_params
    params.require(:session).permit(:name, :email)
  end

end
