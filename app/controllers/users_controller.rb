class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(secure_params)
    if @user.valid?
      #@user.update_spreadsheet
      #UserMailer.contact_email(@contact).deliver

      flash[:notice] = "Message sent from #{@user.name}."
      #redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:user).permit(:userid, :name, :email, :phone, :password, :cpassword)
  end

end