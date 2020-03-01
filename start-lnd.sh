#!/usr/bin/env bash

# exit from script if error was raised.
set -e

declare -A cli_opts
cli_opts=( ["LNDDIR"]="--lnddir="
           ["CONFIGFILE"]="--configfile="
           ["DATADIR"]="--datadir="
           ["SYNCFREELIST"]="--sync-freelist"
           ["TLSCERTPATH"]="--tlscertpath="
           ["TLSKEYPATH"]="--tlskeypath="
           ["TLSEXTRAIP"]="--tlsextraip="
           ["TLSEXTRADOMAIN"]="--tlsextradomain="
           ["TLSAUTOREFRESH"]="--tlsautorefresh"
           ["NO_MACAROONS"]="--no-macaroons"
           ["ADMINMACAROONPATH"]="--adminmacaroonpath="
           ["READONLYMACAROONPATH"]="--readonlymacaroonpath="
           ["INVOICEMACAROONPATH"]="--invoicemacaroonpath="
           ["LOGDIR"]="--logdir="
           ["MAXLOGFILES"]="--maxlogfiles="
           ["MAXLOGFILESIZE"]="--maxlogfilesize="
           ["RPCLISTEN"]="--rpclisten="
           ["RESTLISTEN"]="--restlisten="
           ["LISTEN"]="--listen="
           ["EXTERNALIP"]="--externalip="
           ["NOLISTEN"]="--nolisten"
           ["NOREST"]="--norest"
           ["NAT"]="--nat"
           ["MINBACKOFF"]="--minbackoff="
           ["MAXBACKOFF"]="--maxbackoff="
           ["DEBUGLEVEL"]="--debuglevel="
           ["CPUPROFILE"]="--cpuprofile="
           ["PROFILE"]="--profile="
           ["UNSAFEDISCONNECT"]="--unsafe-disconnect"
           ["UNSAFEREPLAY"]="--unsafe-replay"
           ["MAXPENDINGCHANNELS"]="--maxpendingchannels="
           ["BACKUPFILEPATH"]="--backupfilepath="
           ["NOBOOTSTRAP"]="--nobootstrap"
           ["NOSEEDBACKUP"]="--noseedbackup"
           ["PAYMENTSEXPIRATIONGRACEPERIOD"]="--payments-expiration-grace-period="
           ["TRICKLEDELAY"]="--trickledelay="
           ["CHANENABLETIMEOUT"]="--chan-enable-timeout="
           ["CHANDISABLETIMEOUT"]="--chan-disable-timeout="
           ["CHANSTATUSSAMPLEINTERVAL"]="--chan-status-sample-interval="
           ["ALIAS"]="--alias="
           ["COLOR"]="--color="
           ["MINCHANSIZE"]="--minchansize="
           ["NUMGRAPHSYNCPEERS"]="--numgraphsyncpeers="
           ["HISTORICALSYNCINTERVAL"]="--historicalsyncinterval="
           ["REJECTPUSH"]="--rejectpush"
           ["REJECTHTLC"]="--rejecthtlc"
           ["STAGGERINITIALRECONNECT"]="--stagger-initial-reconnect"
           ["MAXCTLVEXPIRY"]="--max-ctlv-expiry="
           ["MAXCHANNELFEEALLOCATION"]="--max-channel-fee-allocation="
           ["ENABLEUPFRONTSHUTDOWN"]="--enable-upfront-shutdown"
           ["ACCEPTKEYSEND"]="--accept-keysend"
           ["ALLOWCIRCULARROUTE"]="--allow-circular-route"

           ["BITCOIN_ACTIVE"]="--bitcoin.active"
           ["BITCOIN_CHAINDIR"]="--bitcoin.chaindir="
           ["BITCOIN_NODE"]="--bitcoin.node="
           ["BITCOIN_MAINNET"]="--bitcoin.mainnet"
           ["BITCOIN_TESTNET"]="--bitcoin.testnet"
           ["BITCOIN_SIMNET"]=" --bitcoin.simnet"
           ["BITCOIN_REGTEST"]="--bitcoin.regtest"
           ["BITCOIN_DEFAULTCHANCONFS"]="--bitcoin.defaultchanconfs="
           ["BITCOIN_DEFAULTREMOTEDELAY"]="--bitcoin.defaultremotedelay="
           ["BITCOIN_MINHTLC"]="--bitcoin.minhtlc="
           ["BITCOIN_MINHTLCOUT"]="--bitcoin.minhtlcout="
           ["BITCOIN_BASEFEE"]="--bitcoin.basefee="
           ["BITCOIN_FEERATE"]="--bitcoin.feerate="
           ["BITCOIN_TIMELOCKDELTA"]="--bitcoin.timelockdelta="

           ["BTCD_DIR"]="--btcd.dir="
           ["BTCD_RPCHOST"]="--btcd.rpchost="
           ["BTCD_RPCUSER"]="--btcd.rpcuser="
           ["BTCD_RPCPASS"]="--btcd.rpcpass="
           ["BTCD_RPCCERT"]="--btcd.rpccert="
           ["BTCD_RAWRPCCERT"]="--btcd.rawrpccert="

           ["BITCOIND_DIR"]="--bitcoind.dir="
           ["BITCOIND_RPCHOST"]="--bitcoind.rpchost="
           ["BITCOIND_RPCUSER"]="--bitcoind.rpcuser="
           ["BITCOIND_RPCPASS"]="--bitcoind.rpcpass="
           ["BITCOIND_ZMQPUBRAWBLOCK"]="--bitcoind.zmqpubrawblock="
           ["BITCOIND_ZMQPUBRAWTX"]="--bitcoind.zmqpubrawtx="

           ["NEUTRINO_ADDPEER"]="--neutrino.addpeer="
           ["NEUTRINO_CONNECT"]="--neutrino.connect="
           ["NEUTRINO_MAXPEERS"]="--neutrino.maxpeers="
           ["NEUTRINO_BANDURATION"]="--neutrino.banduration="
           ["NEUTRINO_BANTHRESHOLD"]="--neutrino.banthreshold="

           ["LITECOIN_ACTIVE"]="--litecoin.active"
           ["LITECOIN_CHAINDIR"]="--litecoin.chaindir= "
           ["LITECOIN_NODE"]="--litecoin.node="
           ["LITECOIN_MAINNET"]="--litecoin.mainnet"
           ["LITECOIN_TESTNET"]="--litecoin.testnet"
           ["LITECOIN_SIMNET"]="--litecoin.simnet"
           ["LITECOIN_REGTEST"]="--litecoin.regtest"
           ["LITECOIN_DEFAULTCHANCONFS"]="--litecoin.defaultchanconfs="
           ["LITECOIN_DEFAULTREMOTEDELAY"]="--litecoin.defaultremotedelay="
           ["LITECOIN_MINHTLC"]="--litecoin.minhtlc="
           ["LITECOIN_MINHTLCOUT"]="--litecoin.minhtlcout="
           ["LITECOIN_BASEFEE"]="--litecoin.basefee="
           ["LITECOIN_FEERATE"]="--litecoin.feerate="
           ["LITECOIN_TIMELOCKDELTA"]="--litecoin.timelockdelta="

           ["LTCD_DIR"]="--ltcd.dir="
           ["LTCD_RPCHOST"]="--ltcd.rpchost="
           ["LTCD_RPCUSER"]="--ltcd.rpcuser="
           ["LTCD_RPCPASS"]="--ltcd.rpcpass="
           ["LTCD_RPCCERT"]="--ltcd.rpccert="
           ["LTCD_RAWRPCCERT"]="--ltcd.rawrpccert="

           ["LITECOIND_DIR"]="--litecoind.dir="
           ["LITECOIND_RPCHOST"]="--litecoind.rpchost="
           ["LITECOIND_RPCUSER"]="--litecoind.rpcuser="
           ["LITECOIND_RPCPASS"]="--litecoind.rpcpass="
           ["LITECOIND_ZMQPATH"]="--litecoind.zmqpath="

           ["AUTOPILOT_ACTIVE"]="--autopilot.active"
           ["AUTOPILOT_HEURISTIC"]="--autopilot.heuristic="
           ["AUTOPILOT_MAXCHANNELS"]="--autopilot.maxchannels="
           ["AUTOPILOT_ALLOCATION"]="--autopilot.allocation="
           ["AUTOPILOT_MINCHANSIZE"]="--autopilot.minchansize="
           ["AUTOPILOT_MAXCHANSIZE"]="--autopilot.maxchansize="
           ["AUTOPILOT_PRIVATE"]="--autopilot.private"
           ["AUTOPILOT_MINCONFS"]="--autopilot.minconfs="
           ["AUTOPILOT_CONFTARGET"]="--autopilot.conftarget="

           ["TOR_ACTIVE"]="--tor.active"
           ["TOR_SOCKS"]="--tor.socks="
           ["TOR_DNS"]="--tor.dns="
           ["TOR_STREAMISOLATION"]="--tor.streamisolation"
           ["TOR_CONTROL"]="--tor.control="
           ["TOR_TARGETIPADDRESS"]="--tor.targetipaddress="
           ["TOR_V2"]="--tor.v2"
           ["TOR_V3"]="--tor.v3"
           ["TOR_PRIVATEKEYPATH"]="--tor.privatekeypath="

           ["SIGNRPC_SIGNERMACAROONPATH"]="--signrpc.signermacaroonpath="
           ["WALLETRPC_WALLETKITMACAROONPATH"]="--walletrpc.walletkitmacaroonpath="
           ["CHAINRPC_NOTIFIERMACAROONPATH"]="--walletrpc.notifiermacaroonpath="

           ["ROUTERRPC_MINRTPROB"]="--routerrpc.minrtprob="
           ["ROUTERRPC_APRIORIHOPPROB"]="--routerrpc.apriorihopprob="
           ["ROUTERRPC_APRIORIWEIGHT"]="--routerrpc.aprioriweight="
           ["ROUTERRPC_PENALTYHALFLIFE"]="--routerrpc.penaltyhalflife="
           ["ROUTERRPC_ATTEMPTCOST"]="--routerrpc.attemptcost="
           ["ROUTERRPC_MAXMCHISTORY"]="--routerrpc.maxmchistory="
           ["ROUTERRPC_ROUTERMACAROONPATH"]="--routerrpc.routermacaroonpath="

           ["WORKERS_READ"]="--workers.read="
           ["WORKERS_WRITE"]="--workers.write="
           ["WORKERS_SIG"]="--workers.sig="

           ["WTCLIENT_ACTIVE"]="--wtclient.active"
           ["WTCLIENT_PRIVATETOWERURIS"]="--wtclient.private-tower-uris="
           ["WTCLIENT_SWEEPFEERATE"]="--wtclient.sweep-fee-rate="

           ["WATCHTOWER_ACTIVE"]="--watchtower.active"
           ["WATCHTOWER_TOWERDIR"]="--watchtower.towerdir="
           ["WATCHTOWER_LISTEN"]="--watchtower.listen="
           ["WATCHTOWER_EXTERNALIP"]="--watchtower.externalip="
           ["WATCHTOWER_READTIMEOUT"]="--watchtower.readtimeout="
           ["WATCHTOWER_WRITETIMEOUT"]="--watchtower.writetimeout="

           # old options, may not be supported
           ["DEBUGHTLC"]="--debughtlc"
           ["HODLHTLC"]="--hodlhtlc"
           ["NOENCRYPTWALLET"]="--noencryptwallet")


