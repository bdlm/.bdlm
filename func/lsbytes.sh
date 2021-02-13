#!/usr/bin/env bash

#
# Get the size of the files in this dir
#
lsbytes() {
	echo -n $(ls -l | awk '/^-/{total += $5} END{printf "%.2f", total/1048576}')
}
