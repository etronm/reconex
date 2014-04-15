class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)
    if @user.save
      flash[:notice] = "Se ha registrado exitosamente!"
      redirect_to @user
    else
      flash[:error] = "Por favor verifique la informacion!"
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