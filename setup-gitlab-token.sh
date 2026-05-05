#!/bin/bash

echo "GitLab MCP Token Setup"
echo "----------------------"
echo -n "Paste your GitLab Personal Access Token: "
read -s GITLAB_PERSONAL_ACCESS_TOKEN
echo ""

if [ -z "$GITLAB_PERSONAL_ACCESS_TOKEN" ]; then
    echo "Error: No token provided."
    exit 1
fi

# Write to .env file (not committed to git)
ENV_FILE="$(dirname "$0")/.env"
if grep -q "GITLAB_PERSONAL_ACCESS_TOKEN" "$ENV_FILE" 2>/dev/null; then
    sed -i "s/^GITLAB_PERSONAL_ACCESS_TOKEN=.*/GITLAB_PERSONAL_ACCESS_TOKEN=$GITLAB_PERSONAL_ACCESS_TOKEN/" "$ENV_FILE"
else
    echo "GITLAB_PERSONAL_ACCESS_TOKEN=$GITLAB_PERSONAL_ACCESS_TOKEN" >> "$ENV_FILE"
fi

echo "Token saved to .env"
echo ""
echo "To activate in your current shell, run:"
echo "  source .env && export GITLAB_PERSONAL_ACCESS_TOKEN"
