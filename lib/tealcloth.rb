unless RedCloth
  require 'redcloth'
end
class TealCloth < RedCloth

  def textile_ruby( tag, atts, cite, content )
    %(<pre><code class="ruby">#{content}</code></pre>)
  end

end
