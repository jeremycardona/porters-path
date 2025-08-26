# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll theme called "Sour" - a minimal, responsive and SEO-friendly theme built with Jekyll, TailwindCSS, and DaisyUI components. The project combines Ruby/Jekyll for static site generation with modern CSS frameworks for styling.

## Objective

Create fundational template for jekyll static site. 

## Documentation
https://daisyui.com/
https://jekyllrb.com/
https://tailwindcss.com/

## Development Commands

### Setup
```bash
make install          # Install both Ruby gems and npm packages
# OR separately:
bundle install        # Install Ruby dependencies
npm install          # Install Node.js dependencies
```

### Development
```bash
make serve           # Start development server with CSS watching
npm run dev          # Alternative: concurrent CSS watching + Jekyll serve with livereload
npm run watch:css    # Watch and compile CSS only
bundle exec jekyll serve --livereload  # Serve Jekyll with livereload only
```

### Building
```bash
make build           # Build production site with optimized CSS
npm run build        # Alternative: same as above
npm run build:css    # Build CSS only (minified)
```

### Cleanup
```bash
make clean           # Clean Jekyll build files and generated CSS
npm run clean        # Alternative: same as above
```

## Architecture

### Core Technologies
- **Jekyll 4.4.1**: Static site generator with Liquid templating
- **TailwindCSS 4.x**: Utility-first CSS framework with JIT compilation
- **DaisyUI**: Component library built on Tailwind providing pre-built UI components
- **Jekyll Plugins**: SEO-tag, sitemap, and feed generation

### Build System
- **Dual build pipeline**: Jekyll handles static site generation, npm handles CSS compilation
- **CSS compilation**: TailwindCSS processes `src/input.css` → `assets/css/main.css`
- **Content scanning**: Tailwind watches `_includes/`, `_layouts/`, `_posts/`, and root `.html/.md` files
- **Development workflow**: Concurrent CSS watching and Jekyll livereload using npm concurrently

### Theme System
- **DaisyUI themes**: Configured with "light", "dark", and "cyberpunk" themes
- **Theme switching**: JavaScript-based toggle with localStorage persistence
- **Default theme**: Light theme with dark mode support

### Layout Structure
- **`default.html`**: Base layout with DaisyUI navbar, theme toggle, responsive design
- **`home.html`**: Homepage layout with hero section and latest posts grid
- **`post.html`**: Article layout with typography classes and post navigation
- **`head.html`**: Minimal head include that links to generated CSS

### CSS Architecture
- **Base imports**: TailwindCSS base, components, and utilities
- **Custom components**: `.post-content` and `.site-header` utility classes
- **DaisyUI integration**: Uses semantic component classes (navbar, hero, card, etc.)
- **Responsive design**: Grid layouts that adapt from single column to 3 columns

### Content Structure
- **Posts**: Standard Jekyll posts in `_posts/` with markdown content
- **Static pages**: `about.markdown` and `index.markdown` in root
- **Jekyll excludes**: Node modules, source files, and build tools excluded from output

## File Organization

```
├── _layouts/          # Jekyll layouts (default, home, post)
├── _includes/         # Reusable Jekyll partials 
├── _posts/           # Blog posts in markdown
├── src/              # Source files (input.css)
├── assets/css/       # Generated CSS output (git-ignored)
├── _config.yml       # Jekyll configuration
├── tailwind.config.js # TailwindCSS configuration
├── package.json      # Node.js dependencies and scripts
├── Gemfile          # Ruby dependencies
└── Makefile         # Common development tasks
```


## Development Notes

- CSS must be compiled before Jekyll can serve properly - the site relies on `assets/css/main.css`
- The theme toggle requires JavaScript and uses DaisyUI's data-theme attribute system
- Posts use `.post-content` class which applies Tailwind's prose styling for readable typography
- All layouts extend the `default.html` base template which provides consistent navigation and footer
- the objective of this project is to have a template for starting blogs with jekyll, tailwindcss and daisyui components