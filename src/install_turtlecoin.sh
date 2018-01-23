#!/usr/bin/env bash

klog() {
  echo "$@"
  logger -p user.notice -t $SCRIPT_NAME "$@"
}

kerr() {
  echo "$@" >&2
  logger -p user.error -t $SCRIPT_NAME "$@"
}

TURTLECOIN_DIST_VERSION=0.2.2
TURTLECOIN_DIST_URL="https://github.com/turtlecoin/turtlecoin/releases/download/v${TURTLECOIN_DIST_VERSION}/TurtleCoin-v${TURTLECOIN_DIST_VERSION}-linux.tar.gz"

klog "Starting installation of TurtleCoin binaries"

dist_file=`echo "$TURTLECOIN_DIST_URL" | sed 's/.*\///'`
klog "Downloading [$TURTLECOIN_DIST_URL] to [$dist_file]"
curl -L --silent --output ${dist_file} $TURTLECOIN_DIST_URL #>/dev/null 2>&1 

klog "Unpacking [$dist_file]"
if [ $(file ${dist_file} | cut -d ' ' -f 2) = 'Zip' ]; then 
  unzip -q -o ${dist_file};  
elif [ $(file ${dist_file} | cut -d ' ' -f 2) = 'gzip' ]; then 
  tar xzf ${dist_file}
else
  kerr >&2 "Could not process [${dist_file}]. Aborting."
  exit 1;
fi;
rm -f "$dist_file"
klog "Installation completed!"
