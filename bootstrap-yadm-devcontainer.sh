#!/bin/bash

# Ensure yadm is installed
if ! command -v yadm >/dev/null; then
  if command -v brew >/dev/null; then
    brew install yadm
  elif command -v apt-get >/dev/null; then
    sudo apt-get install yadm
  else
    echo "Unsupported yadm platform"
    exit
else
  echo "yadm is already installed"
fi

yadm alt
yadm bootstrap
