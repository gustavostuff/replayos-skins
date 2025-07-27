#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/gustavostuff/replayos-skins/refs/heads/main/skins"

# Check if folder name is provided
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide folder name as an argument."
    echo "Usage: ./install_skin.sh <folder_name>"
    exit 1
fi

FOLDER_NAME=$1
DEST_DIR="/opt/replay/images"

# Slot number
read -p "Please enter slot number (1-7): " SLOT_NUMBER
if ! [[ "$SLOT_NUMBER" =~ ^[1-7]$ ]]; then
    echo "Error: Slot number must be between 1 and 7."
    exit 1
fi

FINAL_SLOT=$((SLOT_NUMBER + 10))

echo "Now installing skin $FOLDER_NAME to slot $SLOT_NUMBER (files will be renamed with suffix $FINAL_SLOT):"

# Download and rename each file directly to DEST_DIR
for FILE in info.png menu.png selector.png; do
    URL="${BASE_URL}/${FOLDER_NAME}/${FILE}"
    NEW_NAME="${FILE%.png}_$FINAL_SLOT.png"
    wget -O "$DEST_DIR/$NEW_NAME" "$URL" 2>/dev/null || echo "Warning: Failed to download $FILE"
done

echo "Skin $FOLDER_NAME successfully installed in slot $SLOT_NUMBER (saved as *_$FINAL_SLOT.png)."
