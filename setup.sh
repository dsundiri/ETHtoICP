#!/bin/bash

# Step 1: Navigate to the ETHtoICP directory
echo "Navigating to the ETHtoICP directory..."
cd /workspaces/ETHtoICP || exit
echo "Now inside /workspaces/ETHtoICP."

# Step 2: Check Git status
echo "Checking Git status..."
git status

# Step 3: Stage all changes
echo "Staging all changes..."
git add .

# Step 4: Commit the changes
echo "Committing changes..."
git commit -m "Initial commit of ETH-ICP bridge project"

# Step 5: Verify if remote is set
REMOTE=$(git remote)
if [ -z "$REMOTE" ]; then
  echo "No remote repository set. Adding GitHub repository..."
  git remote add origin https://github.com/dsundiri/ETHtoICP.git
else
  echo "Remote repository already set."
fi

# Step 6: Push changes to the main branch
echo "Pushing changes to the main branch on GitHub..."
git push -u origin main

# Completion message
echo "Code has been pushed to GitHub!"
