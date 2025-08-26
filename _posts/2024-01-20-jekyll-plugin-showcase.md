---
layout: post
title: "Jekyll Plugin Showcase - Template Examples"
date: 2024-01-20 10:00:00 -0000
author: Sour Theme
tags: [Jekyll, Plugins, Tutorial, Examples]
category: tutorial
excerpt: "Comprehensive examples of how to use all the Jekyll plugins included in the Sour theme. Perfect for learning and reference."
description: "Learn how to use Jekyll plugins like jekyll-toc, jekyll-youtube, jekyll-gist, and more with practical examples."
toc: true
---

This post demonstrates all the Jekyll plugins included in the Sour theme. Use this as a reference guide and template for your own posts.

## Table of Contents Plugin

The table of contents is automatically generated from your headings when you add `toc: true` to your frontmatter.

```yaml
---
layout: post
title: "Your Post"
toc: true
---
```

## Reading Time Plugin

Reading time: {{ page.content | reading_time }}

This is automatically calculated and can be displayed anywhere in your post using:

```liquid
{{ page.content | reading_time }}
```

## YouTube Plugin

Embed YouTube videos easily:

```liquid
{% youtube "dQw4w9WgXcQ" %}
```

{% youtube "dQw4w9WgXcQ" %}

### YouTube with Custom Parameters

```liquid
{% youtube "dQw4w9WgXcQ" width="560" height="315" %}
```

## GitHub Gist Plugin

Embed GitHub gists directly:

```liquid
{% gist octocat/6cad326836d38bd3a7ae %}
```

{% gist octocat/6cad326836d38bd3a7ae %}

### Gist with Specific File

```liquid
{% gist octocat/6cad326836d38bd3a7ae hello.rb %}
```

## SEO Plugin Features

### Automatic Meta Tags

The `jekyll-seo-tag` plugin automatically generates:

- Title tags
- Meta descriptions
- Open Graph tags
- Twitter Card tags
- Canonical URLs
- JSON-LD structured data

### Custom SEO in Frontmatter

```yaml
---
title: "Your Post Title"
description: "Custom meta description for SEO"
image: "/assets/images/featured.jpg"
---
```

## Archives Plugin

The theme automatically creates archive pages for:

- **Categories**: `/category/tutorial/`
- **Tags**: `/tag/jekyll/`

### Using Categories and Tags

```yaml
---
category: tutorial
tags: [Jekyll, Web Development, Tutorial]
---
```

## Pagination Plugin

The advanced pagination plugin creates paginated post lists:

- Homepage shows latest 6 posts
- Archive page shows all posts
- Pagination links automatically generated

Configuration in `_config.yml`:

```yaml
pagination:
  enabled: true
  per_page: 6
  permalink: '/page/:num/'
```

## Redirect Plugin

Create redirects from old URLs:

```yaml
---
title: "New Post"
redirect_from:
  - /old-url/
  - /another-old-url/
---
```

## Target Blank Plugin

External links automatically open in new tabs with proper security attributes.

