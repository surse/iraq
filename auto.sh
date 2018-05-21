while true ; do
./launch.sh
killall screen
rm -fr ../.telegram-cli
rm -fr .telegram-cli
curl "https://api.telegram.org/bot472266761:AAG0w2d-ZfccSVgPUPuq5prncHIjwahgKmk/sendMessage" -F "chat_id=-1001269786581" -F "text=Mehdi_Yt Your Self Bot Crashed And Was Ready To Work :D"
sleep 8
done
