class Admin::ArticlesController < AdminController
  before_filter :require_login

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.new
    @legend = 'New post'
    render 'post'
  end

  def edit
    @article = current_user.articles.find(params[:id])
    @legend = 'Edit post'
    render 'post'
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      flash.now[:success] = 'Saved!'
    else
      flash.now[:error] = 'Ops! An error occurred'
    end

    render 'post'
  end

  def update
    @article = current_user.articles.find(params[:id])

    if @article.update(article_params)
      flash.now[:success] = 'Saved!'
    end

    render 'post'
  end

  def destroy
    @article = current_user.articles.find(params[:id])

    @article.destroy
    redirect_to action: 'index'
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
