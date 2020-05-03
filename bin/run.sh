#!/bin/bash

for i in /in/*
do
	if [ -d $i ]
	then
		cd "$i"
		ffmpeg -y -vaapi_device /dev/dri/renderD128 -framerate 24 -pattern_type glob -i '*.png' -s:v 1920x1080 -vf 'format=nv12,hwupload' -c:v h264_vaapi "/out/$i.mkv"
		cd ..
	fi
done