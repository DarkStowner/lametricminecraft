status=$(curl https://mcapi.xdefcon.com/server/SERVERIP/status/text)
players=$(curl https://api.mcsrvstat.us/1/SERVERIP | jq -r '.players.list[]?' )

if [[ $status = "Server status: Online" ]]; then
              status="Online"
            fi
if [[ -z $players ]]; then
              players="No Players Connected!"
            fi
echo $players
echo $status


curl -X POST \
-H "Accept: application/json" \
-H "X-Access-Token: accesstokengoeshere" \
-H "Cache-Control: no-cache" \
-d '{
    "frames": [
        {
            "text": "'"$status"'",
            "icon": "i16865",
            "index": 0
        },
        {
            "text": "'"$players"'",
            "icon": "i2766",
            "index": 1
        }
    ]
}' \
https://developer.lametric.com/api/v1/dev/widget/update/YOURWIDGET
