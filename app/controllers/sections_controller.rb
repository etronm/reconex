class SectionsController< ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :admin_user, only: :destroy

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:success] = "Seccion actualizada!"
      redirect_to sections_path
    else
      render 'edit'
    end
  end

  def destroy
    Section.find(params[:id]).destroy
    flash[:success] = "Se ha eliminado exitosamente!"
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
    @sections = Section.paginate(page: params[:page], per_page: 10).order('name')
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = "Se ha registrado exitosamente!"
      redirect_to @section
    else
      flash[:error] = "Por favor verifique la informacion!"
      render :new
    end
  end

  private
  def section_params
    params.require(:section).permit(:name, :description, :status)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Por favor ingrese."
    end
  end

end