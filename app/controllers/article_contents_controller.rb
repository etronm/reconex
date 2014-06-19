class ArticleContentsController< ApplicationController
  before_action :signed_in_user, only: [:index, :create, :destroy]
  before_action :admin_user, only: :destroy

  def new
    @article_content = ArticleContent.new
  end

  def index
    render
  end

  def create
    @article_content = ArticleContent.new(request_params)
    if @article_content.save
      flash[:success] = t(:section_create_success)
    else
      flash[:error] = t(:section_create_error)
    end
  end

  private
  def request_params
    params.require(:article_content).permit(:description, :status, :display_order)
  end


end