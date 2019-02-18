#!/bin/bash

# A rather unusual place to put the copyright notice, but I want it printed out
# whenever it's needed. This script is supposed to be a library after all... :-)
copyright_notice()
{
cat << EOF
#
# 	The Universal bash library.
#	(c) 2018 Frederic Pasteleurs <frederic@askarel.be>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
EOF
}

############### <RUNTIME VARS> ###############
ME="$(basename "$0" .sh)"
############### </RUNTIME VARS> ###############

############### <FUNCTIONS> ###############
# Function to call when we bail out
# Parameter 1: message for user
# Parameter 2 (optional): specific exit code. Use exit code 1 by default
# Output: text surrounded by program name and the word 'Exit'
# Function does not return to caller
die()
{
    echo "$ME: $1. Exit" >&2
    test -n "$2" && exit $2
    exit 1
}

# This will check that all binaries needed are available
# Parameter 1: program name to check for presence
# Parameter x: same as above
# Output: nothing if all specified binaries are present
# Function does not return to caller in case of missing program, 
# return to caller if all specified programs are present.
check_prerequisites()
{
    while test -n "$1"; do
	which "$1" > /dev/null || die "Command '$1' not found in path ($PATH)"
	shift
    done
}

############### </FUNCTIONS> ###############

############### <MAIN> ###############
test -z "$BASH_VERSION" && die 'Not running under a real bash shell'
test "$ME" = "libaskarel" && copyright_notice
############### </MAIN> ###############
