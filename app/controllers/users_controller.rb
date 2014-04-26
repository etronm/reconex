class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario eliminado!"
    redirect_to users_url
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Se ha registrado exitosamente!"
      redirect_to @user
    else
      flash[:error] = "Por favor verifique la informacion!"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Pefil actualizado!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :user_type)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Por favor ingrese."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end

