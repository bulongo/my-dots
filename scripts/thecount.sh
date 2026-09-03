#!/bin/bash

## THE COUNT

# echo "WELCOME, I AM COUNT DOWNER"
# echo "BUT YOU SIMPLY REFER TO ME AS... THE COUNT."

# sleep 3

TARGET_TIME=$(date -d "September 10 2026 13:00" +%s)

while ((DIFFERENCE >= 0)) ; do
  CURRENT_TIME=$(date +%s)
  # $() tells the shell to run the command.
  DIFFERENCE=$((TARGET_TIME-CURRENT_TIME))

  # echo $DIFFERENCE

  HOURS=$((DIFFERENCE/(60 * 60)))
  DAYS=$((HOURS/24))

  HOURS_REMAINING=$((HOURS%24))

  MINUTES=$((DIFFERENCE/60))
  MINUTES_REMAINING=$((MINUTES%60))

  SECONDS_REMAINING=$((DIFFERENCE%60))
  # HOURS=$(($DIFFERENCE/(60 * 60)))
  # MINUTES=$(($DIFFERENCE/60))

 
  echo "$DAYS days $HOURS_REMAINING hours $MINUTES_REMAINING minutes $SECONDS_REMAINING seconds to go"
  sleep 1
  clear
done


# echo TIMES UP !!

