#!/bin/bash
# Extension Attribute (EA)  to inventory software update deferral settings on macOS
# Karthikeyan M
#
#
# Function to retrieve values from macOS preferences
get_pref() {
    osascript -l JavaScript << EOS
    ObjC.import('Foundation')
    ObjC.unwrap($.NSUserDefaults.alloc.initWithSuiteName('com.apple.applicationaccess').objectForKey('$1'))
EOS
}

echo "<result>"

# Retrieve deferral settings
forceDelayedMajorSoftwareUpdates=$(get_pref "forceDelayedMajorSoftwareUpdates")
forceDelayedMinorSoftwareUpdates=$(get_pref "forceDelayedSoftwareUpdates")
forceDelayedAppSoftwareUpdates=$(get_pref "forceDelayedAppSoftwareUpdates")

# Check if no deferrals are applied
if [[ "$forceDelayedMajorSoftwareUpdates" != "true" && "$forceDelayedMinorSoftwareUpdates" != "true" && "$forceDelayedAppSoftwareUpdates" != "true" ]]; then
    echo "No Update Deferrals"
else
    # Print deferral settings only if they exist
    echo "DelayMajorUpdate: $forceDelayedMajorSoftwareUpdates"
    if [[ "$forceDelayedMajorSoftwareUpdates" == "true" ]]; then
        majorOSDeferralDelay=$(get_pref "enforcedSoftwareUpdateMajorOSDeferredInstallDelay")
        echo "DelayMajorUpdateDays: $majorOSDeferralDelay"
    fi

    echo "DelayMinorUpdate: $forceDelayedMinorSoftwareUpdates"
    if [[ "$forceDelayedMinorSoftwareUpdates" == "true" ]]; then
        minorOSDeferralDelay=$(get_pref "enforcedSoftwareUpdateMinorOSDeferredInstallDelay")
        echo "DelayMinorUpdateDays: $minorOSDeferralDelay"
    fi

    echo "DelayNonOSUpdate: $forceDelayedAppSoftwareUpdates"
    if [[ "$forceDelayedAppSoftwareUpdates" == "true" ]]; then
        appOSDeferralDelay=$(get_pref "enforcedSoftwareUpdateNonOSDeferredInstallDelay")
        echo "DelayNonOSUpdateDays: $appOSDeferralDelay"
    fi
fi

echo "</result>"