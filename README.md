# backupyourstaff
# USB Backup Script - Early Stage Version

## Overview
This PowerShell script automates the backup of user profile folders (Documents, Downloads, Music, Pictures, and Desktop) from all user accounts on a Windows system to a connected USB drive. Each backup is stored in a time-stamped folder to ensure multiple versions can be maintained.

## Features
- Automatically detects and backs up user profile directories.
- Creates a dedicated "Backups" folder on the USB drive.
- Generates a unique timestamped folder for each backup session.
- Ensures file permissions are correctly set for backup accessibility.
- Checks if the USB drive is connected before initiating the backup process.

## Prerequisites
- A Windows system with PowerShell enabled.
- A USB drive with sufficient storage space (ensure the correct drive letter is set in the script).
- Administrator privileges may be required for accessing all user profiles.

## Usage Instructions
1. Connect a USB drive to the system.
2. Update the script with the correct drive letter if necessary (`$usbDriveLetter` variable).
3. Run the script using PowerShell with administrative privileges.
4. The script will create a backup folder named `Backup_YYYYMMDD_HHmmss` under `Backups` on the USB drive.
5. It will iterate through all user profiles and copy the Documents, Downloads, Music, Pictures, and Desktop folders.
6. Once completed, a confirmation message will be displayed.

## Troubleshooting
- **USB Drive Not Found**: Ensure the correct drive letter is assigned and update the script accordingly.
- **Permission Issues**: Run the script as an administrator to access all user profile folders.
- **Slow Backup Speed**: Large files or slow USB drives may cause delays. Consider using a high-speed USB device.

## Future Enhancements
This is an early-stage script, and more features will be added in future versions, including:
- Incremental backup to avoid redundant copies.
- Email notifications upon successful backups.
- Improved error handling and logging.
- Option to specify custom folders for backup.

## Disclaimer
This script is provided as-is with no guarantees. Use at your own risk and ensure proper testing before deploying in production environments.

---
For feedback or suggestions, feel free to reach out!

