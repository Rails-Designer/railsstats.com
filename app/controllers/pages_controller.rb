class PagesController < ApplicationController
  rescue_from ActionView::MissingTemplate, with: :not_found

  def show
    markdown_path = Rails.root.join("app/views/pages/#{sanitized_path}.md")

    if File.exist?(markdown_path)
      render html: markdown(File.read(markdown_path)).html_safe, layout: "page"

      return
    end

    render template: "pages/#{sanitized_path}"
  rescue ActionView::MissingTemplate
    not_found
  end

  private

  def sanitized_path = params[:page].to_s.gsub(/[^0-9A-Za-z\-_]/, "")

  def not_found = render file: Rails.public_path.join("404.html"), status: :not_found, layout: false

  def markdown(content) = Kramdown::Document.new(content).to_html
end
