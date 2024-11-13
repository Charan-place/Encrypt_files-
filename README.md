# Directory Encryption Script

## Overview

This script encrypts all files within a specified directory using AES-256 encryption with a user-provided password. Each file is encrypted with a unique initialization vector (IV) and a salt, ensuring strong security for sensitive information. This batch file can be useful for securing sensitive directories before transferring, backing up, or storing files.

## How It Works

- **AES-256 Encryption:** The script uses PowerShell to handle encryption with AES-256, generating a unique salt and IV for each file to ensure strong encryption.
- **Password Protection:** Users set a password that will be used to derive the encryption key.
- **Automated Processing:** The script recursively processes each file in the specified directory.

## Prerequisites

- **Windows PowerShell**
- **Windows OS** with support for batch files

## Usage Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Charan-place/YourRepoName.git
2. **Run the Script**:

-  **Open the cloned folder**, then double-click on the batch file (`YourBatchFileName.bat`).
-  **Provide the directory path** you wish to encrypt when prompted.
-  **Set a password** for the encryption.

3. **Encryption Process**:

- The script will iterate over each file within the specified directory and apply AES-256 encryption.
- The encrypted files are stored in a secure format, including a unique salt and IV prepended to the encrypted content.

4. **Completion**:

- Once all files are encrypted, you’ll see a confirmation message indicating the encryption is complete.

## Example

```plaintext
Enter the directory path to encrypt: C:\Users\YourUsername\Documents\SensitiveData
Enter a password for encryption: ********
Encrypting: C:\Users\YourUsername\Documents\SensitiveData\File1.txt
Encrypting: C:\Users\YourUsername\Documents\SensitiveData\File2.txt
...
Encryption completed!


## Security Notes

- **Password Storage**: The password is not stored by the script; however, ensure you remember it, as it’s required for decryption.
- **One-Way Process**: This script only encrypts files. A separate script is required to decrypt the files using the same password.
- **Backup Important Data**: Always keep a backup of your files before encrypting to avoid accidental data loss.

## Disclaimer

This script is provided "as-is" without warranty of any kind. Ensure you understand encryption basics before use, as data recovery will be challenging without the correct password.

## License

This project is licensed under the MIT License.

## Contributions

Contributions are welcome! Feel free to fork the repository, submit issues, or propose enhancements.
