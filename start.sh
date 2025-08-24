#!/bin/bash

if [ "$AUTOSTART" = "true" ]; then
    ./iventoy.sh -R start
else
  ./iventoy.sh start
fi

version=$(cat /iventoy/version)
echo "Starting iVentoy v.${version}..."
tail -f /iventoy/log/log.txt