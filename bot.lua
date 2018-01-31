bot = dofile('./utils.lua')
json = dofile('./JSON.lua')
URL = require "socket.url"
serpent = require("serpent")
http = require "socket.http"
https = require "ssl.https"
redis = require('redis')
tdcli = dofile("tdcli.lua")
database = redis.connect('127.0.0.1', 6379)
BASE = '/home/api/Api/'
day = 86400
----------------------------------------------------------------------------
realm_id = -1001180782639 --Realm ID
----------------------------------------------------------------------------
SUDO = 439620509 --Sudo ID
----------------------------------------------------------------------------
sudo_users = {439620509,400126262,userid} --Sudo ID
----------------------------------------------------------------------------
BOTS = 503686747 --Bot ID
----------------------------------------------------------------------------
bot_id = 503686747 --Bot ID
----------------------------------------------------------------------------
function vardump(value)
print(serpent.block(value, {comment=false}))
end
----------------------------------------------------------------------------
function dl_cb(arg, data)
end
----------------------------------------------------------------------------
function is_ultrasudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then
var = true
end
end
return var
end
----------------------------------------------------------------------------
function is_sudo(msg) 
local hash = database:sismember(SUDO..'sudo:',msg.sender_user_id_)
if hash or is_ultrasudo(msg)  then
return true
else
return false
end
end
----------------------------------------------------------------------------
function is_bot(msg)
 if tonumber(BOTS) == 503686747 then
return true
else
return false
end
end
----------------------------------------------------------------------------
function check_user(msg)
local var = true
if database:get(SUDO.."forcejoin") then
local channel = '@TiniGerTeaM'
local url , res = https.request('https://api.telegram.org/bot503686747:AAEmLSPwXtm87C0tIp2ta6TG2d8uBeZQUAU/getchatmember?chat_id='..channel..'&user_id='..msg.sender_user_id_)
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
 var = false
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» برای استفاده از ربات ابتدا وارد کانال ( '..channel..' ) شوید.', 1, 'html')
elseif data.ok then
return var
end
else
return var
end
end
----------------------------------------------------------------------------
function is_owner(msg) 
local hash = database:sismember(SUDO..'owners:'..msg.chat_id_,msg.sender_user_id_)
if hash or  is_ultrasudo(msg) or is_sudo(msg) then
return true
else
return false
end
end
----------------------------------------------------------------------------
function sleep(n) 
os.execute("sleep " .. tonumber(n)) 
end
----------------------------------------------------------------------------
function is_mod(msg) 
local hash = database:sismember(SUDO..'mods:'..msg.chat_id_,msg.sender_user_id_)
if hash or  is_ultrasudo(msg) or is_sudo(msg) or is_owner(msg) then
return true
else
return false
end
end
----------------------------------------------------------------------------
function is_banned(chat,user)
local hash =  database:sismember(SUDO..'banned'..chat,user)
if hash then
return true
else
return false
end
end
----------------------------------------------------------------------------
function is_gban(chat,user)
local hash =  database:sismember(SUDO..'gbaned',user)
if hash then
return true
else
return false
end
end
----------------------------------------------------------------------------
function deleteMessagesFromUser(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
----------------------------------------------------------------------------
function addChatMember(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit
}, dl_cb, nil)
end
----------------------------------------------------------------------------
local function UpTime()
local uptime = io.popen("uptime -p"):read("*all")
days = uptime:match("up %d+ days")
hours = uptime:match(", %d+ hour") or uptime:match(", %d+ hours")
minutes = uptime:match(", %d+ minutes") or uptime:match(", %d+ minute")
if hours then
hours = hours
else
hours = ""
end
if days then
days = days
else
days = ""
end
if minutes then
minutes = minutes
else
minutes = ""
end
days = days:gsub("up", "")
local a_ = string.match(days, "%d+")
local b_ = string.match(hours, "%d+")
local c_ = string.match(minutes, "%d+")
if a_ then
a = a_
else
a = 0
end
if b_ then
b = b_
else
b = 0
end
if c_ then
c = c_
else
c = 0
end
return a..' days '..b..' hour '..c..' minute'
end
----------------------------------------------------------------------------
function is_filter(msg, value)
local hash = database:smembers(SUDO..'filters:'..msg.chat_id_)
if hash then
local names = database:smembers(SUDO..'filters:'..msg.chat_id_)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_mod(msg) then
 local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
