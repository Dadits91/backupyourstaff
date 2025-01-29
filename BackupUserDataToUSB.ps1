# Get all removable drives (USB)
$usbDrives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 }

# Check if any USB drive is found
if ($usbDrives) {
    foreach ($usbDrive in $usbDrives) {
        $usbDriveLetter = $usbDrive.DeviceID + "\"  # Example: "E:\"

        # Define the main backup folder (Backups)
        $mainBackupFolder = Join-Path -Path $usbDriveLetter -ChildPath "Backups"

        # Create the folder if it doesn't exist
        if (-not (Test-Path $mainBackupFolder)) {
            New-Item -Path $mainBackupFolder -ItemType Directory -Force
        }

        # Create a timestamp for each backup folder
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        
        # Define backup folder inside Backups
        $backupFolder = Join-Path -Path $mainBackupFolder -ChildPath "Backup_$timestamp"

        # Create the backup folder
        New-Item -Path $backupFolder -ItemType Directory -Force

        # Explicitly set full permissions on the backup folder
        $acl = Get-Acl $backupFolder
        $permission = "Everyone","FullControl","Allow"
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
        $acl.SetAccessRule($accessRule)
        Set-Acl $backupFolder $acl

        # Define the source path for user profiles
        $sourceUsers = "C:\Users"

        # Get all user profiles (excluding "Default" and "Public" folders)
        $userProfiles = Get-ChildItem -Path $sourceUsers | Where-Object { $_.Name -ne "Default" -and $_.Name -ne "Public" }

        # Loop through each user profile
        foreach ($profile in $userProfiles) {
            # Define paths for the common folders in each profile (excluding Desktop)
            $folders = @("Documents", "Downloads", "Music", "Pictures", "Videos")
            
            # Loop through each folder and back it up if it exists
            foreach ($folder in $folders) {
                $sourceFolder = Join-Path -Path $profile.FullName -ChildPath $folder
                
                # Backup if the folder exists
                if (Test-Path $sourceFolder) {
                    Copy-Item -Path $sourceFolder -Destination $backupFolder -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }

        Write-Host "Backup completed to USB ($usbDriveLetter) at $timestamp"
    }
} else {
    Write-Host "No USB drive detected. Please connect a USB and try again."
}
