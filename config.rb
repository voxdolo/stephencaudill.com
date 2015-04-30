set :haml, { ugly: true, :format => :html5 }
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :markdown_engine, :kramdown

activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

Time.zone = "Mountain Time (US & Canada)"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"
  blog.permalink = "{year}/{title}.html"
  blog.sources = "articles/{year}/{month}-{day}-{title}.html"
  blog.layout = "article"
  blog.default_extension = ".md"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end
page "/blog/feed.xml", layout: false

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'stephencaudill.com'
end

helpers do
  def page_title(title)
    ["Stephen Caudill", title].compact.join(" &lambda; ")
  end
end
