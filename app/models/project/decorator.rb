class Project::Decorator < SimpleDelegator
  def display_website = URI.parse(website).host

  def display_founded_at = founded_at.strftime("%B %Y")
end
