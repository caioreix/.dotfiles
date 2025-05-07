# Dotfiles

A cross-platform dotfiles setup for Unix-like systems (Linux, macOS/Darwin, Codespaces, Windows WSL) and Windows.

## 🚀 Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/.dotfiles.git ~/.dotfiles
   ```

2. **Run the install script:**

   ```sh
   . ~/.dotfiles/install
   ```

   > **Note:** If you get a permission error, run `chmod +x ~/.dotfiles/install` to make the script executable.

## 🛠️ Configuration Structure

- The `unix/` folder contains configs shared across all unix platforms.
- Platform-specific folders (`darwin/`, `linux/`, `codespaces/`, `windows/`) override shared configs.
- The `local/` folder is for your personal, machine-specific overrides (not tracked by git).

**File Priority (highest to lowest):**

1. `local/*` (sourced directly, for local customizations)
2. Platform-specific (`darwin/`, `linux/`, `codespaces/`, `windows/`) — override shared configs
3. `unix/` — shared defaults

> Overwritten files are backed up in the `old/` folder for easy rollback.

## 📝 Usage Tips

- Place your machine-specific scripts in the `local/` directory.
- To make a script executable, use:
  ```sh
  chmod +x <file>
  ```

## 💻 Platform Notes

### Linux

- **Requirement:** [git](https://git-scm.com/) must be installed.

### macOS (Darwin)

- **Requirement:** Xcode Command Line Tools.
  Install with:
  ```sh
  xcode-select --install
  ```

### Codespaces

- Works out of the box with the shared and codespaces-specific configs.

### Windows

- Supported via the `windows/` directory.

---

Feel free to fork and adapt for your own workflow!
