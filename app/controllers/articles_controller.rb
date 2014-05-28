class ArticlesController< ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :index]

  def new

  end

  def show
    if params[:id]
      @user = User.find(params[:id])
      @articles = @user.articles.paginate(page: params[:page], per_page: 10).order('title')
    end
  end

  def index
    if params[:search]
      @articles = Article.search(params[:search]).paginate(page: params[:page], per_page: 10).order('title')
    else
      @articles = Article.paginate(page: params[:page], per_page: 10).order('title')
    end
  end

  def create

  end

  def destroy

  end

end