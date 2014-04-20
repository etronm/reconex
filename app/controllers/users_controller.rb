class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #render :show
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      flash[:notice] = "Pefil actualizado!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def secure_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :user_type)
  end

end

