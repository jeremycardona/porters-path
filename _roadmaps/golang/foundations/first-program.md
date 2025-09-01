---
layout: tutorial
title: "Your First Go Program"
description: "Write and run your first Go program - Hello World, modules, and understanding Go program structure."
date: 2025-09-01
author: "Porter Community"
categories: [roadmap, golang, foundations, first-program]
tags: [golang, hello-world, modules, beginner, foundations]
porter_voice: junior
difficulty: beginner
estimated_time: "10 minutes"
prerequisites: 
  - "Go installed and verified"
  - "VS Code with Go extension"
technologies: 
  - "Go"
  - "Go Modules"
---

# Your First Go Program

Now for the exciting part - let's write some Go code together! We'll create the classic "Hello, World!" program.

## Step 1: Create a Working Directory

First, let's create a directory for our Go code. You can do this anywhere on your system:

```bash
mkdir hello
cd hello
```

## Step 2: Initialize a Go Module

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

## Step 3: Create Your Go Source File

Now, let's create our first Go source code file. Create a file named `hello.go`:

```bash
touch hello.go
```

Go source code will have the .go file extension. it tells everyone (Go tools, editors, developers) "Hey, I'm Go code!" Without it, Go simply doesn't recognize your file as something it should work with.

## Step 4: Write Your First Go Code

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

## Step 5: Run Your Go Program

Now comes the moment of truth! Let's run our program using Go's `run` command:

```bash
go run hello.go
```

You should see:
```
Hello, World!
```

**Congratulations!** You just wrote and ran your first Go program!

## Understanding the `go run` Command

The `go run` command is perfect for testing and development. Here's what it does:

1. **Compiles** your Go source code
2. **Runs** the compiled program immediately
3. **Cleans up** temporary files

This means you don't have to manually compile and then run your program - Go handles it all in one step!

## What's Next?

You've successfully:
- Created your first Go module
- Written your first Go program
- Learned how to run Go code

You're now ready to continue our Go foundations journey!

## Troubleshooting

**Problem**: `go.mod` file issues
**Solution**: Make sure you're in the correct directory and that you ran `go mod init` successfully.

---

Great job making it through your first Go program! You're well on your way to becoming a Go developer. Remember, every expert was once a beginner - keep practicing and don't be afraid to experiment!

*Having trouble with your first program? Don't hesitate to reach out to the Porter community - we're here to help each other grow!*