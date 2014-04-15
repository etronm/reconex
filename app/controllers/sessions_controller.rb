class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(secure_params)
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #flash[:notice] = "Bienvenido #{user.name}!"
      sign_in user
      redirect_to user
    else
      @session.no_match
      render 'new'
    end
  end

  def destroy
  end

  private
  def secure_params
    params.require(:session).permit(:name, :email)
  end

end
