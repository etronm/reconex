class ArticlesController< ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :index]

  def new

  end

  def index
    if params[:search]
      @articles  = Article.search(params[:search]).paginate(page: params[:page], per_page: 10).order('name')
    else
      @articles  = Article.paginate(page: params[:page], per_page: 10).order('name')
    end
  end

  def create

  end
  def destroy

  end

end