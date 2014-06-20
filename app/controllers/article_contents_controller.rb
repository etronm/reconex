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
    @article_content = ArticleContent.new(
        article_id: params[:article_content][:article_id],
        section_id: params[:article_content][:section_id],
        description: params[:article_content][:description],
        status:params[:article_content][:status],
        display_order:params[:article_content][:display_order])
    if @article_content.save
      flash[:success] = t(:section_create_success)
      render :new
    else
      flash[:error] = t(:section_create_error)
      render :new
    end
  end

  private
  def request_params
    params.require(:article_content).permit(:description, :status, :display_order, :section_id, :article_id)
  end


end