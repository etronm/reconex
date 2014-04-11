class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.valid?
      #@user.update_spreadsheet
      #UserMailer.contact_email(@contact).deliver

      flash[:notice] = "Your information is valid!!! #{@user.name}."
      #redirect_to root_path
    else
      flash[:error] = "Your information is NOT valid!!! #{@user.errors}."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def secure_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirm)
  end

end