#!/bin/bash

# deploy
# Script to deploy changes of a development version web app to become
# live and on the server.

# echo_some_text
# Simple function to echo some text.
echo_some_text()
{
	if [ -n "$1" ]
	then
		echo "$1";
	fi
} # end of echo_some_text

# trigger_url
# Touch the deployment trigger URL to initiate the latest changes from the
# git repository to the server.
trigger_url()
{
	local the_url='';

	if [ -n "$1" ]
	then
		the_url="$1";
	fi

	if [ -n "${the_url}" ]
	then
		curl -X POST "${the_url}"
	else
		echo "No trigger URL was specified.";
	fi

} # end of trigger_url

# minify_assets
# Minify CSS and JavaScript assets.
minify_assets()
{
	npm run prod;
} # end of minify_assets

# git_add_commit_and_push
# Add, commit, and push to the git repository.
git_add_commit_and_push()
{
	local message = "No commit message.";

	if [ -n "$1" ]
	then
		message="$1";
	fi

	git add -A .
	git commit -m "${message}"
	git push
} # end of git_add_commit_and_push

#echo_some_text "Hi";
#echo_some_text;

#trigger_url "some_url";
#trigger_url;

# Default behavior:
GIT_COMMIT_MESSAGE="Commited using deployment script on: `date '+%d/%m/%Y_%H:%M:%S'`.";
MINIFY_ASSETS=false;
TRIGGER_URL_PRODUCTION="";
TRIGGER_URL_SANDBOX="";

# Parse input:
for input in "$@"
do
case $input in
	-a=*|--minify_assets=*)
		MINIFY_ASSETS=true;
		shift # go past argument=value
	;;
	-m=*|--message=*)
		GIT_COMMIT_MESSAGE="${input#*=}"
		shift # go past argument=value
	;;
	-p=*|--trigger_url_production=*)
		TRIGGER_URL_PRODUCTION="${input#*=}"
		shift # go past argument=value
	;;
	-s=*|--trigger_url_sandbox=*)
		TRIGGER_URL_SANDBOX="${input#*=}"
		shift # go past argument=value
	;;
	*)
		# unrecognized flag
	;;
esac
done

# Minify the assets!
if [ "$MINIFY_ASSETS" = true ] ; then
    echo "Minifying the assets ...";
    minify_assets;
fi

# Add and commit changes to the git repository, and push!
git_add_commit_and_push "${GIT_COMMIT_MESSAGE}";

# Handle deployment of changes to the sandbox server!
if [ -n "$TRIGGER_URL_SANDBOX" ]
then
	echo "Deploying to sandbox ...";
	trigger_url "${TRIGGER_URL_SANDBOX}";
fi

# Handle deployment of changes to the production server!
if [ -n "$TRIGGER_URL_PRODUCTION" ]
then
	echo "Deploying to production ...";
	trigger_url "${TRIGGER_URL_PRODUCTION}";
fi