---
layout: guide
title: Getting Started
permalink: /getting-started/
description: "A comprehensive step-by-step guide to set up your Jekyll blog using the Sour theme."
---
# Getting Started with Sour Theme

Welcome to **Sour Theme**! 🍋 This comprehensive guide will walk you through setting up your own modern Jekyll blog using this cutting-edge template.

> **What you'll learn:** How to set up, customize, and deploy a professional Jekyll blog in under 20 minutes.

## 🚀 Quick Overview

**Sour Theme** is a minimal, cyberpunk-inspired Jekyll theme designed for developers and content creators who want:

### ✨ Core Technologies
- **Jekyll 4.4.1** - Lightning-fast static site generator
- **TailwindCSS 4.x** - Utility-first CSS framework with JIT compilation
- **DaisyUI** - Beautiful component library with 25+ themes
- **Modern Plugins** - SEO optimization, analytics, table of contents, and more

### 🎯 Key Features
- **Multi-theme Support** - Light, dark, cyberpunk, and 20+ other themes
- **Responsive Design** - Mobile-first approach that looks great on any device
- **SEO Optimized** - Built-in meta tags, structured data, and social media ready
- **Developer Friendly** - Hot reloading, easy customization, GitHub Actions workflow
- **Performance First** - Optimized builds, lazy loading, and minimal JavaScript

## Prerequisites

Before you start, make sure you have:
- **Ruby** (version 2.7 or higher)
- **Node.js** (version 16 or higher)
- **Git** for version control
- A **GitHub account** (for deployment)

## Step 1: Get the Template

Choose one of these options:

### Option A: Use Template (Recommended)
1. Go to the [Sour Theme repository](https://github.com/your-username/jekyll-theme-sour)
2. Click the green **"Use this template"** button
3. Create your new repository with a descriptive name like `my-blog`

### Option B: Fork Repository
1. Fork the repository on GitHub
2. Clone your fork locally

### Option C: Clone Directly
```bash
git clone https://github.com/jeremycardona/jekyll-theme-sour.git my-blog
cd my-blog
rm -rf .git && git init  # Start fresh git history
```

## Step 2: Install Dependencies

```bash
# Install both Ruby gems and Node.js packages
make install

# Or install separately:
bundle install    # Ruby dependencies
npm install      # Node.js dependencies
```

## Step 3: Customize Your Site

### Update Site Configuration
Edit `_config.yml` with your information:

```yaml
title: Your Amazing Blog
email: your-email@example.com
description: >-
  Write a compelling description of your blog. This appears in search 
  results and social media previews.
baseurl: ""                    # Remove "/jekyll-theme-sour"
url: "https://yourdomain.com"  # Your actual domain
github_username: yourusername
author: Your Name
```

### Choose Your Theme
The template supports multiple DaisyUI themes. Edit `_layouts/default.html`:

```html
<!-- Change the data-theme attribute -->
<html lang="en" data-theme="dark">  
```

Available themes: `light`, `dark`, `cyberpunk`, `cupcake`, `emerald`, `corporate`, `retro`

## Step 4: Remove Template Content

### Delete Example Posts
```bash
rm _posts/2024-01-*.md
```

### Update About Page
Edit `about.markdown` with your information:

```markdown
---
layout: default
title: About
permalink: /about/
---

# About Me

Write your story here...
```

### Customize Homepage (Optional)
Modify `index.markdown` if you want to change the homepage layout.

## Step 5: Create Your First Post

Create a new file in `_posts/` following Jekyll's naming convention:

```bash
# File: _posts/2024-01-15-my-first-post.md
```

```yaml
---
layout: post
title: "My First Blog Post"
date: 2024-01-15 10:00:00 -0000
author: Your Name
tags: [Getting Started, Jekyll, Blog]
category: personal
excerpt: "Welcome to my new blog! Here's what you can expect."
toc: true  # Enable table of contents
---

Welcome to my blog! This is my first post using the Sour theme.

## What's Coming Next

Here's what I plan to write about:

- Technology tutorials
- Personal experiences
- Project showcases

Stay tuned for more content!
```

## Step 6: Development Workflow

### Start Development Server
```bash
make serve
# Opens at http://localhost:4000
```

### Watch for Changes
The server automatically rebuilds when you:
- Modify posts or pages
- Update layouts or includes
- Change CSS (TailwindCSS rebuilds automatically)

### Build for Production
```bash
make build
# Outputs to _site/ directory
```

## Step 7: Deploy Your Blog

### GitHub Pages (Recommended)

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Initial blog setup"
   git push origin main
   ```

2. **Enable GitHub Actions:**
   - Go to your repository settings
   - Navigate to "Pages" section
   - Set source to **"GitHub Actions"** (not "Deploy from branch")
   - The included workflow will handle building and deployment

3. **Set Custom Domain (Optional):**
   - Add `CNAME` file to root directory with your domain
   - Configure DNS with your domain provider

### Alternative Deployment Options

**Netlify:**
1. Connect your GitHub repository
2. Set build command: `make build`
3. Set publish directory: `_site`

**Vercel:**
1. Import your GitHub repository
2. Framework preset: "Other"
3. Build command: `make build`
4. Output directory: `_site`

## Step 8: Ongoing Maintenance

### Keep Dependencies Updated
```bash
# Update Ruby gems
bundle update

# Update Node packages
npm update

# Rebuild CSS after updates
npm run build:css
```

### Theme Updates
To get theme improvements:
```bash
# Add original repository as upstream
git remote add upstream https://github.com/jeremycardona/jekyll-theme-sour.git

# Fetch and merge updates (carefully review changes)
git fetch upstream
git merge upstream/main
```

## Quick Start Checklist

- [ ] Customize `_config.yml` with your information
- [ ] Choose your preferred theme in `_layouts/default.html`
- [ ] Delete template posts from `_posts/`
- [ ] Update `about.markdown` with your story
- [ ] Create your first blog post
- [ ] Test locally with `make serve`
- [ ] Push to GitHub and enable GitHub Actions
- [ ] Set up custom domain (optional)
- [ ] Share your blog with the world!

## Customization Tips

### Adding New Pages
Create `.md` or `.html` files in the root directory:

```yaml
---
layout: default
title: Contact
permalink: /contact/
---

# Get In Touch
[Your contact form or information]
```

### Organizing Posts with Categories
Use categories to organize content:
```yaml
category: tutorial  # Creates /category/tutorial/ page
```

### Using Tags
Add relevant tags for better discoverability:
```yaml
tags: [Jekyll, Web Development, Tutorial]
```

### Custom CSS
Add custom styles to `src/input.css`:
```css
/* Your custom styles */
.my-custom-class {
  @apply bg-primary text-primary-content p-4 rounded;
}
```

## Need Help?

- **Documentation:** Check the included example posts for feature demonstrations
- **Issues:** Open an issue on the GitHub repository
- **Jekyll Docs:** [https://jekyllrb.com/docs/](https://jekyllrb.com/docs/)
- **TailwindCSS:** [https://tailwindcss.com/docs](https://tailwindcss.com/docs)
- **DaisyUI:** [https://daisyui.com/](https://daisyui.com/)

## What's Next?

1. **Write quality content** regularly to grow your audience
2. **Optimize for SEO** with good titles and descriptions
3. **Engage with readers** through social media links
4. **Monitor performance** with Google Analytics (add to `_config.yml`)
5. **Keep learning** and improving your blog

Happy blogging! 🎉

---

*Made with ❤️ using Jekyll, TailwindCSS, and DaisyUI*