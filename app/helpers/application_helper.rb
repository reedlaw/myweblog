# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def code_highlight_and_textile(text)
    textiled = textilize(text)
    text_pieces = textiled.split(/(<code class="ruby">|<\/code>)/)
    in_pre = false
    language = nil
    text_pieces.collect do |piece|
      if piece =~ /^<code class="(.*)">$/
        language = $1
        in_pre = true
        piece + "\r\n"
      elsif piece == "</code>"
        in_pre = false
        language = nil
        piece
      elsif in_pre
        code_highlight(piece)
      else
        piece
      end
    end
  end

  def textilize(text)
    if text.blank?
      ""
    else
      textilized = TealCloth.new(text)
      textilized.to_html
    end
  end
  
  def code_highlight(text)
      convertor = Syntax::Convertors::HTML.for_syntax "ruby"
      html = convertor.convert(text, false)
  end

end
