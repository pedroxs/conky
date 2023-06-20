#!/usr/bin/env bash

function usage() {
  echo "Usage: ./$(basename $0) COMMAND"
  echo
  echo -e "\nOptions:"
  echo -e '\t -q \t Chose quote to retrieve [usd_brl|btc_brl|btc_usd]'
  echo -e '\t -h \t Show this help text'
}

function get_quotes() {
  case $1 in
    usd_brl)
      curl 'https://simulator-api.remessaonline.com.br/v1/simulator' \
        -H 'authorization: 5b50b3f1cadc2f622d286a85da9ab85d' \
        -H 'content-type: application/json;charset=UTF-8' \
        --data-raw '{"targetCustomerType":"individual","amount":5000,"operationType":"outbound","inputCurrencyISOCode":"BRL","outputCurrencyISOCode":"USD","requestor":"www.remessaonline.com.br"}' \
        --compressed -s | jq '.simulation.vet * 100 | round / 100'
      ;;
    btc_brl)
      curl -s 'https://www.mercadobitcoin.net/api/BTC/ticker' | jq '.ticker.last | tonumber/1000' | awk {' printf "%.3f",$1 '}
      ;;
    btc_usd)
      curl -s 'https://www.bitmex.com/api/v1/trade?symbol=.BXBT&count=1&columns=price&reverse=true' | jq '.[].price | ./1000' | awk {' printf "%.3f",$1 '}
      ;;
  esac
}

function main() {
  while getopts ":q:h" opt; do
    case $opt in
      h) usage;;
      q)
        get_quotes $OPTARG
				;;
      \?)
        echo -e "Invalid option: -$OPTARG\n" >&2
        usage
        #exit 1
        ;;
      :)
        echo -e "Option -$OPTARG requires an argument.\n" >&2
        usage
        #exit 1
        ;;
    esac
  done
}

main "$@"
