#!/bin/bash

rm -rf slides
files=$(ls src)
for file in $files
do
  title=${file%???}
  echo $title
  slidev build src/$file --base /slides/$title/ --out ../slides/$title
done

