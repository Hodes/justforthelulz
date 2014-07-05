module ArticlesHelper
  def kramdown(text)
    sanitize Kramdown::Document.new(text).to_html
  end
end
