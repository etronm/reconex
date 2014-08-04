class ArticleContentsController< ApplicationController
  before_action :signed_in_user, only: [:index, :create, :destroy]
  before_action :admin_user, only: :destroy

  def new
    @article_content = ArticleContent.new
  end

  def index
    #@article = Article.find(params[:article_content][:article_id])
  end

  def create
    new_section_name = params[:article_content][:new_section_name]
    @section = Section.where(:name => new_section_name, :description => new_section_name, status: 0).first_or_create
    @article = Article.find(params[:article_id])
    @article_content = ArticleContent.new(
        article: @article,
        section: @section,
        description: params[:article_content][:description],
        status: params[:article_content][:status],
        display_order: params[:article_content][:display_order])

    if @article_content.save
      flash[:success] = t(:section_create_success)
      redirect_to article_article_contents_path @article
    else
      flash[:error] = t(:section_create_error)
      render :new
    end
  end

  private
  def request_params
    params.require(:article_content).permit(:description, :status, :display_order,
                                            :section_id, :article_id, :new_section_name)
  end


end