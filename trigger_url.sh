#!/bin/bash

# trigger_url
# A script to touch the deployment trigger URL, to initiate the git
# repository be deployed to the server.

TRIGGER_URL="https://forge.laravel.com/servers/237299/sites/846897/deploy/http?token=JyJerCFqlZfenanOlF3HzDZA2fDEFPwYBwqeMTmx"

curl -X POST "${TRIGGER_URL}"


# trigger_url
# Touch the deployment trigger URL to initiate the latest changes in the
# git repository become synced and live on the server.
trigger_url()
{
    # Only the superuser can get this information

    if["$(id -u)" = "0"]; then
        echo "<h2>Home directory space by user</h2>"
        echo "<pre>"
        echo "Bytes Directory"
        du -s /home/* | sort -nr
        echo "</pre>"
    fi

} # end of trigger_url