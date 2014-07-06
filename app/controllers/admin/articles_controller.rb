class Admin::ArticlesController < AdminController
  before_filter :require_login

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @legend = 'New post'
    render 'post'
  end

  def edit
    @article = Article.find(params[:id])
    @legend = 'Edit post'
    render 'post'
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to  action: 'index'
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to action: 'index'
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
