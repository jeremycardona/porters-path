---
layout: post
title: "Complete Customization Guide for Sour Theme"
date: 2024-01-22 14:30:00 -0000
author: Sour Theme
tags: [Customization, Guide, TailwindCSS, DaisyUI, Tutorial]
category: tutorial
excerpt: "Step-by-step guide to customizing every aspect of the Sour theme. From colors and fonts to layouts and components."
description: "Complete guide to customizing the Sour Jekyll theme including colors, typography, layouts, and advanced modifications."
toc: true
---

Welcome to the comprehensive customization guide for the Sour theme! This guide will walk you through every aspect of customizing your Jekyll blog to match your personal style and needs.

## Quick Start Customization

### 1. Basic Site Information

First, update your site's basic information in `_config.yml`:

```yaml
title: Your Amazing Blog
email: your-email@example.com
description: >-
  Your blog description here. This appears in search results and social media.
baseurl: "" # Leave empty for root domain
url: "https://yourdomain.com"
twitter_username: yourusername
github_username: yourusername
author: Your Name
```

### 2. Change the Theme Colors

The easiest way to customize colors is by changing the DaisyUI theme. Edit `_layouts/default.html`:

```html
<!-- Change from cyberpunk to another theme -->
<html lang="{{ page.lang | default: site.lang | default: "en" }}" data-theme="dark">
```

**Available themes:**
- `light` - Clean light theme
- `dark` - Modern dark theme  
- `cyberpunk` - Neon cyberpunk theme
- `cupcake` - Soft pastel theme
- `emerald` - Green accent theme
- `corporate` - Professional theme
- `retro` - Vintage theme
- And [many more](https://daisyui.com/docs/themes/)

## Advanced Color Customization

### Creating Custom Color Schemes

Create a custom theme by adding CSS to `src/input.css`:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

/* Custom theme */
[data-theme="my-custom"] {
  --p: 220 71% 56%;  /* Primary color */
  --s: 338 75% 64%;  /* Secondary color */
  --a: 199 89% 48%; /* Accent color */
  --n: 220 13% 18%; /* Neutral color */
  --b1: 0 0% 100%;  /* Base background */
  --b2: 0 0% 95%;   /* Secondary background */
  --b3: 0 0% 90%;   /* Tertiary background */
  --bc: 220 13% 18%; /* Base content color */
}
```

Then use your custom theme:

```html
<html data-theme="my-custom">
```

### Custom CSS Classes

Add your own utility classes:

```css
/* Custom components */
.blog-card {
  @apply bg-base-100 rounded-lg shadow-lg p-6 hover:shadow-xl transition-all duration-300;
}

.gradient-text {
  @apply bg-gradient-to-r from-primary to-secondary bg-clip-text text-transparent;
}

.glow-effect {
  box-shadow: 0 0 20px rgba(var(--p), 0.3);
}

/* Custom animations */
.fade-in {
  animation: fadeIn 0.6s ease-in-out;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
```

## Typography Customization

### Changing Fonts

1. **Add Google Fonts** to `_includes/head.html`:

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

2. **Configure fonts** in `tailwind.config.js`:

```javascript
module.exports = {
  content: ["_includes/**/*.html", "_layouts/**/*.html", "_posts/**/*.md", "*.html", "*.md"],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
        'mono': ['JetBrains Mono', 'monospace'],
        'heading': ['Inter', 'system-ui', 'sans-serif'],
      }
    }
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["light", "dark", "cyberpunk"]
  }
}
```

3. **Apply fonts** in your CSS:

```css
/* Typography improvements */
.prose {
  @apply font-sans text-base-content;
}

.prose h1, .prose h2, .prose h3 {
  @apply font-heading font-semibold;
}

