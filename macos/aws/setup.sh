#!/bin/bash

AWS_SHARED_CREDENTIALS_FILE=~/.secrets/.aws/credentials

if [ ! -d "$AWS_SHARED_CREDENTIALS_FILE" ]; then
  echo "You will need to set up your AWS credentials file at: $AWS_SHARED_CREDENTIALS_FILE"
  mkdir -p "$AWS_SHARED_CREDENTIALS_FILE"
  ln -s "$AWS_SHARED_CREDENTIALS_FILE" ~/.aws/credentials
  ln -s ./config ~/.aws/config
fi
