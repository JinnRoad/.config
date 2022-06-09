$Global:usb = (Get-WmiObject -Class Win32_LogicalDisk | where DriveType -eq 2).DeviceID
