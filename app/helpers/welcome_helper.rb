module WelcomeHelper

  def text_style(index)
    case index
    when 0
      'text-left'
    when 2
      'text-right'
    else
      ''
    end
  end

end
