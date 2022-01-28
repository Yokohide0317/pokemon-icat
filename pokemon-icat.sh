#!/bin/bash

output=$(python3 $HOME/.pokemon-icat/pokemon.py ${@:1})

echo $output

IFS=' ' read -r -a split <<< "$output"

pokemon=${split[0]}

echo " "
echo " "

### CHANGE THIS LINE IF YOU NEED TO USE THIS SCRIPT ON ANOTHER TERMINAL
if test $TERM_PROGRAM = "iTerm.app" ; then
    imgcat $HOME/.pokemon-icat/pokemon-icons/$pokemon.png
elif test $TERM_PROGRAM = "kitty" ; then
    kitty icat --align left --silent $HOME/.pokemon-icat/pokemon-icons/$pokemon.png
else ; then
    echo "Using other terminal"
fi
