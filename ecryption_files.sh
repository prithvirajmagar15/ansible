#!/bin/bash

# Define file names
SENSITIVE_FILE="sensitive.txt"
ENCRYPTED_FILE="sensitive.txt.gpg"
DECRYPTED_FILE="decrypted.txt"

# Create a sample sensitive file
echo "Creating a sensitive file..."
cat <<EOL > $SENSITIVE_FILE
This is some sensitive information. Please keep it confidential.
Account Number: 123456789
Password: super_secret_password
EOL

echo "Sensitive file created: $SENSITIVE_FILE"

# Encrypt the sensitive file
echo "Encrypting the file..."
gpg --symmetric --cipher-algo AES256 -o $ENCRYPTED_FILE $SENSITIVE_FILE

# Check if encryption was successful
if [ $? -eq 0 ]; then
    echo "File encrypted successfully: $ENCRYPTED_FILE"
else
    echo "Encryption failed."
    exit 1
fi

# Decrypt the file
echo "Decrypting the file..."
gpg -o $DECRYPTED_FILE -d $ENCRYPTED_FILE

# Check if decryption was successful
if [ $? -eq 0 ]; then
    echo "File decrypted successfully: $DECRYPTED_FILE"
    echo "Contents of the decrypted file:"
    cat $DECRYPTED_FILE
else
    echo "Decryption failed."
    exit 1
fi

# Cleanup: Remove sensitive files
echo "Cleaning up sensitive files..."
rm -f $SENSITIVE_FILE $ENCRYPTED_FILE $DECRYPTED_FILE

echo "Cleanup complete."
