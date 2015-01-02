class ArticlesController< ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :create, :destroy]
  before_action :admin_user, only: :destroy

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(request_params)
      flash[:success] = t(:article_update_success)
      #redirect_to  edit_article_content_path(@article)
      #redirect_to article_article_contents_url(@article)
      render "article_contents/index"
    else
      render 'edit'
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def tagged
    if params[:tag].present?
      @articles = Article.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 10).order('title')
    else
      @articles = Article.all
    end
  end

  def index
    if params[:search]
      @articles = Article.where("title like (?)", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10).order('title')
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
    if params[:article].present?
      @article = Article.new(title: params[:article][:title],
                             description: params[:article][:description],
                             status: params[:article][:status],
                             author_id: current_user.id)
      if @article.save
        flash[:success] = t(:article_create_success)
        #redirect_to articles_path(:user_id => current_user.id)
        # redireccionamos a la pagina de secciones... pero primero las pruebas!!
        #Ok! redirect_to new_article_content_path(:article_id => @article.id)

        redirect_to new_article_article_content_path(@article)
      else
        flash[:error] = t(:article_create_error)
        render :new
      end
    end
  end

  def destroy

  end

  private
  def request_params
    params.require(:article).permit(:title, :description, :status)
  end

  # def signed_in_user
  #   unless signed_in?
  #     store_location
  #     redirect_to signin_url, notice: t(:sign_in_notice)
  #   end
  # end


end