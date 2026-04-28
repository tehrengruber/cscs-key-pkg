#!/bin/bash
set -e

KEY_NAME="cscs-key Package Signing Key"
KEY_EMAIL="till.ehrengruber@cscs.ch"

# Generate key
gpg --batch --gen-key <<EOF
%no-protection
Key-Type: EDDSA
Key-Curve: ed25519
Subkey-Type: ECDH
Subkey-Curve: cv25519
Name-Real: $KEY_NAME
Name-Email: $KEY_EMAIL
Expire-Date: 0
%commit
EOF

# Get the key ID
KEY_ID=$(gpg --list-keys --with-colons "$KEY_EMAIL" | awk -F: '/^pub/{print $5}' | tail -1)

echo "Key ID: $KEY_ID" >&2
echo "" >&2
echo "Add the following as GitHub secret GPG_PRIVATE_KEY:" >&2
echo "" >&2

gpg --export-secret-keys --armor "$KEY_ID"