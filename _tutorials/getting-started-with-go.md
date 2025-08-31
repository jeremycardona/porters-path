---
layout: tutorial
title: "Getting Started with Go"
description: "Your first steps into Go programming - installation, setup, and writing your first Go program."
date: 2025-08-31
author: "Junior Porter"
categories: [tutorials, golang, beginner]
tags: [golang, installation, setup, beginner, getting-started]
porter_voice: junior
difficulty: beginner
estimated_time: "10 minutes"
prerequisites: ["Basic programming knowledge", "Command line familiarity", "Text editor"]
---

# Getting Started with Go

Welcome to your first step into the world of Go programming! Junior Porter here, and I'm excited to guide you through installing Go and writing your very first program. Don't worry if you're new to this - we'll take it step by step! 🌱

## 📦 Installing Go

Before we can start writing Go code, we need to install Go on our system. The installation process varies depending on your operating system.

### Download Go

Head over to the [official Go downloads page](https://go.dev/doc/install) where you'll find installers for different operating systems:

- **Windows**: Download the `.msi` installer file
- **macOS**: Download the `.pkg` installer file  
- **Linux**: Download the `.tar.gz` archive file

**Important**: Make sure to download the correct version for your operating system and architecture (32-bit or 64-bit). Most modern systems use 64-bit, but double-check if you're unsure!

### Install Go by Operating System

Installation varies from OS, so after downloading your file follow the instructuctions. Some OS are simpler than others and just require you to follow the prompts. I had an issue downloading the latest Go version because I had an older version installed with the package manager and it created some trouble when I was verifying the Go version, besides that it's actually easy!

### Verify Your Installation

Let's make sure Go is properly installed! Open your terminal or command prompt and run:

```bash
go version
```

You should see something like:
```
go version go1.25.0 darwin/amd64
```

If you see the version number, congratulations! Go is successfully installed. If not, double-check that Go is in your system PATH.

## 📝 Writing Your First Go Program

Now for the exciting part - let's write some Go code! We'll create the classic "Hello, World!" program.

### Step 1: Create a Working Directory

First, let's create a directory for our Go code. You can do this anywhere on your system:

```bash
mkdir hello
cd hello
```

### Step 2: Initialize a Go Module

Go uses modules to manage dependencies. Let's initialize our first module:

```bash
go mod init example/hello
```
This tells Go:
  - "This folder is a Go project"
  - "The project is called 'example/hello'"
  - "Use this name for imports within the project"
  - "Track dependencies here"

**go mod init transforms a random folder into a proper Go project that can grow and manage dependencies properly!**

This creates a `go.mod` file that tracks your module's dependencies. You should see:
```
go: creating new go.mod: module example/hello
```

### Step 3: Create Your Go Source File

Now, let's create our first Go source code file. Create a file named `hello.go`:

**For Windows (Command Prompt):**
```cmd
echo. > hello.go
```

**For macOS/Linux (Terminal):**
```bash
touch hello.go
```

Go source code will have the .go file extension. it tells everyone (Go tools, editors, developers) "Hey, I'm Go code!" Without it, Go simply doesn't recognize your file as something it should work with.

### Step 4: Write Your First Go Code

Open `hello.go` in your favorite text editor and add this code:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```

Let me break down what each line does:

- `package main`: Every Go file belongs to a package. The `main` package is special - it tells Go this is an executable program
- `import "fmt"`: This imports Go's format package, which contains functions for formatting text, including printing to the console
- `func main()`: This is the main function where our program starts running
- `fmt.Println("Hello, World!")`: This prints our message to the console

### Step 5: Run Your Go Program

Now comes the moment of truth! Let's run our program using Go's `run` command:

```bash
go run hello.go
```

You should see:
```
Hello, World!
```

🎉 **Congratulations!** You just wrote and ran your first Go program!

## 🔍 Understanding the `go run` Command

The `go run` command is perfect for testing and development. Here's what it does:

1. **Compiles** your Go source code
2. **Runs** the compiled program immediately
3. **Cleans up** temporary files

This means you don't have to manually compile and then run your program - Go handles it all in one step!

## 🚀 What's Next?

You've successfully:
- ✅ Installed Go on your system
- ✅ Created your first Go module
- ✅ Written your first Go program
- ✅ Learned how to run Go code

You're now ready to dive deeper into Go programming! Here are some next steps you can take:

1. **Experiment**: Try changing the message in your Hello World program
2. **Explore**: Check out the [Go Tour](https://tour.golang.org/) for interactive learning
3. **Prepare**: Get ready for our comprehensive Go roadmap starting September 1, 2025!

## 🤔 Troubleshooting

**Problem**: `go: command not found`
**Solution**: Go isn't in your system PATH. Revisit the installation steps for your operating system.

**Problem**: Permission errors on Linux/macOS
**Solution**: Make sure you used `sudo` when extracting to `/usr/local` or try installing Go to your home directory instead.

**Problem**: `go.mod` file issues
**Solution**: Make sure you're in the correct directory and that you ran `go mod init` successfully.

---

Great job making it through your first Go tutorial! You're well on your way to becoming a Go developer. Remember, every expert was once a beginner - keep practicing and don't be afraid to experiment! 🍄

*Junior Porter & The Porter Community*

---

*Having trouble with the installation or your first program? Don't hesitate to reach out to the Porter community - we're here to help each other grow!*
