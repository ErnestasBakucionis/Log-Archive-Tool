# Log Archive Tool
**Project Page URL: https://roadmap.sh/projects/log-archive-tool**
## Overview
The Log Archive Tool is a Bash script designed to compress log files from a specified directory into a `.tar.gz` archive. It logs the archive operations with the date and time for tracking purposes. This tool is useful for maintaining a clean and organized log storage system.

## Features
- Compresses logs from a specified directory into a `.tar.gz` archive.
- Allows customization of the archive directory and log file path.
- Logs the date and time of each archive operation.
- Automatically creates the archive directory if it doesn't exist.

## Requirements
- A Unix/Linux system with the following utilities:
  - `bash`
  - `tar`
  - `mkdir`
  - `date`
  - `echo`
- Ensure the script has execution permissions:
  ```bash
  chmod +x log_archive_tool.sh
  ```

## Usage
```bash
./log_archive_tool.sh <log-directory> [--archive-dir <archive-directory>] [--log-file <log-file>]
```

### Arguments
- `<log-directory>`: The directory containing logs to be archived (required).
- `--archive-dir <archive-directory>`: (Optional) The directory where the archive will be saved. Default: `./archives`
- `--log-file <log-file>`: (Optional) Path to the log file where archive operations are logged. Default: `./archive.log`

### Examples
1. Basic usage:
   ```bash
   ./log_archive_tool.sh /var/log
   ```
   This archives logs from `/var/log` into the `./archives` directory and logs the operation in `./archive.log`.

2. Specify a custom archive directory:
   ```bash
   ./log_archive_tool.sh /var/log --archive-dir /backups
   ```
   This saves the archive to `/backups` and logs the operation in `./archive.log`.

3. Specify a custom log file:
   ```bash
   ./log_archive_tool.sh /var/log --log-file /backups/operations.log
   ```
   This logs the operation details in `/backups/operations.log`.

## How It Works
1. The script validates the provided log directory.
2. If the archive directory does not exist, it creates one.
3. The script generates a timestamp-based archive name (e.g., `logs_archive_20240816_100648.tar.gz`).
4. It compresses the specified log directory into the archive directory using `tar`.
5. The operation is logged to a log file with a timestamp.

## Sample Output
```bash
Logs archived successfully: ./archives/logs_archive_20240816_100648.tar.gz
```

Log file entry:
```text
[2024-08-16 10:06:48] Archived logs to: ./archives/logs_archive_20240816_100648.tar.gz
```

## Troubleshooting
- **Log directory does not exist**:
  Ensure the provided log directory exists and is accessible.
  ```bash
  Error: Log directory does not exist: /invalid/path
  ```
- **Permission denied**:
  Ensure the script has execution permissions and necessary file access rights.
  ```bash
  chmod +x log_archive_tool.sh
  ```
