module ArticlesHelper
  def kramdown(text)
    return sanitize Kramdown::Document.new(text).to_html
  end
end
