#!/bin/bash
shopt -s nullglob

# Attempts to convert all inside INPUT_DIR, expecting structure "location/date/*.jpeg"
DIRS=("$INPUT_DIR"/*)
for location in "${DIRS[@]}"
do
	if [ -d $location ]
	then
		LOC=`basename "$location"`
		DATES=("$location"/*)
		for location_date in "${DATES[@]}"
		do
			if [ -d $location_date ]
			then
				DATE=`basename "$location_date"`
				DEST_DIR="$OUTPUT_DIR"/"$LOC"

				echo "=== Attempting to digest $location_date into $DEST_DIR ==="
				mkdir "$DEST_DIR"
				cd "$location_date"
				ffmpeg -y -framerate 24 -pattern_type glob -i '*.jpeg' -s hd1080 -vcodec libx264 -crf 18 -preset slow "$DEST_DIR"/"$DATE.mkv"
				cd ..
			fi
		done
	fi
done