----------------------------------------------------------------------------
function is_muted(chat,user)
local hash =  database:sismember(SUDO..'mutes'..chat,user)
if hash then
return true
else
return false
end
end
----------------------------------------------------------------------------
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, dl_cb, nil) 
end 
----------------------------------------------------------------------------
function SendMetion(chat_id, user_id, msg_id, text, offset, length)
local tt = database:get('endmsg') or ''
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = msg_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text..'\n\n'..tt,
disable_web_page_preview_ = 1,
clear_draft_ = 0,
entities_ = {[0]={
ID="MessageEntityMentionName",
offset_=offset,
length_=length,
user_id_=user_id
},
},
},
}, dl_cb, nil)
end
----------------------------------------------------------------------------
function priv(chat,user)
local ohash = database:sismember(SUDO..'owners:'..chat,user)
local mhash = database:sismember(SUDO..'mods:'..chat,user)
if tonumber(SUDO) == tonumber(user) or mhash or ohash then
return true
else
return false
end
end
----------------------------------------------------------------------------
function getInputFile(file)
local input = tostring(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
----------------------------------------------------------------------------
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},
}, dl_cb, nil)
end
----------------------------------------------------------------------------
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
----------------------------------------------------------------------------
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
----------------------------------------------------------------------------
function adduser(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
----------------------------------------------------------------------------
function banall(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, 'تو بودی خودتو سوپر بن میکردی ؟ 😐', 1, 'md')
return false
 end
if priv(chat,user) then
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» کاربر مورد نظر جزو ( مالکین | سازندگان ) ربات میباشد!', 1, 'md')
else
bot.changeChatMemberStatus(chat, user, "Kicked")
database:sadd(SUDO..'gbaned',user)
SendMetion(msg.chat_id_, user, msg.id_, '» کاربر ( '..user..' ) از تمامی گروه های ربات مسدود شد.' , 10, string.len(user)) 
end
end
----------------------------------------------------------------------------
function kick(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
return false
end
if priv(chat,user) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» کاربر مورد نظر جزو ( مالکین | سازندگان ) ربات میباشد!', 1, 'md')
else
bot.changeChatMemberStatus(chat, user, "Kicked")
end
end
----------------------------------------------------------------------------
function ban(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, 'تو بودی خودتو مسدود میکردی ؟ 😐', 1, 'md')
return false
end
if priv(chat,user) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» کاربر مورد نظر جزو ( مالکین | سازندگان ) ربات میباشد!', 1, 'md')
else
bot.changeChatMemberStatus(chat, user, "Kicked")
database:sadd(SUDO..'banned'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '» کاربر ( '..user..' ) از گروه مسدود شد.' , 10, string.len(user))
end
end
----------------------------------------------------------------------------
function mute(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, 'تو بودی خودتو سایلنت میکردی ؟ 😐', 1, 'md')
return false
end
if priv(chat,user) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» کاربر مورد نظر جزو ( مالکین | سازندگان ) ربات میباشد!', 1, 'md')
else
database:sadd(SUDO..'mutes'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '» کاربر ( '..user..' ) در حالت سکوت قرار گرفت.' , 10, string.len(user))
end
end
----------------------------------------------------------------------------
function unbanall(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
return false
end
database:srem(SUDO..'gbaned',user)
SendMetion(msg.chat_id_, user, msg.id_, '» کاربر ( '..user..' ) از تمامی گروه های ربات لغو مسدودیت شد.' , 10, string.len(user)) 
end
----------------------------------------------------------------------------
function unban(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
return false
end
database:srem(SUDO..'banned'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '» کاربر ( '..user..' ) از گروه لغو مسدودیت شد.' , 10, string.len(user))
end
----------------------------------------------------------------------------
function unmute(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
return false
end
database:srem(SUDO..'mutes'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '» کاربر ( '..user..' ) از حالت سکوت خارج شد.' , 10, string.len(user))
end
----------------------------------------------------------------------------
function delete_msg(chatid,mid)
tdcli_function ({ID="DeleteMessages", chat_id_=chatid, message_ids_=mid}, dl_cb, nil)
end
----------------------------------------------------------------------------
function user(msg,chat,text,user)
entities = {}
if text:match('<user>') and text:match('<user>') then
local x = string.len(text:match('(.*)<user>'))
local offset = x
local y = string.len(text:match('<user>(.*)</user>'))
local length = y
text = text:gsub('<user>','')
text = text:gsub('</user>','')
table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user})
end
entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}
return tdcli_function ({ID="SendMessage", chat_id_=chat, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_=entities}}, dl_cb, nil)
end
----------------------------------------------------------------------------
function settings(msg,value,lock) 
local hash = SUDO..'settings:'..msg.chat_id_..':'..value
if value == 'file' then
text = 'فایل'
elseif value == 'inline' then
text = 'دکمه شیشه ای'
elseif value == 'link' then
text = 'لینک'
elseif value == 'game' then
text = 'بازی'
elseif value == 'username' then
text = 'یوزرنیم'
elseif value == 'tag' then
text = 'هشتگ'
elseif value == 'pin' then
text = 'سنجاق'
elseif value == 'photo' then
text = 'عکس'
elseif value == 'gif' then
text = 'گیف'
elseif value == 'video' then
text = 'فیلم'
elseif value == 'audio' then
text = 'صدا'
elseif value == 'music' then
text = 'موزیک'
elseif value == 'text' then
text = 'متن'
elseif value == 'sticker' then
text = 'استیکر'
elseif value == 'contact' then
text = 'مخاطب'
elseif value == 'forward' then
text = 'فوروارد'
elseif value == 'persian' then
text = 'فارسی'
elseif value == 'english' then
text = 'انگیلیسی'
elseif value == 'bot' then
text = 'ربات'
elseif value == 'tgservice' then
text = 'پیام سرویسی'
elseif value == 'fosh' then
text = 'فحش'
elseif value == 'selfivideo' then
text = 'فیلم سلفی'
elseif value == 'emoji' then
text = 'ایموجی'
elseif value == 'cmd' then
text = 'دستورات'
elseif value == 'join' then
text = 'ورودی گروه'
elseif value == 'reply' then
text = 'پاسخ'
else return false
end
if lock then
database:set(hash,true)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل ( '..text..' ) با موفقیت فعال گردید.',1,'md')
else
database:del(hash)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل ( '..text..' ) با موفقیت غیرفعال گردید.',1,'md')
end
end
------------------------------------------------------------
function is_lock(msg,value)
local hash = SUDO..'settings:'..msg.chat_id_..':'..value
if database:get(hash) then
return true 
else
return false
end
end
----------------------------------------------------------------------------
function warn(msg,chat,user)
local type = database:hget("warn:"..msg.chat_id_,"swarn")
if type == "kick" then
kick(msg,chat,user)
local text = 'کاربر ( '..user..' ) اخطار های شما از حد مجاز خارج شد!\n\nشما از گروه اخراج میشوید.'
SendMetion(msg.chat_id_, user, msg.id_, text, 8, string.len(user))
end
if type == "ban" then
local text = 'کاربر ( '..user..' ) اخطار های شما از حد مجاز خارج شد!\n\nشما از گروه مسدود میشوید.'
SendMetion(msg.chat_id_, user, msg.id_, text, 8, string.len(user))
changeChatMemberStatus(chat, user, "Kicked")
database:sadd(SUDO..'banned'..chat,user)
end
if type == "mute" then
local text = 'کاربر ( '..user..' ) اخطار های شما از حد مجاز خارج شد!\n\nشما در حالت سکوت قرار میگیرید.'
SendMetion(msg.chat_id_, user, msg.id_, text, 8, string.len(user))
database:sadd(SUDO..'mutes'..msg.chat_id_,user)
end
end
----------------------------------------------------------------------------
function trigger_anti_spam(msg,type)
if type == 'kick' then
kick(msg,msg.chat_id_,msg.sender_user_id_)
end
if type == 'ban' then
if is_banned(msg.chat_id_,msg.sender_user_id_) then else
SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '» کاربر ( '..msg.sender_user_id_..' ) به دلیل ارسال پیام مکرر از گروه مسدود شد.' , 10, string.len(msg.sender_user_id_))
end
bot.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
database:sadd(SUDO..'banned'..msg.chat_id_,msg.sender_user_id_)
end
if type == 'mute' then
if is_muted(msg.chat_id_,msg.sender_user_id_) then else
SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '» کاربر ( '..msg.sender_user_id_..' ) به دلیل ارسال پیام مکرر در حالت سکوت قرار گرفت.' , 10, string.len(msg.sender_user_id_))
end
database:sadd(SUDO..'mutes'..msg.chat_id_,msg.sender_user_id_)
end
end
----------------------------------------------------------------------------
function televardump(msg,value)
local text = json:encode(value)
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 'html')
end
----------------------------------------------------------------------------
function run(msg,data)
if msg then
database:incr(SUDO..'groupmsgkk:'..msg.chat_id_..':')
database:incr(SUDO..'total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)
if msg.send_state_.ID == "MessageIsSuccessfullySent" then
return false 
end
end
----------------------------------------------------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
chat_type = 'super'
elseif id:match('^(%d+)') then
chat_type = 'user'
else
chat_type = 'group'
end
end
----------------------------------------------------------------------------
local text = msg.content_.text_
if text and text:match('[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]') then
text = text
end
----------------------------------------------------------------------------
if msg.content_.ID == "MessageText" then
msg_type = 'text'
end
if msg.content_.ID == "MessageChatAddMembers" then
msg_type = 'add'
end
if msg.content_.ID == "MessageChatJoinByLink" then
msg_type = 'join'
end
if msg.content_.ID == "MessagePhoto" then
msg_type = 'photo'
end
----------------------------------------------------------------------------
if msg_type == 'text' and text then
if text:match('^[/!]') then
text = text:gsub('^[/!]','')
end
end
----------------------------------------------------------------------------
if text then
if not database:get(SUDO..'bot_id') then
function cb(a,b,c)
database:set(SUDO..'bot_id',b.id_)
end
bot.getMe(cb)
end
end
-------------------------------------------------StartBot-------------------------------------------------
if text == 'start' and not database:get(SUDO.."timeactivee:"..msg.chat_id_) and chat_type == 'user' and check_user(msg) then
function pv_start(extra, result, success)
SendMetion(msg.chat_id_, result.id_, msg.id_, 'سلام ( '..result.id_..' | '..result.first_name_..' ) \n\nبرای استفاده از این ربات کافی است این ربات را به گروه خود اضافه کنید .\n\nو سپس دستور زیر را در گروه وارد کنید :\n\n/active\n\nبا زدن این دستور ربات در گروه شما فعال میشود .\n\nدر صورت بروز هرگونه مشکلی کافی است به @MrKarimFar یا @MrPars پیام بدید.\n\n► @TiniGerTeaM' , 7, string.len(result.id_))
end
tdcli.getUser(msg.sender_user_id_, pv_start)
database:setex(SUDO.."timeactivee:"..msg.chat_id_, 73200, true)
end
----------------------------------------------------------------------------
if chat_type == 'super' then
local user_id = msg.sender_user_id_
floods = database:hget("flooding:settings:"..msg.chat_id_,"flood") or  'nil'
NUM_MSG_MAX = database:hget("flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = database:hget("flooding:settings:"..msg.chat_id_,"floodtime") or 5
if database:hget("flooding:settings:"..msg.chat_id_,"flood") then
if not is_mod(msg) then
if msg.content_.ID == "MessageChatAddMembers" then
return
else
local post_count = tonumber(database:get('floodc:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
if post_count > tonumber(database:hget("flooding:settings:"..msg.chat_id_,"floodmax") or 5) then
local ch = msg.chat_id_
local type = database:hget("flooding:settings:"..msg.chat_id_,"flood")
trigger_anti_spam(msg,type)
 end
database:setex('floodc:'..msg.sender_user_id_..':'..msg.chat_id_, tonumber(database:hget("flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1)
end
end
local edit_id = data.text_ or 'nil' 
NUM_MSG_MAX = 5
if database:hget("flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = database:hget("flooding:settings:"..msg.chat_id_,"floodmax")
end
if database:hget("flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = database:hget("flooding:settings:"..msg.chat_id_,"floodtime")
end
end	  
----------------------------------------------------------------------------
-- save pin message id
if msg.content_.ID == 'MessagePinMessage' then
if is_lock(msg,'pin') and is_owner(msg) then
database:set(SUDO..'pinned'..msg.chat_id_, msg.content_.message_id_)
elseif not is_lock(msg,'pin') then
database:set(SUDO..'pinned'..msg.chat_id_, msg.content_.message_id_)
end
end
----------------------------------------------------------------------------
-- check filters
if text and not is_mod(msg) then
if is_filter(msg,text) then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end 
end
----------------------------------------------------------------------------
-- check settings
----------------------------------------------------------------------------
-- lock tgservice
if is_lock(msg,'tgservice') then
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatDeleteMember" then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock pin
if is_owner(msg) then else
if is_lock(msg,'pin') then
if msg.content_.ID == 'MessagePinMessage' then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '*Pin Lock Is Active*\n*You Do Not Have Any Authority You Can Not Pin A Message*',1, 'md')
bot.unpinChannelMessage(msg.chat_id_)
local PinnedMessage = database:get(SUDO..'pinned'..msg.chat_id_)
if PinnedMessage then
bot.pinChannelMessage(msg.chat_id_, tonumber(PinnedMessage), 0)
end
end
end
end
----------------------------------------------------------------------------
if is_mod(msg) then
else
----------------------------------------------------------------------------
-- lock link
 if is_lock(msg,'link') then
if text then
if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID == 'MessageEntityUrl' or msg.content_.text_.web_page_ then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
if msg.content_.caption_ then
local text = msg.content_.caption_
local is_link = text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text:match("[Tt].[Mm][Ee]/")
if is_link then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
----------------------------------------------------------------------------
-- lock username
if is_lock(msg,'username') then
if text then
local is_username = text:match("@[%a%d]")
if is_username then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
if msg.content_.caption_ then
local text = msg.content_.caption_
local is_username = text:match("@[%a%d]")
if is_username then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
----------------------------------------------------------------------------
-- lock hashtag
if is_lock(msg,'tag') then
if text then
local is_hashtag = text:match("#")
if is_hashtag then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
if msg.content_.caption_ then
local text = msg.content_.caption_
local is_hashtag = text:match("#")
if is_hashtag then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
----------------------------------------------------------------------------
-- lock rep
if is_lock(msg,'reply') then
if msg.reply_to_message_id_ ~= 0 then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock sticker 
if is_lock(msg,'sticker') then
if msg.content_.ID == 'MessageSticker' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock join
if is_lock(msg,'join') then
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
bot.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
----------------------------------------------------------------------------
-- lock forward
if is_lock(msg,'forward') then
if msg.forward_info_ then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock photo
if is_lock(msg,'photo') then
if msg.content_.ID == 'MessagePhoto' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end 
----------------------------------------------------------------------------
-- lock file
if is_lock(msg,'file') then
if msg.content_.ID == 'MessageDocument' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock file
if is_lock(msg,'inline') then
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end 
----------------------------------------------------------------------------
-- lock game
if is_lock(msg,'game') then
if msg.content_.game_ then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end 
----------------------------------------------------------------------------
-- lock music 
if is_lock(msg,'music') then
if msg.content_.ID == 'MessageAudio' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock voice 
if is_lock(msg,'audio') then
if msg.content_.ID == 'MessageVoice' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock gif
if is_lock(msg,'gif') then
if msg.content_.ID == 'MessageAnimation' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------		  
-- lock contact
if is_lock(msg,'contact') then
if msg.content_.ID == 'MessageContact' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock video 
if is_lock(msg,'video') then
if msg.content_.ID == 'MessageVideo' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock text 
if is_lock(msg,'text') then
if msg.content_.ID == 'MessageText' then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock persian 
if is_lock(msg,'persian') then
if text and text:match('[\216-\219][\128-\191]') then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end 
if msg.content_.caption_ then
local text = msg.content_.caption_
local is_persian = text:match("[\216-\219][\128-\191]")
if is_persian then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
----------------------------------------------------------------------------
-- lock english 
if is_lock(msg,'english') then
if text:match('[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]') then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end 
if msg.content_.caption_ then
local text = msg.content_.caption_
local is_english = text:match("[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]")
if is_english then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
----------------------------------------------------------------------------
-- lock fosh
if is_lock(msg,'fosh') then
if text then
if text:match("کیر") or text:match("کس") or text:match("تخم") or text:match("جینده") or  text:match("کص") or text:match("کونی") or text:match("جندع") or text:match("کیری") or text:match("کصده") or text:match("کون")  or text:match("جنده") or text:match("ننه") or text:match("ننت") or  text:match("کیرم") or text:match("تخمم") or text:match("تخم") or text:match("ننع") or text:match("مادر") or text:match("قهبه") or text:match("گاییدی") or text:match("گاییدم") or text:match("میگام") or text:match("میگامت") or text:match("سکس") or text:match("kir") or text:match("kos") or text:match("kon") or text:match("nne") or text:match("nnt")  then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
end
----------------------------------------------------------------------------
-- lock emoji
if is_lock(msg,'emoji') then
local is_emoji_msg = text:match("😀") or text:match("😬") or text:match("😁") or text:match("😂") or  text:match("😃") or text:match("😄") or text:match("😅") or text:match("☺️") or text:match("🙃") or text:match("🙂") or text:match("😊") or text:match("😉") or text:match("😇") or text:match("😆") or text:match("😋") or text:match("😌") or text:match("😍") or text:match("😘") or text:match("😗") or text:match("😙") or text:match("😚") or text:match("🤗") or text:match("😎") or text:match("🤓") or text:match("🤑") or text:match("😛") or text:match("😏") or text:match("😶") or text:match("😐") or text:match("😑") or text:match("😒") or text:match("🙄") or text:match("🤔") or text:match("😕") or text:match("😔") or text:match("😡") or text:match("😠") or text:match("😟") or text:match("😞") or text:match("😳") or text:match("🙁") or text:match("☹️") or text:match("😣") or text:match("😖") or text:match("😫") or text:match("😩") or text:match("😤") or text:match("😲") or text:match("😵") or text:match("😭") or text:match("😓") or text:match("😪") or text:match("😥") or text:match("😢") or text:match("🤐") or text:match("😷") or text:match("🤒") or text:match("🤕") or text:match("😴") or text:match("💋") or text:match("❤️")
if is_emoji_msg then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock selfvideo 
if is_lock(msg,'selfivideo') then
if msg.content_.ID == "MessageUnsupported" then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
end
----------------------------------------------------------------------------
-- lock bot
if is_lock(msg,'bot') then
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
bot.changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, 'Kicked')
end
end
end
----------------------------------------------------------------------------
if is_lock(msg,'cmd') then
if not is_mod(msg) then
return  false
end
end
end
----------------------------------------------------------------------------
-- check mutes
local muteall = database:get(SUDO..'muteall'..msg.chat_id_)
if msg.sender_user_id_ and muteall and not is_mod(msg) then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
if msg.sender_user_id_ and is_muted(msg.chat_id_,msg.sender_user_id_) then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
----------------------------------------------------------------------------
-- check bans
if msg.sender_user_id_ and is_banned(msg.chat_id_,msg.sender_user_id_) then
kick(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and is_banned(msg.chat_id_,msg.content_.members_[0].id_) then
kick(msg,msg.chat_id_,msg.content_.members_[0].id_)
delete_msg(msg.chat_id_, {[0] = msg.id_})
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» کاربر از گروه مسدود شده است.',1, 'md')
end
----------------------------------------------------------------------------
--check Gbans
if msg.sender_user_id_ and is_gban(msg.chat_id_,msg.sender_user_id_) then
kick(msg,msg.chat_id_,msg.sender_user_id_)
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and is_gban(msg.chat_id_,msg.content_.members_[0].id_) then
kick(msg,msg.chat_id_,msg.content_.members_[0].id_)
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
----------------------------------------------------------------------------
-- welcome
local status_welcome = (database:get(SUDO..'status:welcome:'..msg.chat_id_) or 'disable') 
if status_welcome == 'enable' then
if msg.content_.ID == "MessageChatJoinByLink" then
if not is_banned(msg.chat_id_,msg.sender_user_id_) then
function wlc(extra,result,success)
if database:get(SUDO..'welcome:'..msg.chat_id_) then
t = database:get(SUDO..'welcome:'..msg.chat_id_)
else
t = 'Hi {name}\nWelcome To This Group !'
end
local t = t:gsub('{name}',result.first_name_)
bot.sendMessage(msg.chat_id_, msg.id_, 1, t,0)
end
bot.getUser(msg.sender_user_id_,wlc)
end
end
if msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].type_.ID == 'UserTypeGeneral' then
if msg.content_.ID == "MessageChatAddMembers" then
if not is_banned(msg.chat_id_,msg.content_.members_[0].id_) then
if database:get(SUDO..'welcome:'..msg.chat_id_) then
t = database:get(SUDO..'welcome:'..msg.chat_id_)
else
t = 'Hi {name}\nWelcome To This Group !'
end
local t = t:gsub('{name}',msg.content_.members_[0].first_name_)
bot.sendMessage(msg.chat_id_, msg.id_, 1, t,0)
end
end
end
end
----------------------------------------------------------------------------
 -- locks
if text and is_owner(msg) then
local lock = text:match('^lock pin$')
local unlock = text:match('^unlock pin$')
if lock then
settings(msg,'pin','lock')
end
if unlock then
settings(msg,'pin')
end
end 
if text and is_mod(msg) then
local lock = text:match('^lock (.*)$')
local unlock = text:match('^unlock (.*)$')
local pin = text:match('^lock pin$') or text:match('^unlock pin$')
if pin and is_mod(msg) then
elseif pin and not is_mod(msg) then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» شما دسترسی استفاده از این دستور را ندارید.',1, 'md')
elseif lock then
settings(msg,lock,'lock')
elseif unlock then
settings(msg,unlock)
end
end
----------------------------------------------------------------------------
-- lock flood settings
if text and is_owner(msg) then
if text == 'lock flood kick' then
database:hset("flooding:settings:"..msg.chat_id_ ,"flood",'kick') 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل رگبار به حالت اخراج تنظیم شد.',1, 'md')
elseif text == 'lock flood ban' then
database:hset("flooding:settings:"..msg.chat_id_ ,"flood",'ban') 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل رگبار به حالت مسدود تنظیم شد.',1, 'md')
elseif text == 'lock flood mute' then
database:hset("flooding:settings:"..msg.chat_id_ ,"flood",'mute') 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل رگبار به حالت سکوت تنظیم شد.',1, 'md')
elseif text == 'unlock flood' then
database:hdel("flooding:settings:"..msg.chat_id_ ,"flood") 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل رگبار غیرفعال شد.',1, 'md')
end
end
----------------------------------------------------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
database:incr(SUDO..'sgpsmessage:')
if not database:sismember(SUDO.."botgps",msg.chat_id_) then  
database:sadd(SUDO.."botgps",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:incr(SUDO..'pvmessage:')
if not database:sismember(SUDO.."usersbot",msg.chat_id_) then
database:sadd(SUDO.."usersbot",msg.chat_id_)
end
else
database:incr(SUDO..'gpsmessage:')
if not database:sismember(SUDO.."botgp",msg.chat_id_) then
database:sadd(SUDO.."botgp",msg.chat_id_)
 end
end
end
----------------------------------------------------------------------------
database:incr(SUDO.."allmsg")
if msg.content_.game_ then
print("------ G A M E ------")
elseif msg.content_.text_ then
print("------ T E X T ------")
elseif msg.content_.sticker_ then
print("------ S T I C K E R ------")
elseif msg.content_.animation_ then
print("------ G I F ------")
elseif msg.content_.voice_ then
print("------ V O I C E ------")
elseif msg.content_.video_ then
print("------ V I D E O ------")
elseif msg.content_.photo_ then
print("------ P H O T O ------")
elseif msg.content_.document_ then
print("------ D O C U M E N T ------")
elseif msg.content_.audio_  then
print("------ A U D I O ------")
elseif msg.content_.location_ then
print("------ L O C A T I O N ------")
elseif msg.content_.contact_ then
print("------ C O N T A C T ------")
end
----------------------------------------------------------------------------
if not database:get(SUDO.."timeclears:") then
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/animation/*")
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")
io.popen("rm -rf ~/.telegram-cli/data/encrypted/*")
database:setex(SUDO.."timeclears:", 7200, true)
bot.sendMessage(realm_id, 0, 1, '» تمامی فایل های اضافی ذخیره شده در سرور پاکسازی شدند.', 1, 'md')
print("------ All Cache Has Been Cleared ------")
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Ultrasudo
if text then
if is_ultrasudo(msg) then
-------------------------------------------------ForceJoin------------------------------------------------
if text == 'join on' then
if not database:get(SUDO.."forcejoin") then
database:set(SUDO.."forcejoin", true)
bot.sendMessage(msg.chat_id_, msg.id_, 1, "» حالت جوین اجباری روشن شد.", 1, 'md')
else
bot.sendMessage(msg.chat_id_, msg.id_, 1, "» حالت جوین اجباری روشن بود.", 1, 'md')
end
end
if text == 'join off' then
if database:get(SUDO.."forcejoin") then
database:del(SUDO.."forcejoin")
 bot.sendMessage(msg.chat_id_, msg.id_, 1, "» حالت جوین اجباری خاموش شد.", 1, 'md')
else
bot.sendMessage(msg.chat_id_, msg.id_, 1, "» حالت جوین اجباری خاموش بود.", 1, 'md')
end
end
-------------------------------------------------Forward------------------------------------------------
if text:match("^fwd (.*)") and msg.reply_to_message_id_ ~= 0 then
local action = text:match("^fwd (.*)")
if action == "sgps" then
local gp = database:smembers(SUDO.."botgps") or 0
local gps = database:scard(SUDO.."botgps") or 0
for i=1, #gp do
tdcli.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
end
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» پیام شما به '..gps..' سوپر گروه فوروارد شد.', 1, 'md')
elseif action == "gps" then
local gp = database:smembers(SUDO.."botgp") or 0
local gps = database:scard(SUDO.."botgp") or 0
for i=1, #gp do
tdcli.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
end
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» پیام شما به '..gps..' گروه فوروارد شد.', 1, 'md')
elseif action == "pv" then
local gp = database:smembers(SUDO.."usersbot") or 0
local gps = database:scard(SUDO.."usersbot") or 0
for i=1, #gp do
tdcli.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
end
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» پیام شما به '..gps..' کاربر فوروارد شد.', 1, 'md')
elseif action == "all" then
local gp = database:smembers(SUDO.."usersbot") or 0
local gpspv = database:scard(SUDO.."usersbot") or 0
for i=1, #gp do
tdcli.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
end
local gp = database:smembers(SUDO.."botgps") or 0
local gpss = database:scard(SUDO.."botgps") or 0
for i=1, #gp do
tdcli.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
end
local gp = database:smembers(SUDO.."botgp") or 0
local gps = database:scard(SUDO.."botgp") or 0
for i=1, #gp do
tdcli.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0)
end
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» پیام شما به '..gpss..' سوپر گروه , '..gps..' گروه و '..gpspv..' کاربر فوروارد شد.', 1, 'md')
end
end
-------------------------------------------------backUp------------------------------------------------
if text == 'backup' then
tdcli.sendDocument(SUDO, 0, 0, 1, nil, './bot.lua', dl_cb, nil)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» آخرین نسخه بک آپ برای شما ارسال شد.', 1, 'md')
end
-------------------------------------------------SetSudo------------------------------------------------
if text == 'setsudo' then
function prom_reply(extra, result, success)
database:sadd(SUDO..'sudo:',result.sender_user_id_)
local user = result.sender_user_id_
local text = '» کاربر ( '..user..' ) به برابچ سودو اضاف شد.'
SendMetion(msg.chat_id_, user, msg.id_, text, 10, string.len(user))
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end
end
if text == 'remsudo' then
function prom_reply(extra, result, success)
database:srem(SUDO..'sudo:',result.sender_user_id_)
local text = '» کاربر ( '..result.sender_user_id_..' ) از برابچ سودو حذف شد.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 10, string.len(result.sender_user_id_))
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)  
end
end
end
------------------------------------------------------------------------------------------------------
if is_sudo(msg) then
-------------------------------------------------SetRank------------------------------------------------
if text:match('^setrank (.*)') then
local rank = text:match('setrank (.*)')
 function setrank(extra, result, success)
database:set('ranks:'..result.sender_user_id_, rank)
local text = '» لقب کاربر ( '..result.sender_user_id_..' ) به ( '..rank..' ) تنظیم شد.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 14, string.len(result.sender_user_id_))
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),setrank)  
end
end
-------------------------------------------------BanAll------------------------------------------------
if text == 'banall' then
if msg.reply_to_message_id_ == 0 then
local user = msg.sender_user_id_
else
function banreply(extra, result, success)
banall(msg,msg.chat_id_,result.sender_user_id_)
end
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),banreply)
end
if text:match('^banall @(.*)') then
local username = text:match('banall @(.*)')
function banusername(extra,result,success)
if result.id_ then
banall(msg,msg.chat_id_,result.id_)
else 
text = '» دسترسی لازم را از طرف تلگرام ندارم!'
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
bot.resolve_username(username,banusername)
end
if text:match('^banall (%d+)') then
banall(msg,msg.chat_id_,text:match('banall (%d+)'))
end
if text == 'unbanall' then
if msg.reply_to_message_id_ == 0 then
local user = msg.sender_user_id_
else
function unbanreply(extra, result, success)
unbanall(msg,msg.chat_id_,result.sender_user_id_)
end
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply)
end	
if text:match('^unbanall (%d+)') then
unbanall(msg,msg.chat_id_,text:match('unbanall (%d+)'))
end
if text:match('^unbanall @(.*)') then
local username = text:match('unbanall @(.*)')
function unbanusername(extra,result,success)
if result.id_ then
unbanall(msg,msg.chat_id_,result.id_)
else 
text = '» دسترسی لازم را از طرف تلگرام ندارم!'
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
bot.resolve_username(username,unbanusername)
end
-------------------------------------------------Leave------------------------------------------------
if text == 'leave' then
bot.changeChatMemberStatus(msg.chat_id_, bot_id, "Left")
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» ربات با موفقیت از گروه خارج شد.', 1, 'md')
end
-------------------------------------------------SetOwner------------------------------------------------
if text == 'setowner' then
function prom_reply(extra, result, success)
database:sadd(SUDO..'owners:'..msg.chat_id_,result.sender_user_id_)
local user = result.sender_user_id_
local text = '» کاربر ( '..user..' ) به مالک ربات تنظیم شد.'
SendMetion(msg.chat_id_, user, msg.id_, text, 10, string.len(user))
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end
end
if text:match('^setowner @(.*)') then
local username = text:match('^setowner @(.*)')
function promreply(extra,result,success)
if result.id_ then
database:sadd(SUDO..'owners:'..msg.chat_id_,result.id_)
SendMetion(msg.chat_id_, result.id_, msg.id_, '» کاربر ( '..result.id_..' ) به مالک ربات تنظیم شد.' , 10, string.len(result.id_))
else 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» دسترسی لازم را از طرف تلگرام ندارم!', 1, 'md')
end
end
bot.resolve_username(username,promreply)
end
if text and text:match('^setowner (%d+)') then
local user = text:match('setowner (%d+)')
database:sadd(SUDO..'owners:'..msg.chat_id_,user)
local text = '» کاربر ( '..user..' ) به مالک ربات تنظیم شد.'
SendMetion(msg.chat_id_, user, msg.id_, text, 10, string.len(user))
end
if text == 'remowner' then
function prom_reply(extra, result, success)
database:srem(SUDO..'owners:'..msg.chat_id_,result.sender_user_id_)
local text = '» کاربر ( '..result.sender_user_id_..' )  از مالکیت ربات حذف شد.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 10, string.len(result.sender_user_id_))
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)  
end
end
if text:match('^remowner @(.*)') then
local username = text:match('^remowner @(.*)')
function demreply(extra,result,success)
  if result.id_ then
database:srem(SUDO..'owners:'..msg.chat_id_,result.id_)
SendMetion(msg.chat_id_, result.id_, msg.id_, '• User [ '..result.id_..' ] Was Removed To The Group Owner List !' , 9, string.len(result.id_))
else 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» دسترسی لازم را از طرف تلگرام ندارم!', 1, 'md')
end
end
bot.resolve_username(username,demreply)
end
if text and text:match('^remowner (%d+)') then
local user = text:match('remowner (%d+)')
database:srem(SUDO..'owners:'..msg.chat_id_,user)
local text = '» کاربر ( '..user..' )  از مالکیت ربات حذف شد.'
SendMetion(msg.chat_id_, user, msg.id_, text, 10, string.len(user))
end
if text == 'clean ownerlist' then
database:del(SUDO..'owners:'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لیست مالکین ربات پاکسازی شد.', 1, 'md')
end
end
-------------------------------------------------Reload------------------------------------------------
if text == 'reload' and is_sudo(msg) then
dofile('bot.lua') 
io.popen("rm -rf ~/.telegram-cli/data/animation/*")
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*")
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» تمامی سیستم و فایل های ربات بروز شدند.', 1, 'md')
end
-------------------------------------------------Stats------------------------------------------------
if text == 'stats' and is_sudo(msg) then
local users = database:scard(SUDO.."usersbot")
local sgpsm = database:get(SUDO..'sgpsmessage:')
local gpsm = database:get(SUDO..'gpsmessage:')
local pvm = database:get(SUDO..'pvmessage:')
local gp = database:scard(SUDO.."botgp")
local gps = database:scard(SUDO.."botgps")
local allmgs = database:get(SUDO.."allmsg")
bot.sendMessage(msg.chat_id_, msg.id_, 1, '• آمار ربات راکتانس عبارتند از :\n\n» تعداد سوپر گروه ها : [`'..gps..'`]\n» تعداد پیام های دریافتی در سوپر گروه ها : [`'..sgpsm..'`]\n\n» تعداد گروه ها : [`'..gp..'`]\n» تعداد پیام های دریافتی در گروه ها : [`'..gpsm..'`]\n\n» تعداد کاربران ربات : [`'..users..'`]\n» تعداد پیام های دریافتی از کاربران : [`'..pvm..'`]\n\n» تعداد تمامی پیام های دریافتی ربات : [ `'..allmgs..'` ]\n\n➲ @ReactanceTeam', 1, 'md')
end
 if text == 'reset stats' and is_sudo(msg) then
database:del(SUDO.."allmsg")
database:del(SUDO.."botgps")
database:del(SUDO.."botgp")
database:del(SUDO.."usersbot")
database:del(SUDO..'sgpsmessage:')
database:del(SUDO..'gpsmessage:')
database:del(SUDO..'pvmessage:')
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» آمار ربات بروز شد.', 1, 'html')
end
-----------------------------------------------------------------------------------------------------
-- owner
if is_owner(msg) then
-------------------------------------------------Config------------------------------------------------
if text == 'config' then
local function promote_admin(extra, result, success)
vardump(result)
local chat_id = msg.chat_id_
local admins = result.members_
for i=1 , #admins do
if database:sismember(SUDO..'mods:'..msg.chat_id_,admins[i].user_id_) then
else
database:sadd(SUDO..'mods:'..msg.chat_id_,admins[i].user_id_)
end
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» ادمین های گروه در ربات ترفیع یافتند.', 1, 'md')
end
bot.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
end
-------------------------------------------------CleanBots------------------------------------------------
if text == 'clean bots' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
kick(msg,msg.chat_id_,bots[i].user_id_)
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» ربات های (Api) اخراج شدند.', 1, 'md')
end
bot.channel_get_bots(msg.chat_id_,cb)
end
-------------------------------------------------Setlink------------------------------------------------
if text and text:match('^setlink (.*)') then
local link = text:match('setlink (.*)')
database:set(SUDO..'grouplink'..msg.chat_id_, link)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لینک درخواستی با موفقیت ثبت شد.', 1, 'md')
end
if text == 'remlink' then
database:del(SUDO..'grouplink'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لینک ثبت شده حذف شد.', 1, 'md')
end
-------------------------------------------------SetlRules------------------------------------------------
if text == 'remrules' then
database:del(SUDO..'grouprules'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» قوانین ثبت شده حذف شد.', 1, 'md')
end
if text and text:match('^setrules (.*)') then
local link = text:match('setrules (.*)')
database:set(SUDO..'grouprules'..msg.chat_id_, link)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» قوانین درخواستی با موفقیت ثبت شد.', 1, 'md')
end
-------------------------------------------------Welcome------------------------------------------------
if text == 'welcome enable' then
database:set(SUDO..'status:welcome:'..msg.chat_id_,'enable')
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» پیام خوشامد گویی فعال شد.', 1, 'md')
end
if text == 'welcome disable' then
database:set(SUDO..'status:welcome:'..msg.chat_id_,'disable')
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» پیام خوشامد گویی غیرفعال شد.', 1, 'md')
end
if text and text:match('^setwelcome (.*)') then
local welcome = text:match('^setwelcome (.*)')
database:set(SUDO..'welcome:'..msg.chat_id_,welcome)
local t = '» پیام خوشامد گویی با موفقیت ثبت شد.\n\nپیام خوشامد گویی :\n{ '..welcome..' }'
bot.sendMessage(msg.chat_id_, msg.id_, 1,t, 1, 'html')
end
if text == 'rem welcome' then
database:del(SUDO..'welcome:'..msg.chat_id_,welcome)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» پیام خوشامد گویی به حالت اولیه بازگشت.', 1, 'md')
end
-------------------------------------------------OwnerList------------------------------------------------
if text == 'ownerlist' then
local list = database:smembers(SUDO..'owners:'..msg.chat_id_)
local t = '» لیست مالکین گروه :\n\n'
for k,v in pairs(list) do
t = t..k.." - `[ "..v.." ]`\n" 
end
if #list == 0 then
t = '» لیست مالکین گروه خالی شد.'
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end
-------------------------------------------------Promote Part-------------------------------------------------
if text == 'promote' then
function prom_reply(extra, result, success)
database:sadd(SUDO..'mods:'..msg.chat_id_,result.sender_user_id_)
local user = result.sender_user_id_
local text = '» کاربر  ( '..user..' ) به لیست مدیران گروه اضافه شد.'
SendMetion(msg.chat_id_, user, msg.id_, text, 11, string.len(user))
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)  
end
end
if text:match('^promote @(.*)') then
local username = text:match('^promote @(.*)')
function promreply(extra,result,success)
if result.id_ then
database:sadd(SUDO..'mods:'..msg.chat_id_,result.id_)
SendMetion(msg.chat_id_, result.id_, msg.id_, '• User [ '..result.id_..' ] Was Added To The Group Promote List !' , 9, string.len(result.id_))
else 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» دسترسی لازم را از طرف تلگرام ندارم!', 1, 'md')
end
end
bot.resolve_username(username,promreply)
end
if text and text:match('^promote (%d+)') then
local user = text:match('promote (%d+)')
database:sadd(SUDO..'mods:'..msg.chat_id_,user)
mbb = '» کاربر  ( '..user..' ) به لیست مدیران گروه اضافه شد.'
SendMetion(msg.chat_id_, user, msg.id_, mbb, 9, string.len(user))
end
if text == 'demote' then
function prom_reply(extra, result, success)
database:srem(SUDO..'mods:'..msg.chat_id_,result.sender_user_id_)
sos = '» کاربر  ( '..result.sender_user_id_..' ) از لیست مدیران گروه حذف شد.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, sos,11, string.len(result.sender_user_id_))
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)  
end
end
if text:match('^demote @(.*)') then
local username = text:match('^demote @(.*)')
function demreply(extra,result,success)
if result.id_ then
database:srem(SUDO..'mods:'..msg.chat_id_,result.id_)
SendMetion(msg.chat_id_, result.id_, msg.id_, '• User [ '..result.id_..' ] Was Removed To The Group Promote List !' , 9, string.len(result.id_))
else 
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» دسترسی لازم را از طرف تلگرام ندارم!', 1, 'md')
end
end
bot.resolve_username(username,demreply)
end
if text and text:match('^demote (%d+)') then
  local user = text:match('demote (%d+)')
 database:srem(SUDO..'mods:'..msg.chat_id_,user)
text = '» کاربر  ( '..user..' ) از لیست مدیران گروه حذف شد.'
SendMetion(msg.chat_id_, user, msg.id_, mbb,11, string.len(user))
end
end
end
if text == 'promotelist' then
local list = database:smembers(SUDO..'mods:'..msg.chat_id_)
local t = '» لیست مدیران گروه :\n\n'
for k,v in pairs(list) do
t = t..k.." - `"..v.."`\n" 
end
if #list == 0 then
t = '» لیست مدیران گروه خالی میباشد.'
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end
if text == 'clean promotelist' then
database:del(SUDO..'mods:'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لیست مدیران گروه پاکسازی شد.', 1, 'md')
 end
-------------------------------------------------Clean blocklist------------------------------------------------
if text == 'clean blocklist' and is_owner(msg) then
local function removeblocklist(extra, result)
if tonumber(result.total_count_) == 0 then 
bot.sendMessage(msg.chat_id_, msg.id_, 0,'» بلاک لیست گروه خالی میباشد.', 1, 'md')
else
local x = 0
for x,y in pairs(result.members_) do
x = x + 1
bot.changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
end
bot.sendMessage(msg.chat_id_, msg.id_, 0,'» بلاک لیست گروه پاکسازی شد.', 1, 'md')
end
end
bot.getChannelMembers(msg.chat_id_, 0, 'Kicked', 200, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_}) 
end
-------------------------------------------------CleaNDeleted------------------------------------------------
if text == 'clean deleted' and is_owner(msg) then
local function deleteaccounts(extra, result)
for k,v in pairs(result.members_) do 
local function cleanaccounts(extra, result)
if not result.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked")
end
end
bot.getUser(v.user_id_, cleanaccounts, nil)
 end 
bot.sendMessage(msg.chat_id_, msg.id_, 0,'» کاربران پاک شده از گروه حذف شدند.', 1, 'md')
end 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1000}, deleteaccounts, nil)
end
----------------------------------------------------------------------------------------------------
-- mods
if is_mod(msg) then
-------------------------------------------------Warn------------------------------------------------
if text and text:match('^warnmax (%d+)') then
local num = text:match('^warnmax (%d+)')
if 2 > tonumber(num) or tonumber(num) > 10 then
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» عددی بین 2 تا 10 وارد کنید.', 1, 'md')
else
database:hset("warn:"..msg.chat_id_ ,"warnmax" ,num)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» اخطار به ( '..num..' ) عدد تنظیم شد.', 1, 'md')
end
end
if is_owner(msg) then
if text == 'setwarn kick' then
database:hset("warn:"..msg.chat_id_ ,"swarn",'kick') 
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» وضعیت اخطار به حالت اخراج تنظیم شد.', 1, 'html')
elseif text == 'setwarn ban' then
database:hset("warn:"..msg.chat_id_ ,"swarn",'ban') 
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» وضعیت اخطار به حالت مسدود تنظیم شد.', 1, 'html')
elseif text == 'setwarn mute' then
database:hset("warn:"..msg.chat_id_ ,"swarn",'mute') 
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» وضعیت اخطار به حالت سکوت تنظیم شد.', 1, 'html')
end
end
if text == 'warn' and tonumber(msg.reply_to_message_id_) > 0 then
function warn_by_reply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
bot.sendMessage(msg.chat_id_, msg.id_, 1,'باشه باعی', 1, 'md')
return false
end
if priv(msg.chat_id_,result.sender_user_id_) then
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» کاربر مورد نظر جزو ( مالکین | سازندگان ) ربات میباشد!', 1, 'md')
else
local nwarn = tonumber(database:hget("warn:"..result.chat_id_,result.sender_user_id_) or 0)
local wmax = tonumber(database:hget("warn:"..result.chat_id_ ,"warnmax") or 3)
if nwarn == wmax then
database:hset("warn:"..result.chat_id_,result.sender_user_id_,0)
warn(msg,msg.chat_id_,result.sender_user_id_)
else 
database:hset("warn:"..result.chat_id_,result.sender_user_id_,nwarn + 1)
local text = '» کاربر ( '..result.sender_user_id_..' ) شما از مدیران ('..(nwarn + 1)..'/'..wmax..') اخطار دریافت کردید.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 10, string.len(result.sender_user_id_))
end  
end
end 
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),warn_by_reply)
end
if text == 'unwarn' and tonumber(msg.reply_to_message_id_) > 0 then
function unwarn_by_reply(extra, result, success)
if priv(msg.chat_id_,result.sender_user_id_) then
else
if not database:hget("warn:"..result.chat_id_,result.sender_user_id_) then
local text = '» کاربر ( '..result.sender_user_id_..' ) هیچ اخطاری ندارد.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 10, string.len(result.sender_user_id_))
local warnhash = database:hget("warn:"..result.chat_id_,result.sender_user_id_)
else database:hdel("warn:"..result.chat_id_,result.sender_user_id_,0)
local text = '» کاربر ( '..result.sender_user_id_..' ) تمام اخطار هایش پاکسازی شدند.'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 10, string.len(result.sender_user_id_))
end
end
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unwarn_by_reply)
end
-------------------------------------------------Help------------------------------------------------
if text and text:match('^help') and check_user(msg) and not msg.forward_info_ then
bot.sendMessage(msg.chat_id_, msg.id_, 0,'⚡» برای مشاهده راهنما بر روی لینک زیر کلیک کنید :\n\n» https://t.me/TiniGerHelp/3', 1, 'md')
end
-------------------------------------------------Settings------------------------------------------------
local function getsettings(value)
if value == 'muteall' then
local hash = database:get(SUDO..'muteall'..msg.chat_id_)
if hash then
return '( فعال ✓ )'
else
return '( غیرفعال ✘ )'
end
elseif value == 'welcome' then
local hash = database:get(SUDO..'welcome:'..msg.chat_id_)
if hash == 'enable' then
return '( فعال ✓ )'
else
return '( غیرفعال ✘ )'
end
elseif value == 'spam' then
local hash = database:hget("flooding:settings:"..msg.chat_id_,"flood")
if hash then
 if database:hget("flooding:settings:"..msg.chat_id_, "flood") == "kick" then
return '( فعال - اخراج )'
elseif database:hget("flooding:settings:"..msg.chat_id_,"flood") == "ban" then
return '( فعال - مسدود )'
elseif database:hget("flooding:settings:"..msg.chat_id_,"flood") == "mute" then
return '( فعال - سکوت )'
end
 else
return '( غیرفعال ✘ )'
end
elseif is_lock(msg,value) then
return  '( فعال ✓ )'
 else
return '( غیرفعال ✘ )'
end
end
 ---------------------------------------------------
if text == 'settings' then
local wmax = tonumber(database:hget("warn:"..msg.chat_id_ ,"warnmax") or 3)
local text = '» تنظیمات اصلی گروه :\n\n'
..'> قفل لینک : '..getsettings('link')..'\n'
..'> قفل ربات : '..getsettings('bot')..'\n\n'
..'> قفل تگ : '..getsettings('tag')..'\n'
..'> قفل رگبار : '..getsettings('spam')..'\n\n'
..'> قفل یوزرنیم : '..getsettings('username')..'\n'
..'> قفل فوروارد : '..getsettings('forward')..'\n\n'
..'> تعداد رگبار : [ '..NUM_MSG_MAX..' ]\n'
..'> زمان رگبار : [ '..TIME_CHECK..' ]\n\n\n'
..'» تنظیمات فرعی گروه :\n\n'
..'> قفل پاسخ : '..getsettings('reply')..'\n'
.. '> قفل فحش : '..getsettings('fosh')..'\n\n'
 ..'> قفل ورودی : '..getsettings('join')..'\n'
..'> قفل فارسی : '..getsettings('persian')..'\n\n'
..'> قفل سنجاق : '..getsettings('pin')..'\n'
.. '> قفل ایموجی : '..getsettings('emoji')..'\n\n'
.. '> قفل دستورات : '..getsettings('cmd')..'\n'
..'> خوشامد گویی : '..getsettings('welcome')..'\n\n'
..'> قفل انگیلیسی : '..getsettings('english')..'\n'
.. '> قفل فیلم سلفی : '..getsettings('selfvideo')..'\n\n'
..'> قفل پیام سرویسی : '..getsettings('tgservice')..'\n'
..'> قفل دکمه شیشه ای : '..getsettings('inline')..'\n\n\n'
..'» تنظیمات رسانه گروه :\n\n'
..'> قفل صدا : '..getsettings('voice')..'\n'
..'> قفل گیف : '..getsettings('gif')..'\n\n'
..'> قفل فایل : '..getsettings('file')..'\n'
..'> قفل متن : '..getsettings('text')..'\n\n'
..'> قفل فیلم : '..getsettings('video')..'\n'
 ..'> قفل بازی : '..getsettings('game')..'\n\n'
..'> قفل عکس : '..getsettings('photo')..'\n'
..'> قفل موزیک : '..getsettings('music')..'\n\n'
..'> قفل استیکر : '..getsettings('sticker')..'\n'
..'> قفل مخاطب : '..getsettings('contact')..'\n\n\n'
.."» اطلاعات گروه :\n\n"
.."> تعداد اخطار : ( `"..wmax.."/10` )\n"
..'> قفل گروه : '..getsettings('muteall')..'\n\n'
.."> آیدی شخص : ( `"..msg.sender_user_id_.."` )\n"
.."> آیدی گروه : ( `"..msg.chat_id_.."` )\n\n"
.."► @TinigerTeaM\n"
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
-------------------------------------------------Flood------------------------------------------------
if text and text:match('^setfloodmax (%d+)$') then
database:hset("flooding:settings:"..msg.chat_id_ ,"floodmax" ,text:match('setfloodmax (.*)'))
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» حداکثر ارسال رگبار به ( `'..text:match('setfloodmax (.*)')..'` ) تنظیم شد.', 1, 'md')
end
if text and text:match('^setfloodtime (%d+)$') then
database:hset("flooding:settings:"..msg.chat_id_ ,"floodtime" ,text:match('setfloodtime (.*)'))
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» حداکثر زمان ارسال رگبار به ( `'..text:match('setfloodtime (.*)')..'` ) تنظیم شد.', 1, 'md')
end
-------------------------------------------------Link------------------------------------------------
if text == 'link' then
local link = database:get(SUDO..'grouplink'..msg.chat_id_) 
if link then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» لینک گروه :  \n'..link, 1, 'md')
else
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» لینکی برای گروه تنظیم نشده است !', 1, 'md')
end
end
-------------------------------------------------Rules-------------------------------------------------
if text == 'rules' then
local rules = database:get(SUDO..'grouprules'..msg.chat_id_) 
if rules then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قوانین گروه : \n'..rules, 1, 'md')
else
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قانونی برای گروه تنظیم نشده است !', 1, 'md')
end
end
-------------------------------------------------MuteChat-------------------------------------------------
if text == 'mutechat' then
database:set(SUDO..'muteall'..msg.chat_id_,true)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل گفتگو فعال شد .', 1, 'md')
end
if text == 'unmutechat' then
database:del(SUDO..'muteall'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» قفل گفتگو غیرفعال شد .', 1, 'md')
end
-------------------------------------------------Ban-------------------------------------------------
if text == 'kick' and tonumber(msg.reply_to_message_id_) > 0 then
function kick_by_reply(extra, result, success)
kick(msg,msg.chat_id_,result.sender_user_id_)
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kick_by_reply)
end
if text and text:match('^kick (%d+)') then
kick(msg,msg.chat_id_,text:match('kick (%d+)'))
end
if text and text:match('^kick @(.*)') then
local username = text:match('kick @(.*)')
function kick_username(extra,result,success)
if result.id_ then
kick(msg,msg.chat_id_,result.id_)
else 
 bot.sendMessage(msg.chat_id_, msg.id_, 1, '» دسترسی لازم را از طرف تلگرام ندارم!', 1, 'md')
end
end
bot.resolve_username(username,kick_username)
end
-------------------------------------------------Ban-------------------------------------------------
if text == 'ban' and tonumber(msg.reply_to_message_id_) > 0 then
function banreply(extra, result, success)
ban(msg,msg.chat_id_,result.sender_user_id_)
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),banreply)
end
if text and text:match('^ban (%d+)') then
ban(msg,msg.chat_id_,text:match('ban (%d+)'))
end
if text and text:match('^ban @(.*)') then
local username = text:match('ban @(.*)')
function banusername(extra,result,success)
if result.id_ then
ban(msg,msg.chat_id_,result.id_)
else 
text = '» دسترسی لازم را از طرف تلگرام ندارم!'
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
bot.resolve_username(username,banusername)
end
if text == 'unban' and tonumber(msg.reply_to_message_id_) > 0 then
function unbanreply(extra, result, success)
unban(msg,msg.chat_id_,result.sender_user_id_)
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply)
end
if text and text:match('^unban (%d+)') then
unban(msg,msg.chat_id_,text:match('unban (%d+)'))
end
if text and text:match('^unban @(.*)') then
local username = text:match('unban @(.*)')
function unbanusername(extra,result,success)
if result.id_ then
unban(msg,msg.chat_id_,result.id_)
else 
text = '» دسترسی لازم را از طرف تلگرام ندارم!'
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
bot.resolve_username(username,unbanusername)
end
if text == 'banlist' then
local list = database:smembers(SUDO..'banned'..msg.chat_id_)
local t = '» لیست افراد مسدود شده :\n\n'
for k,v in pairs(list) do
t = t..k.." - `"..v.."`\n" 
end
if #list == 0 then
t = '» لیست افراد مسدود شده خالی میباشد.'
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end
if text == 'clean banlist' then
database:del(SUDO..'banned'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لیست افراد مسدود شده پاکسازی شد.', 1, 'md')
end
-------------------------------------------------Silent-------------------------------------------------
if text == 'silent' and tonumber(msg.reply_to_message_id_) > 0 then
function mutereply(extra, result, success)
mute(msg,msg.chat_id_,result.sender_user_id_)
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),mutereply)
end
if text and text:match('^silent (%d+)') then
mute(msg,msg.chat_id_,text:match('silent (%d+)'))
end
if text and text:match('^silent @(.*)') then
local username = text:match('silent @(.*)')
function muteusername(extra,result,success)
if result.id_ then
mute(msg,msg.chat_id_,result.id_)
else 
text = '» دسترسی لازم را از طرف تلگرام ندارم!'
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
bot.resolve_username(username,muteusername)
end
if text == 'unsilent' and tonumber(msg.reply_to_message_id_) > 0 then
function unmutereply(extra, result, success)
unmute(msg,msg.chat_id_,result.sender_user_id_)
end
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unmutereply)
end
if text and text:match('^unsilent (%d+)') then
unmute(msg,msg.chat_id_,text:match('unsilent (%d+)'))
end
if text and text:match('^unsilent @(.*)') then
local username = text:match('unsilent @(.*)')
function unmuteusername(extra,result,success)
if result.id_ then
unmute(msg,msg.chat_id_,result.id_)
else 
text = '» دسترسی لازم را از طرف تلگرام ندارم!'
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end
bot.resolve_username(username,unmuteusername)
end
if text == 'silentlist' then
local list = database:smembers(SUDO..'mutes'..msg.chat_id_)
local t = '» لیست افراد سکوت شده :\n\n'
for k,v in pairs(list) do
t = t..k.." - `"..v.."`\n" 
end
if #list == 0 then
t = '» لیست افراد سکوت شده خالی میباشد.'
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end      
if text == 'clean silentlist' then
database:del(SUDO..'mutes'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لیست افرادی که در حالت سکوت هستند پاکسازی شد.', 1, 'md')
end
-------------------------------------------------DeleteMessages-------------------------------------------------
if text and text:match('^del (%d+)$') then
local limit = tonumber(text:match('^del (%d+)$'))
if limit > 100 then
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» شما در هر بار پاکسازی فقط میتوانید ( 100 ) پیام گروه را پاک کنید!', 1, 'md')
else
function cb(a,b,c)
local msgs = b.messages_
 for i=1 , #msgs do
delete_msg(msg.chat_id_,{[0] = b.messages_[i].id_})
end
end
bot.getChatHistory(msg.chat_id_, 0, 0, limit + 1,cb)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» تعداد ( `'..limit..'` ) پیام گروه پاک شد.', 1, 'md')
end
end
if tonumber(msg.reply_to_message_id_) > 0 then
if text == "del" then
delete_msg(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})
end	
end
-------------------------------------------------Filter Word-------------------------------------------------
if text and text:match('^filter (.*)') then
local w = text:match('^filter (.*)')
database:sadd(SUDO..'filters:'..msg.chat_id_,w)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» عبارت ( '..w..' ) به لیست کلمات فیلتر شده اضافه شد.', 1, 'html')
end
if text and text:match('^unfilter (.*)') then
local w = text:match('^unfilter (.*)')
database:srem(SUDO..'filters:'..msg.chat_id_,w)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» عبارت ( '..w..' ) از لیست کلمات فیلتر شده حذف شد.', 1, 'html')
end
if text == 'clean filterlist' then
database:del(SUDO..'filters:'..msg.chat_id_)
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» لیست کلمات فیلتر شده پاکسازی شد.', 1, 'md')
end
if text == 'filterlist' then
local list = database:smembers(SUDO..'filters:'..msg.chat_id_)
local t = '» لیست کلمات فیلتر شده :\n\n'
for k,v in pairs(list) do
t = t..k.." - "..v.."\n" 
end
if #list == 0 then
t = '» لیست کلمات فیلتر شده خالی میباشد.'
end
bot.sendMessage(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end
-------------------------------------------------Pin-------------------------------------------------
if text == 'pin' and msg.reply_to_message_id_ ~= 0 then
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,0)
bot.sendMessage(msg.chat_id_, msg.reply_to_message_id_, 1, "» پیام انتخابی شما سنجاق شد.", 1, 'md')
end
-------------------------------------------------Whois-------------------------------------------------
if msg_type == 'text' then
if text then
if text:match('^whois @(.*)') then
local username = text:match('^whois @(.*)')
 function id_by_username(extra,result,success)
if result.id_ then
 text = '*• User ID :* [ `'..result.id_..'` ]\n*• Number Of Messages Sent :* [ `'..(database:get(SUDO..'total:messages:'..msg.chat_id_..':'..result.id_) or 0)..'` ]'
else 
 text = '» دسترسی لازم را از طرف تلگرام ندارم!'
end
bot.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
bot.resolve_username(username,id_by_username)
end
if text and text:match('whois (%d+)') then
local id = text:match('whois (%d+)')
local text = 'برای مشاهده شخص کلیک کنید!'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=26, user_id_=id}}}}, dl_cb, nil)
end
if text == "whois" then
function id_by_reply(extra, result, success)
bot.sendMessage(msg.chat_id_, msg.id_, 1, '» آیدی شخص : ( `'..result.sender_user_id_..'` )\n» تعداد پیام های شخص : ( `'..(database:get(SUDO..'total:messages:'..msg.chat_id_..':'..result.sender_user_id_) or 0)..'` )', 1, 'md')
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
bot.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),id_by_reply)
end
end
end
end
end
-------------------------------------------------Memeber-------------------------------------------------
-------------------------------------------------Memeber-------------------------------------------------
-------------------------------------------------Memeber-------------------------------------------------
-------------------------------------------------GroupActive-------------------------------------------------
if text and text:match('^[Aa]ctive') and not database:get(SUDO.."active:"..msg.chat_id_) then
database:set(SUDO.."active:"..msg.chat_id_, true)
bot.sendMessage(msg.chat_id_, msg.id_, 1, 'شما در حال نصب ربات برای گروه خود میباشید !\n\n\nلطفا برای تکمیل کردن نصب دستور زیر را وارد کنید :\n\n/setme\n\nبا وارد کردن این دستور شما مالک ربات میشوید !\n\n► @TiniGerTeaM', 1, 'html')
tdcli.forwardMessages(realm_id, msg.chat_id_,{[0] = msg.id_}, 0)
elseif text and text:match('^[Ss]etme') and not database:get(SUDO.."omg:"..msg.chat_id_) then
database:sadd(SUDO.."owners:"..msg.chat_id_, msg.sender_user_id_)
database:set(SUDO.."omg:"..msg.chat_id_, true)
bot.sendMessage(msg.chat_id_, msg.id_, 1, 'شما با موفیت به عنوان مالک ربات تنظیم شدید.\n\n\nلطفا برای دریافت راهنما دستور زیر را ارسال کنید :\n\n/help\n\nدر صورت بروز هرگونه مشکلی کافی است به @MrKarimFar یا @MrPars پیام بدید.\n\n► @TiniGerTeaM', 1, 'html')
tdcli.forwardMessages(realm_id, msg.chat_id_,{[0] = msg.id_}, 0)
end
-------------------------------------------------Bot-------------------------------------------------
if text == "ربات" then
if database:get('ranks:'..msg.sender_user_id_) then
local rank =  database:get('ranks:'..msg.sender_user_id_) 
local  k = {"چه عجب","جونم","جانم","بنال","چیه همش صدام میکنی","خستم کردی","بلههه" ,"بگو"}
bot.sendMessage(msg.chat_id_, msg.id_, 1,''..k[math.random(#k)]..' '..rank..'',1,'md') 
else
local p = {"چه عجب","😕","جونم","جانم","😐","بنال","چیه همش صدام میکنی","😐","خستم کردی","بلههه","😕" ,"بگو","😐","😕"}
bot.sendMessage(msg.chat_id_, msg.id_, 1,''..p[math.random(#p)]..'', 1, 'html')
end
end
-------------------------------------------------CheckMute-------------------------------------------------
if text and msg_type == 'text' and not is_muted(msg.chat_id_,msg.sender_user_id_) then
-------------------------------------------------Me-------------------------------------------------
if text == 'me' then
local rank =  database:get('ranks:'..msg.sender_user_id_) or 'مقامی برای شما ثبت نشده است !'
local msgs = database:get(SUDO..'total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)
if is_ultrasudo(msg) then
t = 'مدیر اصلی ربات'
elseif is_sudo(msg) then
t = 'مدیر ربات'
elseif is_owner(msg) then
t = 'مالک گروه'
elseif is_mod(msg) then
t = 'مدیر گروه'
else
t = 'فرد عادی'
end
local text = '• اطلاعات درخواستی شما :\n\n» آیدی شما : ( '..msg.sender_user_id_..' )\n» آیدی گروه : ( '..msg.chat_id_..' )\n» سطح دسترسی : ( '..t..' )\n» تعداد پیام های شما : ( '..msgs..' )\n» مقام شما : ( '..rank..' )\n\n► @TiniGerTeaM'
SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, text, 41, string.len(msg.sender_user_id_))
end
-------------------------------------------------Ping-------------------------------------------------
if text and text:match("^[Pp]ing$") then
bot.sendMessage(msg.chat_id_, msg.id_, 1,'Bot Is Online', 1, 'html')
end
-------------------------------------------------Insta-------------------------------------------------
if text and text:match("^insta (.*)$") then
text = text:match("^insta (.*)$")
url = 'https://i.reloadlife.me/instagram/userinfo?username='..text
local res = http.request(url) 
local js = json:decode(res)
bio = js.result.biography or '---'
follw = js.result.followers
follwing = js.result.following
fn = js.result.full_name or '---'
postnum = js.result.posts or '---'
bot.sendMessage(msg.chat_id_, msg.id_, 1,'• اطلاعات صفحه درخواستی :\n\n» بیوگرافی :\n( '..bio..' )\n\n» دنبال کننده ها : ( '..follw..' )\n\n» دنبال شده ها : ( '..follwing..' )\n\n» نام کامل : ( '..fn..' )\n\n» پسوند : ( '..text..' )\n\n» پست ها : ( '..postnum..' )\n\n► @TiniGeTeaM', 1, 'html')
 end
 -------------------------------------------------ID-------------------------------------------------
if text == "id" or text == "Id" or text == "آیدی" or text == "ایدی" or text == "ID" then
if check_user(msg) then
if msg.reply_to_message_id_ == 0 then
local rank =  database:get('ranks:'..msg.sender_user_id_) or 'مقامی برای شما ثبت نشده است !'
local gmsgs = database:get(SUDO..'groupmsgkk:'..msg.chat_id_..':')
local msgs = database:get(SUDO..'total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,'» آیدی شما : ( '..msg.sender_user_id_..' )\n» آیدی گروه : ( '..msg.chat_id_..' )\n» تعداد پیام های شما : ( '..msgs..' )\n» تعداد پیام های گروه : ( '..gmsgs..' )\n» مقام شما : ( '..rank..' )\n► @TiniGerTeaM')
else
bot.sendMessage(msg.chat_id_, msg.id_, 1,'» پروفایلی برای شما ثبت نشده است!\n\n» آیدی شما : ( '..msg.sender_user_id_..' )\n\n» آیدی گروه : ( '..msg.chat_id_..' )\n\n» تعداد پیام های شما : ( '..msgs..' )\n\n» تعداد پیام های گروه : ( '..gmsgs..' )\n\n» مقام شما : ( '..rank..' )\n\n► @TiniGerTeaM', 1, 'md')
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
end
end
-------------------------------------------------Terminal-------------------------------------------------
if text and text:match("^[lL][uU][aA] (.*)") and is_ultrasudo(msg) then
local text = text:match("^[lL][uU][aA] (.*)")
local output = loadstring(text)()
if output == nil then
output = ""
elseif type(output) == "table" then
output = serpent.block(output, {comment = false})
else
utput = "" .. tostring(output)
end
bot.sendMessage(msg.chat_id_, msg.sender_user_id_, 1,output, 1, 'html')
end
end
end
end
-------------------------------------------------End-------------------------------------------------
-------------------------------------------------End-------------------------------------------------
-------------------------------------------------End-------------------------------------------------
function tdcli_update_callback(data)
if (data.ID == "UpdateNewMessage") then
run(data.message_,data)
elseif (data.ID == "UpdateMessageEdited") then
data = data
local function edited_cb(extra,result,success)
run(result,data)
end
tdcli_function ({
ID = "GetMessage",
chat_id_ = data.chat_id_,
message_id_ = data.message_id_
}, edited_cb, nil)
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({
ID="GetChats",
offset_order_="9223372036854775807",
offset_chat_id_=0,
limit_=20
}, dl_cb, nil)
end
end

-- Create By @Mehdi_Yt
