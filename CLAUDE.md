# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A developer blog featuring a community of mushroom mascots called "Porters" who guide readers through software development topics. The blog combines technical content with approachable, community-driven storytelling.

## Objective

Create coding tutorials, series, content and share my approach to learning and discovering new technologies.

## Mascot concept 
Characters: The Porters - a community of portobello mushroom characters
Individual Personas:

Junior Porter: New developer, asking questions, learning basics
Senior Porter: Experienced, mentoring others, architectural insights
Specialist Porters: Frontend Porter, Backend Porter, DevOps Porter, etc.
Explorer Porter: Always trying new technologies

## Porter's Path - Tone & Voice Guide
### Core Voice Characteristics
#### Growth-Minded & Encouraging

Emphasize learning as a continuous journey, not a destination
Celebrate small wins and progress over perfection
Use growth metaphors naturally: "sprouting ideas," "branching out," "rooting understanding"
Frame failures as "composting moments" - breaking down to build something better

#### Community-Oriented & Inclusive

Use "we" and "us" frequently - you're all growing together
Welcome developers at every level without condescension
Acknowledge different learning styles and approaches
Share uncertainty and learning moments honestly

#### Approachably Technical

Explain complex concepts without dumbing them down
Use analogies that connect to the mushroom/growth theme when helpful
Balance technical depth with accessibility
Admit when something is challenging - normalize the struggle

### Porter-Specific Voice Elements
#### The Collective Perspective
Instead of "I think..." use:

"The Porters have been exploring..."
"We've discovered that..."
"After some discussion in the patch..."
"Senior Porter suggests... but Junior Porter wonders..."

Natural Integration of Theme
Don't force mushroom metaphors everywhere, but use them when they genuinely enhance understanding:

"This pattern has deep roots in functional programming"
"Let's branch into the different approaches"
"These concepts are interconnected like mycelium networks"
"Time to decompose this complex problem"

#### Character Voices for Different Content
Junior Porter Voice (Learning/Beginner Content):

Curious and questioning: "Wait, why does this work?"
Honest about confusion: "This totally stumped me at first"
Excited about discoveries: "This clicked when I realized..."
Seeks clarification: "Let me make sure I understand..."

Senior Porter Voice (Advanced/Architectural Content):

Patient and mentoring: "Here's what I wish I'd known earlier"
Experience-based: "In practice, what usually happens is..."
Balanced perspective: "Both approaches have their place"
Strategic thinking: "Consider the long-term implications"

Explorer Porter Voice (New Tech/Experimental Content):

Enthusiastic about possibilities: "This opens up so many opportunities"
Honest about rough edges: "It's not perfect, but the potential is exciting"
Experimental mindset: "Let's see what happens when we..."
Early adopter perspective: "Worth keeping an eye on"

### Tone Guidelines
#### Conversational but Informed

Write like you're explaining to a colleague over coffee
Use contractions and natural speech patterns
Avoid academic jargon without sacrificing accuracy
Be confident without being arrogant

#### Optimistically Realistic

Acknowledge that coding is hard while maintaining enthusiasm
Celebrate progress without toxic positivity
Address frustrations developers actually face
Balance "you can do it" with "this takes time"

#### Gently Humorous

Light, situational humor that developers relate to
Self-deprecating about coding struggles
Playful Porter interactions when natural
Never at the expense of the reader or learning

### Content Voice Examples
#### Opening Paragraphs:
❌ "Today I'm going to teach you about React hooks"
✅ "The Porters have been diving deep into React hooks lately, and we've uncovered some patterns that have really changed how we think about state management"
#### Explaining Concepts:
❌ "First, you need to understand closures"
✅ "Junior Porter was struggling with this until we realized it all comes back to understanding closures - let's explore what that means"
#### Sharing Struggles:
❌ "This is easy once you get it"
✅ "Senior Porter admits this concept took multiple attempts to really sink in - and that's totally normal"
#### Presenting Solutions:
❌ "The correct way to do this is..."
✅ "After trying several approaches, we've found this pattern works well in most situations"
### What to Avoid
#### Over-Cute Mushroom References

Don't force puns or mushroom metaphors in every sentence
Avoid infantilizing language ("funguy" jokes get old quickly)
Let the theme enhance, not overshadow, the technical content

#### Fake Personas

Don't create dramatic conflicts between Porters
Avoid making them feel like separate people rather than perspectives
Keep Porter voices as natural extensions of teaching different concepts

#### Exclusionary Language

Avoid "obviously," "simply," "just," or "easy"
Don't assume prior knowledge without context
Include rather than exclude different experience levels

### Consistency Checks
Before publishing, ask:

Does this sound like a helpful community member sharing knowledge?
Would a developer at any level feel welcomed by this tone?
Are the Porter perspectives adding value or just decoration?
Does the growth theme enhance understanding or feel forced?

### Sample Porter Dialogue Integration
Instead of dry transitions, use Porter perspectives:
"While Senior Porter appreciates the elegance of this functional approach, Explorer Porter points out that the newer async/await syntax might be more intuitive for developers coming from other languages. Let's look at both approaches..."
This creates natural segues between different viewpoints while maintaining the community feeling that makes your blog unique.
The Bottom Line
Your voice should feel like the most helpful, encouraging senior developer you know, who happens to work with a really supportive team. Technical expertise delivered with warmth, community spirit, and genuine care for helping others grow.

## Porters' guidelines
When using material that is from books, articles, guides, tutorials, videos, documentation you must follow the [guidelines](./PORTER_GUIDELINES.md)

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
- **DaisyUI themes**: Configured with "light", "dark", and "fantasy" themes
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