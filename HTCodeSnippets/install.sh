#!/usr/bin/env bash

# Determine the install directory.
installDirectory=~/Library/Developer/Xcode/UserData/CodeSnippets

echo "Templates will be installed to $installDirectory"

# Create the install directory if it does not exist.
if [ ! -d "$installDirectory" ]
then
	mkdir -p "$installDirectory"
fi

# Copy all of the xctemplate folders into the install directory.
cp -r ./HTTempplate/HTCodeSnippets/*.codesnippet "$installDirectory"

