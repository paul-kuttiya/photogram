module ApplicationHelper
  def display_website(website)
    return if website.downcase =~ /\Ahttps?\:\/\//
    URI::HTTP.build({host: website}).to_s
  end

  def display_time(t)
    t.strftime("%B %d, %Y") 
  end

  def has_image?(image=nil)
    image.path || "/placeholder/profile.png"
  end

  def mention(text)
    text.gsub(/@(\S+)/, '<a href=/\1>@\1</a>').html_safe
  end
end
