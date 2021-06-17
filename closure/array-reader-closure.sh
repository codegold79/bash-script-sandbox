#!/bin/bash

function readArray {
    for i in ${arr[@]};
    do
            echo $i
    done
}

# The variable captured by the readArray function
arr=("one" "two" "three")
