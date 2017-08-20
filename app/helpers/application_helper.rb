module ApplicationHelper
  def display_website(website)
    has_uri = website.downcase =~ /\Ahttps?\:\/\//
    return if website.nil? || website.empty? || has_uri
    URI::HTTP.build({host: website}).to_s
  end

  def display_time(t)
    t.strftime("%B %d, %Y") 
  end

  def has_image?(avatar=nil)
    return "/placeholder/profile.png" if !avatar.path
    avatar
  end

  def process_link(text)
    mention = text.gsub(/@(\w+)/, '<a href=/\1>@\1</a>').html_safe
    hash = mention.gsub(/#(\w+)/, '<a href=/tags/\1>#\1</a>').html_safe
  end
end
