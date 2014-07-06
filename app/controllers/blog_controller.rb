class BlogController < ApplicationController
  layout 'blog'

  def index
    @articles = Article.published
  end


  def show
    @article = Article.friendly.find(params[:id])
  end

  def feed
    @articles = Article.published
    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
