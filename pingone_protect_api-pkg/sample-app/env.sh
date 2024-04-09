#!/bin/bash

# Creates a JS file with a JSON object made up of environment variables that
# are set to the global window object.
# 

if test -z "$1" ; then
  printf "\e[0;31mThis script requires an envFile argument."
  printf "\n%s" "Example:"
  printf "\n%s" "./env.sh .env\e[0m"
  printf "\n"
  exit 1
fi

ENVFILE=$1

# Recreate env file.
rm -rf ./.env
touch ./.env

# Read each line in .env file
# Each line represents key=value pairs
while read -r line || test -n "${line}"
do
  #Only continue if the current line is not a comment "#".
  [[ ${line} =~ ^#.*  || -z "${line}" ]] && continue
  # Split env variables by character `=`
  if printf '%s\n' "${line}" | grep -q -e '='
  then
    varname=$(printf '%s\n' "${line}" | sed -e 's/=.*//')
    varvalue=$(printf '%s\n' "${line}" | sed -e 's/^[^=]*=//')
  fi

  # Read value of current environment variable if it exists.
  value=$(printf '%s\n' "${!varname}")
  # Otherwise use value from .env file
  test -z "${value}" && value=${varvalue}
  
  # Append environment variable to .env
  echo "${varname}=$value" >> ./.env
done < "$ENVFILE"

# This script will self destruct
# If you are running this locally, comment this out.
rm -- "$0"
