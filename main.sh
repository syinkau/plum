#!/bin/bash

# Infinite loop to restart run.sh if it stops
while true; do
  echo "Starting run.sh..."
  ./run.sh
  ./x.sh

  # Log exit status
  EXIT_CODE=$?
  echo "run.sh exited with code $EXIT_CODE. Restarting in 5 seconds..."
  sleep 5
done
