source "https://rubygems.org"
# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll", "~> 4.4.1"
# This is the default theme for new Jekyll sites. You may change this to anything you like.
# gem "minima", "~> 2.5"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sitemap"
  gem "jekyll-seo-tag"
  gem "jekyll-archives"          # Category/tag pages
  gem "jekyll-paginate-v2"       # Better pagination
  gem "jekyll-toc"               # Table of contents
  gem "jekyll-reading-time"      # Reading time
  gem "jekyll-gist"              # GitHub gists
  # gem "jekyll-katex"             # Math rendering for ML content (disabled due to JS runtime issues)
  gem "jekyll-redirect-from"     # URL redirects
  gem "jekyll-target-blank"      # External links
  gem "jekyll-last-modified-at"  # Modified dates
  gem "jekyll-youtube"           # Embed YouTube videos
  gem "rouge"                    # Syntax highlighter (built into Jekyll 4+)

end

# Updated (modern):
platforms :windows, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1", :platforms => [:windows]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
