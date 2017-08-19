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

  def process_link(text)
    mention = text.gsub(/@(\w+)/, '<a href=/\1>@\1</a>').html_safe
    hash = mention.gsub(/#(\w+)/, '<a href=/tags/\1>#\1</a>').html_safe
  end
end
