#!/bin/bash

# Directory containing the files
directory="./davinci-flows"

# Initialize the command variable
command="dvtf-pingctl generate"

# Loop through all files in the directory
for file in "$directory"/*.json; do
  # Add each file as a parameter
  command+=" -e \"$file\""
done

# Execute the command
eval $command