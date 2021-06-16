#!/bin/bash
##
# Compare strings
#
# Note that spacing matters. Exclude the spaces surrounding the `==`, for
# example, and the test returns TRUE. 
##

FRUIT="banana"

# A single pair of square brackets is POSIX-compliant. It is the most portable
# option. It works with sh and bash.
if [ $FRUIT == "apple" ]; then
	echo "fruit is apple"
else 
    echo "fruit is not apple, it's $FRUIT"
fi

# A double bracket is not POSIX-compliant. It is an extension available for bash
# and its variants, but doesn't work with sh. Double bracket is preferred if
# portability isn't a concern. It's preferable as does not have as many
# requirements as using single brackets.
if [[ $FRUIT = "apple" ]]; then
	echo "fruit is apple"
else 
    echo "fruit is not apple, it's $FRUIT"
fi

echo "Assign 'apple' to fruit"
FRUIT="apple"

if [ $FRUIT == "apple" ]; then
	echo "fruit is apple"
else 
    echo "fruit is not apple, it's $FRUIT"
fi

if [[ $FRUIT = "apple" ]]; then
	echo "fruit is apple"
else 
    echo "fruit is not apple, it's $FRUIT"
fi

echo "Assign 'orange' to fruit"
FRUIT="orange"

# It seems `==` and `=` work the same in these simple cases.
if [[ $FRUIT == "apple" ]]; then
	echo "fruit is apple"
else 
    echo "fruit is not apple, it's $FRUIT"
fi

if [ $FRUIT = "apple" ]; then
	echo "fruit is apple"
else 
    echo "fruit is not apple, it's $FRUIT"
fi
