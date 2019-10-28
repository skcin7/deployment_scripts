#!/bin/bash

# Set default commit message.
MESSAGE="Deploy script used on `date '+%d/%m/%Y_%H:%M:%S'`."

# Parse input to get git commit message:
for i in "$@"
do
case $i in
    -m=*|--message=*)
        MESSAGE="${i#*=}"
        shift # past argument=value
    ;;
    *)
        # unknown option
    ;;
esac
done

# Compile/minify JavaScripts/CSS:
npm run prod

# Add all files of current saved version and commit with commit message.
git add -A .
git commit -m "${MESSAGE}"

# Push to server:
git push

# deploy
TRIGGER_URL_SANDBOX="https://forge.laravel.com/servers/237299/sites/808513/deploy/http?token=OSUTZl6j0y3hRLRQ1w4BaDk2MY6syp7Z5EuFXzbP"
TRIGGER_URL_PRODUCTION="https://forge.laravel.com/servers/237299/sites/846897/deploy/http?token=JyJerCFqlZfenanOlF3HzDZA2fDEFPwYBwqeMTmx"

#curl -X POST "${TRIGGER_URL_SANDBOX}"
#curl -X POST "${TRIGGER_URL_PRODUCTION}"