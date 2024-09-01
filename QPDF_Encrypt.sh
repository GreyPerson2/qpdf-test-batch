#!/bin/bash
read -rsp "Enter passphrase: " PASSPHRASE1
echo
read -rsp "Enter passphrase: " PASSPHRASE2
echo

for file_name in ./*.pdf; do
  echo "Encrypting $file_name"

  qpdf \
    --encrypt \
    --user-password="$PASSPHRASE1" \
    --owner-password="$PASSPHRASE2" \
    --bits=256 -- \
    --replace-input $file_name \

  echo "Done! Output: $file_name"
done
