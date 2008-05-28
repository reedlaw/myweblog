# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def textilize(text)
    if text.blank?
      ""
    else
      textilized = TealCloth.new(text)
      textilized.to_html
    end
  end

end
