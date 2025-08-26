---
layout: post
title: "Deploy Sour Theme to GitHub Pages with GitHub Actions"
date: 2024-01-25 10:00:00 -0000
author: Sour Theme
tags: [GitHub Pages, Deployment, GitHub Actions, CI/CD, Tutorial]
category: tutorial
excerpt: "Complete guide to deploying your Sour theme blog to GitHub Pages using GitHub Actions. Includes TailwindCSS build automation and custom domain setup."
description: "Step-by-step tutorial for deploying Jekyll sites with npm dependencies to GitHub Pages using GitHub Actions workflow."
toc: true
---

GitHub Pages is an excellent free hosting solution for Jekyll blogs, but the Sour theme requires special setup due to its npm dependencies and TailwindCSS build process. This guide walks you through deploying your blog with GitHub Actions.

## Why GitHub Actions is Required

GitHub Pages has limitations that make it incompatible with the Sour theme's build process:

- **No npm support**: GitHub Pages can't run `npm install` or build TailwindCSS
- **Limited plugins**: Many Jekyll plugins aren't supported
- **No custom build steps**: Can't run our `make build` process

**Solution**: Use GitHub Actions to build the site and deploy the generated `_site` folder.

## Prerequisites

- GitHub account
- Git repository with your Sour theme
- Basic understanding of Git commands

## Step 1: Prepare Your Repository

### 1.1 Clean Up Your Repository

First, ensure your repository is clean and properly configured:

```bash
# Remove build artifacts
make clean

# Check what's ignored
cat .gitignore
```

Your `.gitignore` should include:
```gitignore
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata
node_modules/
assets/css/main.css
*.gem
.bundle/
vendor/
```

### 1.2 Update Configuration

Update your `_config.yml` for production:

```yaml
# Production URL (replace with your actual domain)
url: "https://yourusername.github.io"
baseurl: "/your-repo-name"  # Leave empty if using custom domain

# Exclude GitHub Actions files
exclude:
  - .github/
  - node_modules/
  - vendor/
  - Gemfile
  - Gemfile.lock
  - package*.json
  - src/
  - Makefile
  - README.md
  - DEVELOPER.md
  - CONFIG-GUIDE.md
```

### 1.3 Commit and Push to GitHub

```bash
git add .
git commit -m "Prepare for GitHub Pages deployment"
git push origin main
```

## Step 2: Create GitHub Actions Workflow

### 2.1 Create Workflow Directory

```bash
mkdir -p .github/workflows
```

### 2.2 Create Build and Deploy Workflow

Create `.github/workflows/deploy.yml`:

```yaml
name: Build and Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout repository
      uses: actions/checkout@v4
      
    - name: Setup Ruby
      uses: ruby/setup-ruby@v1
      with:
        ruby-version: '3.1'
        bundler-cache: true
        
    - name: Setup Node.js
      uses: actions/setup-node@v4
      with:
        node-version: '18'
        cache: 'npm'
        
    - name: Install dependencies
      run: |
        bundle install
        npm install
        
    - name: Build TailwindCSS
      run: npm run build:css
      
    - name: Build Jekyll site
      run: bundle exec jekyll build
      env:
        JEKYLL_ENV: production
        
    - name: Upload artifact
      uses: actions/upload-pages-artifact@v3
      with:
        path: ./_site

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    if: github.ref == 'refs/heads/main'
    
    steps:
    - name: Deploy to GitHub Pages
      id: deployment
      uses: actions/deploy-pages@v4
```

## Step 3: Configure GitHub Pages

### 3.1 Enable GitHub Pages

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll to **Pages** section
4. Under **Source**, select **GitHub Actions**

### 3.2 Set Repository Permissions

1. In **Settings** > **Actions** > **General**
2. Under **Workflow permissions**, select:
   - **Read and write permissions**
   - Check **Allow GitHub Actions to create and approve pull requests**

## Step 4: Deploy Your Site

### 4.1 Trigger First Deployment

```bash
# Make a small change to trigger deployment
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Actions workflow for deployment"
git push origin main
```

### 4.2 Monitor Deployment

1. Go to **Actions** tab in your repository
2. Watch the "Build and Deploy to GitHub Pages" workflow
3. Check for any errors in the build process

### 4.3 Access Your Site

Once deployment succeeds, your site will be available at:
- `https://yourusername.github.io/repository-name` (if using baseurl)
- `https://yourusername.github.io` (if repository is named `yourusername.github.io`)

## Step 5: Custom Domain (Optional)

### 5.1 Add Custom Domain

If you have a custom domain:

1. Create `CNAME` file in repository root:
```bash
echo "yourdomain.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push origin main
```

2. Configure DNS:
   - **A records**: Point to GitHub Pages IPs:
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`
   - **CNAME record**: Point `www` to `yourusername.github.io`

3. Update `_config.yml`:
```yaml
url: "https://yourdomain.com"
baseurl: ""  # Empty for custom domain
```

### 5.2 Enable HTTPS

In GitHub Pages settings, check **Enforce HTTPS** (available after DNS propagation).

## Troubleshooting Common Issues

### Build Failures

**Problem**: CSS not loading
```yaml
# Solution: Ensure TailwindCSS builds before Jekyll
- name: Build TailwindCSS
  run: npm run build:css
  
