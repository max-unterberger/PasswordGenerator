#!/usr/bin/env bash
# install_password_alias.sh
#
# Adds an alias so that typing `password` (or a custom alias) runs ./python-generator.py
# Supports Bash and Zsh.
#
# Usage: ./install.sh [alias_name]
# If alias_name is omitted, 'password' is used by default.

# Optional first parameter: alias name (default: password)
ALIAS_NAME="${1:-password}"

# Determine absolute path to python-generator.py
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/python-generator.py"

# Choose the right RC file
if [ -n "$ZSH_VERSION" ]; then
  RC_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
  RC_FILE="$HOME/.bashrc"
else
  echo "Unsupported shell. Please add the alias yourself to ~/.bashrc or ~/.zshrc."
  exit 1
fi

ALIAS_CMD="alias $ALIAS_NAME='$SCRIPT_PATH'"

# Add the alias if it isn't already present
if grep -Fxq "$ALIAS_CMD" "$RC_FILE"; then
  echo "Alias already exists in $RC_FILE"
else
  echo "" >> "$RC_FILE"
  echo "# run python-generator when typing '$ALIAS_NAME'" >> "$RC_FILE"
  echo "$ALIAS_CMD" >> "$RC_FILE"
  echo "Added alias to $RC_FILE"
  echo "→ $ALIAS_CMD"
  echo ""
  echo "Reload your shell or run:  source $RC_FILE"
fi
