xml.instruct!
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc root_url
    xml.lastmod Time.current.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end

  Project.verified.each do |project|
    xml.url do
      xml.loc project_url(project)
      xml.lastmod project.updated_at.strftime("%Y-%m-%dT%H:%M:%S+00:00")
    end
  end
end
