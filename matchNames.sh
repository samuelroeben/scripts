#!/bin/bash

# Specify the source folder (current directory where the script is executed)
source_folder="."

# Iterate through the files in the source folder
for file in "$source_folder"/*; do
    # Check if it's a file (not a directory)
    if [ -f "$file" ]; then
        # Get the file name without the path and extension
        file_name_without_extension=$(basename "$file" | cut -f 1 -d '.')
        
        # Check if a directory with the same name exists
        if [ -d "$file_name_without_extension" ]; then
            # Move the file into the corresponding folder
            mv "$file" "$file_name_without_extension/"
            echo "Moved $file to ./$file_name_without_extension/"
        else
            echo "No corresponding folder found for $file_name_without_extension. Skipping."
        fi
    fi
done
