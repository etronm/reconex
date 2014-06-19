class ArticleContentsController< ApplicationController
  before_action :signed_in_user, only: [:index, :create, :destroy]
  before_action :admin_user, only: :destroy

  def new
    @article_content = ArticleContent.new
  end

  def index
    render
  end

  private
  def request_params
    params.require(:article_content).permit(:description, :status, :display_order)
  end


end