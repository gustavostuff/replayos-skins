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
read -p "Please enter slot number (11-17): " SLOT_NUMBER
if ! [[ "$SLOT_NUMBER" =~ ^[0-1][1-7]$ ]]; then
    echo "Error: Slot number must be between 11 and 17."
    exit 1
fi

echo "Now installing skin $FOLDER_NAME:"

# Download and rename each file directly to DEST_DIR
for FILE in info.png menu.png selector.png; do
    URL="${BASE_URL}/${FOLDER_NAME}/${FILE}"
    NEW_NAME="${FILE%.png}_$SLOT_NUMBER.png"
    # echo "Downloading and renaming $FILE to $NEW_NAME..."
    wget -O "$DEST_DIR/$NEW_NAME" "$URL" 2>/dev/null || echo "Warning: Failed to download $FILE"
done

echo "Skin $FOLDER_NAME successfully installed in slot $SLOT_NUMBER."
