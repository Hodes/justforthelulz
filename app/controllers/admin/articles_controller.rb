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
end
