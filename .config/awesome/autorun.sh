#!/usr/bin/env bash

function run {
	if ! "pgrep -f $1" ;
	then
		$"@"&
	fi
}

# Emacs daemon
run emacs --daemon

# For desktop fx
run compton &
