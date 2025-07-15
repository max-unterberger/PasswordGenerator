# A Simple Password Generator Script 🔐
Generates a 20-character long password composed of random upper/lower-case letters, digits, and symbols (!, #, $)

## Installation

### Windows (Command Prompt)

1. Run the installer, choosing which script to use:

   ```cmd
   install.bat python
   ```
   or
   ```cmd
   install.bat powershell
   ```
2. Optionally, specify a custom alias name (default is `password`). For example:
    ```cmd
    install.bat powershell pwgen
    ```
3. Restart Command Prompt to use the alias:
   ```cmd
   password
   ```

### Unix (Bash/Zsh)

1. Run the installer (optionally specify a custom alias, default is `password`):

   ```sh
   ./install.sh           # sets alias 'password'
   ./install.sh pwgen   # sets alias 'pwgen'
   ```
2. Reload your shell config or restart your terminal:
   ```sh
   source ~/.bashrc   # or ~/.zshrc
   ```
3. Use the alias:
   ```sh
   password
   ```

