#!/bin/bash

function status {
	oneg="$(onegate service show | grep undefined)"
	if [ -z "$oneg" ]; then
		feature=$1
		status="${2// /_}"
		onegate vm update $VMID --data "$feature"_STATUS="$status"
	else
		echo "Onegate is not configured"
	fi
}

function info {
	one="$(onegate service show | grep undefined)"
	if [ -z "$one" ]; then
		feature=$1
		note="${2// /_}"
		info=$3
		onegate vm update $VMID --data "$feature"_"$info"="$note"
	else
		echo "Onegate is not configured"
	fi
}
