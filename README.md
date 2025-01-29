# backupyourstaff
# BackupUserDataToUSB

## Overview
**BackupUserDataToUSB** is a simple, one-click solution to automatically back up user files from a Windows computer to a USB drive. This script detects any connected USB storage device and copies essential user folders, ensuring that important documents are safely stored.

## Features
- **One-click execution** – Simply run the script, and it handles everything automatically.
- **Automatic USB detection** – No need to specify a drive letter; the script finds all connected USB drives.
- **Backs up essential user folders**:
  - Documents
  - Downloads
  - Music
  - Pictures
  - Videos
- **Creates time-stamped backups** – Each backup is stored in a uniquely named folder (`Backup_YYYYMMDD_HHMMSS`) to prevent overwriting previous backups.
- **Works for all user profiles** – Supports multiple users on the same computer.
- **Silent execution** – Runs in the background without unnecessary pop-ups.

## How It Works
1. Plug in a USB drive.
2. Run `backup.bat` (with administrator privileges if prompted).
3. The script will:
   - Detect the connected USB drive(s).
   - Create a `Backups` folder on the USB drive.
   - Create a timestamped folder inside `Backups`.
   - Copy user data from `C:\Users\[Profile]` to the USB backup folder.
4. When the process is complete, a message will confirm the backup.

## Files Included
- **`BackupUserDataToUSB.ps1`** – PowerShell script that performs the backup operation.
- **`backup.bat`** – Batch script that runs the PowerShell script with one click.

## Requirements
- Windows 10 or later
- A connected USB storage device
- Administrator privileges (if prompted)

## Usage
1. Download and extract the files to a folder of your choice.
2. Plug in a USB drive.
3. **Run `backup.bat` as Administrator** (Right-click > Run as Administrator).
4. Wait for the script to complete. Your files will be copied into `Backups\Backup_YYYYMMDD_HHMMSS` on the USB drive.
5. Safely eject the USB drive after completion.

## Notes
- The script will **only copy existing files** and will not delete or modify any files on your system.
- If no USB is detected, the script will notify you to plug one in.
- This is an **early-stage version** – more features and improvements will be added soon!

## Future Updates
- Support for scheduled automatic backups
- Cloud backup integration (OneDrive, Google Drive, etc.)
- Email notifications upon successful backup

## Disclaimer
This script is provided "as is" without warranty of any kind. Use at your own risk. Always verify your backups to ensure data integrity.

---
🚀 **Enjoy effortless backups with BackupUserDataToUSB!** 🚀



