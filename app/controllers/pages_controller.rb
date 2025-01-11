class PagesController < ApplicationController
  rescue_from ActionView::MissingTemplate, with: :not_found

  def show
    path = "#{params[:page]}"
    md_path = Rails.root.join("app/views/pages/#{path}.md")

    if File.exist?(md_path)
      render html: markdown(File.read(md_path)).html_safe, layout: "page"

      return
    end

    render template: "pages/#{path}"
  rescue ActionView::MissingTemplate
    not_found
  end

  private

  def not_found = render file: Rails.public_path.join("404.html"), status: :not_found, layout: false

  def markdown(content) = Kramdown::Document.new(content).to_html
end
