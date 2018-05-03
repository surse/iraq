token=""
curl "https://api.telegram.org/bot"$token"/sendmessage" -F
./tg -s ./bot.lua $@ --bot=$token
