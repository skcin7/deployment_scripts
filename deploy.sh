#!/bin/bash

#
# deploy.sh
#
# Author: Nick Morgan <https://nicholas-morgan.com>
# Date: October 30, 2019
#
# My script to deploy changes in my projects from my local development
# machine to the live production environment that lives somewhere
# on a server.
#

# Default deployment behavior stored in these variables.
# Deployment behavior may be altered by passing input arguments when executing the deployment.
# e.g.: $ deploy.sh -commit_message="Custom commit message";
GIT_COMMIT_MESSAGE="Commited using deployment script on: `date '+%d/%m/%Y_%H:%M:%S'`.";
MINIFY_ASSETS=false;
FILE="";
TRIGGER_URL_PRODUCTION="";
TRIGGER_URL_SANDBOX="";

# Parse input arguments:
for input in "$@"
do
case $input in
	-c=*|--commit_message=*)
		GIT_COMMIT_MESSAGE="${input#*=}"
		shift # go past argument=value
	;;
	-m=*|--minify_assets=*)
		#MINIFY_ASSETS=true;
		MINIFY_ASSETS="${input#*=}"
		shift # go past argument=value
	;;
	-f=*|--file=*|--single_file=*)
		FILE="${input#*=}"
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

#
# echo_some_text - function
#
# Function to simply echo some text.
echo_some_text()
{
	if [ -n "$1" ]
	then
		echo "$1";
	fi
} # end of echo_some_text

#
# trigger_url - function
#
# Function to deploy to server using the trigger URL.
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
		echo_some_text "No trigger URL was specified.";
	fi

} # end of trigger_url

#
# minify_assets - function
#
# Function to minify CSS and JavaScript assets.
minify_assets()
{
	npm run prod;
} # end of minify_assets

#
# git_add_commit_and_push - function
#
# Function to add, commit, and push to the git repository.
git_add_commit_and_push()
{
	local MESSAGE="No commit message.";
	local FILE="";

	# Set local function variables.
	if [ -n "$1" ]
	then
		MESSAGE="$1";
	fi

	if [ -n "$2" ]
	then
		FILE="$2";
	fi

	# Execute it all
	# If file was specified, then add only that single specified file.
	# Otherwise, add all files.
	if [ -n "$FILE" ]
	then
		git add "${FILE}"
	else
		git add -A .
	fi
	#git add -A .
	git commit -m "${MESSAGE}"
	git push -u origin master
} # end of git_add_commit_and_push

# Minify the assets (if desired to do so)!
if [ "$MINIFY_ASSETS" = true ] ; then
    echo_some_text "Minifying the assets ...";
    minify_assets;
fi

# Add and commit changes to the git repository, and push!
#git_add_commit_and_push "${GIT_COMMIT_MESSAGE}";
git_add_commit_and_push "${GIT_COMMIT_MESSAGE}" "${FILE}";

# Handle deployment of changes to the sandbox server!
if [ -n "$TRIGGER_URL_SANDBOX" ]
then
	echo_some_text "Deploying to sandbox ...";
	trigger_url "${TRIGGER_URL_SANDBOX}";
fi

# Handle deployment of changes to the production server!
if [ -n "$TRIGGER_URL_PRODUCTION" ]
then
	echo_some_text "Deploying to production ...";
	trigger_url "${TRIGGER_URL_PRODUCTION}";
fi