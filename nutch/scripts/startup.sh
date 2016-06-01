#!/bin/bash

# Copy required config
cp /tmp/config/gora.properties $NUTCH_HOME/runtime/local/conf/gora.properties
cp /tmp/config/regex-urlfilter.txt $NUTCH_HOME/runtime/local/conf/regex-urlfilter.txt

# Start nutch webserver for controlling with REST API
$NUTCH_HOME/runtime/local/bin/nutch nutchserver > /dev/null &
# Start nutch web gui
$NUTCH_HOME/runtime/local/bin/nutch webapp
