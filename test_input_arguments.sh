#!/bin/bash

# test_input_arguments
# Simple script for testing input arguments.

# All arguments
echo "Arguments: $@";

# Number of arguments
#echo $#;
echo "You provided $# argument(s).";

# Specific arguments
#echo "$0"; # the shell script itself
#echo "$1"; # first actual argument
#echo "$2";
#echo "$3";