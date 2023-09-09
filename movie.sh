#!/bin/bash

# Function to duplicate the subdirectory structure for a file, move the file, and delete the source folder
move_and_duplicate_structure() {
  local source_file="$1"
  local destination_dir="$2"
  local source_dir=$(dirname "$source_file")

  # Extract the subdirectory structure
  subdirs=$(dirname "$source_file")

  # Create the same subdirectory structure in the destination directory
  mkdir -p "$destination_dir/$subdirs"

  # Move the file to the duplicated structure
  mv "$source_file" "$destination_dir/$source_file"

  # Delete the source directory (if it's empty)
  rmdir "$source_dir" 2> /dev/null
}

# Loop through all subdirectories
for dir in */; do
  # Check if there are any .mkv or .mp4 files in the directory
  if ls "$dir"/*.mkv 1> /dev/null 2>&1 || ls "$dir"/*.mp4 1> /dev/null 2>&1; then
    # Loop through .mkv and .mp4 files in the directory
    for file in "$dir"/*.mkv "$dir"/*.mp4; do
      if [ -f "$file" ]; then
        # Get the file extension
        extension="${file##*.}"
        
        # Duplicate the subdirectory structure for the file, move the file, and delete the source folder
        move_and_duplicate_structure "$file" "$extension"
        
        echo "Moved, Duplicated, and Deleted Source Folder: $file -> $extension/$file"
      fi
    done
  fi
done