.prose code {
  @apply font-mono text-sm bg-base-200 px-1 py-0.5 rounded;
}
```

## Layout Customization

### Modifying the Navigation

Edit `_layouts/default.html` to customize the navbar:

```html
<!-- Custom navigation with dropdown -->
<nav class="bg-neutral text-neutral-content sticky top-0 z-50">
  <div class="container mx-auto px-4">
    <div class="flex items-center justify-between py-4">
      
      <!-- Logo -->
      <a href="{{ '/' | relative_url }}" class="text-xl font-bold">
        <span class="text-primary">Your</span>Blog
      </a>
      
      <!-- Desktop Navigation -->
      <ul class="hidden md:flex space-x-6">
        <li><a href="{{ '/' | relative_url }}" class="hover:text-primary transition-colors">Home</a></li>
        <li><a href="{{ '/about' | relative_url }}" class="hover:text-primary transition-colors">About</a></li>
        
        <!-- Dropdown example -->
        <li class="dropdown dropdown-hover">
          <label tabindex="0" class="cursor-pointer hover:text-primary">Categories</label>
          <ul tabindex="0" class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-52">
            <li><a href="/category/tutorial/">Tutorials</a></li>
            <li><a href="/category/review/">Reviews</a></li>
            <li><a href="/category/news/">News</a></li>
          </ul>
        </li>
        
        <li><a href="{{ '/posts' | relative_url }}" class="hover:text-primary transition-colors">Archive</a></li>
      </ul>
      
      <!-- Mobile menu button -->
      <button class="md:hidden btn btn-ghost btn-square">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
        </svg>
      </button>
    </div>
  </div>
</nav>
```

### Custom Footer

Replace the footer section in `_layouts/default.html`:

```html
<footer class="bg-base-200 mt-16">
  <div class="container mx-auto px-4 py-12">
    <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
      
      <!-- About Section -->
      <div class="col-span-2">
        <h3 class="font-bold text-lg mb-4">{{ site.title }}</h3>
        <p class="text-base-content/80 mb-4">{{ site.description }}</p>
        <div class="flex space-x-4">
          <a href="https://twitter.com/{{ site.twitter_username }}" class="text-primary hover:text-primary-focus">Twitter</a>
          <a href="https://github.com/{{ site.github_username }}" class="text-primary hover:text-primary-focus">GitHub</a>
        </div>
      </div>
      
      <!-- Quick Links -->
      <div>
        <h4 class="font-semibold mb-4">Quick Links</h4>
        <ul class="space-y-2">
          <li><a href="{{ '/' | relative_url }}" class="hover:text-primary">Home</a></li>
          <li><a href="{{ '/about' | relative_url }}" class="hover:text-primary">About</a></li>
          <li><a href="{{ '/posts' | relative_url }}" class="hover:text-primary">Archive</a></li>
        </ul>
      </div>
      
      <!-- Categories -->
      <div>
        <h4 class="font-semibold mb-4">Categories</h4>
        <ul class="space-y-2">
          {% for category in site.categories limit:5 %}
          <li><a href="/category/{{ category[0] }}/" class="hover:text-primary">{{ category[0] | capitalize }}</a></li>
          {% endfor %}
        </ul>
      </div>
    </div>
    
    <!-- Copyright -->
    <div class="border-t border-base-300 mt-8 pt-8 text-center">
      <p>&copy; {{ 'now' | date: '%Y' }} {{ site.title }}. Built with Jekyll & Sour Theme.</p>
    </div>
  </div>
</footer>
```

## Homepage Customization

### Custom Hero Section

Edit `_layouts/home.html` to customize the homepage:

```html
<!-- Custom hero with background -->
<section class="hero min-h-screen bg-gradient-to-br from-primary to-secondary">
  <div class="hero-content text-center text-primary-content">
    <div class="max-w-4xl">
      <h1 class="text-5xl md:text-7xl font-bold mb-6">
        Welcome to <span class="text-accent">{{ site.title }}</span>
      </h1>
      <p class="text-xl md:text-2xl mb-8 opacity-90">
        {{ site.description }}
      </p>
      <div class="flex flex-col sm:flex-row gap-4 justify-center">
        <a href="{{ '/posts' | relative_url }}" class="btn btn-accent btn-lg">
          Read Latest Posts
        </a>
        <a href="{{ '/about' | relative_url }}" class="btn btn-outline btn-lg text-white border-white hover:bg-white hover:text-primary">
          About Me
        </a>
      </div>
    </div>
  </div>
</section>

<!-- Featured Content Section -->
<section class="py-16 bg-base-100">
  <div class="container mx-auto px-4">
    <h2 class="text-3xl font-bold text-center mb-12">Featured Content</h2>
    
    <!-- Custom featured posts grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      {% for post in site.posts limit:6 %}
      <article class="card bg-base-200 shadow-xl hover:shadow-2xl transition-all duration-300">
        <!-- Custom post card content -->
        <div class="card-body">
          <h3 class="card-title text-lg">
            <a href="{{ post.url | relative_url }}" class="hover:text-primary">{{ post.title }}</a>
          </h3>
          <p class="text-base-content/70">{{ post.excerpt | strip_html | truncatewords: 20 }}</p>
          <div class="card-actions justify-between items-center mt-4">
            <div class="text-sm text-base-content/60">
              {{ post.date | date: "%B %d, %Y" }}
            </div>
            <a href="{{ post.url | relative_url }}" class="btn btn-primary btn-sm">Read More</a>
          </div>
        </div>
      </article>
      {% endfor %}
    </div>
  </div>
