atom_feed do |feed|
  feed.title "Reed's Blog"
  feed.updated((@posts.first.created_at))
  
  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.body, :type => 'html')
      entry.author do |author|
        author.name("Reed Law")
      end
    end
  end
end
