#!/bin/bash

# Set the idle time in milliseconds (e.g., 10 minutes)
IDLE_TIME=$((3*60*1000))

while true; do
    # Get the current idle time
    IDLE=$(xprintidle)

    # Check if the idle time exceeds the threshold
    if [ "$IDLE" -ge "$IDLE_TIME" ]; then
        # Trigger the sleep state
        echo "System has been idle for $((IDLE_TIME/1000/60)) minutes. Going to sleep..."
        sudo pm-suspend
        # Alternatively, you can use:
        # sudo systemctl suspend
    fi

    # Wait for a while before checking again
    sleep 60
done
