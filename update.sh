#!/bin/bash
# ---------------------------------------------------
# Script Name: update.sh
# Description: Automates system updates and cleanup
# ---------------------------------------------------

echo "🔄 Updating and upgrading system..."
sudo apt update -y && sudo apt upgrade -y

echo "🧹 Cleaning up unnecessary packages..."
sudo apt autoremove -y && sudo apt clean

if [ $? -eq 0 ]; then
    echo "✅ System update and cleanup completed!"
else
    echo "❌ Update failed! Check network connection or permissions."
fi
