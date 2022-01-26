#!/bin/bash

pushd media_build;
    git remote update
    git pull
popd

pushd media;
    git remote update
    git pull
popd
