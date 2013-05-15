#! /bin/bash


tc qdisc add dev eth1 root handle 1: tbf rate 33kbit buffer 1000 limit 3000
tc qdisc add dev eth1 parent 1: handle 10: netem delay 1000ms
