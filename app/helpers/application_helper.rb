module ApplicationHelper
  def display_website(website)
    URI::HTTP.build({host: website}).to_s
  end

  def display_time(t)
    t.strftime("%B %d, %Y") 
  end
end
