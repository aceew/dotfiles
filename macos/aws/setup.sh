#!/bin/bash

AWS_SHARED_CREDENTIALS_FOLDER=~/.secrets/.aws/
AWS_SHARED_CREDENTIALS_FILE="${AWS_SHARED_CREDENTIALS_FOLDER}credentials"

mkdir -p ~/.aws

if [ ! -d $AWS_SHARED_CREDENTIALS_FOLDER ]; then
  echo "You will need to set up your AWS credentials file at: $AWS_SHARED_CREDENTIALS_FILE"
  mkdir -p "$AWS_SHARED_CREDENTIALS_FOLDER"
  touch $AWS_SHARED_CREDENTIALS_FILE
  ln -s "$AWS_SHARED_CREDENTIALS_FILE" ~/.aws/credentials
  ln -s ./config ~/.aws/config
fi