class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      #@user.update_spreadsheet
      #UserMailer.contact_email(@contact).deliver

      flash[:notice] = "Se ha registrado su usuario exitosamente #{@user.name}!!!! ."
      #redirect_to root_path
      redirect_to @user
    else
      flash[:error] = "Please validate your information!"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def secure_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :user_type)
  end

end