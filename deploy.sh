#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -v # if using a theme, replace by `hugo -t <yourtheme>`

# Add changes to git
git add .

# Commit changes to content repository
msg="updating the content repository `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push changes to Github
git push origin master

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes to final site
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos on Github.
git push origin master

# Come Back
cd ..
