class SectionsController< ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :admin_user, only: :destroy

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = t(:section_update_success)
      redirect_to sections_path
    else
      render 'edit'
    end
  end

  def destroy
    Section.find(params[:id]).destroy
    flash[:success] = t(:section_destroy_success)
    redirect to sections_url
  end

  def new
    @section = Section.new
  end

  def show
    @section = Section.find(params[:id])
  end

  def index
    #@sections = Section.all
    #@sections = Section.active.paginate(page: params[:page], per_page: 10).order('name')
    if params[:search]
      @sections = Section.active.search(params[:search]).paginate(page: params[:page], per_page: 10).order('name')
    else
      @sections = Section.active.paginate(page: params[:page], per_page: 10).order('name')
    end
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = t(:section_create_success)
      redirect_to sections_path
    else
      flash[:error] = t(:section_create_error)
      render :new
    end
  end

  private
  def section_params
    params.require(:section).permit(:name, :description, :status)

    #Client.where("created_at >= :start_date AND created_at <= :end_date",
    # {start_date: params[:start_date], end_date: params[:end_date]})

  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: t(:sign_in_notice)
    end
  end

end