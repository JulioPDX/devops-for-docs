#!/bin/bash

list="$(git tag)"

# deploy all tags
echo "$list" | while read tag
do
    git checkout tags/$tag
    mike deploy $tag

done

# deploy main or devel and set the latest stable

mike checkout main
mike deploy devel
mike set-default --push $(git describe --tags) --branch hosted
