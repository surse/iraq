token="454157611:AAG3GiwznqM6wFvJmYD9i8dTgUTSvJgQjik"
curl "https://api.telegram.org/bot"$token"/sendmessage" -F
./tg -s ./bot.lua $@ --bot=$token
