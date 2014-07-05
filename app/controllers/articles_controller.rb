class ArticlesController < ApplicationController
  layout 'blog'
  before_filter :require_login, :only => [:new, :create]

  def index
    @articles = Article.all
  end


  def show
    @article = Article.friendly.find(params[:id])
  end

  def feed
    @articles = Article.all
    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
