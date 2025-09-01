---
layout: tutorial
title: "Go Installation & Setup"
description: "Quick Go environment setup - installation, VS Code, and verification for our community Go journey."
date: 2025-09-01
author: "Porter Community"
categories: [roadmap, golang, foundations, setup]
tags: [golang, installation, setup, vscode, environment, foundations]
porter_voice: junior
difficulty: beginner
estimated_time: "5 minutes"
prerequisites: 
  - "Command line familiarity"
technologies: 
  - "Go"
  - "VS Code"
---

# Go Installation & Setup

Let's get Go and VS Code installed for our community learning journey! 

## Install Go

1. **Download**: Visit [go.dev/doc/install](https://go.dev/doc/install)
2. **Choose**: Select the installer for your OS (Windows `.msi`, macOS `.pkg`, Linux `.tar.gz`)
3. **Install**: Follow the official installation instructions on that page

The official docs cover all OS-specific details better than we could recreate here.
### Verify Installation

Open your terminal and run:

```bash
go version
```

You should see something like:
```
go version go1.25.x darwin/amd64
```

**Got the version?**  You're ready to go!  
**Command not found?** Check the [official troubleshooting guide](https://go.dev/doc/install#troubleshoot).


## Install VS Code

1. **Download**: Visit [code.visualstudio.com/Download](https://code.visualstudio.com/Download)
2. **Choose**: Select the installer for your OS
3. **Install**: Run the installer and follow the prompts
4. **Install Go Extension**: 
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
   - Search "Go" and install the official Go extension by Google


## Ready for Code

That's it! Go and VS Code are installed and ready. 

**Next**: [Your First Go Program]({{ '/roadmaps/golang/foundations/first-program/' | relative_url }}) where we write actual Go code together.

## Community Notes

**Having issues?** Share your setup experience below - the community learns together by helping each other troubleshoot.

---

*Setup complete! Questions or ready to code? Join the community discussion below.*