#!/bin/bash
read -rsp "Enter passphrase: " PASSPHRASE

for file_name in ./*.pdf; do
  echo "decrypt $file_name"

  qpdf \
    --decrypt \
    --remove-restrictions \
    --password="$PASSPHRASE1" \
    --replace-input $file_name \

  echo "Done! Output: $file_name"
done
