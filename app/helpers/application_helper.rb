module ApplicationHelper
  def page_title
    if current_page?(root_url) or current_page?(post_path)
      Settings.blog_home_title
    else
      Settings.blog_post_title % @article.title
    end
  end

  def blog_description
    Settings.blog_description
  end

  def blog_title
    Settings.blog_title
  end

  def disqus_shortname
    Settings.disqus_shortname
  end
end
