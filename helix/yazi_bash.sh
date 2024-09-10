#!/bin/bash

# Use yazi to choose a file and store the result in the 'files' variable
files=$(yazi --chooser-file=/dev/stdout | cat)

# Toggle floating panes in zellij
zellij action toggle-floating-panes

# Send escape key to zellij
zellij action write 27

# Send command to open the selected file
zellij action write-chars ":open $files"

# Send enter key to zellij
zellij action write 13

# Toggle floating panes in zellij again
zellij action toggle-floating-panes

# Close the current pane in zellij
zellij action close-pane
