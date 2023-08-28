#!/bin/bash



PROTON_USERNAME="${PROTON_EMAIL%%@*}"


mkdir /json
export HYDROXIDEKEYRAW=$(echo $PROTON_PASSWORD | su - root -c "hydroxide auth $PROTON_USERNAME")
IFS=":" read -ra HYDROXIDEKEYDELIMIT <<< "$HYDROXIDEKEYRAW"
export HYDROXIDEKEY="${HYDROXIDEKEYDELIMIT[2]:1}"
echo -e "{\x22user\x22: \x22$PROTON_USERNAME\x22, \x22hash\x22: \x22$HYDROXIDEKEY\x22}" > ./info.json

echo $HYDROXIDEKEY