module ApplicationHelper
  def display_website(website)
    URI::HTTP.build({host: website}).to_s
  end
end
