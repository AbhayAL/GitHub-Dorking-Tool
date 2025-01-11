#!/bin/bash

# Check if the target is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: ./github_dork_tool.sh <target>"
    echo "Example: ./github_dork_tool.sh nasa.gov"
    exit 1
fi

target="$1"

echo ""
echo "************ GitHub Dork Links (must be logged in) *******************"
echo ""
echo "Generating GitHub dork links for the target: $target"
echo ""

dorks=(
    "password"
    "npmrc _auth"
    "dockercfg"
    "pem private"
    "id_rsa"
    "aws_access_key_id"
    "s3cfg"
    "htpasswd"
    "git-credentials"
    "bashrc password"
    "db_password"
    "FTP password"
    "appsettings.json"
    "credentials"
    "API_KEY"
)

# Generate links
for dork in "${dorks[@]}"; do
    query=$(echo "$dork" | sed 's/ /%20/g')
    echo "$dork"
    echo "https://github.com/search?q=$target+$query&type=Code"
    echo ""
done

echo "************************************************************************"
echo "Use these links responsibly. Unauthorized access or use is prohibited."
