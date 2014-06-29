class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create]

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.save

    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