[External link example](https://github.com)

## Last Modified Plugin

Show when content was last updated:

```liquid
Last modified: {{ page.last_modified_at | date: "%B %d, %Y" }}
```

Last modified: {{ page.last_modified_at | date: "%B %d, %Y" }}

## Feed Plugin

Automatic RSS feed generation at `/feed.xml`

Subscribe to the feed: [RSS Feed]({{ '/feed.xml' | relative_url }})

## Sitemap Plugin

Automatic sitemap generation at `/sitemap.xml` for SEO.

## Syntax Highlighting

Using Rouge for syntax highlighting:

### JavaScript Example

```javascript
function greetUser(name) {
  console.log(`Hello, ${name}!`);
  return `Welcome to Sour Theme, ${name}`;
}

const user = "Developer";
greetUser(user);
```

### CSS Example

```css
.sour-theme {
  @apply bg-gradient-to-r from-primary to-secondary;
  border-radius: 8px;
  transition: all 0.3s ease;
}

.sour-theme:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}
```

### Ruby Example

```ruby
class SourTheme
  attr_reader :name, :version
  
  def initialize(name, version)
    @name = name
    @version = version
  end
  
  def description
    "#{@name} v#{@version} - A Jekyll theme with TailwindCSS"
  end
end

theme = SourTheme.new("Sour", "1.0.0")
puts theme.description
```

## Advanced Markdown Features

### Tables

| Plugin | Purpose | Usage |
|--------|---------|-------|
| jekyll-seo-tag | SEO optimization | Automatic |
| jekyll-sitemap | XML sitemap | Automatic |
| jekyll-feed | RSS feed | Automatic |
| jekyll-toc | Table of contents | `toc: true` |

### Task Lists

- [x] Create comprehensive README
- [x] Add plugin examples
- [x] Document customization options
- [ ] Add more themes
- [ ] Create video tutorials

### Footnotes

Here's a statement that needs a citation[^1].

[^1]: This is the footnote explaining the citation.

### Blockquotes

> "The best way to learn Jekyll is to build something with it. The Sour theme provides a perfect starting point with all the tools you need."
> 
> — Sour Theme Documentation

### Code Blocks with Line Numbers

```ruby
# app.rb
require 'jekyll'

class MyJekyllSite
  def initialize
    @config = Jekyll.configuration({
      'source' => '.',
      'destination' => './_site'
    })
  end
  
  def build
    site = Jekyll::Site.new(@config)
    site.process
  end
end
```

## Image Examples

### Responsive Images

![Sour Theme Screenshot](/assets/images/screenshot.jpg "Sour Theme Screenshot")

### Image with Caption

<figure>
  <img src="https://via.placeholder.com/600x300/1a1a2e/eee?text=Sample+Image" alt="Sample image">
  <figcaption>This is a sample image with a caption demonstrating responsive design.</figcaption>
</figure>

## Custom Liquid Tags

### Highlighting Important Information

```liquid
{% highlight ruby %}
def hello_world
  puts "Hello, World!"
end
{% endhighlight %}
```

{% highlight ruby %}
def hello_world
  puts "Hello, World!"
end
{% endhighlight %}

## Performance Tips

### Lazy Loading

Images can be lazy-loaded for better performance:

```html
<img src="image.jpg" loading="lazy" alt="Description">
```

### Optimized Assets

The theme automatically:
- Minifies CSS in production
- Optimizes images
- Compresses HTML
- Generates efficient navigation

## Customization Examples

### Custom Variables

```yaml
# _config.yml
custom_variables:
  brand_color: "#00ff88"
  font_family: "Inter"
  enable_dark_mode: true
```

### Custom Includes

Create reusable components in `_includes/`:

```liquid
<!-- _includes/alert.html -->
<div class="alert alert-{{ include.type | default: 'info' }}">
  {{ include.message }}
</div>
```

Usage:

```liquid
{% include alert.html type="warning" message="This is a warning!" %}
```

{% include alert.html type="warning" message="This is a warning!" %}

## Testing Your Setup

### Development Checklist

- [ ] All plugins loading correctly
- [ ] CSS compiling without errors
- [ ] Search functionality working
- [ ] Navigation responsive on mobile
- [ ] SEO tags generating properly
- [ ] Social media previews displaying

### Build Verification

```bash
# Test build
make build

# Check for errors
bundle exec jekyll doctor

# Validate HTML (optional)
bundle exec htmlproofer ./_site
```

## Next Steps

Now that you've seen all the plugin examples, try:

1. **Create your first post** using these templates
2. **Customize the theme** colors and layout
3. **Add your own content** and pages
4. **Deploy to GitHub Pages** or Netlify
5. **Share your blog** with the world!

## Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [DaisyUI Components](https://daisyui.com/components/)
- [Sour Theme Repository](https://github.com/your-username/jekyll-theme-sour)

---

*This post serves as both documentation and a template. Feel free to copy and modify these examples for your own content!*