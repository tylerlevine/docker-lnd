#!/usr/bin/env bash

# exit from script if error was raised.
set -e

declare -A cli_opts
cli_opts=( ["LNDDIR"]="--lnddir="
           ["LOGDIR"]="--logdir="
           ["CONFIGFILE"]="--configfile="
           ["DATADIR"]="--datadir="
           ["TLSCERTPATH"]="--tlscertpath="
           ["TLSKEYPATH"]="--tlskeypath="
           ["TLSEXTRAIP"]="--tlsextraip="
           ["TLSEXTRADOMAIN"]="--tlsextradomain="
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
           ["NOLISTEN"]="--nolisten"
           ["EXTERNALIP"]="--externalip="
           ["DEBUGLEVEL"]="--debuglevel="
           ["CPUPROFILE"]="--cpuprofile="
           ["PROFILE"]="--profile="
           ["DEBUGHTLC"]="--debughtlc"
           ["HODLHTLC"]="--hodlhtlc"
           ["UNSAFE_DISCONNECT"]="--unsafe-disconnect"
           ["UNSAFE_REPLAY"]="--unsafe-replay"
           ["MAXPENDINGCHANNELS"]="--maxpendingchannels="
           ["NOBOOTSTRAP"]="--nobootstrap"
           ["NOENCRYPTWALLET"]="--noencryptwallet"
           ["TRICKLEDELAY"]="--trickledelay="
           ["ALIAS"]="--alias="
           ["COLOR"]="--color="
           ["MINCHANSIZE"]="--minchansize="
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
           ["BITCOIND_ZMQPATH"]="--bitcoind.zmqpath="
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
           ["AUTOPILOT_MAXCHANNELS"]="--autopilot.maxchannels="
           ["AUTOPILOT_ALLOCATION"]="--autopilot.allocation="
           ["AUTOPILOT_MINCHANSIZE"]="--autopilot.minchansize="
           ["AUTOPILOT_MAXCHANSIZE"]="--autopilot.maxchansize="
           ["TOR_SOCKS"]="--tor.socks="
           ["TOR_DNS"]="--tor.dns="
           ["TOR_STREAMISOLATION"]="--tor.streamisolation" )

CLI_ARGS=('')

add_if_exists() {
  VAR_NAME=$1
  VAR_VALUE="${!1}"

  if [[ -n "$VAR_VALUE" ]]; then
    if [[ $VAR_VALUE == 'y' ]]; then
      CLI_ARGS=("${CLI_ARGS[@]}" "${cli_opts[${VAR_NAME}]}")
    else
      CLI_ARGS=("${CLI_ARGS[@]}" "${cli_opts[${VAR_NAME}]}$VAR_VALUE")
    fi
  fi
}

if [ ! -f /etc/ssl/openssl.cnf.edited ]; then
    sed -i 's/# req_extensions/req_extensions/' /etc/ssl/openssl.cnf
    sed -i 's/# copy_extensions/copy_extensions/' /etc/ssl/openssl.cnf
    sed -i '/\[ v3_req \]/a subjectAltName = @alt_names' /etc/ssl/openssl.cnf
    echo "[ alt_names ]" >> /etc/ssl/openssl.cnf
    echo "DNS.1 = localhost" >> /etc/ssl/openssl.cnf
    echo "DNS.2 = lnd" >> /etc/ssl/openssl.cnf
    echo "DNS.3 = $EXTERNALIP" >> /etc/ssl/openssl.cnf
    touch /etc/ssl/openssl.cnf.edited
fi

cd /root/.lnd/
if [ ! -f tls.key ]; then
    openssl ecparam -genkey -name prime256v1 -out tls.key
fi
if [ ! -f csr.csr ]; then
    openssl req -new -sha256 -key tls.key -out csr.csr -subj '/CN=localhost/O=lnd'
fi
if [ ! -f tls.cert ]; then
    openssl req -x509 -sha256 -days 36500 -key tls.key -in csr.csr -out tls.cert -extensions v3_req
fi

for lala in "${!cli_opts[@]}"; do add_if_exists "$lala"; done
echo "Starting lnd with the following options:" ${CLI_ARGS[@]} "$@"
exec lnd ${CLI_ARGS[@]} "$@"