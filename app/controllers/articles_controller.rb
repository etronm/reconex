class ArticlesController< ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :create]
  before_action :admin_user, only: :destroy

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    if params[:search]
      @articles = Article.search(params[:search]).paginate(page: params[:page], per_page: 10).order('title')
    else
      if params[:user_id]
        @user = User.find(params[:user_id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 10).order('title')
      else
        @articles = Article.paginate(page: params[:page], per_page: 10).order('title')
      end
    end

  end

  def create
    @article = Article.new(title: params[:article][:title],
                           description: params[:article][:description],
                           status: params[:article][:status],
                           author_id: current_user.id)
    if @article.save
      flash[:success] = t(:article_create_success)
      redirect_to article_path(current_user.id)
    else
      flash[:error] = t(:article_create_error)
      render :new
    end

  end

  def destroy

  end

  private
  def request_params
    params.require(:article).permit(:title, :description, :status, :author_id)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: t(:sign_in_notice)
    end
  end

end