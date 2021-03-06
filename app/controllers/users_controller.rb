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
    @articles = @user.articles.paginate(page: params[:page])
  end

  def index
    per_page = 12
    if params[:search]
      @users= User.search(params[:search]).paginate(page: params[:page], per_page: per_page ).order('name')
    else
      @users = User.paginate(page: params[:page], per_page: per_page ).order('name')
    end

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
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation, :user_type, :locale)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end

