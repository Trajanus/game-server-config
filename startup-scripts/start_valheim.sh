#!/bin/sh

export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
export SteamAppID=892970

password=$(cat "${CREDENTIALS_DIRECTORY}/valheim-password") || exit 1

if [ -z "$password" ]; then
    echo "ERROR: Valheim password is empty or was not read" >&2
    exit 1
fi


# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.

./valheim_server.x86_64 -name "$WORLD_NAME" -port "$SERVER_PORT" -nographics -world "Dedicated" -password "$password" -public 1 > /dev/null &

export LD_LIBRARY_PATH=$templdpath

echo "Server started"
echo ""
#read -p "Press RETURN to stop server"
#echo 1 > server_exit.drp

#echo "Server exit signal set"
#echo "You can now close this terminal"

while :
do
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "valheim.service: timestamp ${TIMESTAMP}"
sleep 60
done
