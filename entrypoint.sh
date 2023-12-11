#!/bin/sh -l

json=$(cat "$1")

echo "| Alert Name | Count |"
echo "|------------|-------|"

formatted=$(jq -r '.site[].alerts[] | "| \(.name) | \(.count) |"' "$1")

echo "scan_json<<EOF" >> $GITHUB_OUTPUT
echo "<details>" >> $GITHUB_OUTPUT
echo "<summary>" >> $GITHUB_OUTPUT
echo "Scan Results" >> $GITHUB_OUTPUT
echo "</summary>" >> $GITHUB_OUTPUT
echo "" >> $GITHUB_OUTPUT
echo "$formatted" >> $GITHUB_OUTPUT
echo "" >> $GITHUB_OUTPUT
echo "</details>" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT

exit 0