- name: Build Jekyll site
  run: bundle exec jekyll build
```

**Problem**: Missing dependencies
```yaml
# Solution: Install both Ruby and Node dependencies
- name: Install dependencies
  run: |
    bundle install
    npm install
```

**Problem**: Plugin errors
```yaml
# Solution: Set production environment
env:
  JEKYLL_ENV: production
```

### Deployment Failures

**Problem**: Permission denied
- Check **Settings** > **Actions** > **General** > **Workflow permissions**
- Ensure **Read and write permissions** is selected

**Problem**: Pages not updating
- Check if deployment completed successfully
- Clear browser cache
- Wait a few minutes for CDN propagation

### Performance Issues

**Problem**: Slow builds
```yaml
# Solution: Cache dependencies
- name: Setup Node.js
  uses: actions/setup-node@v4
  with:
    node-version: '18'
    cache: 'npm'  # Enable npm cache
    
- name: Setup Ruby
  uses: ruby/setup-ruby@v1
  with:
    ruby-version: '3.1'
    bundler-cache: true  # Enable bundler cache
```

## Advanced Configuration

### Environment-Specific Builds

Create different configs for development vs production:

```yaml
# _config_production.yml
url: "https://yourdomain.com"
baseurl: ""

# Google Analytics (production only)
google_analytics: "GA-MEASUREMENT-ID"

# Compress HTML in production
compress_html:
  clippings: all
  comments: all
  endings: all
```

Update workflow:
```yaml
- name: Build Jekyll site
  run: bundle exec jekyll build --config _config.yml,_config_production.yml
  env:
    JEKYLL_ENV: production
```

### Branch-Specific Deployments

Deploy different branches to different environments:

```yaml
# Deploy main branch to production
- name: Deploy to Production
  if: github.ref == 'refs/heads/main'
  uses: actions/deploy-pages@v4

# Deploy staging branch to GitHub Pages environment
- name: Deploy to Staging
  if: github.ref == 'refs/heads/staging'
  # Deploy to different subdomain or path
```

### Build Optimization

Speed up builds with parallel jobs:

```yaml
jobs:
  build:
    strategy:
      matrix:
        os: [ubuntu-latest]
        node-version: [18]
        ruby-version: ['3.1']
    
    runs-on: ${{ matrix.os }}
```

## Security Best Practices

### 1. Environment Variables

Store sensitive data in GitHub Secrets:

```yaml
# In workflow file
env:
  GOOGLE_ANALYTICS_ID: ${{ secrets.GOOGLE_ANALYTICS_ID }}
  API_KEY: ${{ secrets.API_KEY }}
```

Add secrets in **Settings** > **Secrets and variables** > **Actions**.

### 2. Dependabot Updates

Create `.github/dependabot.yml`:

```yaml
version: 2
updates:
  - package-ecosystem: "bundler"
    directory: "/"
    schedule:
      interval: "monthly"
      
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "monthly"
      
  - package-ecosystem: "github-actions"
    directory: "/.github/workflows"
    schedule:
      interval: "monthly"
```

### 3. Security Scanning

Add CodeQL analysis:

```yaml
- name: Initialize CodeQL
  uses: github/codeql-action/init@v3
  with:
    languages: javascript

- name: Perform CodeQL Analysis
  uses: github/codeql-action/analyze@v3
```

## Monitoring and Analytics

### Build Status Badge

Add to your README.md:

```markdown
[![Deploy to GitHub Pages](https://github.com/username/repo/actions/workflows/deploy.yml/badge.svg)](https://github.com/username/repo/actions/workflows/deploy.yml)
```

### Performance Monitoring

Monitor your site with:
- **Google Analytics**: Add to `_config.yml`
- **Google Search Console**: Verify domain ownership
- **Lighthouse CI**: Add performance testing to workflow

## Conclusion

With GitHub Actions, you can deploy the Sour theme to GitHub Pages while maintaining all its modern features:

✅ **Automated builds** with TailwindCSS compilation  
✅ **Full Jekyll plugin support**  
✅ **Custom domains** with HTTPS  
✅ **Zero hosting costs**  
✅ **Continuous deployment** on every push  

Your blog is now automatically deployed whenever you push changes to the main branch. Simply add new posts to `_posts/` and push to GitHub - your site will rebuild and deploy automatically!

## Next Steps

- **Custom Domain**: Set up your own domain name
- **Analytics**: Add Google Analytics for visitor tracking
- **SEO**: Submit sitemap to Google Search Console
- **Performance**: Optimize images and enable caching
- **Monitoring**: Set up uptime monitoring

Happy blogging with GitHub Pages! 🚀

---

*Need help with deployment? Check the [GitHub Actions documentation](https://docs.github.com/en/actions) or open an issue in the Sour theme repository.*