#!/bin/bash

# Function to handle errors
error_exit() {
  echo "Error on line $1"
  exit 1
}

# Trap errors and call the error_exit function
trap 'error_exit $LINENO' ERR

# Step 1: Initialize git repository
echo "Initializing a new Git repository..."
git init

# Step 2: Add all project files to the repository
echo "Adding all project files to the repository..."
git add .

# Step 3: Commit the changes with a message
echo "Committing the changes..."
git commit -m "Initial commit: ETH-ICP Bridge setup"

# Step 4: Set up the main branch
echo "Setting up the main branch..."
git branch -M main

# Step 5: Ask for GitHub repository URL
echo "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git):"
read REPO_URL

# Step 6: Check if remote origin exists
if git remote get-url origin &>/dev/null; then
  echo "Remote 'origin' already exists. Updating the remote URL..."
  git remote set-url origin "$REPO_URL"
else
  echo "Adding the remote GitHub repository..."
  git remote add origin "$REPO_URL"
fi

# Step 7: Push the code to GitHub
echo "Pushing the code to GitHub..."
git push -u origin main

echo "Repository has been pushed successfully!"
