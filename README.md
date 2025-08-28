# Porter's Path

A developer blog featuring a community of mushroom mascots called "Porters" who guide readers through software development topics. Built with Jekyll, TailwindCSS, and DaisyUI components, combining technical content with approachable, community-driven storytelling.

## ✨ Features

- **Unique Character-Driven Content**: Learn through the Porter community's diverse perspectives
- **Modern Tech Stack**: Jekyll 4.4.1 + TailwindCSS 4.x + DaisyUI components  
- **Fantasy Theme**: Immersive design with mushroom-inspired aesthetics
- **Multi-Voice Teaching**: Different Porter characters explain concepts from various angles
- **Growth-Oriented Learning**: Content focused on continuous improvement and community learning
- **SEO Optimized**: Built-in SEO tags, sitemap, and structured data
- **Rich Features**: Search, tags, categories, reading time, and responsive design

## 🚀 Quick Start


### Prerequisites

- Ruby 2.7+ and Bundler
- Node.js 14+ and npm
- Git

### Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/jeremycardona/porters-path.git
   cd porters-path
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

Your Porter's Path blog should now be running locally with live reload enabled!

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

## ✍️ Writing Porter Content

### Creating Blog Posts with Porter Voices

1. Create a new file in `_posts/` with the format: `YYYY-MM-DD-title.md`
2. Add frontmatter with required fields:

```markdown
---
layout: post
title: "Learning React Hooks: A Porter's Journey"
date: 2024-01-15 12:00:00 -0000
author: The Porters
tags: [react, hooks, javascript, learning]
excerpt: "Join the Porters as they explore React hooks and share their discoveries"
description: "Learn React hooks through the diverse perspectives of the Porter community"
---

# Your content here

Write your blog post using the Porter voices and growth-oriented tone described in CLAUDE.md.
```

### Porter Character Integration

Use these frontmatter fields to specify which Porter voices feature in your content:

```yaml
layout: post                         # Required: use 'post' for blog posts
title: "Post Title"                 # Required: post title
date: 2024-01-15 12:00:00 -0000      # Required: publication date
author: "The Porters"               # Recommended: use "The Porters" 
tags: [tag1, tag2]                  # Optional: array of tags
category: "category-name"           # Optional: single category
excerpt: "Short description"        # Optional: post preview text
description: "SEO description"      # Optional: meta description
porter_voices: [junior, senior]     # Optional: which Porter perspectives are featured
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

## 🍄 Porter Character Guide

### The Porter Community

- **Junior Porter**: New developer voice for beginner-friendly content
- **Senior Porter**: Experienced developer sharing architectural insights  
- **Explorer Porter**: Always trying new technologies and frameworks
- **Frontend Porter**: UI/UX focused development content
- **Backend Porter**: Server-side and database expertise
- **DevOps Porter**: Infrastructure and deployment guidance

### Writing with Porter Voices

See `CLAUDE.md` for detailed voice guidelines and examples of how to integrate Porter perspectives naturally into your technical content.

## 🎨 Site Configuration

### Modifying Site Information

Edit `_config.yml`:

```yaml
title: "Porter's Path"
email: your-email@example.com
description: "A developer blog featuring the Porter community"
url: "https://yoursite.com"
twitter_username: yourusername
github_username: yourusername
author: The Porters
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

Porter's Path includes powerful Jekyll plugins:

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

Porter's Path includes a built-in search feature:

1. Search data is generated in `search.json`
2. Search modal is included in `_includes/search.html`  
3. Triggered by the search input in the navbar
4. Searches through post titles, content, tags, and Porter voices

To customize search, modify `search.json` and `_includes/search.html`.

## 🚀 Deployment

### GitHub Pages

1. Enable GitHub Pages in repository settings
2. Set source to "GitHub Actions"  
3. Porter's Path will build automatically on push

### Netlify

1. Connect your repository to Netlify
2. Set build command: `npm run build`
3. Set publish directory: `_site`

### Custom Server

1. Run `npm run build`
2. Upload `_site` folder to your server

## 📝 Porter Writing Guidelines

### Writing Tips for Porter Content

1. **Use Porter perspectives** to explain concepts from multiple angles
2. **Write growth-oriented content** that encourages continuous learning  
3. **Include Porter dialogue** naturally without forcing character interactions
4. **Tag consistently** including Porter voice tags (junior, senior, explorer, etc.)
5. **Focus on community learning** rather than individual expertise

### Porter Content Features

Porter's Path supports all standard Markdown plus:

- Syntax highlighting with Rouge for code examples
- Tables for data comparison
- Task lists for tutorial steps
- Footnotes for additional context
- Math equations (when enabled) for technical explanations
- Porter voice integration for multi-perspective learning

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b new-porter-content`
3. Write content following Porter voice guidelines in `CLAUDE.md`
4. Test locally: `make serve`
5. Commit changes: `git commit -am 'Add new Porter content'`
6. Push to branch: `git push origin new-porter-content`
7. Submit a pull request

## 📄 License

Porter's Path is available as open source under the terms of the [MIT License](LICENSE).

## 🆘 Support

- **Documentation**: Check this README and `CLAUDE.md` for Porter voice guidelines
- **Issues**: Open an issue on GitHub
- **Discussions**: Use GitHub Discussions for Porter content ideas

## 🎯 Roadmap

- [ ] Interactive Porter character guides
- [ ] Advanced search with Porter voice filtering
- [ ] Porter-themed tutorial series
- [ ] Community Porter submissions
- [ ] Multi-voice content templates
- [ ] Porter character illustrations

---

**Happy learning with the Porters! 🍄**

*Built with ❤️ using Jekyll, TailwindCSS, and DaisyUI*