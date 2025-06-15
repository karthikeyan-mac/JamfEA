#!/bin/zsh
# Jamf EA – Location Services status
#  Karthikeyan

# Read the Location Services status (returns 1 if enabled, 0 if disabled)
location_status=$(/usr/bin/defaults read /var/db/locationd/Library/Preferences/ByHost/com.apple.locationd LocationServicesEnabled 2>/dev/null)

# Report result as "Enabled" or "Disabled"
if [[ "$location_status" == "1" ]]; then
  result="Enabled"
else
  result="Disabled"
fi

echo "<result>$result</result>"