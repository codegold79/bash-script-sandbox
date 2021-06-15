#!/bin/bash
##
# This script shows that imported variables will overwrite variables with the
# same name. Variables imported from two.sh are treated as if they were declared
# in one.sh.
##

NAME="Alice"
echo "In one, name is $NAME"

echo "Import two.sh"
source two.sh

echo "In one, name is $NAME"
echo "Assign Alice to NAME"
NAME="Alice"
echo "In one, name is $NAME"

callName

echo "In one, name is $NAME"
