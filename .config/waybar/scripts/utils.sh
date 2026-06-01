#!/usr/bin/bash

run_command() {
    # Runs command in a separate terminal
    # Params:
    #   command (str): Commands to run
    # Returns:
    #   void
    local command="$1"
    kitty sh -c "
printf \"[INFO] Starting process...\n\"
$command
printf \"\n[INFO] Process finished.\n\"
read -n 1 -s -r -p \"[INFO] Press any key to close window \"
"
}
