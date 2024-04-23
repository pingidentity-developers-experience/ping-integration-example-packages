#!/bin/bash

STR=""

var1=$(echo $STR | cut -f1 -d:)
var2=$(echo $STR | cut -f2 -d:)

echo $var1 $var2