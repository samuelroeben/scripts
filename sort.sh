#!/bin/bash

# loop through the files in the folder and move them into corresponding directories based on their extensions
for file in *.*; do
    echo "Processing file: $file"
    extension="${file##*.}"
    case "$extension" in
        DNG)
            echo "Moving $file to raw/"
            if [[ ! -d "raw" ]]; then
                mkdir -p raw
            fi
            mv "$file" raw/
            ;;
        MP4)
            echo "Moving $file to MP4/"
            if [[ ! -d "MP4" ]]; then
                mkdir -p MP4
            fi
            mv "$file" MP4/
            ;;
        WAV)
            echo "Moving $file to WAV/"
            if [[ ! -d "WAV" ]]; then
                mkdir -p WAV
            fi
            mv "$file" WAV/
            ;;
        JPG)
            echo "Moving $file to jpg/"
            if [[ ! -d "jpg" ]]; then
                mkdir -p jpg
            fi
            mv "$file" jpg/
            ;;
        LRV|THM)
            echo "DELTE $file"
            rm -f "$file"
            ;;
        *)
            ;;
    esac
done