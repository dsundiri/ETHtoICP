#!/bin/bash

# Step 1: Move eth-icp-bridge and eth-icp-frontend into ETHtoICP
echo "Organizing project directories..."
if [ -d "eth-icp-bridge" ] && [ -d "eth-icp-frontend" ]; then
  mv eth-icp-bridge ETHtoICP/
  mv eth-icp-frontend ETHtoICP/
  echo "Moved eth-icp-bridge and eth-icp-frontend into ETHtoICP."
else
  echo "eth-icp-bridge or eth-icp-frontend directory not found!"
  exit 1
fi

# Step 2: Navigate to ETHtoICP directory
cd ETHtoICP || exit
echo "Switched to ETHtoICP directory."

# Step 3: Initialize a new Git repository if none exists
if [ ! -d ".git" ]; then
  echo "Initializing new Git repository..."
  git init
  echo "Git repository initialized."
else
  echo "Git repository already exists."
fi

# Step 4: Add all files to Git
echo "Adding all files to Git..."
git add .
echo "Files added."

# Step 5: Commit changes
echo "Committing changes..."
git commit -m "Initial commit - Organize ETH-ICP project"
echo "Changes committed."

# Step 6: Set remote repository
if git remote | grep origin > /dev/null; then
  echo "Remote repository already set."
else
  echo "Setting remote repository..."
  git remote add origin https://github.com/dsundiri/ETHtoICP.git
  echo "Remote repository set."
fi

# Step 7: Push changes to GitHub
echo "Pushing changes to GitHub..."
git branch -M main
git push -u origin main
echo "Changes pushed to GitHub."

# Completion message
echo "Project setup complete!"
