#!/bin/bash
# Jamf EA – Password age in days
# Karthikeyan Marappan
#

# Get the current user
currentUser=$(/usr/bin/stat -f%Su /dev/console)

# Get the password last set timestamp
pwTimestamp=$(/usr/bin/dscl . -read /Users/"$currentUser" | \
  /usr/bin/awk -F'real>|</real' '/passwordLastSetTime/ {getline; print $2}' | \
  /usr/bin/awk -F. '{print $1}')

# Calculate password age in days
if [[ -n "$pwTimestamp" ]]; then
  now=$(/bin/date +%s)
  ageDays=$(( (now - pwTimestamp) / 86400 ))
else
  ageDays="NA"
fi

echo "<result>${ageDays}</result>"