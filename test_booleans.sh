#!/bin/bash

# test_booleans
# Simple script for testing booleans.

if [ true  ] ; then echo "This text will always appear." ; fi;
if [ false ] ; then echo "This text will always appear." ; fi;
if true      ; then echo "This text will always appear." ; fi;
if false     ; then echo "This text will never appear."  ; fi;