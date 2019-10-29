#!/bin/bash
# download util from here brew tap fullscreen/tap
set -euo pipefail

# rotate aws IAM keys
# remember to define the full path to your $AWS_SHARED_CREDENTIALS_FILE

profiles=$(grep "^\[" $AWS_SHARED_CREDENTIALS_FILE |sort -u | xargs | tr '\[' ' ' | tr '\]' ' ')

echo "started key rotation `date`"

for profile in $profiles; do
	echo "Rotating IAM key for ${profile}"
	aws-rotate-key --profile "$profile" -y >>/var/log/rotate-iam-keys.log
done

echo "finished key rotation $(date)"
