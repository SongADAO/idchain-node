#!/bin/sh

set -e

if [ "${1}" = 'idchain' ]; then
    # Default startup mode

    # Need to init node?
    if [ ! -f /idchain/initialized ]; then
        # initialize idchain
        echo "Initializing IDChain for first startup"
        geth --datadir /idchain init idchain-genesis.json
        touch /idchain/initialized
    fi

    echo "geth config vars:"
    echo "  SYNCMODE: ${SYNCMODE}"
    echo "  EXTRA_OPTS: ${EXTRA_OPTS}"
    exec geth --datadir /idchain --networkid 74 --port 30329 --http --http.addr 0.0.0.0 --http.corsdomain "*" --http.vhosts "*" --ws --ws.addr 0.0.0.0 --ws.origins "*" --nousb --syncmode "${SYNCMODE}" ${EXTRA_OPTS}
    # exec echo "done!"
fi

# user provided custom args to container. Just execute whatever was provided
exec "${@}"
