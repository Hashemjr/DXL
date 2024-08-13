#!/bin/bash

REPO_URL="https://github.com/Hashemjr/DXL"
CLONE_DIR="Dxl"
BRANCHES_FILE="branches"
TARGET_BRANCH="Black"
COMMIT_MSG="Hello"

# Cloning the Repo
git clone "$REPO_URL" "$CLONE_DIR"

# Changing Directory
cd "$CLONE_DIR"

# Displaying all branches
git branch > "$BRANCHES_FILE"

# Making file executable
chmod +x "$BRANCHES_FILE"

# Getting the Hello Commit
git log Red --grep="$COMMIT_MSG"

# Switching to black branch
git checkout "$TARGET_BRANCH"

# Adding new lines to Black_file.txt
echo "hello again" >> Black_file.txt
echo "I need a cup of coffee" >> Black_file.txt
git add Black_file.txt
git commit -m "New Lines added"
git push origin "$TARGET_BRANCH"
