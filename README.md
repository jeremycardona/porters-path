# Sour Theme

A minimal, responsive, and SEO-friendly Jekyll theme built with TailwindCSS and DaisyUI components. Perfect for developers who want a clean, modern blog with cyberpunk aesthetics and powerful features out of the box.

![Sour Theme](https://via.placeholder.com/800x400/1a1a2e/eee?text=Sour+Theme+Screenshot)

## ✨ Features

- **Modern Stack**: Jekyll 4.4.1 + TailwindCSS 4.x + DaisyUI components
- **Responsive Design**: Mobile-first approach with clean, professional layouts
- **SEO Optimized**: Built-in SEO tags, sitemap, and structured data
- **Dark Theme**: Cyberpunk-inspired theme with customizable color schemes
- **Performance**: Optimized CSS compilation and fast page loads
- **Developer Friendly**: Well-documented code with extensive customization options
- **Rich Features**: Search, tags, categories, reading time, and more

## 🚀 Quick Start

📖 **For detailed setup instructions, see our [Getting Started Guide](GETTING_STARTED.md)**

### Prerequisites

- Ruby 2.7+ and Bundler
- Node.js 14+ and npm
- Git

### Installation

1. **Clone or fork this repository:**
   ```bash
   git clone https://github.com/your-username/jekyll-theme-sour.git
   cd jekyll-theme-sour
   ```

2. **Install dependencies:**
   ```bash
   make install
   # OR manually:
   bundle install && npm install
   ```

3. **Start development server:**
   ```bash
   make serve
   # OR manually:
   npm run dev
   ```

4. **Open your browser:**
   ```
   http://localhost:4000
   ```

Your site should now be running locally with live reload enabled!

## 📁 Project Structure

```
├── _config.yml          # Jekyll configuration
├── _layouts/            # Page layouts
│   ├── default.html     # Base layout with navbar/footer
│   ├── home.html        # Homepage layout
│   ├── post.html        # Blog post layout
│   └── page.html        # Static page layout
├── _includes/           # Reusable components
│   ├── head.html        # HTML head with SEO
│   ├── search.html      # Search modal
│   └── post-card.html   # Post preview component
├── _posts/             # Your blog posts (Markdown)
├── _pages/             # Static pages
├── assets/css/         # Generated CSS (auto-generated)
├── src/input.css       # TailwindCSS source
├── package.json        # Node.js dependencies
├── Gemfile            # Ruby dependencies
└── Makefile           # Development commands
```

## ✍️ Writing Content

### Creating Blog Posts

1. Create a new file in `_posts/` with the format: `YYYY-MM-DD-title.md`
2. Add frontmatter with required fields:

```markdown
---
layout: post
title: "Your Amazing Post Title"
date: 2024-01-15 12:00:00 -0000
author: Your Name
tags: [tag1, tag2, tag3]
excerpt: "A brief description of your post for previews"
description: "SEO description for search engines"
---

# Your content here

Write your blog post content using Markdown syntax.
```

### Available Frontmatter Options

```yaml
layout: post                    # Required: use 'post' for blog posts
title: "Post Title"            # Required: post title
date: 2024-01-15 12:00:00 -0000 # Required: publication date
author: "Author Name"          # Optional: author name
tags: [tag1, tag2]             # Optional: array of tags
category: "category-name"      # Optional: single category
excerpt: "Short description"   # Optional: post preview text
description: "SEO description" # Optional: meta description
image: "/assets/images/post.jpg" # Optional: featured image
---
```

### Creating Static Pages

1. Create a new file in `_pages/` or root directory
2. Add frontmatter:

```markdown
---
layout: page
title: "Page Title"
permalink: /page-url/
description: "Page description for SEO"
---

# Page Content

Your page content here.
```

## 🎨 Customization

### Changing Colors and Theme

The theme uses DaisyUI's theming system. Edit `_layouts/default.html`:

```html
<!-- Change data-theme attribute -->
<html data-theme="cyberpunk">
```

Available themes: `light`, `dark`, `cyberpunk`, or [create custom themes](https://daisyui.com/docs/themes/).

### Modifying Site Information

Edit `_config.yml`:

```yaml
title: Your Site Title
email: your-email@example.com
description: Your site description
url: "https://yoursite.com"
twitter_username: yourusername
github_username: yourusername
author: Your Name
```

### Customizing Navigation

Edit the navbar in `_layouts/default.html`:

```html
<!-- Desktop menu -->
<ul class="menu menu-horizontal px-1 hidden lg:flex">
  <li><a href="{{ '/' | relative_url }}">Home</a></li>
  <li><a href="{{ '/about' | relative_url }}">About</a></li>
  <li><a href="{{ '/posts' | relative_url }}">Archive</a></li>
  <!-- Add more navigation items -->
</ul>
```

### Adding Custom CSS

Add custom styles to `src/input.css`:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Your custom styles */
.my-custom-class {
  @apply text-primary font-bold;
}
```

## 🔌 Jekyll Plugins

This theme includes powerful Jekyll plugins:

### SEO and Social Media
- `jekyll-seo-tag`: Automatic SEO tags
- `jekyll-sitemap`: XML sitemap generation
- `jekyll-feed`: RSS feed

### Content Enhancement
- `jekyll-archives`: Category and tag archive pages
- `jekyll-paginate-v2`: Advanced pagination
- `jekyll-toc`: Table of contents
- `jekyll-reading-time`: Reading time estimation

### Media and Embeds
- `jekyll-youtube`: Embed YouTube videos
- `jekyll-gist`: Embed GitHub gists

### Development Tools
- `jekyll-redirect-from`: URL redirections
- `jekyll-target-blank`: External link handling
- `jekyll-last-modified-at`: Last modified dates

### Plugin Usage Examples

**Table of Contents:**
```markdown
---
layout: post
title: "My Post"
toc: true
---

# Section 1
## Subsection 1.1
## Subsection 1.2
# Section 2
```

**YouTube Embed:**
```liquid
{% youtube "dQw4w9WgXcQ" %}
```

**GitHub Gist:**
```liquid
{% gist username/gist-id %}
```

**Reading Time:**
```liquid
{{ page.content | reading_time }}
```

## 🛠️ Development Commands

### Make Commands (Recommended)
```bash
make install    # Install all dependencies
make serve      # Start development server
make build      # Build for production
make clean      # Clean build files
```

### npm Commands
```bash
npm install     # Install Node.js dependencies
npm run dev     # Start dev server with CSS watching
npm run build   # Build production site
npm run watch:css # Watch CSS changes only
npm run clean   # Clean generated files
```

### Jekyll Commands
```bash
bundle install                        # Install Ruby gems
bundle exec jekyll serve --livereload # Start Jekyll server
bundle exec jekyll build              # Build site
```

## 📱 Search Functionality

The theme includes a built-in search feature:

1. Search data is generated in `search.json`
2. Search modal is included in `_includes/search.html`
3. Triggered by the search input in the navbar
4. Searches through post titles, content, and tags

To customize search, modify `search.json` and `_includes/search.html`.

## 🚀 Deployment

### GitHub Pages

1. Enable GitHub Pages in repository settings
2. Set source to "GitHub Actions"
3. The theme will build automatically on push

### Netlify

1. Connect your repository to Netlify
2. Set build command: `npm run build`
3. Set publish directory: `_site`

### Custom Server

1. Run `npm run build`
2. Upload `_site` folder to your server

## 📝 Content Guidelines

### Writing Tips

1. **Use meaningful headings** for better SEO and readability
2. **Add excerpts** to frontmatter for better post previews
3. **Tag consistently** for better organization
4. **Include descriptions** for social media sharing
5. **Optimize images** before adding to posts

### Markdown Features

This theme supports all standard Markdown plus:

- Syntax highlighting with Rouge
- Tables
- Task lists
- Footnotes
- Math equations (when enabled)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b new-feature`
3. Make your changes
4. Test locally: `make serve`
5. Commit changes: `git commit -am 'Add new feature'`
6. Push to branch: `git push origin new-feature`
7. Submit a pull request

## 📄 License

This theme is available as open source under the terms of the [MIT License](LICENSE).

## 🆘 Support

- **Documentation**: Check this README and `CLAUDE.md`
- **Issues**: Open an issue on GitHub
- **Discussions**: Use GitHub Discussions for questions

## 🎯 Roadmap

- [ ] Multiple theme variants
- [ ] Advanced search with filters
- [ ] Comment system integration
- [ ] Newsletter signup component
- [ ] PWA features
- [ ] Multi-language support

---

**Happy blogging with Sour Theme! 🎉**

*Built with ❤️ using Jekyll, TailwindCSS, and DaisyUI*