</section>
```

## Post Layout Customization

### Enhanced Post Layout

Create a more detailed post layout in `_layouts/post.html`:

```html
---
layout: default
---

<article class="max-w-4xl mx-auto px-4 py-8">
  <!-- Post header -->
  <header class="mb-12 text-center">
    <h1 class="text-4xl md:text-5xl font-bold mb-6 gradient-text">{{ page.title }}</h1>
    
    <!-- Post meta -->
    <div class="flex flex-wrap justify-center gap-6 text-base-content/70 mb-6">
      <div class="flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
        </svg>
        <time datetime="{{ page.date | date_to_xmlschema }}">{{ page.date | date: "%B %d, %Y" }}</time>
      </div>
      
      {% if page.author %}
      <div class="flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
        </svg>
        <span>{{ page.author }}</span>
      </div>
      {% endif %}
      
      <div class="flex items-center gap-2">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
        </svg>
        <span>{{ page.content | reading_time }}</span>
      </div>
    </div>
    
    <!-- Tags -->
    {% if page.tags %}
    <div class="flex flex-wrap justify-center gap-2">
      {% for tag in page.tags %}
      <a href="/tag/{{ tag | slugify }}/" class="badge badge-primary badge-outline">{{ tag }}</a>
      {% endfor %}
    </div>
    {% endif %}
  </header>

  <!-- Table of contents (if enabled) -->
  {% if page.toc %}
  <div class="toc-container mb-8 p-6 bg-base-200 rounded-lg">
    <h2 class="text-xl font-semibold mb-4">Table of Contents</h2>
    {% toc %}
  </div>
  {% endif %}

  <!-- Post content -->
  <div class="prose prose-lg max-w-none">
    {{ content }}
  </div>

  <!-- Post footer -->
  <footer class="mt-12 pt-8 border-t border-base-300">
    <!-- Share buttons -->
    <div class="mb-8">
      <h3 class="text-lg font-semibold mb-4">Share this post</h3>
      <div class="flex gap-4">
        <a href="https://twitter.com/intent/tweet?text={{ page.title | url_encode }}&url={{ page.url | absolute_url }}" 
           class="btn btn-primary btn-sm" target="_blank">
          Twitter
        </a>
        <a href="https://www.linkedin.com/sharing/share-offsite/?url={{ page.url | absolute_url }}" 
           class="btn btn-secondary btn-sm" target="_blank">
          LinkedIn
        </a>
      </div>
    </div>

    <!-- Navigation -->
    <div class="flex justify-between items-center">
      {% if page.previous.url %}
      <a href="{{ page.previous.url | relative_url }}" class="btn btn-outline">
        ← {{ page.previous.title | truncate: 30 }}
      </a>
      {% endif %}
      
      {% if page.next.url %}
      <a href="{{ page.next.url | relative_url }}" class="btn btn-outline">
        {{ page.next.title | truncate: 30 }} →
      </a>
      {% endif %}
    </div>
  </footer>
</article>
```

## Advanced Customizations

### Adding Dark Mode Toggle

Create a theme switcher component:

```html
<!-- Add to _includes/theme-toggle.html -->
<div class="dropdown dropdown-end">
  <label tabindex="0" class="btn btn-ghost btn-circle">
    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"/>
    </svg>
  </label>
  <ul tabindex="0" class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-52">
    <li><a onclick="setTheme('light')">Light</a></li>
    <li><a onclick="setTheme('dark')">Dark</a></li>
    <li><a onclick="setTheme('cyberpunk')">Cyberpunk</a></li>
  </ul>
</div>

<script>
function setTheme(theme) {
  document.documentElement.setAttribute('data-theme', theme);
  localStorage.setItem('theme', theme);
}

