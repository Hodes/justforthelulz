class ArticlesController < ApplicationController
  layout 'blog'
  before_filter :require_login, :only => [:new, :create]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.find(params[:id])
  end
end
