#!/usr/bin/env bash

function passlib-hash() {
 local passwd=$1; shift || return 1
 local script

 script="from passlib.hash import sha512_crypt;print sha512_crypt.using(rounds=5000).hash(\"$passwd\")"

 python -c "$script"
}
