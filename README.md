# Dotfiles

The Unix folder is meant for sharing configurations between Darwin, Linux, and Codespaces.

**File Priority:**

1. `.dotfiles/local/*` (will just be sourced)
2. Specific (`/darwin`, `/linux`, `/codespaces`, `/windows`) files overwrite defaults
3. Default (`/unix`) files overwrite originals

Use the local directory to add environment-specific source files.

The overwritten files will be stored in an `old` folder in case of needing rollback.

## Linux

> WIP

## Darwin

Require developer tools, just run `xcode-select --install`

1. install homebrew
2. install vscode

## Windows

> WIP
