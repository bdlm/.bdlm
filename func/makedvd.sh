#!/usr/bin/env bash

#
# Create an ISO from a vido_ts folder
# The video_ts folder must be INSIDE of the specified directory
#
makedvd() {
	DIR=$1
	NAME=$(basename "${DIR}")
	echo "hdiutil makehybrid -udf -udf-volume-name \"${NAME}\" -o \"${NAME}.iso\" \"${DIR}\""
	hdiutil makehybrid -udf -udf-volume-name "${NAME}" -o "${NAME}.iso" "${DIR}"
}
