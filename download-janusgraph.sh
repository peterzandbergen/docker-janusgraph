#!/bin/bash
if ! [[ -f tmp/janusgraph.zip ]]; then
    curl --location --output tmp/janusgraph.zip https://github.com/JanusGraph/janusgraph/releases/download/v0.3.0/janusgraph-0.3.0-hadoop2.zip
fi

if ! [[ -d docker/tmp/janusgraph-0.3.0-hadoop2 ]] ; then
    unzip tmp/janusgraph.zip -d docker/tmp
fi

