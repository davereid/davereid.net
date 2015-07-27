#!/bin/bash
rm -rf output_prod/*
sculpin generate --env=prod || ( echo "Could not generate the site" && exit )
s3cmd --config="$(readlink -f ~/.s3cfg)" --force --recursive --delete-removed --bucket-location=us-east-1 --progress --acl-public sync output_prod/ s3://davereid.net
