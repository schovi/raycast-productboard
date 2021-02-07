#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create note
# @raycast.mode fullOutput
# @raycast.packageName Productboard
# @raycast.argument1 { "type": "text", "placeholder": "title" }
# @raycast.argument2 { "type": "text", "placeholder": "content" }
# @raycast.argument3 { "type": "text", "placeholder": "email", "optional": true }

#
# Optional parameters:
# @raycast.icon 🗣
# @raycast.currentDirectoryPath ~
# @raycast.needsConfirmation false
#
# Documentation:
# @raycast.description Creates a new note productboard.
# @raycast.author David Schovanec
# @raycast.authorURL david.schovanec@productboard.com

source './secrets.sh'

if [[ -z $PRODUCTBOARD_TOKEN ]]; then
  echo "Error: Missing PRODUCTBOARD_TOKEN"
  exit 1
fi

url="https://api.productboard.com/notes"

auth="Authorization: Bearer $PRODUCTBOARD_TOKEN"

payload="{\"title\":\"$1\", \"content\":\"$2\""

if [[ -n $3 ]]; then
  payload="${payload},\"customer_email\":\"$3\"}"
else
  payload="${payload}}"
fi

response="$(echo $payload | curl -s -X POST $url -H "$auth" -H "Content-Type: application/json" -d @-)"

url="$(echo "$response" | jq -r .links.html)"

if [[ -n $url ]]; then
  echo "OK:"
  echo "Browser will open note in 2 seconds..."

  sleep 2

  open $url
else
  echo "ERROR:"
  echo "$(echo "$response" | jq .)"
  exit 1
fi
