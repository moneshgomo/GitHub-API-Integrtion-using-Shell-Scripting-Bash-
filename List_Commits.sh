#!/bin/bash
# ===============================================
#  Author : Moneshgomo
#  Script: list_commits.sh
#  Description: Fetch commits from a GitHub repo
# ===============================================

set -e

API_URL="https://api.github.com"

USERNAME=$github_username
TOKEN=$github_aws_token

REPO_OWNER=$1
REPO_NAME=$2


function validate_inputs {  #  ( -z flag is for check empty strings )


if [[ -z "$REPO_OWNER" || -z "$REPO_NAME" ]]; then
  echo "❌ Usage: $0 <repo_owner> <repo_name>"
  echo "Example: $0 octocat Hello-World"

fi

if [[ -z "$TOKEN" ]]; then
  echo "❌ Error: GitHub token not found!"
  echo "Please export github_aws_token or store it in token.txt."
fi

}


function list_commits_in_repo {
  curl -s -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "${API_URL}/repos/${REPO_OWNER}/${REPO_NAME}/commits" \
  | jq '.[] | {url: .url, sha: .sha, node_id: .node_id, author: .commit.author.name, message: .commit.message}'
}

#  Run the main logic ---
echo "Listing commits for ${REPO_OWNER}/${REPO_NAME}..."
validate_inputs
list_commits_in_repo
