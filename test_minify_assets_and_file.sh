#!/bin/bash

# test_minify_assets_and_file
# Simple script for testing the minify_assets and file properties.

MINIFY_ASSETS=false;
FILE="";

# Parse input arguments:
for input in "$@"
do
case $input in
	-m=*|--minify_assets=*)
		#MINIFY_ASSETS=true;
		MINIFY_ASSETS="${input#*=}"
		shift # go past argument=value
	;;
	-f=*|--file=*|--single_file=*)
		FILE="${input#*=}"
		shift # go past argument=value
	;;
	*)
		# unrecognized flag
	;;
esac
done

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

echo "${MINIFY_ASSETS}";



#if [ "$MINIFY_ASSETS" = true ] ; then
#    echo_some_text "Minifying the assets ...";
#    minify_assets;
#fi

# Add and commit changes to the git repository, and push!
#git_add_commit_and_push "${GIT_COMMIT_MESSAGE}";
git_add_commit_and_push "${GIT_COMMIT_MESSAGE}" "${FILE}";