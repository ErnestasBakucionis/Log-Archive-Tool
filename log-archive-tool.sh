#!/bin/bash

# Log Archive Tool
# This script compresses logs from a specified directory into a tar.gz archive
# and logs the operation with the date and time.

# Function to display usage
usage() {
    echo "Usage: $0 <log-directory> [--archive-dir <archive-directory>] [--log-file <log-file>]"
    exit 1
}

# Default values
ARCHIVE_DIR="./archives"
LOG_FILE="./archive.log"

# Parse arguments
if [ "$#" -lt 1 ]; then
    usage
fi

LOG_DIR="$1"
shift

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --archive-dir)
            ARCHIVE_DIR="$2"
            shift 2
            ;;
        --log-file)
            LOG_FILE="$2"
            shift 2
            ;;
        *)
            usage
            ;;
    esac
done

# Ensure log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Log directory does not exist: $LOG_DIR"
    exit 1
fi

# Create archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Generate timestamp and archive name
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

# Compress logs
if tar -czf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"; then
    echo "Logs archived successfully: $ARCHIVE_PATH"
else
    echo "Error: Failed to archive logs"
    exit 1
fi

# Log the operation
TIMESTAMP_LOG=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$TIMESTAMP_LOG] Archived logs to: $ARCHIVE_PATH" >> "$LOG_FILE"