// Load saved theme
const savedTheme = localStorage.getItem('theme') || 'cyberpunk';
setTheme(savedTheme);
</script>
```

### Custom Search Enhancement

Enhance the search functionality in `_includes/search.html`:

```html
<div class="modal" id="search-modal">
  <div class="modal-box max-w-2xl">
    <h3 class="font-bold text-lg mb-4">Search Posts</h3>
    <input type="text" id="search-input" placeholder="Search..." class="input input-bordered w-full mb-4">
    <div id="search-results" class="max-h-96 overflow-y-auto">
      <!-- Results will be populated here -->
    </div>
    <div class="modal-action">
      <label for="search-modal" class="btn">Close</label>
    </div>
  </div>
</div>

<script>
// Enhanced search with fuzzy matching
let searchData = [];
fetch('/search.json')
  .then(response => response.json())
  .then(data => searchData = data);

document.getElementById('search-input').addEventListener('input', function(e) {
  const query = e.target.value.toLowerCase();
  const results = searchData.filter(post => 
    post.title.toLowerCase().includes(query) ||
    post.content.toLowerCase().includes(query) ||
    post.tags.some(tag => tag.toLowerCase().includes(query))
  );
  
  displayResults(results);
});

function displayResults(results) {
  const container = document.getElementById('search-results');
  if (results.length === 0) {
    container.innerHTML = '<p class="text-center text-base-content/60">No results found.</p>';
    return;
  }
  
  container.innerHTML = results.map(post => `
    <div class="card bg-base-200 mb-4">
      <div class="card-body p-4">
        <h4 class="card-title text-lg">
          <a href="${post.url}" class="hover:text-primary">${post.title}</a>
        </h4>
        <p class="text-sm text-base-content/70">${post.excerpt}</p>
        <div class="text-xs text-base-content/60">${post.date}</div>
      </div>
    </div>
  `).join('');
}
</script>
```

## Performance Optimizations

### Image Optimization

Add responsive images with lazy loading:

```html
<!-- Responsive image component -->
<picture>
  <source media="(max-width: 640px)" srcset="image-small.jpg">
  <source media="(max-width: 1024px)" srcset="image-medium.jpg">
  <img src="image-large.jpg" alt="Description" loading="lazy" class="w-full h-auto rounded-lg">
</picture>
```

### CSS Optimization

Configure TailwindCSS for optimal performance in `tailwind.config.js`:

```javascript
module.exports = {
  content: [
    "_includes/**/*.html",
    "_layouts/**/*.html", 
    "_posts/**/*.md",
    "*.html",
    "*.md"
  ],
  theme: {
    extend: {
      // Your custom theme extensions
    }
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["light", "dark", "cyberpunk"],
    // Reduce CSS size by only including used themes
    logs: false,
  }
}
```

## Testing Your Customizations

### Development Workflow

1. **Make changes** to your files
2. **Test locally** with `make serve`
3. **Check responsiveness** on different screen sizes
4. **Validate HTML** with `bundle exec jekyll doctor`
5. **Test performance** with browser dev tools

### Browser Testing

Test your customizations across different browsers:
- Chrome/Chromium
- Firefox  
- Safari
- Mobile browsers

## Deployment Considerations

### Production Build

Before deploying, ensure your build is optimized:

```bash
# Build for production
npm run build

# Test the built site
cd _site && python -m http.server 8000
```

### Environment Variables

Set environment-specific variables in `_config.yml`:

```yaml
# Development settings
development:
  url: "http://localhost:4000"
  
# Production settings  
production:
  url: "https://yourdomain.com"
  compress_html:
    clippings: all
    comments: all
    endings: all
```

## Troubleshooting Common Issues

### CSS Not Loading
- Check `assets/css/main.css` exists
- Verify TailwindCSS compilation: `npm run build:css`
- Clear Jekyll cache: `make clean`

### Plugin Errors
- Update gems: `bundle update`
- Check plugin compatibility in `Gemfile`
- Review `_config.yml` plugin configuration

### Build Failures
- Check syntax in modified files
- Verify YAML frontmatter formatting
- Test with `bundle exec jekyll doctor`

## Next Steps

Now that you've customized your theme:

1. **Create quality content** regularly
2. **Optimize for SEO** with good meta descriptions
3. **Engage with your audience** through comments/social media
4. **Monitor performance** with analytics
5. **Keep the theme updated** with new features

Remember to backup your customizations and consider contributing improvements back to the theme repository!

---

*Have questions about customization? Check the [GitHub repository](https://github.com/your-username/jekyll-theme-sour) or open an issue for help.*