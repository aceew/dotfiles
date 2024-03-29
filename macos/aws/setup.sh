#!/bin/bash

AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials

mkdir -p ~/.aws

if [ ! -d $AWS_SHARED_CREDENTIALS_FOLDER ]; then
  echo "You will need to set up your AWS credentials file at: $AWS_SHARED_CREDENTIALS_FILE"
  mkdir -p "$AWS_SHARED_CREDENTIALS_FOLDER"
  touch $AWS_SHARED_CREDENTIALS_FILE
  cp "${PWD}/config" ~/.aws/config
fi