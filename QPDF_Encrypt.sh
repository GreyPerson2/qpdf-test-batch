#!/bin/bash
read -rsp "Enter user password: " PASSPHRASE1
echo
read -rsp "Enter owner password: " PASSPHRASE2
echo

for file_name in ./*.pdf; do
  echo "Encrypting $file_name"
#This setting will replace original file with the encrypted file.
  qpdf \
    --encrypt \
    --user-password="$PASSPHRASE1" \
    --owner-password="$PASSPHRASE2" \
    --bits=256 -- \
    --replace-input $file_name \

  echo "Done! Output: $file_name"
done
