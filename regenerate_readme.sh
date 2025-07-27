#!/bin/bash

OUTPUT_FILE="README.md"
SKINS_DIR="skins"
SCRIPT_URL="https://raw.githubusercontent.com/gustavostuff/replayos-skins/refs/heads/main/install_skin.sh"
RAW_IMAGE_BASE="https://github.com/gustavostuff/replayos-skins/blob/main/skins"

# Start fresh README content
cat > "$OUTPUT_FILE" <<EOF
## ReplayOS skins

A collection of ReplayOS skins with installer scripts

:warning: In order to install a skin, You first need to login to ReplayOS [via SSH](https://www.replayos.com/wifi/).

---
EOF

# Loop through each subfolder inside skins/
for SKIN_FOLDER in "$SKINS_DIR"/*/; do
    FOLDER_NAME=$(basename "$SKIN_FOLDER")

    cat >> "$OUTPUT_FILE" <<EOF

### $FOLDER_NAME

![]($RAW_IMAGE_BASE/$FOLDER_NAME/menu.png?raw=true)

Installation script:
\`\`\`bash
curl -sL $SCRIPT_URL -o install_skin.sh && bash install_skin.sh $FOLDER_NAME
\`\`\`

---
EOF
done

echo "README.md generated with $(ls -1 "$SKINS_DIR" | wc -l) skin entries."
