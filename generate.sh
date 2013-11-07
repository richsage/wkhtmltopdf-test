#!/bin/bash

IS_OSX=$(uname -v | grep -q "^Darwin")$?
IS_LINUX=$(uname -a | grep -q "Linux")$?
if [ $IS_OSX -eq 0 ]; then
  BIN="./bin/wkhtmltopdf-osx"
else
  SIXTYFOURBIT=$(uname -m | grep "x86_64")$?
  if [ $SIXTYFOURBIT -eq 0]; then
    BIN="./bin/wkhtmltopdf-amd64"
  else
    BIN="./bin/wkhtmltopdf-i386"
  fi
fi

$BIN example.html output.pdf
echo "Output is saved in output.pdf"
