#!/bin/bash
# download util from here brew tap fullscreen/tap
set -euo pipefail

# rotate aws IAM keys
# remember to define the full path to your $AWS_SHARED_CREDENTIALS_FILE

AWS_SHARED_CREDENTIALS_FILE=${AWS_SHARED_CREDENTIALS_FILE:-'~/.aws/credentials'}
profiles=$(grep "^\[" $AWS_SHARED_CREDENTIALS_FILE |sort -u | xargs | tr '\[' ' ' | tr '\]' ' ')

echo "started key rotation `date`"

for profile in $profiles; do
	echo "Rotating IAM key for ${profile}"
	aws-rotate-key --profile "$profile" -y
done

echo "finished key rotation $(date)"
