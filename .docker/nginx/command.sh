#!/bin/bash

chmod +x /scripts/*.sh

/scripts/wait-for-it.sh workspace:9000 --timeout=30

nginx;
