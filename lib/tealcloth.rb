unless RedCloth
  require 'redcloth'
end
class TealCloth < RedCloth

  def textile_ruby( tag, atts, cite, content )
    %(<pre><code class="ruby">#{content}</code></pre>)
  end
  
  def textile_video( tag, atts, cite, content )
    %(<div class="video">#{content}</div>)
  end

end
