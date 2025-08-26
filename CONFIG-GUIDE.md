# Configuration Guide - Sour Theme

This guide explains all configuration options available in the Sour Theme, helping you customize your Jekyll blog to your needs.

## Table of Contents

- [Site Configuration](#site-configuration)
- [Plugin Configuration](#plugin-configuration)
- [Build Configuration](#build-configuration)
- [Custom Variables](#custom-variables)
- [Performance Settings](#performance-settings)
- [Development Settings](#development-settings)

## Site Configuration

### Basic Site Information

Edit these settings in `_config.yml` to customize your site:

```yaml
# Site Identity
title: Your Blog Title                    # Appears in header and page titles
email: your-email@example.com            # Contact email
description: >-                          # Site description for SEO and RSS
  Your blog description here. This appears in search results,
  social media shares, and the RSS feed.

# URLs and Paths
baseurl: ""                              # Subpath (leave empty for root domain)
url: "https://yourdomain.com"            # Full URL of your site
```

### Social Media Integration

```yaml
# Social Media Usernames
twitter_username: yourusername           # Twitter handle (without @)
github_username: yourusername            # GitHub username
author: Your Name                        # Default author for posts
```

### Content Settings

```yaml
# Content Processing
timezone: America/New_York               # Your timezone
date_format: "%B %d, %Y"                # Date display format
excerpt_separator: "<!--more-->"        # Custom excerpt separator

# Language and Locale
lang: en                                 # Site language code
locale: en_US                           # Locale for date formatting
```

## Plugin Configuration

### Pagination Settings

The theme uses `jekyll-paginate-v2` for advanced pagination:

```yaml
# Pagination Configuration
pagination:
  enabled: true                          # Enable pagination
  per_page: 6                           # Posts per page
  permalink: '/page/:num/'              # URL structure for pages
  title: ':title - page :num'          # Page title format
  limit: 0                              # Max pages (0 = unlimited)
  sort_field: 'date'                    # Sort posts by date
  sort_reverse: true                    # Newest first
```

**Advanced Pagination Options:**

```yaml
pagination:
  # Custom sorting
  sort_field: 'title'                   # Sort by title instead of date
  sort_reverse: false                   # Alphabetical order
  
  # Category-specific pagination
  category: 'tutorials'                 # Only paginate specific category
  
  # Custom permalink patterns
  permalink: '/blog/page-:num/'         # Custom URL structure
  
  # Page title customization
  title: 'Blog Posts - Page :num of :max'
```

### Archives Configuration

Configure category and tag archive pages:

```yaml
# Archive Pages
jekyll-archives:
  enabled:
    - categories                        # Enable category archives
    - tags                             # Enable tag archives
    - years                            # Enable yearly archives (optional)
    - months                           # Enable monthly archives (optional)
  
  layouts:
    category: 'category'               # Layout for category pages
    tag: 'tag'                        # Layout for tag pages
    year: 'year'                      # Layout for year pages
    month: 'month'                    # Layout for month pages
  
  permalinks:
    category: '/category/:name/'       # Category URL structure
    tag: '/tag/:name/'                # Tag URL structure
    year: '/:year/'                   # Year URL structure
    month: '/:year/:month/'           # Month URL structure
```

### Table of Contents

Configure automatic TOC generation:

```yaml
# Table of Contents
toc:
  min_level: 2                         # Minimum heading level (H2)
  max_level: 4                         # Maximum heading level (H4)
  no_toc_section_class: 'no-toc'      # CSS class to exclude sections
  list_class: 'toc-list'               # CSS class for TOC list
  item_class: 'toc-item'               # CSS class for TOC items
```

### SEO Configuration

The theme includes comprehensive SEO settings:

```yaml
# SEO Plugin Settings
seo:
  name: Your Name                      # Schema.org name
  type: Person                         # Schema.org type (Person/Organization)
  links:                              # Social media profiles
    - https://twitter.com/yourusername
    - https://github.com/yourusername
    - https://linkedin.com/in/yourprofile

# Social Media Defaults
twitter:
  username: yourusername               # Twitter username
  card: summary_large_image           # Twitter card type

facebook:
  app_id: 123456789                   # Facebook app ID
  publisher: https://facebook.com/yourpage

# Default image for social media
image: /assets/images/site-logo.png   # Default social media image
```

### Reading Time Plugin

Configure reading time calculation:

```yaml
# Reading Time
reading_time:
  reading_speed: 200                   # Words per minute
  include_images: true                 # Count images in reading time
  image_time: 12                      # Seconds per image
```

## Build Configuration

### File Processing

Control which files Jekyll processes:

```yaml
# Include specific files/directories
include:
  - _pages                            # Include pages directory
  - .htaccess                         # Include Apache config
  - _redirects                        # Include Netlify redirects

# Exclude files from processing
exclude:
  - .sass-cache/                      # Sass cache files
  - .jekyll-cache/                    # Jekyll cache
  - gemfiles/                         # Bundler files
  - node_modules/                     # npm dependencies
  - vendor/                           # Ruby vendor files
  - Gemfile                          # Ruby dependencies
  - Gemfile.lock                     # Lock file
  - package*.json                    # Node.js files
  - src/                             # Source files
  - Makefile                         # Build scripts
  - README.md                        # Documentation
  - LICENSE                          # License file
  - CHANGELOG.md                     # Changelog
```

### Markdown Processing

Configure markdown rendering:

```yaml
# Markdown Settings
markdown: kramdown                     # Markdown processor
highlighter: rouge                    # Syntax highlighter

# Kramdown Configuration
kramdown:
  input: GFM                          # GitHub Flavored Markdown
  hard_wrap: false                    # Don't wrap lines
  auto_ids: true                      # Auto-generate heading IDs
  footnote_nr: 1                      # Start footnotes at 1
  entity_output: as_char              # Output entities as characters
  toc_levels: 2..4                    # TOC heading levels
  smart_quotes: lsquo,rsquo,ldquo,rdquo # Smart quote characters
  enable_coderay: false               # Disable CodeRay

# Syntax Highlighting
highlighter: rouge
rouge:
  line_numbers: false                 # Don't show line numbers
  css_class: 'highlight'              # CSS class for highlighted code
```

### Liquid Settings

Configure Liquid template engine:

```yaml
# Liquid Settings
liquid:
  error_mode: strict                  # Strict error handling
  strict_filters: true                # Strict filter handling
  strict_variables: true              # Strict variable handling
```

## Custom Variables

### Site-wide Custom Variables

Add your own variables to `_config.yml`:

```yaml
# Custom Site Variables
custom:
  # Branding
  brand_color: "#00ff88"              # Primary brand color
  accent_color: "#ff0080"             # Secondary accent color
  logo_url: "/assets/images/logo.png" # Site logo
  
  # Social Media
  social_links:
    twitter: "yourusername"
    github: "yourusername"
    linkedin: "yourprofile"
    youtube: "yourchannel"
    instagram: "yourusername"
  
  # Analytics
  google_analytics: "GA-MEASUREMENT-ID"
  google_tag_manager: "GTM-XXXXXX"
  
  # Comments
  disqus_shortname: "yoursite"        # Disqus comments
  
  # Newsletter
  mailchimp_url: "your-mailchimp-url"
  
  # Contact
  contact_email: "contact@yoursite.com"
  business_address: "Your Address"
```

### Using Custom Variables

Access custom variables in templates:

```liquid
<!-- Access custom variables -->
<div style="color: {{ site.custom.brand_color }}">
  Brand colored text
</div>

<!-- Social links -->
{% if site.custom.social_links.twitter %}
  <a href="https://twitter.com/{{ site.custom.social_links.twitter }}">
    Follow on Twitter
  </a>
{% endif %}

<!-- Conditional content -->
{% if site.custom.google_analytics %}
  <!-- Google Analytics code -->
{% endif %}
```

## Performance Settings

### Compression and Optimization

```yaml
# HTML Compression (for production)
compress_html:
  clippings: all                      # Remove whitespace
  comments: all                       # Remove comments
  endings: all                        # Remove end tags where possible
  startings: []                       # Keep start tags
  blanklines: false                   # Remove blank lines
  profile: false                      # Don't show compression stats

# Asset optimization
sass:
  style: compressed                   # Compress CSS
  
# Plugin optimization
incremental: true                     # Enable incremental builds
```

### Caching Settings

```yaml
# Build performance
incremental: true                     # Faster rebuilds in development
profile: false                       # Don't show build performance stats

# Cache settings
cache_dir: .jekyll-cache             # Cache directory location
```

## Development Settings

### Local Development

Create a separate config for development (`_config_dev.yml`):

```yaml
# Development overrides
url: "http://localhost:4000"          # Local URL
show_drafts: true                     # Show draft posts
future: true                          # Show future-dated posts
incremental: true                     # Faster builds
profile: true                         # Show build stats

# Disable analytics in development
custom:
  google_analytics: false
  google_tag_manager: false

# Development-only plugins
plugins:
  - jekyll-livereload                 # Auto-refresh browser
```

Use with: `bundle exec jekyll serve --config _config.yml,_config_dev.yml`

### Environment-specific Settings

Use environment variables:

```yaml
# Environment-based configuration
google_analytics: {% if jekyll.environment == "production" %}"GA-MEASUREMENT-ID"{% endif %}

# Or use environment variables
google_analytics: {{ site.env.GOOGLE_ANALYTICS_ID }}
```

## Advanced Configuration

### Custom Collections

Create custom content types:

```yaml
# Custom Collections
collections:
  projects:                           # Collection name
    output: true                      # Generate pages
    permalink: /projects/:name/       # URL structure
  team:
    output: false                     # Don't generate pages
    
# Collection defaults
defaults:
  - scope:
      path: "_projects"
      type: "projects"
    values:
      layout: "project"               # Default layout
      author: "Your Name"             # Default author
```

### Custom Plugins

Add custom plugin configurations:

```yaml
# Custom plugin settings
my_custom_plugin:
  setting1: value1
  setting2: value2
  
# Plugin-specific data
plugin_data:
  api_key: "your-api-key"
  cache_duration: 3600
```

### Deployment Settings

```yaml
# GitHub Pages settings
github: [Repository GITHUB_REPOSITORY] # Auto-set by GitHub
safe: true                            # Safe mode for GitHub Pages

# Netlify settings
plugins:
  - jekyll-redirect-from              # Netlify redirects

# Custom deployment
deploy:
  method: "rsync"                     # Deployment method
  destination: "user@server:/path/"   # Deploy destination
```

## Configuration Examples

### Personal Blog

```yaml
title: "John Doe's Blog"
description: "Thoughts on web development and technology"
author: "John Doe"
email: "john@example.com"

pagination:
  per_page: 5
  
toc:
  min_level: 2
  max_level: 3
  
custom:
  show_reading_time: true
  enable_comments: true
  social_links:
    twitter: "johndoe"
    github: "johndoe"
```

### Corporate Blog

```yaml
title: "Acme Corp Tech Blog"
description: "Technical insights from the Acme engineering team"
author: "Acme Engineering"
email: "engineering@acme.com"

seo:
  type: Organization
  name: "Acme Corporation"
  
pagination:
  per_page: 10
  
custom:
  logo_url: "/assets/images/acme-logo.png"
  show_author_bio: true
  enable_newsletter: true
```

### Portfolio Site

```yaml
title: "Jane Designer Portfolio"
description: "UI/UX designer specializing in mobile applications"
author: "Jane Designer"

collections:
  projects:
    output: true
    permalink: /work/:name/

custom:
  show_portfolio: true
  contact_form: true
  social_links:
    dribbble: "janedesigner"
    behance: "janedesigner"
```

## Troubleshooting Configuration

### Common Issues

1. **Site not building**: Check YAML syntax with a validator
2. **Plugins not working**: Ensure plugins are in both `Gemfile` and `_config.yml`
3. **Custom variables not appearing**: Restart Jekyll server after config changes
4. **Performance issues**: Check exclude list includes large directories

### Testing Configuration

```bash
# Validate configuration
bundle exec jekyll doctor

# Test with different config
bundle exec jekyll serve --config _config.yml,_config_test.yml

# Check plugin loading
bundle exec jekyll serve --verbose
```

---

*For more advanced configuration options, check the [Jekyll documentation](https://jekyllrb.com/docs/configuration/) and individual plugin documentation.*