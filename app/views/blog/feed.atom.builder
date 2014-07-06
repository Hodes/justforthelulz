atom_feed :language => 'pt-BR' do |feed|
  feed.title blog_title
  feed.updated @articles.first.updated_at

  @articles.each do |item|
    feed.entry(item, url: post_path(item.slug)) do |entry|
      entry.title item.title
      entry.content kramdown(item.text), :type => 'html'
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author do |author|
        author.name item.author.name
      end
    end
  end
end
