RailsIcons.configure do |config|
  config.default_library = "lucide"

  # Override Lucide defaults
  # config.libraries.lucide.outline.default.css = "icon"
  # config.libraries.lucide.outline.default.stroke_width = "1.5"
  config.libraries.lucide.outline.default.data = {slot: "icon"}
end