CLI_ARGS=('')
SAFE_CLI_ARGS=('')

add_if_exists() {
  VAR_NAME=$1
  VAR_VALUE="${!1}"

  if [[ -n "$VAR_VALUE" ]]; then
    OPT="${cli_opts[${VAR_NAME}]}"
    if [[ $VAR_VALUE == 'y' ]]; then
      CLI_ARGS=("${CLI_ARGS[@]}" "$OPT")
      SAFE_CLI_ARGS=("${SAFE_CLI_ARGS[@]}" "$OPT")
    else
      CLI_ARGS=("${CLI_ARGS[@]}" "$OPT$VAR_VALUE")
      if [[ "$VAR_NAME" == *"USER"* ]] || [[ "$VAR_NAME" == *"PASS"* ]]; then
        SAFE_CLI_ARGS=("${SAFE_CLI_ARGS[@]}" "$OPT*")
      else
        SAFE_CLI_ARGS=("${SAFE_CLI_ARGS[@]}" "$OPT$VAR_VALUE")
      fi
    fi
  fi
}

for opt in "${!cli_opts[@]}"; do add_if_exists "$opt"; done

# shellcheck disable=SC2068
echo "Starting lnd with the following options:" ${SAFE_CLI_ARGS[@]} "$@"
# shellcheck disable=SC2068
exec lnd ${CLI_ARGS[@]} "$@"
