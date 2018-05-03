storm = dofile('./utils.lua') URL = require('socket.url') HTTPS = require("ssl.https") json = dofile('./JSON.lua') URL = require "socket.url" serpent = require("serpent") http = require "socket.http" https = require "ssl.https" redis = require('redis') sdor = dofile("tdcli.lua") tahadevstorm = redis.connect('127.0.0.1', 6379)
----------------------------------------------------------------------------
function vardump(value)  print(serpent.block(value, {comment=false}))  end
local AutoSet = function()
io.write('\n\27[1;35m>> • ࿇ • { قم بارسال ايدي المطور الاساسي } • ࿇ • \n    \27[0;39;49m')   local SUDO = tonumber(io.read())  if not tostring(SUDO):match('%d+') then SUDO = 373906612  end
io.write('\n\27[1;35m>> • ࿇ • { قم بارسال معرف المطور بدون @ } • ࿇ • \n    \27[0;39;49m')  local user = io.read() 
io.write('\n\27[1;35m>> • ࿇ • { قم بارسال التوكن الخاص بك } • ࿇ • \n    \27[0;39;49m')  
local token = io.read() 
botid = token:match("(%d+)")
io.write('\n\27[1;35m>> • ࿇ • { قم بارسال اسم البوت } • ࿇ • \n    \27[0;39;49m')  local name = io.read() 
local create = function(data, file, uglify)  file = io.open(file, "w+")   local serialized   if not uglify then  serialized = serpent.block(data, {comment = false, name = "_"})  else  serialized = serpent.dump(data)  end    file:write(serialized)    file:close()  end
local create_config_auto = function()
config = {
SUDO = SUDO,
sudo_users = {SUDO},
token = token,
BOTS = botid,
sudouser = user,
botname = name,
bot_id = botid,
}
create(config, "./config.lua")   print("\27[7;35m"..[[ • ࿇ • { تم صنع ملف الكونفك بنجاح } • ࿇ • \n  ]].."\n\27[10m") end create_config_auto()
------------------
file = io.open("launch.sh", "w")
file:write([[
token="]]..token..[["
curl "https://api.telegram.org/bot"$token"/sendmessage" -F
./tg -s ./bot.lua $@ --bot=$token
]])
file:close()
os.execute(' screen -S launch.sh ./launch.sh')
print("\27[7;35m"..[[ • ࿇ • { تم صنع ملف الرن الخاص في البوت } • ࿇ • \n    ]].."\n\27[10m")
end
local serialize_to_file = function(data, file, uglify)  file = io.open(file, "w+")  local serialized  if not uglify then   serialized = serpent.block(data, {comment = false, name = "_"})  else   serialized = serpent.dump(data) end  file:write(serialized)  file:close() end local load_redis = function()  local f = io.open("./config.lua", "r")  if not f then   AutoSet()  else   f:close()  end  local config = loadfile("./config.lua")() return config end  _redis = load_redis()
print("\27[7;38m"..[[]].."\n\27[10m")
print('⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️0%')
print('⬛️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️10%')
print('⬛️  ⬛️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️20%')
print('⬛️  ⬛️  ⬛️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️30%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️40%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬜️  ⬜️  ⬜️  ⬜️  ⬜️50%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬜️  ⬜️  ⬜️  ⬜️60%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬜️  ⬜️  ⬜️70%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬜️  ⬜️80%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛  ⬛️  ⬜️90%')
print('⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛️  ⬛  ⬛️  ⬛️  ⬛️️100%')
print("\27[7;37m"..[[]].."")
print("\27[7;37m"..[[ 📥 تم اكتمال تنصيب البوت •]].."")
print("\27[7;37m"..[[]].."")
sudos = dofile("config.lua")
SUDO = sudos.SUDO
sudo_users = {sudos.SUDO}
BOTS = sudos.bot_id
bot_id = sudos.bot_id
botname = sudos.botname
sudouser = sudos.user
chaneel = sudos.token
function dl_cb(arg, data)
end
----------------------------------------------------------------------------
function is_devtaha(msg)
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
local hash = tahadevstorm:sismember('sudo:',msg.sender_user_id_)
if hash or is_devtaha(msg)  then
return true
else
return false
end
end
----------------------------------------------------------------------------
function is_bot(msg)
 if tonumber(BOTS) == BOTS then
return true
else
return false
end
end
function is_owner(msg) 
local hash = tahadevstorm:sismember('owners:'..msg.chat_id_,msg.sender_user_id_)
if hash or  is_devtaha(msg) or is_sudo(msg) then
return true
else
return false
end
end
function sleep(n) 
os.execute("sleep " .. tonumber(n)) 
end
function is_mod(msg) 
local hash = tahadevstorm:sismember('mods:'..msg.chat_id_,msg.sender_user_id_)
if hash or  is_devtaha(msg) or is_sudo(msg) or is_owner(msg) then
return true
else
return false
end
end
-----------
function changetitle(chat_id, title)
  tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
  }, dl_cb, nil)
end
-----------
function user_info(extra,result)
    if result.user_.username_  then
      username = ''..result.user_.username_..''
    else
      username = ''
    end
    local text = ''..(result.user_.first_name_ or 'لا يوجد')..''..extra.gid..''..result.user_.id_..''..(result.user_.phone_number_ or  'ماكو')..''..username
    storm.sendtaha(extra.gid,extra.msgid, 0, 1,  text, 1, 'html')
  end

function is_vipgroup(msg) 
local hash = tahadevstorm:sismember('vip:group'..msg.chat_id_,msg.sender_user_id_)
if hash or  is_devtaha(msg) or is_sudo(msg) or is_owner(msg) or is_mod(msg) then
return true
else
return false
end
end
-----------
function is_vipgroups(msg) 
local hash = tahadevstorm:sismember('vip:groups',msg.sender_user_id_)
if hash or  is_devtaha(msg) then
return true
else
return false
end
end
-----------
function is_banned(chat,user)
local hash =  tahadevstorm:sismember('banned'..chat,user)
if hash then
return true
else
return false
end
end
function is_gban(chat,user)
local hash =  tahadevstorm:sismember('gbaned',user)
if hash then
return true
else
return false
end
end
---------
function check_user(msg)
local var = true
if tahadevstorm:get("forcejoin") then
local channel = '@STORMCLl'
local url , res = https.request('https://api.telegram.org/bot475702712:AAGRxNsme_--3e6F1pHV8L9Tv1ALau4yD04/getchatmember?chat_id='..channel..'&user_id='..msg.sender_user_id_)
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
local taha = [[
📪￤لا يمكنك استخدام البوت
📯￤عليك الاشتراك في القناة
♨￤<a href="https://telegram.me/STORMCLl"> اضغط هنا للاشتراك </a>
]]
storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, 'html')
elseif data.ok then
return var
end
else
return var
end
end

------
function get_title(gid)
sdor.getChat(gid, savegp, nil) 
local gn = tahadevstorm:hget('sgp:'..gid, 'name') or "----"
local text = ""..gn..""
return text
end

function get_username(user_id)
  if tahadevstorm:hget('username',user_id) then
    text = ''..(string.gsub(tahadevstorm:hget('username',user_id), 'false', '') or '-----')
  end
 get_user(user_id)
  return text
end
function getname(user_id)
  if tahadevstorm:hget('name',user_id) then
    text = ''..(string.gsub(tahadevstorm:hget('name',user_id), 'false', '') or '-----')
  end
  get_user(user_id)
  return text
end
function get_phone(user_id)
  if tahadevstorm:hget('phone',user_id) then
    text = ''..(string.gsub(tahadevstorm:hget('phone',user_id), 'false', '') or '-----')
  end
  get_user(user_id)
  return text
end

function get_user(user_id)
  function dl_username(arg, data)
    username = data.username or '-----'
        name = data.first_name_ or '-----'
        phone = data.phone_number_ or '-----'


    tahadevstorm:hset('username',data.id_,data.username_)
tahadevstorm:hset('name',data.id_,data.first_name_)
tahadevstorm:hset('phone',data.id_,data.phone_number_)
  end
  tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
  }, dl_username, nil)
end
---
function deleteMessagesFromUser(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
function formsgg(msgs)
local taha = '' 
if msgs < 100 then taha = 'ضعيف 😨' elseif msgs < 500 then taha = 'استمر بالتفاعل ♨' elseif msgs < 1500 then taha = 'متوسط 🌟' elseif msgs < 5000 then taha = 'متفاعل 💥' elseif msgs < 10000 then taha = 'حلو استمر 💫' elseif msgs < 50000 then taha = 'رائع جدا 💢' elseif msgs < 90000 then taha = 'قوي جدا 😻'  elseif msgs < 100000 then taha = 'ملك التفاعل 🔥' elseif msgs < 1000000 then taha = 'رب التفاعل انت 🔥' end return taha end
function addChatMember(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit
}, dl_cb, nil)
end
local function getParseMode(parse_mode)
if parse_mode then
local taha = parse_mode:lower()
if taha == 'markdown' or taha == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif taha == 'html' then
P = {ID = "TextParseModeHTML"}
end end
return P
end
function is_filter(msg, value)
local hash = tahadevstorm:smembers('filters:'..msg.chat_id_)
if hash then
local names = tahadevstorm:smembers('filters:'..msg.chat_id_)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_mod(msg) and not is_vipgroup(msg) and not is_vipgroups(msg) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end end end end
function is_muted(chat,user)
local hash =  tahadevstorm:sismember('mutes'..chat,user)
if hash then
return true
else
return false
end end
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, dl_cb, nil) 
end 
function SendMetion(chat_id, user_id, msg_id, text, offset, length)
local tt = tahadevstorm:get('endmsg') or ''
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
function priv(chat,user)
local noow = tahadevstorm:sismember('owners:'..chat,user)
local nomo = tahadevstorm:sismember('mods:'..chat,user)
local novip1 = tahadevstorm:sismember('vip:groups'..chat,user)
local novip2 = tahadevstorm:sismember('vip:group'..chat,user)
if tonumber(SUDO) == tonumber(user) or noow or nomo or novip1 or novip2 then
return true
else
return false
end end
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
--
function setphoto(chat_id, photo)
  tdcli_function ({
    ID = "ChangeChatPhoto",
    chat_id_ = chat_id,
    photo_ = getInputFile(photo)
  }, dl_cb, nil)
end
--
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
---------------
function resolve_username(username,cb)
  tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, cb, nil)
end
-------

------
function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
end 
getChannelFull(channel,callback_admins)
end
function getUser(user_id,cb)
tdcli_function ({  ID = "GetUser", user_id_ = user_id  }, cb, nil)
end
function adduser(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
function banall(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تستطيع حضر او طرد او كتم البوت 🎎', 1, 'md')
return false
end
if priv(chat,user) then
storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ لا تسطيع حضر او كتم او طرد ( الادمنيه و المدراء )', 1, 'md')
else
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
storm.changeChatMemberStatus(chat, user, "Kicked")
tahadevstorm:sadd('gbaned',user)
SendMetion(msg.chat_id_, user, msg.id_, '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم حظره عام بنجاح  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user))  
end
end
function kick(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
return false
end
if priv(chat,user) then
else
storm.changeChatMemberStatus(chat, user, "Kicked")
end
end
function kickm(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
return false
end
if priv(chat,user) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '☇￤لا تسطيع حضر او كتم او طرد ( الادمنيه و المدراء )', 1, 'md')
else
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
storm.changeChatMemberStatus(chat, user, "Kicked")
SendMetion(msg.chat_id_, user, msg.id_, '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم طرده من المجموعه  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user))  
end
end
function ban(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تستطيع حضر او طرد او كتم البوت 🎎', 1, 'md')
return false
end
if priv(chat,user) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تسطيع حضر او كتم او طرد ( الادمنيه و المدراء )', 1, 'md')
else
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
storm.changeChatMemberStatus(chat, user, "Kicked")
tahadevstorm:sadd('banned'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم حظره من المجموعه  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user)) 
end
end
function mute(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تستطيع حضر او طرد او كتم البوت 🎎', 1, 'md')
return false
end
if priv(chat,user) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تسطيع حضر او كتم او طرد ( الادمنيه و المدراء )', 1, 'md')
else
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
tahadevstorm:sadd('mutes'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم كتمه في المجموعه  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user)) 
end
end
function unbanall(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تستطيع حضر او طرد او كتم البوت 🎎', 1, 'md')
return false
end
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
tahadevstorm:srem('gbaned',user)
SendMetion(msg.chat_id_, user, msg.id_, '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم الغاء حظره عام  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user))  
end
function unban(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تستطيع حضر او طرد او كتم البوت 🎎', 1, 'md')
return false
end
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
tahadevstorm:srem('banned'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_,'🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم الغاء حظره   ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user))
end
function unmute(msg,chat,user)
if tonumber(user) == tonumber(bot_id) then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ لا تستطيع حضر او طرد او كتم البوت 🎎', 1, 'md')
return false
end
if is_devtaha(msg) then t = 'مطور اساسي' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب' elseif is_mod(msg) then t = 'ادمن الكروب' end
tahadevstorm:srem('mutes'..chat,user)
SendMetion(msg.chat_id_, user, msg.id_, '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم الغاء كتمه بنجاح  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(user)) 
end
function delete_msg(chatid,mid)
tdcli_function ({ID="DeleteMessages", chat_id_=chatid, message_ids_=mid}, dl_cb, nil)
end
function user(msg,chat,text,user)
entities = {}
if text and text:match('<user>') and text:match('<user>') then
local x = string.len(text:match('(.*)<user>'))
local offset = x
local y = string.len(text:match('<user>(.*)</user>'))
local length = y
text = text:gsub('<user>','')
text = text:gsub('</user>','')
table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user}) end
entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}
return tdcli_function ({ID="SendMessage", chat_id_=chat, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_=entities}}, dl_cb, nil) end
function settings(msg,value,lock) local hash = 'settings:'..msg.chat_id_..':'..value if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' end if value == 'الملفات' then text = 'الملفات 📂' elseif value == 'الاونلاين' then text = 'الاونلاين 🔌'  elseif value == 'الروابط' then text = 'الروابط 📧' elseif value == 'الالعاب' then text = 'الالعاب 🎁' elseif value == 'المعرفات' then text = 'المعرفات 🚹' elseif value == 'التاك' then text = 'التاك #⃣' elseif value == 'التثبيت' then text = 'التثبيت 📡' elseif value == 'الصور' then text = 'الصور 📷' elseif value == 'المتحركه' then text = 'المتحركه 🔆' elseif value == 'الفيديو' then text = 'الفيديو 🎥' elseif value == 'الصوت' then text = 'الصوت 📢' elseif value == 'الاغاني' then text = 'الاغاني 🔇' elseif value == 'الدردشه' then text = 'الدردشه 📝' elseif value == 'الملصقات' then text = 'الملصقات 🎎' elseif value == 'الجهات' then text = 'الجهات 📞' elseif value == 'التوجيه' then text = 'التوجيه 🔄' elseif value == 'العربيه' then text = 'العربيه 📻' elseif value == 'الانكلش' then text = 'الانكلش 🆎' elseif value == 'البوتات' then text = 'البوتات 👾' elseif value == 'الاشعارات' then text = 'الاشعارات 🔎' elseif value == 'السيلفي' then text = 'السيلفي 🔦' elseif value == 'الماركداون' then text = 'الماركداون 📔' elseif value == 'الدخول' then text = 'دخول الاعضاء 📥' elseif value == 'الكل' then text = 'الكل ⚠' else return false end if lock then tahadevstorm:set(hash,true) SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤ '..t..' ( '..msg.sender_user_id_..' ) \n🎫￤ قام بقفل ( '..text..' )\n', 16, string.len(msg.sender_user_id_)) else tahadevstorm:del(hash) SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤ '..t..' ( '..msg.sender_user_id_..' ) \n🎫￤ قام بفتح ( '..text..' )\n', 16, string.len(msg.sender_user_id_)) end end
function is_lock(msg,value)
local hash = 'settings:'..msg.chat_id_..':'..value
if tahadevstorm:get(hash) then
return true 
else
return false
end end
function trigger_anti_spam(msg,type)
if type == 'kick' then
kick(msg,msg.chat_id_,msg.sender_user_id_)
SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤العضو • ( '..msg.sender_user_id_..' ) قام بعمل تكرار في المجموعه وتم طرده' , 10, string.len(msg.sender_user_id_))
end
if type == 'ban' then
if is_banned(msg.chat_id_,msg.sender_user_id_) then else
SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤العضو • ( '..msg.sender_user_id_..' ) قام بعمل تكرار في المجموعه وتم حظره' , 10, string.len(msg.sender_user_id_))
end
storm.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
tahadevstorm:sadd('banned'..msg.chat_id_,msg.sender_user_id_)
end
if type == 'mute' then
if is_muted(msg.chat_id_,msg.sender_user_id_) then else
SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤العضو • ( '..msg.sender_user_id_..' ) قام بعمل تكرار في المجموعه وتم كتمه' , 10, string.len(msg.sender_user_id_))
end
tahadevstorm:sadd('mutes'..msg.chat_id_,msg.sender_user_id_)
end
end
function televardump(msg,value)
local text = json:encode(value)
storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 'html')
end
function chackgp(msg) 
local hash = tahadevstorm:sismember('bot:gps', msg.chat_id_)
if hash then
return true
else
return false
end
end
function run(msg,data)
if msg then
tahadevstorm:incr('groupmsgkk:'..msg.chat_id_..':')
tahadevstorm:incr('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)
if msg.send_state_.ID == "MessageIsSuccessfullySent" then
return false 
end
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
chat_type = 'super'
elseif id:match('^(%d+)') then
chat_type = 'user'
else
chat_type = 'group' end end
function savegp(extra, result, success) name = (result.title_ or false)    hash = 'sgp:'..msg.chat_id_   tahadevstorm:hset(hash, 'name', name) end 

local text = msg.content_.text_
if text and text:match('[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]') then
text = text
end
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
if tahadevstorm:get('viewchannel'..msg.sender_user_id_) then
if not msg.forward_info_ then
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ هاذا ليس توجيه من القناة', 1, 'md')
tahadevstorm:del('viewchannel'..msg.sender_user_id_)
else
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ عدد المشاهدات المنشور ( '..msg.views_..' ) مشاهده ♨', 1, 'md')
tahadevstorm:del('viewchannel'..msg.sender_user_id_) end end
if msg_type == 'text' and text then
if text and text:match('^[/!]') then
text = text:gsub('^[/!]','')
end
end
if text then
if not tahadevstorm:get('bot_id') then
function cb(a,b,c)
tahadevstorm:set('bot_id',b.id_)
end
storm.getMe(cb)
end end
if tahadevstorm:get("link:group"..msg.chat_id_) == 'setlinkwai' and is_mod(msg) then if text and text:match("^الغاء$") then storm.sendtaha(msg.chat_id_, msg.id_, 1, "🚸￤ تم الغاء الامر ♨", 1, "html") tahadevstorm:del("link:group" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) else  if text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)") then     local glink = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   local hash = "link:group"..msg.chat_id_   tahadevstorm:set(hash,glink)   storm.sendtaha(msg.chat_id_, msg.id_, 1, '🏀￤تم حفظ الرابط الخاص بالمجموعه', 1, 'md')  end   end end
if tahadevstorm:get("bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then if text and text:match("^الغاء$") then storm.sendtaha(msg.chat_id_, msg.id_, 1, "🚸￤ تم الغاء الامر ♨", 1, "html") tahadevstorm:del("bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) else local gps = tahadevstorm:scard("botgps") or 0 local gpss = tahadevstorm:smembers("botgps") or 0 local msgs = { [0] = id } for i = 1, #gpss do storm.sendtaha(gpss[i], 0, 1, text, 1, "md") end storm.sendtaha(msg.chat_id_, msg.id_, 1, "🎫￤ تمت الاذاعه بنجاح ✔ \n ♻￤الى ( *" .. gps .. "* ) مجموعات في البوت", 1, "md")     tahadevstorm:del("bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) end end
if tahadevstorm:get("bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then if text and text:match("^الغاء$") then storm.sendtaha(msg.chat_id_, msg.id_, 1, "🚸￤ تم الغاء الامر ♨", 1, "html") tahadevstorm:del("bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) else local gps = tahadevstorm:scard("usersbot") or 0 local gpss = tahadevstorm:smembers("usersbot") or 0 local msgs = { [0] = id } for i = 1, #gpss do storm.sendtaha(gpss[i], 0, 1, text, 1, "md") end storm.sendtaha(msg.chat_id_, msg.id_, 1, "🎫￤ تمت الاذاعه بنجاح ✔ \n ♻￤الى ( *" .. gps .. "* ) مشتركين في البوت ", 1, "md")     tahadevstorm:del("bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) end end
if tahadevstorm:get("rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then local rules = msg.content_.text_ tahadevstorm:set("rules:group" .. msg.chat_id_, rules) storm.sendtaha(msg.chat_id_, msg.id_, 1, "🚸￤تم حفظ القوانين ✔",  1, "md") end  tahadevstorm:del("rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
if tahadevstorm:get("sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then tahadevstorm:del("sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  local dev = text:match("(.*)") tahadevstorm:set("dev", dev) SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤ المطور ( '..msg.sender_user_id_..' )\n📬￤ تم وضع كليشه المطور' , 13, string.len(msg.sender_user_id_)) storm.sendtaha(SUDO, 0, 1,'', 1, 'md') storm.sendtaha(SUDO, 0, 1,'', 1, 'md') end
if tahadevstorm:get("sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then tahadevstorm:del("sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_) local pvstart = text:match("(.*)") tahadevstorm:set("pvstart", pvstart) SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤ المطور ( '..msg.sender_user_id_..' )\n📬￤ تم وضع الرد في التواصل' , 13, string.len(msg.sender_user_id_)) storm.sendtaha(SUDO, 0, 1,'', 1, 'html') storm.sendtaha(SUDO, 0, 1,'', 1, 'md') end

if text == 'start' and chat_type == 'user' and not tahadevstorm:get("timeactivee:"..msg.chat_id_) and check_user(msg) then
local username = nil
local taha = [[
 '📪┊اهلا بك يا ( <a href="https://telegram.me/]]..get_username(msg.sender_user_id_)..[[">]]..getname(msg.sender_user_id_)..[[</a> )
<code>---------------------</code>
☇┊عزيزي انا بوت حمايه كروبات ال <b>100k</b>
♨┊لتفعيل البوت مجانا اتبع التعليمات
📬┊اولا اضفني الى مجموعتك 
✨┊ثانيا راسل( تفعيل البوت )
⛥┊سيتم رفع منشئ للمجموعه 
💥┊ثم سيتم رفع ادمنيه المجموعه
<code>---------------------</code>
💠┊المطور مالتي ( @tahaj20 )
]]
storm.sendtaha(msg.chat_id_, msg.id_, 1,taha, 1, 'html')
tahadevstorm:setex("timeactivee:"..msg.chat_id_, 10, true)
end 

if chat_type == 'user' then
if text and text:match('(.*)') and not is_sudo(msg) then
if not tahadevstorm:sismember("usersbot",msg.chat_id_) then
tahadevstorm:sadd("usersbot",msg.chat_id_)
end
storm.forwardMessages(SUDO, msg.sender_user_id_, {[0] = msg.id_}, 1)
storm.sendtaha(SUDO, 0, 1,'📯 • لديك رساله جديده من\n <code>'..msg.sender_user_id_..'</code> \n 📌 • للرد على الشخص اتبع الخطوه هاذه \n الايدي + الرساله \nمثال 123456789 هلو حبي', 1, 'html')
if text and text:match("^(.*)$") then
local pvstart = tahadevstorm:get("pvstart")
if pvstart then
storm.sendtaha(msg.sender_user_id_, 0, 1, pvstart, 1, "html")
end end end
if text and text:match('^(%d+) (.*)') and is_sudo(msg) then
local user , msg = text:match('(%d+) (.*)')
local taha = '📮 • العضو ( '..user..' ) تم ارسال رسالتك اليه بنجاح'
storm.sendtaha(user, 0, 1,msg, 1, 'md')
SendMetion(SUDO, user, user, taha, 13, string.len(user))
end
if text and text:match("^توجيه (%d+)") and msg.reply_to_message_id_ and is_sudo(msg) then
local user = text:match("^توجيه (%d+)")
local taha = '📮 • العضو ( '..user..' ) تم توجيه رسالتك اليه بنجاح'
text = ''
msgs = msg.reply_to_message_id_
SendMetion(SUDO, user, user, taha, 13, string.len(user))
tdcli_function({ ID = "ForwardMessages", chat_id_ = user,from_chat_id_ = msg.chat_id_, message_ids_ = { [0] = msgs }, disable_notification_ = 0, from_background_ = 1 }, dl_cb, nil)
storm.sendtaha(msg.chat_id_, msg.reply_to_message_id_, 1, text, 1, 'html')
end end
------------------------------------------
if chat_type == 'super' then
local user_id = msg.sender_user_id_
floods = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"flood") or  'nil'
NUM_MSG_MAX = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodtime") or 5
if tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"flood") then
if not is_mod(msg) then
if msg.content_.ID == "MessageChatAddMembers" then
return
else
local post_count = tonumber(tahadevstorm:get('floodc:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
if post_count > tonumber(tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodmax") or 5) then
local ch = msg.chat_id_
local type = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"flood")
trigger_anti_spam(msg,type)
 end
tahadevstorm:setex('floodc:'..msg.sender_user_id_..':'..msg.chat_id_, tonumber(tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1)
end
end
local edit_id = data.text_ or 'nil' 
NUM_MSG_MAX = 5
if tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodmax")
end
if tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"floodtime")
end
end	  
----------------------------------------------------------------------------
-- تخزين التثبيت
if msg.content_.ID == 'MessagePinMessage' then
if is_lock(msg,'التثبيت') and is_owner(msg) then
tahadevstorm:set('pinned'..msg.chat_id_, msg.content_.message_id_)
elseif not is_lock(msg,'التثبيت') then
tahadevstorm:set('pinned'..msg.chat_id_, msg.content_.message_id_)
end
end
----------------------------------------------------------------------------
--تخزين الكلمات السيئه
if text and not is_mod(msg) and not is_vipgroup(msg) and not is_vipgroups(msg)  then
if is_filter(msg,text) then
delete_msg(msg.chat_id_, {[0] = msg.id_})
end 
end
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- قفل التثبيت
if is_owner(msg) then else
if is_lock(msg,'التثبيت') then if msg.content_.ID == 'MessagePinMessage' then storm.sendtaha(msg.chat_id_, msg.id_, 1, ' ابن الكحبه لا تثبت ',1, 'md') storm.unpinChannelMessage(msg.chat_id_) local PinnedMessage = tahadevstorm:get('pinned'..msg.chat_id_) if PinnedMessage then storm.pinChannelMessage(msg.chat_id_, tonumber(PinnedMessage), 0) end end end end  if is_mod(msg) then  else
if is_lock(msg,'الروابط') and not is_vipgroup(msg) and not is_vipgroups(msg) then if text then if msg.content_ and msg.content_[0] and msg.content_.ID == 'MessageEntityUrl' or msg.content_.text_.web_page_ then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end if msg.content_.caption_ then   local text = msg.content_.caption_ local is_link = text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match("[Ww][Ww][Ww].") or text:match(".[Cc][Oo][Mm]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text:match(".[Pp][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text:match("[Tt].[Mm][Ee]/")  if is_link then  delete_msg(msg.chat_id_, {[0] = msg.id_}) end  end  end
if is_lock(msg,'المعرفات') and not is_vipgroup(msg) and not is_vipgroups(msg) then if text then local is_username = text:match("@[%a%d]") if is_username then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end if msg.content_.caption_ then local text = msg.content_.caption_ local is_username = text:match("@[%a%d]") if is_username then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end end
if is_lock(msg,'التاك') and not is_vipgroup(msg) and not is_vipgroups(msg) then if text then local is_hashtag = text:match("#") if is_hashtag then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end if msg.content_.caption_ then local text = msg.content_.caption_ local is_hashtag = text:match("#") if is_hashtag then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end end
if is_lock(msg,'الملصقات') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageSticker' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الدخول') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == "MessageChatJoinByLink" then storm.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked") end end
if is_lock(msg,'الاضافه') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == "MessageChatAddMembers" then storm.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked") end end
if is_lock(msg,'التوجيه') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.forward_info_ then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الصور') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessagePhoto' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end 
if is_lock(msg,'الملفات') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageDocument' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الاونلاين') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end 
if is_lock(msg,'الالعاب') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.game_ then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end 
if is_lock(msg,'الاغاني') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageAudio' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الصوت') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageVoice' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'المتحركه') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageAnimation' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الجهات') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageContact' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الفيديو') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageVideo' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'الدردشه') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == 'MessageText' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end

           
            if msg.content_.text_ then
            local _nl, ctrl_chars = string.gsub(text, '%c', '')
            local _nl, real_digits = string.gsub(text, '%d', '')
            local id = msg.id_
            local msgs = {[0] = id}
            local chat = msg.chat_id_
            local hash = 'bot:sens:spam'..msg.chat_id_
            if not tahadevstorm:get(hash) then
              sens = 400
            else
              sens = tonumber(tahadevstorm:get(hash))
            end
              if not is_mod(msg) and not is_vipgroup(msg) and not is_vipgroups(msg) and tahadevstorm:get('bot:spam:mute'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
              delete_msg(chat,msgs)
              
            end
          end
          
if is_lock(msg,'الكل') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.entities_ then if msg.content_.entities_[0] then   if msg.content_.ID == 'MessagePhoto' or text:match("#") or text:match("@[%a%d]") or msg.content_.ID == 'MessageDocument' or msg.content_.photo_ or msg.content_.ID == 'MessageSticker' or msg.content_.ID == 'MessageAudio' or msg.content_.audio_ or msg.content_.ID == 'MessageAnimation' or msg.content_.animation_ or msg.content_.ID == 'MessageVideo' or msg.content_.video_  or msg.content_.ID == 'MessageContact' or  msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" or msg.forward_info_ or msg.content_.ID == 'MessageDocument' or msg.content_.game_ or msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end  end end 
if is_lock(msg,'الماركداون') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.entities_ then if msg.content_.entities_[0] then if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then  delete_msg(msg.chat_id_, {[0] = msg.id_}) end end end end 
if is_lock(msg,'العربيه') and not is_vipgroup(msg) and not is_vipgroups(msg) then if text and text:match('[\216-\219][\128-\191]') then delete_msg(msg.chat_id_, {[0] = msg.id_}) end  if msg.content_.caption_ then local text = msg.content_.caption_ local is_persian = text:match("[\216-\219][\128-\191]") if is_persian then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end end end
if is_lock(msg,'الانكلش') and not is_vipgroup(msg) and not is_vipgroups(msg) then if text and text:match('[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]') then delete_msg(msg.chat_id_, {[0] = msg.id_}) end  if msg.content_.caption_ then local text = msg.content_.caption_ local is_english = text:match("[qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM]") if is_english then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end end end
if is_lock(msg,'الاشعارات') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatDeleteMember" then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end
if is_lock(msg,'السيلفي') and not is_vipgroup(msg) and not is_vipgroups(msg) then if msg.content_.ID == "MessageUnsupported" then delete_msg(msg.chat_id_, {[0] = msg.id_}) end end          
if is_lock(msg,'البوتات') and not is_sudo(msg) then local text = '🎫￤العضو • ( '..msg.sender_user_id_..' )\n🚷￤قام باضافه بوت في المجموعه وتم طرد البوت ومن قام باضافه البوت 📬' if msg.content_.ID == "MessageChatAddMembers" then if msg.content_.members_[0].type_.ID == 'UserTypeBot' then storm.changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, 'Kicked') storm.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked") SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, text, 13, string.len(msg.sender_user_id_))  end end end
local muteall = tahadevstorm:get('muteall'..msg.chat_id_)
if msg.sender_user_id_ and muteall and not is_mod(msg) then delete_msg(msg.chat_id_, {[0] = msg.id_}) end
if msg.sender_user_id_ and is_muted(msg.chat_id_,msg.sender_user_id_) then delete_msg(msg.chat_id_, {[0] = msg.id_}) end
if msg.sender_user_id_ and is_banned(msg.chat_id_,msg.sender_user_id_) then kick(msg,msg.chat_id_,msg.sender_user_id_) delete_msg(msg.chat_id_, {[0] = msg.id_}) end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and is_banned(msg.chat_id_,msg.content_.members_[0].id_) then kick(msg,msg.chat_id_,msg.content_.members_[0].id_) delete_msg(msg.chat_id_, {[0] = msg.id_}) storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو تم حظره من المجموعه 👾',1, 'md') end
if msg.sender_user_id_ and is_gban(msg.chat_id_,msg.sender_user_id_) then kick(msg,msg.chat_id_,msg.sender_user_id_) delete_msg(msg.chat_id_, {[0] = msg.id_}) end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and is_gban(msg.chat_id_,msg.content_.members_[0].id_) then kick(msg,msg.chat_id_,msg.content_.members_[0].id_) delete_msg(msg.chat_id_, {[0] = msg.id_}) end
local status_welcome = (tahadevstorm:get('add:welc:'..msg.chat_id_) or 'rem') 
if status_welcome == 'add' then
if msg.content_.ID == "MessageChatJoinByLink" then
if not is_banned(msg.chat_id_,msg.sender_user_id_) then function wlc(extra,result,success) if tahadevstorm:get('welcome:'..msg.chat_id_) then t = tahadevstorm:get('welcome:'..msg.chat_id_) else  t = { 'هله اجه الكروب كله يرحب بي 💋','لضل صنم رحمه للكعبه احجي سولف اني اسولف وياك 🤗❤️','نورت الكروب 💋',"هله بريحه هلي 😍😉",'ضويت الكروب شمعه ❤️','الجه الزين كله 💋','هلا بيك حبيبي نورت 🌝','نورت كلبي 💋','صير حباب ولضل ثكيل 🤷🏼‍♀️','❤️ نورتنه يروح عمتك ☺️','صير خوش عضو بالكروب ترا اطردك 🙃','نـَْﮩْْ❀ُུـَ❀﴿💡﴾ـۖؐـورتـ❥','مٰ̲ہٰٰنہٰٰوِٰڕٰ حہٰٰبྀ̲ہ؏ۤـٖٓہٰٰمٰ̲ہٰٰڕٰيِٰہٰٰ┊※🌝️‘’💛' }   end storm.sendtaha(msg.chat_id_, msg.id_, 1, t,0) storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..t[math.random(#t)]..'',0) end storm.getUser(msg.sender_user_id_,wlc) end end
if msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].type_.ID == 'UserTypeGeneral' then
if msg.content_.ID == "MessageChatJoinByLink" then
if not is_banned(msg.chat_id_,msg.content_.members_[0].id_) then
if tahadevstorm:get('welcome:'..msg.chat_id_) then t = tahadevstorm:get('welcome:'..msg.chat_id_) else t = ' {name} منور حياتي' end local t = t:gsub('{name}',msg.content_.members_[0].first_name_) storm.sendtaha(msg.chat_id_, msg.id_, 1, t,0) end end end end
if text and is_owner(msg) then local lock = text:match('^قفل التثبيت$') local unlock = text:match('^فتح التثبيت$') if lock then settings(msg,'التثبيت','lock') end if unlock then settings(msg,'التثبيت') end end  if text and is_mod(msg) then local lock = text:match('^قفل (.*)$') local unlock = text:match('^فتح (.*)$')  local pin = text:match('^قفل التثبيت$') or text:match('^فتح التثبيت$') if pin and is_mod(msg) then elseif pin and not is_mod(msg) then storm.sendtaha(msg.chat_id_, msg.id_, 1, '💥￤ للمدراء والادمنيه فقط 🚸',1, 'md') elseif lock then settings(msg,lock,'lock') elseif unlock then settings(msg,unlock) end end 
----------------------------------------------------------------------------
-- كود قفل التكرار (بالطرد و الكتم والحظر )
--كود فتح التكرار 
if text and is_owner(msg) then
if text == 'قفل التكرار بالطرد' then
tahadevstorm:hset("flooding:settings:"..msg.chat_id_ ,"flood",'kick') 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم قفل التكرار بالطرد',1, 'md')
elseif text == 'قفل التكرار بالحظر' then
tahadevstorm:hset("flooding:settings:"..msg.chat_id_ ,"flood",'ban') 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم قفل التكرار بالحظر',1, 'md')
elseif text == 'قفل التكرار بالكتم' then
tahadevstorm:hset("flooding:settings:"..msg.chat_id_ ,"flood",'mute') 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم قفل التكرار بالكتم',1, 'md')
elseif text == 'فتح التكرار' then
tahadevstorm:hdel("flooding:settings:"..msg.chat_id_ ,"flood") 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم فتح التكرار',1, 'md')
end
end



tahadevstorm:incr("allmsg")
if msg.content_.game_ then
print("------ G A M E ------")
elseif msg.content_.text_ then
local taha = "" 
storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, 'md') 
elseif msg.content_.sticker_ then
local taha = "" 
storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha..''..get_title(msg.chat_id_)..'', 1, 'md') 
elseif msg.content_.edit_ then
local taha = "كخير 💋" 
storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, 'md') 
elseif msg.content_.animation_ then
local taha = "" 
storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, 'md') 
elseif msg.content_.voice_ then
print("------ V O I C E ------")
elseif msg.content_.video_ then
print("------ V I D E O ------")
elseif msg.content_.photo_ then
local taha = "لدز صور" 
storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, 'md') 
elseif msg.content_.document_ then
print("------ D O C U M E N T ------")
elseif msg.content_.audio_  then
print("------ A U D I O ------")
elseif msg.content_.location_ then
print("------ L O C A T I O N ------")
elseif msg.content_.contact_ then
print("------ C O N T A C T ------")
end
if text and text:match('^قفل (التعديل)$') and is_mod(msg) then
local locking = text:match('^قفل (التعديل)$') 
ch = msg.chat_id_
tahadevstorm:hset(SUDO.."gps:settings:"..ch,'edit:Lock','lock')
taha = [[
💥￤تم قفل التعديل
💢￤بواسطه (<a href="https://telegram.me/]]..get_username(msg.sender_user_id_)..[["> اضغط هنا للاشتراك </a>)
]]
storm.sendtaha(msg.chat_id_, msg.id_, 1,taha, 1, 'html')
end
if text and text:match('^فتح (التعديل)$') and is_mod(msg) then
local locking = text:match('^فتح (التعديل)$') 
ch = msg.chat_id_
tahadevstorm:hdel(SUDO.."gps:settings:"..ch,'edit:Lock','lock')
taha = "ok"
storm.sendtaha(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
-----------------------------------------
if text:match("^lock (.*)$") and is_mod(msg) then
	local lockpt = {string.match(text, "^(lock) (.*)$")} 
      if lockpt[2] == "spm" then
         storm.sendtaha(msg.chat_id_, msg.id_, 1, '*Done*\n_Msg Edit locked for normal members._', 1, 'md')
         tahadevstorm:set('bot:spam:mute'..msg.chat_id_,'delmsg')
	  end
	end
if text:match("^unlock (.*)$") and is_mod(msg) then
	local unlockpt = {string.match(text, "^(unlock) (.*)$")} 
      if unlockpt[2] == "spm" then
         storm.sendtaha(msg.chat_id_, msg.id_, 1, '*Done*\n_Msg Edit has been unlocked._', 1, 'md')
         tahadevstorm:del('bot:spam:mute'..msg.chat_id_)
      end
      end
-----------------------------------
if msg.chat_id_ then local id = tostring(msg.chat_id_) if id:match('-100(%d+)') then tahadevstorm:incr('sgpsmessage:') if not tahadevstorm:sismember("botgps",msg.chat_id_) then   tahadevstorm:sadd("botgps",msg.chat_id_) end elseif id:match('^(%d+)') then tahadevstorm:incr('pvmessage:') if not tahadevstorm:sismember("usersbot",msg.chat_id_) then tahadevstorm:sadd("usersbot",msg.chat_id_) end else tahadevstorm:incr('gpsmessage:') if not tahadevstorm:sismember("botgp",msg.chat_id_) then tahadevstorm:sadd("botgp",msg.chat_id_)  end end end if text then if is_devtaha(msg) then
if text and text:match("^توجيه (.*)") and msg.reply_to_message_id_ ~= 0 and is_devtaha(msg) then if not tahadevstorm:get('lock:bc'..msg.chat_id_) then local bcpv = text:match("^توجيه (.*)")
if bcpv == "للمجموعات" then local gp = tahadevstorm:smembers("botgps") or 0 local gps = tahadevstorm:scard("botgps") or 0 for i=1, #gp do sdor.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0) end storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم توجيه رسالتك ✔\n♻￤الى (*'..gps..'*) مجموعه في البوت', 1, 'md')
elseif bcpv == "للمجموعات العاديه" then local gp = tahadevstorm:smembers("botgp") or 0 local gps = tahadevstorm:scard("botgp") or 0 for i=1, #gp do sdor.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0) end storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم توجيه الرساله الى ( '..gps..' ) مجموعه عاديه', 1, 'md')
elseif bcpv == "للخاص" then local gp = tahadevstorm:smembers("usersbot") or 0 local gps = tahadevstorm:scard("usersbot") or 0 for i=1, #gp do sdor.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0) end storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم توجيه رسالتك ✔\n♻￤الى (*'..gps..'*) مشتركين بالخاص', 1, 'md')
elseif bcpv == "للكل" then local gp = tahadevstorm:smembers("usersbot") or 0 local gpspv = tahadevstorm:scard("usersbot") or 0 for i=1, #gp do sdor.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0) end local gp = tahadevstorm:smembers("botgps") or 0 local gpss = tahadevstorm:scard("botgps") or 0 for i=1, #gp do sdor.forwardMessages(gp[i], msg.chat_id_,{[0] = msg.reply_to_message_id_ }, 0) end storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم توجيه رسالتك ✔\n♻￤الى (<b>'..gpss..'</b>) مجموعات في البوت\n🚸￤والى (<b>'..gpspv..'</b>) مشتركين بالخاص', 1, 'html') end end end
if text == 'ارسال نسخه' and is_devtaha(msg) then sdor.sendDocument(SUDO, 0, 0, 1, nil, './bot.lua', dl_cb, nil) storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم ارسال نسخه التخزين الى الخاص', 1, 'md') end
-------------------------------------------------------------------------------------------------
if text == 'رفع مطور' and is_devtaha(msg) then function sudo_reply(extra, result, success) tahadevstorm:sadd('sudo:',result.sender_user_id_) tahadevstorm:srem('owners:'..result.chat_id_,result.sender_user_id_) if is_devtaha(msg) then t = 'المطور الاساسي' end  local user = result.sender_user_id_ local text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مطور في البوت  ꪜ\n💰| بواسطة •❯【 '..t..' 】'  SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user)) end if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then else storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply) end end
if text and is_sudo(msg) and text:match('^رفع مطور (%d+)') and is_devtaha(msg) then local user = text:match('رفع مطور (%d+)') tahadevstorm:sadd('sudo:',user) tahadevstorm:srem('owners:'..msg.chat_id_,user) if is_devtaha(msg) then t = 'المطور الاساسي' end local text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مطور في البوت  ꪜ\n💰| بواسطة •❯【 '..t..' 】' SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user)) end
if text and text:match('^رفع مطور @(.*)') and is_devtaha(msg) then     local username = text:match('^رفع مطور @(.*)')  function vippyuser(extra,result,success)   if result.id_ then   if is_devtaha(msg) then t = 'المطور الاساسي' end  tahadevstorm:sadd('sudo:',result.id_) tahadevstorm:srem('owners:'..msg.chat_id_,user) text = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تمت ترقيته مطور في البوت  ꪜ\n💰| بواسطة •❯【 '..t..' 】'   else    text = taha    end    SendMetion(msg.chat_id_, result.id_, msg.id_, text, 16, string.len(result.id_))    end    resolve_username(username,vippyuser)  end
if text and text:match('^تنزيل مطور @(.*)') and is_devtaha(msg) then     local username = text:match('^تنزيل مطور @(.*)')  function vippyuser(extra,result,success)   if result.id_ then   if is_devtaha(msg) then t = 'المطور الاساسي' end  tahadevstorm:srem('sudo:',result.id_) text = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تمت تنزيله من المطورين  ꪜ\n💰| بواسطة •❯【 '..t..' 】'   else    text = taha    end    SendMetion(msg.chat_id_, result.id_, msg.id_, text, 16, string.len(result.id_))    end    resolve_username(username,vippyuser)  end

if text == 'تنزيل مطور' and is_devtaha(msg) then function sudo_reply(extra, result, success)  tahadevstorm:srem('sudo:',result.sender_user_id_) local user = result.sender_user_id_ if is_devtaha(msg) then t = 'المطور الاساسي' end local text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت تنزيله من المطورين  ꪜ\n💰| بواسطة •❯【 '..t..' 】' SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user)) end if tonumber(msg.reply_to_message_id_) == 0 then else storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)   end end
if text and text:match('^تنزيل مطور (%d+)') and is_devtaha(msg) then local user = text:match('تنزيل مطور (%d+)') tahadevstorm:srem('sudo:',user) if is_devtaha(msg) then t = 'المطور الاساسي' end local text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت تنزيله من المطورين  ꪜ\n💰| بواسطة •❯【 '..t..' 】' SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user)) end end
if is_sudo(msg) then
--------------------------------------------
if text and text:match("^تحديث السورس$") or text:match("^ØªØ­Ø¯ÙØ« Ø§ÙØ³ÙØ±Ø³$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then

   storm.sendtaha(msg.chat_id_, msg.id_, 1, 'ââØªÙ Ø§ÙØªØ­Ø¯ÙØ«', 1, 'md')
  
   os.execute('rm -rf bot.lua')
   os.execute('rm -rf tdcli.lua')
os.execute('wget https://raw.githubusercontent.com/NOVAR1/test/master/bot.lua')
os.execute('wget https://raw.githubusercontent.com/NOVAR1/test/master/tdcli.lua')
 return false end
-----------------------------------------------------
if text == 'حظر عام' and is_devtaha(msg) then if msg.reply_to_message_id_ == 0 then local user = msg.sender_user_id_ else function banreply(extra, result, success) banall(msg,msg.chat_id_,result.sender_user_id_) end end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),banreply) end
if text and text:match('^حظر عام @(.*)') and is_devtaha(msg) then local username = text:match('حظر عام @(.*)') function banusername(extra,result,success) if result.id_ then banall(msg,msg.chat_id_,result.id_) else  text = '🎫￤ العضو لا يوجد في المجموعه ' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end end resolve_username(username,banusername) end
if text and text:match('^حظر عام (%d+)') and is_devtaha(msg) then banall(msg,msg.chat_id_,text:match('حظر عام (%d+)')) end
if text == 'الغاء العام' and is_devtaha(msg) then if msg.reply_to_message_id_ == 0 then local user = msg.sender_user_id_ else function unbanreply(extra, result, success) unbanall(msg,msg.chat_id_,result.sender_user_id_) end end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) end	
if text and text:match('^الغاء العام (%d+)') and is_devtaha(msg) then unbanall(msg,msg.chat_id_,text:match('الغاء العام (%d+)')) end
if text and text:match('^الغاء العام @(.*)') and is_devtaha(msg) then local username = text:match('الغاء العام @(.*)') function unbanusername(extra,result,success) if result.id_ then unbanall(msg,msg.chat_id_,result.id_) else  text = '🎫￤ العضو لا يوجد في المجموعه ' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end end resolve_username(username,unbanusername) end
if text == 'المحظورين عام' or text == 'قائمه العام' and is_sudo(msg) then
local list = tahadevstorm:smembers('gbaned')
local t = '🎫￤ قائمه المحظورين عام ♨ \n\n'
for k, v in pairs(list) do
local user_info = tahadevstorm:hgetall('user:'..v)
		if user_info and user_info.username then
			local username = user_info.username
t = t .. k .. " ➛ •【@" ..username.."】\n"
else
t = t .. k .. " ➛ •【" .. v .. "】\n"
end
end
if #list == 0 then
t = '🎫￤ لا يوجد اعضاء محظورين عام'
end
storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'html')
end
if text == 'مسح العام' or text == 'مسح قائمه العام' and is_devtaha(msg) then tahadevstorm:del('gbaned') storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح قائمه المحظورين عام ', 1, 'html') end	
		
------------------------------------
if text == 'تفعيل الاشتراك اجباري' and is_sudo(msg) then
if not tahadevstorm:get("add:me:ch") then
tahadevstorm:set("add:me:ch", true)
storm.sendtaha(msg.chat_id_, msg.id_, 1, "📮 | تم تفعيل الاشتراك اجباري", 1, 'md')
else
storm.sendtaha(msg.chat_id_, msg.id_, 1, "📮 | تم تفعيل الاشتراك اجباري", 1, 'md')
end
end
----------------------------------------------------------------------------
if text == 'تعطيل الاشتراك اجباري' and is_sudo(msg) then
if tahadevstorm:get("add:me:ch") then
tahadevstorm:del("add:me:ch")
storm.sendtaha(msg.chat_id_, msg.id_, 1, "📮 | تم تعطيل الاشتراك اجباري", 1, 'md')
else
storm.sendtaha(msg.chat_id_, msg.id_, 1, "📮 | تم تعطيل الاشتراك اجباري", 1, 'md')
end
end
-----------------------------

----------------------------
-- كود المغادره من المجموعه
if text == 'غادر' and is_sudo(msg) then tahadevstorm:del("botgps")  tahadevstorm:del('bot:gpsby:id') tahadevstorm:del("addfrebot:"..msg.chat_id_, true) storm.changeChatMemberStatus(msg.chat_id_, bot_id, "Left") storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ تم مغادرة المجموعه ', 1, 'md') end
-------------------------------------------------------------------------------------------------
--كود رفع وتنزيل المدير في المجموعه
if text == 'رفع مدير' and is_sudo(msg) then
function prom_reply(extra, result, success)
if is_devtaha(msg) then
t = 'المطور 📬' elseif is_sudo(msg) then
t = 'المطور 📬' end
tahadevstorm:sadd('owners:'..msg.chat_id_,result.sender_user_id_)
local user = result.sender_user_id_
local text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مدير المجموعه  ꪜ\n💰| بواسطة •❯【 '..t..' 】'
SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user)) 
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end
end
if text and text:match('^رفع مدير @(.*)') and is_sudo(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
if is_devtaha(msg) then
t = 'المطور 📬' elseif is_sudo(msg) then
t = 'المطور 📬' end
tahadevstorm:sadd('owners:'..msg.chat_id_,result.id_)
SendMetion(msg.chat_id_, result.id_, msg.id_, '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تمت ترقيته مدير المجموعه  ꪜ\n💰| بواسطة •❯【 '..t..' 】' ,16, string.len(result.id_))
else 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو لا يوجد في المجموعه ', 1, 'md')
end
end
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير (%d+)') and is_sudo(msg) then
local id = text:match('رفع مدير (%d+)')
if is_devtaha(msg) then
t = 'المطور 📬' elseif is_sudo(msg) then
t = 'المطور 📬' end
tahadevstorm:sadd('owners:'..msg.chat_id_,user)
local text = '🧝‍♂| العضو •❯【 '..id..' 】\n🗃| تمت ترقيته مدير المجموعه  ꪜ\n💰| بواسطة •❯【 '..t..' 】'
SendMetion(msg.chat_id_, id, msg.id_, text, 16, string.len(id)) 
end
if text == 'تنزيل مدير' and is_sudo(msg) then
function prom_reply(extra, result, success)
if is_devtaha(msg) then
t = 'المطور 📬' elseif is_sudo(msg) then
t = 'المطور 📬' end
tahadevstorm:srem('owners:'..msg.chat_id_,result.sender_user_id_)
local text = '🧝‍♂| العضو •❯【 '..result.sender_user_id_..' 】\n🗃| تم تنزيله من الاداره  ꪜ\n💰| بواسطة •❯【 '..t..' 】'
SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 16, string.len(result.sender_user_id_))
end
if tonumber(msg.reply_to_message_id_) == 0 then
else
storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)  
end
end
if text and text:match('^تنزيل مدير @(.*)') and is_sudo(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function demreply(extra,result,success)
  if result.id_ then
  if is_devtaha(msg) then
t = 'المطور 📬' elseif is_sudo(msg) then
t = 'المطور 📬' end
tahadevstorm:srem('owners:'..msg.chat_id_,result.id_)
SendMetion(msg.chat_id_, result.id_, msg.id_, '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تم تنزيله من الاداره  ꪜ\n💰| بواسطة •❯【 '..t..' 】', 16, string.len(result.id_))
else 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو لا يوجد في المجموعه ', 1, 'md')
end
end
resolve_username(username,demreply)
end
if text and text:match('^تنزيل مدير (%d+)') and is_sudo(msg) then
local id = text:match('تنزيل مدير (%d+)')
if is_devtaha(msg) then
t = 'المطور 📬' elseif is_sudo(msg) then
t = 'المطور 📬' end
tahadevstorm:srem('owners:'..msg.chat_id_,user)
local text = '🧝‍♂| العضو •❯【 '..id..' 】\n🗃| تم تنزيله من الاداره  ꪜ\n💰| بواسطة •❯【 '..t..' 】'
SendMetion(msg.chat_id_, id, msg.id_, text, 16, string.len(id)) 
end
if text == 'مسح المدراء' and is_sudo(msg) then
tahadevstorm:del('owners:'..msg.chat_id_)
storm.sendtaha(msg.chat_id_, msg.id_, 1,'??￤ تم مسح مدراء المجموعه', 1, 'md')
end
end
--------------------

-------------------
if text == 'مسح المطورين' and is_sudo(msg) then   local list = tahadevstorm:smembers('sudo:') for k,v in pairs(list) do  tahadevstorm:srem(v,'sudo:') tahadevstorm:del("sudo:") tahadevstorm:del('sudo:')  end storm.sendtaha(msg.chat_id_, msg.id_, 1,'💥￤تم مسح جميع المطورين', 1, 'md')   end
if text == 'مسح المميزين عام' and is_sudo(msg) then   
local list = tahadevstorm:smembers('vip:groups') 
for k,v in pairs(list) do  
tahadevstorm:del(v,'vip:groups') 
tahadevstorm:del("vip:groups") 
tahadevstorm:del('vip:groups')  
end storm.sendtaha(msg.chat_id_, msg.id_, 1,'🚸￤تم مسح جميع المميزين عام', 1, 'md')   end
-----------------

--------------------
if text == 'مكاني' and check_user(msg) then
 local ch =  '@STORMCLl' 
local msguser = tonumber(tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 1)
	
if is_devtaha(msg) then
t = 'مطور اساسي 🕹' elseif is_sudo(msg) then
t = 'مطور 🃏' elseif is_owner(msg) then
t = 'مدير الكروب 💡' elseif is_mod(msg) then
t = 'ادمن الكروب 👮' elseif is_vipgroups(msg) then
t = 'مميز عام 📪' elseif is_vipgroup(msg) then
t = 'مميز 🚸' else
t = 'مجرد عضو 🙌' 
end 
local text = '??￤ ايديك  ( '..msg.sender_user_id_..' )\n🛰￤ رتبتك ( '..t..' )\n☇￤ رسائلك ( '..msguser..'\n✨￤تفاعلك ( '..formsgg(msguser)..' ) '
 SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, text, 13, string.len(msg.sender_user_id_))
 end 
---------------------
--كود التحديث عباره عن رن من التلي
if text == 'تحديث' and is_devtaha(msg) then
os.execute('rm -fr .telegram-cli')
dofile('bot.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*")
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*")
storm.sendtaha(msg.chat_id_, msg.id_, 1,'♻￤ تم تحديث البوت ', 1, 'md') end
if text == 'الكروبات' and is_sudo(msg) then local addgrop = tahadevstorm:scard("botgps") storm.sendtaha(msg.chat_id_, msg.id_, 1, 'عدد مجموعات الفعله ( *'..addgrop..'* )', 1, 'md') end end
if text == 'المشتركين' and is_sudo(msg) then local addgrop = tahadevstorm:scard("usersbot") or 0 storm.sendtaha(msg.chat_id_, msg.id_, 1, 'عددد المشتركين ( *'..addgrop..'* )', 1, 'md') end  
if text and text:match("^كول (.*)") and is_mod(msg) then local taha =  text:match("^كول (.*)") storm.sendtaha(msg.chat_id_, msg.id_, 1,'`'..taha..'`', 1, 'md') end
if text == 'مسح المجموعات' and is_sudo(msg) then local list = tahadevstorm:smembers('bot:gpsby:id')   for k,v in pairs(list) do storm.changeChatMemberStatus(v, bot_id, "Left") tahadevstorm:del("botgps") tahadevstorm:del('bot:gpsby:id')  end storm.sendtaha(msg.chat_id_, msg.id_, 1,'♻￤ تم المغادره المجموعات كلها ✔', 1, 'md')   end
if text == 'رفع المدير' then function gpinfo(arg,data) local function promote_admin(extra, result, success) vardump(result) local chat_id = msg.chat_id_ local admins = result.members_ for i = data.administrator_count_ - 1 , #admins do if tahadevstorm:sismember('owners:'..msg.chat_id_,admins[i].user_id_) then else tahadevstorm:sadd('owners:'..msg.chat_id_,admins[i].user_id_) end end storm.sendtaha(msg.chat_id_, msg.id_, 1,'💥￤ تم ترقيه مدير المجموعه منشئ', 1, 'md') end storm.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin) end storm.getChannelFull(msg.chat_id_, gpinfo, nil) end  if is_owner(msg) then 
if text == 'رفع الادمنيه' and is_owner(msg) then local function promote_admin(extra, result, success) vardump(result) local chat_id = msg.chat_id_ local admins = result.members_ for i=1 , #admins do if tahadevstorm:sismember('mods:'..msg.chat_id_,admins[i].user_id_) then else tahadevstorm:sadd('mods:'..msg.chat_id_,admins[i].user_id_) end end storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم ترقية ادمنيه الكروب', 1, 'md') end storm.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin) end
if chat_type == 'super' then
if text and text:match('^تفعيل ([https://]*.t.me/joinchat/%S+)$') and is_sudo(msg) then
tahadevstorm:sadd('bot:gps', text:match('تفعيل ([https://]*.t.me/joinchat/%S+)')) 
tahadevstorm:sadd('bot:gpsby:id', text:match('تفعيل ([https://]*.t.me/joinchat/%S+)')) 
local taha = text:match('تفعيل ([https://]*.t.me/joinchat/%S+)') tahadevstorm:del('lock:add'..msg.chat_id_) function getmepar(extra,result,success) local username = nil username = '@'..(result.username_ or 'ماكو معرف ❌')..'' storm.sendtaha(msg.chat_id_, msg.id_, 1,'☈￤ المطور ( '..username..' )\n🎫￤ايديه ( `'..msg.sender_user_id_..'` )\n🎗￤ تم بتفعيل المجموعه 🔻\n♻ ('..taha..')', 1, 'md') end getUser(msg.sender_user_id_, getmepar) end    
if text and text:match('^تعطيل ([https://]*.t.me/joinchat/%S+)$') and is_sudo(msg) then tahadevstorm:srem('bot:gps', text:match('تعطيل ([https://]*.t.me/joinchat/%S+)')) tahadevstorm:srem('bot:gpsby:id', text:match('تعطيل ([https://]*.t.me/joinchat/%S+)')) tahadevstorm:del("botgps") local taha = text:match('تعطيل ([https://]*.t.me/joinchat/%S+)') tahadevstorm:set('lock:add'..msg.chat_id_,true) function getmepar(extra,result,success) username = '@'..(result.username_ or 'ماكو معرف ❌')..'' storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ المطور ( '..username..' )\n📮￤ايديه ( `'..msg.sender_user_id_..'` )\n🚸￤ تم بتعطيل المجموعه 🔻\n📪 ('..taha..')', 1, 'md') end getUser(msg.sender_user_id_, getmepar) end
if text == 'تعطيل' and is_sudo(msg) then local username = nil function getmepar(extra,result,success) username = '@'..(result.username_ or 'ماكو معرف ❌')..'' tahadevstorm:set('lock:add'..msg.chat_id_,true) tahadevstorm:srem('bot:gpsby:id', msg.chat_id_) tahadevstorm:srem('bot:gps', msg.chat_id_) tahadevstorm:del("botgps") tahadevstorm:del('mods:'..msg.chat_id_) tahadevstorm:del('owners:'..msg.chat_id_)
tahadevstorm:del("addfrebot:"..msg.chat_id_, true)
 tahadevstorm:del("addfrebot:"..msg.chat_id_) tahadevstorm:del("setmoder:"..msg.chat_id_) tahadevstorm:del('banned'..msg.chat_id_) tahadevstorm:del('lock:id'..msg.chat_id_) tahadevstorm:del('rules:group'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ المطور ( '..username..' )\n📮￤ايديه ( `'..msg.sender_user_id_..'` )\n🚸￤ تم بتعطيل المجموعه 🔻\n📪 (`'..msg.chat_id_..'`)', 1, 'md') end getUser(msg.sender_user_id_, getmepar) end 
if text and text:match('^ضع اسم (.*)') and is_owner(msg) then local name = text:match('^ضع اسم (.*)') storm.changeChatTitle(msg.chat_id_, name) end
if text=="ضع رابط" and is_mod(msg) then  storm.sendtaha(msg.chat_id_, msg.id_, 1, "♨￤حسناا ارسل لي رابط المجموعه 📥", 1, 'md')       tahadevstorm:set("link:group"..msg.chat_id_, 'setlinkwai') end
if text == "الرابط"  then local link = tahadevstorm:get("link:group"..msg.chat_id_)            if link then                              storm.sendtaha(msg.chat_id_, msg.id_, 1, '💳￤رابط المجموعه 👇 \nٴ┄•🔸•┄༻📯༺┄•🔸•┄    \n'..link..'\n\n ٴ┄•🔸•┄༻📯༺┄•🔸•┄    \n', 1, 'html')                          else                storm.sendtaha(msg.chat_id_, msg.id_, 1, '❌￤لم يتم وضع رابط المجموعه\n📯￤ارسل ( ضع رابط ) ليتم حفظ الرابط', 1, 'md')              end            end
if text and text:match("^مسح الرابط$")  and is_mod(msg) then              storm.sendtaha(msg.chat_id_, msg.id_, 1, "📬￤تم مسح الرابط ✔", 1 , "html")            tahadevstorm:del("link:group" .. msg.chat_id_)       end
if text=="اذاعه" and is_devtaha(msg) then tahadevstorm:setex("bc:in:grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) storm.sendtaha(msg.chat_id_, msg.id_, 1, "♨￤حسناا ارسل النص", 1, "html") end
if text=="اذاعه خاص" and is_devtaha(msg) then tahadevstorm:setex("bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) storm.sendtaha(msg.chat_id_, msg.id_, 1, "♨￤حسناا ارسل النص", 1, "html") end
if text and text:match("^ضع قوانين$") and is_mod(msg) then tahadevstorm:setex("rules" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) storm.sendtaha(msg.chat_id_, msg.id_, 1, "📪￤حسناا ارسل النص", 1, "html")  end
if text and text:match("^مسح القوانين$")  and is_mod(msg) then   storm.sendtaha(msg.chat_id_, msg.id_, 1, "📬￤تم مسح القوانين ✔", 1 , "html")  tahadevstorm:del("rules:group" .. msg.chat_id_) end
if text and text:match("^القوانين$") then local rules = tahadevstorm:get("rules:group" .. msg.chat_id_)   if rules then     storm.sendtaha(msg.chat_id_, msg.id_, 1, rules, 1, nil)   else      storm.sendtaha(msg.chat_id_, msg.id_, 1, "❌￤لا توجد قوانين في المجموعه",  1, "html")   end    end
if text == 'بنت' or text == 'اي بنت' or text == 'ي بنت' or text == 'يي بنت'  or text == 'بنيه'  or text == 'بنية'  or text == 'ي ابنيه'  or text == 'اي ابنية' or text == 'اي ابنيه'  or text == 'مو ولد'  or text == 'مو صبي'  or text == 'مش ولد'  or text == 'مش صبي' then local taha = {'ئوف فديتج مح ئم خدود 🙈💋','همزين مو ولد كتلوني الزواحف والله ☹️','شلونج ياروحي 🐣💋','هلا بيج ياروحي انتي ☺️','ضيفيني كروبات ❤️','ئوف نطيني بوسه ياروحي ❤️💋','مح بنوتات ولا الولد كتلوني بس يزحفون 😡','هلا بالبنوتات 😻😻','شلونج اخبارج 🙀','هم يزحفولج 🤐' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'ولد' or text == 'اي ولد' or text == 'ي ولد' or text == 'يي ولد'  or text == 'رجال'  or text == 'لج اني ولد'  or text == 'مو بنيه'  or text == 'مو بنية'  or text == 'مو بنت' then local taha = {'مشيطلعبرا 😌','شعندك داخل خاص 😒','ثكيله وماحجي ويه ولد 😊','عوع ولد مشطلعبرا بلوك 🙃','برا متستحي داخل خاص 😒','هلا بيك تشرفت بيك ونته اخويه 😊','شلونك 🤓','ئشعدك داخل خاص ؟ 😒' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'دوم' or text == 'دومج' or text == 'ادومين' or text == 'ادوم'  or text == 'دومج❤️'   or text == 'دوم❤️'  or text == 'دومج ❤️'  or text == 'دوم ❤️' or text == 'دايمه'  or text == 'دايمة' then local taha = {'ادوم ايامك يالغالي  ❤️','تسلم دوم الحبيبك 😌','دوم وكعد ع عناد الواكفين 🤷🏼‍♀️','دوم وجيري 🌝🤷🏼‍♀️','يدومك الناسك ❤️😌' }  storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'اي وينهة' or text == 'اي وينه' or text == 'وينة' or text == 'وينهة'  or text == 'وينها'  or text == 'وينه' or text == 'اي وينهة' or text == 'اي وينها' then local taha = {'شمدريني تعال دوره يمكن تلكاه بجيبي 😂🙈','ليش ادور عليه 😐','يمي تعال هسه اكلك وينه 🙃','مادري والله هستوه جان هنا 😌','ميخصك 🤤','يمي بالخاص سد اخر ضهور اني كلت اله 😏','ميخصك حبيبي ويمي ئنته شنو 😋','بالمطبخ ديحضرلي لفه 😂🌝','هسه طلع من البيت راح يجيب عسل 😌','مالك دخل بي 🙊','روح دور عليه 🙂','هستوه جان يحجي هنا 👨🏼‍🎤','شمدريني روح اسئل غيري 👩🏼‍💻','عندك رقمه ؟ 🤷🏼‍♀️','اتصل عليه وذا ماعندك رصيد هذا كارت اشخط الشاشه وحطه ▓▓▓▓▓▓▓▓▓▓▓ <<اشخط هنا 🤷🏼‍♀️','يابة روح لو اخلي الاعضاء يتفلون بوجهك 😪😂' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'شبي' or text == 'شبيه' or text == 'شبيها' or text == 'شبيهة'  or text == 'كلي شبي'  or text == 'كلي شبيه' then local taha = {'شبت بيك 😒','يعني شبي ئنته كلي شبي 😐💔','خطيه ندعم و ودو للمستشفى وهسه بالعنايه العمه 😭','ئنته تعرف شبي 🙃','بي دم ولحم وزيدك من الشعر بيت يمشي ويحجي 🙊🙈','الدنيه دارت عليه خطيه 😪','يسلم عليك 😕','يريدك بشغله 🌝','روحله بساع يردك بشغله😐','غير تعارك ويايه وصيح عليه تراضها 😭','احجي شبي 🌝','يابة روح لو اخلي الاعضاء يتفلون بوجهك 😪😂' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'اكلج' or text == 'اكلك' or text == 'كلك' or text == 'كلج'  or text == 'ممكن طلب'  or text == 'ببكن طلب'  or text == 'اكول' then local taha = {'كول بعد روحي 😐❤️', 'شتريد تفضل 😌', 'اطلب طلب بي حض 😐', 'احجي ماعندي وقت اريد اطلع 🌝', 'تفضل كول 🌝💋', 'لخويا اختي لصغير الجبيره دلليدلل كول كولي مايردك ماردج اله لسانج لسانك 😂😂🤗',  'كول نعسانه من البارحه منايمه 🤤', 'كول 🙈', 'اذا عترفت بشي ومابي حض اكلب التلي عليك 😌', 'احجي 😶', 'صاير شي لا تجلطني 😳', 'ها 😒', 'لتشلع كلبي 😌', 'ها حبيبي كول ماكول لاحد 🙈', 'ها عيني 😉💋', 'شكو شرايد 😒','كولي بنتي ☺️🍼','كول ابني ☺️🍼 ','كول وماكول الخالتك🙊😹' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'هيج' or text == 'هيجي' or text == 'مو هيج' or text == 'زين هيج' or text == 'ليش هيج' then local taha = {'هيج لو دجاجه 🤣😌', 'لا يابه مو هيج منو كلك اني اعرف 🙃', 'لا مو هيج 🤓', 'اني جنت موجوده مصار هيج 😕', 'اني فراعت خضره دكلي هيج متستحي 😔', 'لدكول هيج اضوج من هاي الكلمه 😑', 'روح كول الغيري هيج مو الي 😒', 'يله نركص الهجع يلهجع 😌😂','براحتي اني مو بمزاجك دكلي هيج 😌', 'بابا رو ح خالو روح شسوي انته كلتلي هيج 🙃','وشلون تركص احلام ؟... جذي 💃🏼 جذي 💃🏼', 'منو كلك هيج اصلا 😂', 'اعرف طوختها راح اسكت 🤷🏼‍♂️', 'يله نغني هنــ🇭🇺ــدي هيجي كيجي ميجي ليجي 🤷🏼‍♂️' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == ""..botname..' شنو رئيك بهاذا' or text == 'شنو رئيك بهذا' or text == 'شنو رئيك بهاذا' or text == 'شنو رئيك بيه' then
function necha(extra, result, success)
local taha = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 💋🙄','يلعب ع البنات 🙄😐', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل 😻','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني 🤓❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات 🐣 ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷🏼‍♀️','مو خوش ولد 🤓' }
storm.sendtaha(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md')
        end
        if tonumber(msg.reply_to_message_id_) == 0 then
        else
           storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)  
          end
        end
        
        if text == ""..botname..' شنو رئيك بهاي' or text == 'شنو رئيج بهاي' or text == 'شنو رئيج بهايه' or text == 'شنو رئيج بهاية' or text == 'شو رئيك بهي' then
function necha(extra, result, success)

local taha = {'الكبد مال اني هيه 🙊🙄','ختولي ماحبها 😌','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 😐💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي 😔','ئووووووووف اموت ع ربها 😍😍','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 😣','صديقتي وختي وروحي وحياتي 😍😌','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤧🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ 😕😒','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🙌🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹😹' }
storm.sendtaha(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md')
        end
        if tonumber(msg.reply_to_message_id_) == 0 then
        else
           storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)  
          end
        end
----------------------

--------------------
if text == 'تفعيل' and is_sudo(msg) then
tahadevstorm:set("addfrebot:"..msg.chat_id_, true)
tahadevstorm:sadd('bot:gpsby:id', msg.chat_id_) 
tahadevstorm:sadd("botgps", msg.chat_id_)
function promote_admin(extra, result, success) vardump(result) local chat_id = msg.chat_id_ local admins = result.members_ for i=1 , #admins do if tahadevstorm:sismember('mods:'..msg.chat_id_,admins[i].user_id_) then else tahadevstorm:sadd('mods:'..msg.chat_id_,admins[i].user_id_) end end end storm.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin) function gpinfo(arg,data) local function promote_admin(extra, result, success) vardump(result) local chat_id = msg.chat_id_ local admins = result.members_ for i = data.administrator_count_ - 1 , #admins do if tahadevstorm:sismember('owners:'..msg.chat_id_,admins[i].user_id_) then else tahadevstorm:sadd('owners:'..msg.chat_id_,admins[i].user_id_) end end  end storm.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin) end storm.getChannelFull(msg.chat_id_, gpinfo, nil)
local taha = tahadevstorm:get("link:group"..msg.chat_id_)
if taha then 
text32 = 'لتفعيل المجموعه عليك وضع الرابط'
storm.sendtaha(msg.chat_id_, msg.id_, 1,text32, 1, 'html')
else
local zo = [[
💥 • المجموعه تم تفعيلها • 💥
`---------------------`
📬￤المجموعه (`]]..msg.chat_id_..[[`)
📯￤اسم المجموعه (`]]..get_title(msg.chat_id_)..[[`)
`---------------------`
💢￤معرف المطور (]]..get_username(msg.sender_user_id_)..[[)
💠￤ايدي المطور (`]]..msg.sender_user_id_..[[`)
]]
storm.sendtaha(msg.chat_id_, msg.id_, 1,zo, 1, 'md')
if not is_devtaha(msg) then  
 local link =  tahadevstorm:get("link:group"..msg.chat_id_)
 if not link then  
 link = "لم يتم وضعه" 
 end  
local text = [[💥 اهلا عزيزي المطور 💥
📪| لقد تم تفعيل مجموعه جديده
`---------------------`
📯￤معلومات المجموعه •
♨￤ايدي المجموعه (`]]..msg.chat_id_..[[`)
📡￤رابط المجموعه []]..link..[[]
💠￤اسم المجموعه (`]]..get_title(msg.chat_id_)..[[`)
🏂￤ عدد الادمنيه ( *]]..data.administrator_count_..[[* )
⛹￤ عدد المطرودين ( *]]..data.kicked_count_..[[* )
💥￤ عدد الاعضاء ( *]]..data.member_count_..[[* )
`---------------------`
📑￤معلومات المطور
📬￤اسم المطور (`]]..getname(msg.sender_user_id_)..[[`)
💢￤ايدي المطور (`]]..msg.sender_user_id_..[[`)
✨￤معرف المطور {]]..get_username(msg.sender_user_id_)..[[ }
]]
storm.sendtaha(SUDO, 0, 1,text, 1, 'md') 
end
end
end
-----------
if text and text:match('^هينه @(.*)') and is_sudo(msg) then
local username = text:match('^هينه @(.*)')
function demreply(extra,result,success)
  if result.id_ then
local text = "تدلل حياتي"
storm.sendtaha(msg.chat_id_, msg.id_, 1,text, 1, 'md')
local text = "تعال لك كواد فرخ  @"..username.." دودكي مستنقع 😹👻 "
storm.sendtaha(msg.chat_id_, result.id_, 1,text, 1, 'md')
else 
storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو لا يوجد في المجموعه ', 1, 'md')
end
end
resolve_username(username,demreply)
end
------------
if text == "تقيد" and is_mod(msg) and msg.reply_to_message_id_ then
function kekoii(extra, result, success)
storm.sendtaha(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..result.sender_user_id_..')* \n☑┇تم تقيده في المجموعه', 1, 'md')
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "")
end
storm.getMessage(msg.chat_id_, msg.reply_to_message_id_,kekoii)
end

if text == "الغاء تقيد" and is_mod(msg) and msg.reply_to_message_id_ then
function kekoii(extra, result, success)
storm.sendtaha(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..result.sender_user_id_..')* \n☑┇تم الغاء التقيد في المجموعه', 1, 'md')
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tahadevstorm:del("keko:band"..bot_id..msg.chat_id_..result.sender_user_id_)
end
storm.getMessage(msg.chat_id_, msg.reply_to_message_id_,kekoii)
end
if text and text:match("^(الغاء تقيد) @(.*)$") and is_mod(msg) then
local ikeko = {string.match(text, "^(الغاء تقيد) @(.*)$")}
function ikekoi(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
storm.sendtaha(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..result.id_..')* \n☑┇تم الغاء تقيده في المجموعه', 1, 'md')
tahadevstorm:del("keko:band"..bot_id..msg.chat_id_..result.id_)
else
storm.sendtaha(msg.chat_id_, msg.id_, 1, "✖┇خطاء", 1, 'html')
end
end
resolve_username(ikeko[2],ikekoi)
end
if text and  text:match("^(تقيد) @(.*)$") and is_mod(msg)  then
local ikeko = {string.match(text, "^(تقيد) @(.*)$")}
function ikekoi(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. chaneel .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "")
storm.sendtaha(msg.chat_id_, msg.id_, 1, '👤┇العضو ~⪼ *('..result.id_..')* \n☑┇تم تقيده في المجموعه', 1, 'md')
end
end
resolve_username(ikeko[2],ikekoi)
end

-----------			

if text == ""..botname.." رزله" or text == 'نكحه' then
function necha(extra, result, success)
local text = "تدلل حياتي"
storm.sendtaha(msg.chat_id_, msg.id_, 1,text, 1, 'md')

local text = "تعال لك كواد فرخ دودكي مستنقع 😹👻"
storm.sendtaha(msg.chat_id_, result.id_, 1,text, 1, 'md')
        end
        if tonumber(msg.reply_to_message_id_) == 0 then
        else
           storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)  
          end
        end
        
        if text == ""..botname.." بوسه" or text == 'مصه' then
function necha(extra, result, success)
local taha = {"هاي",'[taha](T.ME/TAHAJ20)' }
storm.sendtaha(msg.chat_id_, result.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md')
        end
        if tonumber(msg.reply_to_message_id_) == 0 then
        else
           storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),necha)  
          end
        end
        
        if text == 'غني' then
	local on = {'Fun/taha.ogg.mp3'}
	sdor.sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, ''..on[math.random(#on)]..'', msg_caption, dl_cb, nil)
     end
             if text == 'سكته' then
	local on = {'Fun/taha1.mp4'}
	sdor.sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, ''..on[math.random(#on)]..'', msg_caption, dl_cb, nil)
     end

if text and text:match("ضع صوره") and is_owner(msg) then tahadevstorm:set('setphoto:in:group'..msg.chat_id_..''..msg.sender_user_id_,true)  storm.sendtaha(msg.chat_id_, msg.id_, 1, '✨ | حسنا ارسل الصوره الان 💥', 1, 'md') end
----------------------------		
if text and text:match("^اضف رد$") and tonumber(msg.sender_user_id_) == tonumber(SUDO)  then local taha5 = '☇￤حسنآ قم بارسال الكلمه لتعيينها 📯' storm.sendtaha(msg.chat_id_, msg.id_, 1, taha5, 1, 'md') tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_, 'taha') return false  end if text and text:match("^(.*)$") then if not tahadevstorm:get('lock:reply'..msg.chat_id_) then local reply_in_grup = tahadevstorm:get('reply_in_grup'..text..''..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1, reply_in_grup, 1, 'md') end local reply_grup_by_sudo = tahadevstorm:get('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_) local taha6 = '☇￤حسنآ قم بارسال الرد ' if reply_grup_by_sudo == 'taha' then storm.sendtaha(msg.chat_id_, msg.id_, 1, taha6, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_, 'rd') tahadevstorm:set('taha'..msg.sender_user_id_..''..msg.chat_id_, text) return false  end if reply_grup_by_sudo == 'rd' then local reply_in_grup2 = tahadevstorm:get('taha'..msg.sender_user_id_..''..msg.chat_id_) local taha7 = '☇￤تم حفظ الرد في المجموعه 😀' tahadevstorm:set('reply_in_grup'..reply_in_grup2..''..msg.chat_id_, text) tahadevstorm:sadd('reply_in_gruprdsudo'..msg.chat_id_, reply_in_grup2) storm.sendtaha(msg.chat_id_, msg.id_, 1, taha7, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_, 'not') end end
if text and text:match("^حذف رد$") and tonumber(msg.sender_user_id_) == tonumber(SUDO)  then local taha8 = '☇￤حسنآ قم بارسال الكلمه لحذف الرد ✂' storm.sendtaha(msg.chat_id_, msg.id_, 1, taha8, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_, 'nottaha') return false  end  if text and text:match("^(.*)$") then local reply_grup_by_sudo = tahadevstorm:get('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_) local taha9 = '☇￤تم حذف الرد في المجموعه 📪' if reply_grup_by_sudo == 'nottaha' then storm.sendtaha(msg.chat_id_, msg.id_, 1, taha9, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..msg.chat_id_, 'not')  tahadevstorm:set('reply_in_grup'..text..''..msg.chat_id_..'', " ")  end end
if text and text:match("^اضف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(SUDO)  then local taha5 = '☇￤حسنآ قم بارسال الكلمه لتعيينها 📯' storm.sendtaha(msg.chat_id_, msg.id_, 1, taha5, 1, 'md') tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id, 'taha') return false end
if text and text:match("^(.*)$") then if not tahadevstorm:get('lock:dev'..msg.chat_id_) then local reply_in_grup = tahadevstorm:get('reply_in_grup'..text..''..bot_id) storm.sendtaha(msg.chat_id_, msg.id_, 1, reply_in_grup, 1, 'md') end local reply_grup_by_sudo = tahadevstorm:get('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id) local taha6 = '☇￤حسنآ قم بارسال الرد ♨' if reply_grup_by_sudo == 'taha' then storm.sendtaha(msg.chat_id_, msg.id_, 1, taha6, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id, 'rd') tahadevstorm:set('taha'..msg.sender_user_id_..''..bot_id, text) return false  end if reply_grup_by_sudo == 'rd' then local reply_in_grup2 = tahadevstorm:get('taha'..msg.sender_user_id_..''..bot_id) local taha7 = '☇￤تم حفظ الرد في المجموعه 🎁' tahadevstorm:set('reply_in_grup'..reply_in_grup2..''..bot_id, text) tahadevstorm:sadd('reply_in_gruprdsudo'..bot_id, reply_in_grup2) storm.sendtaha(msg.chat_id_, msg.id_, 1, taha7, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id, 'not') end end
if text and text:match("^حذف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(SUDO)  then local taha8 = '☇￤حسنآ قم بارسال الكلمه لحذف الرد 🚷' storm.sendtaha(msg.chat_id_, msg.id_, 1, taha8, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id, 'nottaha') return false  end if text and text:match("^(.*)$") then local reply_grup_by_sudo = tahadevstorm:get('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id) local taha9 = '☇￤تم حذف الرد في المجموعه 😃' if reply_grup_by_sudo == 'nottaha' then storm.sendtaha(msg.chat_id_, msg.id_, 1, taha9, 1, 'md')  tahadevstorm:set('reply_grup_by_sudo'..msg.sender_user_id_..''..bot_id, 'not')  tahadevstorm:set('reply_in_grup'..text..''..bot_id..'', " ")  end end
if text and text:match("^مسح ردود المجموعه$") and is_devtaha then local startreply = '☇￤تم مسح ردود المجموعه 🎑' local list = tahadevstorm:smembers('reply_in_gruprdsudo'..bot_id) for k,v in pairs(list) do tahadevstorm:del('reply_in_gruprdsudo'..msg.chat_id_, text) tahadevstorm:set('reply_in_grup'..v..''..msg.chat_id_..'', " ") end storm.sendtaha(msg.chat_id_, msg.id_, 1, startreply, 1, 'md') end
if text and text:match("^ردود المجموعه$") and is_devtaha then local list = tahadevstorm:smembers('reply_in_gruprdsudo'..msg.chat_id_..'') text = "📑 | قائمه ردود في المجموعه 📬 \n\n" for k,v in pairs(list) do local reply_grup_by_sudo1 = tahadevstorm:get('reply_in_grup'..v..''..msg.chat_id_..'') if tahadevstorm:get('reply:group:'..msg.chat_id_) then text = text..""..k.." • | *【 "..v.." 】*\n`— — — — — — — — —`\n"  else text = text..""..k.."• | 【 "..v.." 】\n`— — — — — — — — —`\n" end end if #list == 0 then text = '☇￤المجموعه خاليه من الردود' end storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end
if text and text:match("^مسح ردود المطور$") and is_devtaha then local startreply = '☇￤تم مسح ردود المطور 🎑' local list = tahadevstorm:smembers('reply_in_gruprdsudo'..bot_id) for k,v in pairs(list) do tahadevstorm:del('reply_in_gruprdsudo'..bot_id, text) tahadevstorm:set('reply_in_grup'..v..''..bot_id..'', " ") end storm.sendtaha(msg.chat_id_, msg.id_, 1, startreply, 1, 'md') end
if text and text:match("^ردود المطور$") and is_devtaha then local list = tahadevstorm:smembers('reply_in_gruprdsudo'..bot_id..'') text = "☇￤قائمه ردود المطور \n\n" for k,v in pairs(list) do local reply_grup_by_sudo1 = tahadevstorm:get('reply_in_grup'..v..''..bot_id..'') if tahadevstorm:get('reply:group:'..msg.chat_id_) then text = text..""..k.."• | 【 "..v.." 】\n`— — — — — — — — —`\n"  else text = text..""..k.."• | 【 "..v.." 】\n`— — — — — — — — —`\n" end end if #list == 0 then text = "☇￤قائمه ردود المطور فارغه" end storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'html') end

if text and text:match('^غادر (-%d+)')  and is_sudo(msg) then gp = text:match('غادر (-%d+)') tahadevstorm:srem('bot:gps', gp) tahadevstorm:srem('bot:gpsby:id', gp) tahadevstorm:del("botgps") tahadevstorm:del('mod:'..gp) tahadevstorm:del('owners:'..gp) tahadevstorm:del('banned:'..gp) tahadevstorm:del("addfrebot:"..gp) tahadevstorm:del("setmoder:"..gp) tahadevstorm:del("gps:settings:"..gp) tahadevstorm:del("gps:settings:"..gp) storm.sendtaha(text:match('غادر (-%d+)'), 0, 1,'💢￤تم مغادره البوت من المجموعه \n♨￤الامر بواسطه مطور البوت \n 📪￤للاستفسار راسل مطور البوت ', 1, 'html') storm.changeChatMemberStatus(text:match('غادر (-%d+)'), bot_id, "Left") storm.sendtaha(msg.chat_id_, msg.id_, 1,'📬￤تم ازاله المجموعه من مجموعات البوت بنجاح ✔ ', 1, 'html') end if tonumber(msg.reply_to_message_id_) > 0 then
if text ==("مسح") and is_mod(msg) then delete_msg(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   end   end
if text ==('تفعيل الترحيب') and is_owner(msg) then tahadevstorm:set('add:welc:'..msg.chat_id_,'add') storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم تفعيل الترحيب', 1, 'md') end
if text ==('تعطيل الترحيب') and is_owner(msg) then tahadevstorm:set('add:welc:'..msg.chat_id_,'rem') storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم تعطيل الترحيب', 1, 'md') end
if text and text:match('^ضع ترحيب (.*)') and is_owner(msg) then local welcome = text:match('^ضع ترحيب (.*)') tahadevstorm:set('welcome:'..msg.chat_id_,welcome) local t = '🎫￤ تم وضع الترحيب ( `'..welcome..'` )' storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'html') end
if text ==('مسح الترحيب') and is_owner(msg) then tahadevstorm:del('welcome:'..msg.chat_id_,welcome) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح ترحيب المجموعه', 1, 'md') end
if text ==('المدراء') and is_owner(msg) then local list = tahadevstorm:smembers('owners:'..msg.chat_id_) local t = '🎫￤ قائمه المدراء 📥 • \n\n' for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else t = t .. k .. " ➛ •【" .. v .. "】\n" end end if #list == 0 then t = '🎫￤ لا يوجد مدراء هنا' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'md') end
if text ==('المطورين') and is_sudo(msg) then  local list = tahadevstorm:smembers('sudo:')  local t = '🎫￤ قائمه المطورين 📥 • \n\n'  for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else  t = t .. k .. " ➛ •【" .. v .. "】\n"  end end  if #list == 0 then  t = '🎫￤لا يوجد مطورين في البوت' end  storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'html') end
if text ==('روابط الكروبات') and is_sudo(msg) then local list = tahadevstorm:smembers('bot:gps') local t = '🎫￤ قائمه روابط المجموعات المفعله \n\n' for k,v in pairs(list) do  t = t..k.."<code>• [ </code>"..v.."]\n"  end t = t..'' if #list == 0 then t = '🎫￤ لا توجد مجموعات مفعله' end  storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'html') end
if text ==('المجموعات') and is_sudo(msg) then local list = tahadevstorm:smembers('bot:gpsby:id') local t = '??￤ قائمه المجموعات المفعله \n\n' for k,v in pairs(list) do  t = t..k.." - <code>"..v.."</code>\n"  end t = t..'' if #list == 0 then t = '🎫￤ لا توجد مجموعات مفعله' end  storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'html') end
if text ==('رفع ادمن') and is_owner(msg) then function prom_reply(extra, result, success) if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب 💡'  end tahadevstorm:sadd('mods:'..msg.chat_id_,result.sender_user_id_)  local user = result.sender_user_id_ local text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته ادمن  ꪜ\n💰| بواسطة •❯【 '..t..' 】' SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user)) end if tonumber(msg.reply_to_message_id_) == 0 then else storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   end end
if text and text:match('^رفع ادمن @(.*)') and is_owner(msg) then local username = text:match('^رفع ادمن @(.*)') function promreply(extra,result,success) if result.id_ then if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب 💡'  end tahadevstorm:sadd('mods:'..msg.chat_id_,result.id_) SendMetion(msg.chat_id_, result.id_, msg.id_, '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تمت ترقيته ادمن  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(result.id_)) else  storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو لا يوجد في المجموعه ', 1, 'md') end end resolve_username(username,promreply) end
if text ==('^رفع ادمن (%d+)') and is_owner(msg) then local user = text:match('رفع ادمن (%d+)') if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب 💡'  end tahadevstorm:sadd('mods:'..msg.chat_id_,user) mbb = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته ادمن  ꪜ\n💰| بواسطة •❯【 '..t..' 】' SendMetion(msg.chat_id_, user, msg.id_, mbb, 16, string.len(user)) end
if text ==('تنزيل ادمن') and is_owner(msg) then function prom_reply(extra, result, success) if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب 💡'  end tahadevstorm:srem('mods:'..msg.chat_id_,result.sender_user_id_) sos = '🧝‍♂| العضو •❯【 '..result.sender_user_id_..' 】\n🗃| تم تنزيله من الادمنيه  ꪜ\n💰| بواسطة •❯【 '..t..' 】'  SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, sos,16, string.len(result.sender_user_id_)) end if tonumber(msg.reply_to_message_id_) == 0 then else storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   end end
if text and text:match('^تنزيل ادمن @(.*)') and is_owner(msg) then local username = text:match('^تنزيل ادمن @(.*)') function promreply(extra,result,success) if result.id_ then if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب 💡'  end tahadevstorm:srem('mods:'..msg.chat_id_,result.id_) SendMetion(msg.chat_id_, result.id_, msg.id_, '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تم تنزيله من الادمنيه  ꪜ\n💰| بواسطة •❯【 '..t..' 】' , 16, string.len(result.id_)) else  storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو لا يوجد في المجموعه ', 1, 'md') end end resolve_username(username,promreply) end
if text and text:match('^تنزيل ادمن (%d+)') and is_owner(msg) then local user = text:match('تنزيل ادمن (%d+)')    if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب'  end  tahadevstorm:srem('mds:'..msg.chat_id_,user) text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم تنزيله من الادمنيه  ꪜ\n💰| بواسطة •❯【 '..t..' 】' SendMetion(msg.chat_id_, user, msg.id_, text,16, string.len(user))  end end end 
if text ==('الادمنيه') and is_mod(msg) then local list = tahadevstorm:smembers('mods:'..msg.chat_id_) local t = '🎫￤ قائمه الادمنيه 📥 • \n\n' for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else t = t .. k .. " ➛ •【" .. v .. "】\n" end end if #list == 0 then t = '🎫￤لا يوجد ادمنيه في المجموعه' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'md') end
if text ==('مسح الادمنيه') and is_owner(msg) then tahadevstorm:del('mods:'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح ادمنيه البوت', 1, 'md') end
if text ==('مسح المطرودين') and is_owner(msg) then local function removeblocklist(extra, result) if tonumber(result.total_count_) == 0 then  storm.sendtaha(msg.chat_id_, msg.id_, 0,'🎫￤ المجموعه خاليه من المطرودين', 1, 'md') else local x = 0 for x,y in pairs(result.members_) do x = x + 1 storm.changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil) end storm.sendtaha(msg.chat_id_, msg.id_, 0,'🎫￤ تم مسح بيانات الكروب', 1, 'md') end end storm.getChannelMembers(msg.chat_id_, 0, 'Kicked', 2000, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})  end
if text ==('مسح المحذوف') and is_owner(msg) then local function deleteaccounts(extra, result) for k,v in pairs(result.members_) do  local function cleanaccounts(extra, result) if not result.first_name_ then storm.changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked") end end storm.getUser(v.user_id_, cleanaccounts, nil) end  storm.sendtaha(msg.chat_id_, msg.id_, 0,'🎫￤ تم مسح الحسابات المحذوفه', 1, 'md') end  tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1000}, deleteaccounts, nil) end if is_mod(msg) then local function getsettings(value) if value == 'welcome' then local hash = tahadevstorm:get('welcome:'..msg.chat_id_) if hash == 'enable' then return '` مفعل ✓ `' else return '` معطل ✘ `' end elseif value == 'spam' then local hash = tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"flood") if hash then  if tahadevstorm:hget("flooding:settings:"..msg.chat_id_, "flood") == "kick" then return '` بالطرد 🚸 `' elseif tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"flood") == "ban" then return '` بالحظر 🚸 `' elseif tahadevstorm:hget("flooding:settings:"..msg.chat_id_,"flood") == "mute" then return '` بالكتم 🔇 `' end  else return '` معطل ✘ `' end elseif is_lock(msg,value) then return  '` مقفل ✓ `' else return '` مفتوح ✘ `' end end
if text == 'الاعدادات' and is_mod(msg) then local text = ' 🎁 • اعدادات المجموعه • 🎁\n•——•💠•۪۫•৩﴾ • 📯 • ﴿৩•۪۫•💠•——•\n\n'..'☈￤ الروابط ('..getsettings('الروابط')..')\n'..'☈￤ البوتات ('..getsettings('البوتات')..')\n'..'☈￤ التاك ('..getsettings('التاك')..')\n'..'☈￤ التكرار ('..getsettings('التكرار')..')\n'..'☈￤ المعرفات ('..getsettings('المعرفات')..')\n'..'☈￤ التوجيه ('..getsettings('التوجيه')..')\n'..'☈￤ عدد التكرار ('..NUM_MSG_MAX..' )\n'..'☈￤ زمن التكرار ('..TIME_CHECK..' )\n'..'\n\n•—>  📯 • اعدادات اخراى • 📯  <—•\n\n'..'\n☈￤ الدخول ('..getsettings('الدخول')..' )\n'..'☈￤ العربيه ('..getsettings('العربيه')..' )\n'..'☈￤ التثبيت ('..getsettings('التثبيت')..' )\n'..'☈￤ الترحيب ('..getsettings('welcome')..' )\n'..'☈￤ الانكلش ('..getsettings('الانكلش')..' )\n'..'☈￤ السيلفي ('..getsettings('السيلفي')..' )\n'..'☈￤ الاشعارات ('..getsettings('الاشعارات')..' )\n'..'☈￤ اللستات ('..getsettings('اللستات')..' )\n'..'\n\n•—> 💥 • اعدادات الوسائط • 💥 <—•\n\n'..'☈￤ الصوت ('..getsettings('الصوت')..' )\n'..'☈￤ المتحركه ('..getsettings('المتحركه')..' )\n'..'☈￤ الملفات ('..getsettings('الملفات')..' )\n'..'☈￤ الدردشه ('..getsettings('الدردشه')..' )\n'..'☈￤ الفيديو ('..getsettings('الفيديو')..' )\n'..'☈￤ الالعاب ('..getsettings('الالعاب')..' )\n'..'☈￤ الصور ('..getsettings('الصور')..' )\n'..'☈￤ الاغاني ('..getsettings('الاغاني')..' )\n'..'☈￤ الملصقات ('..getsettings('الملصقات')..' )\n'..'☈￤ الجهات ('..getsettings('الجهات')..' )\n\n•——•📮•۪۫•৩﴾ • 📯 • ﴿৩•۪۫•📮•——•\n📭￤ المطور @TAHAJ20' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end
if text and text:match('^ضع تكرار (%d+)$') and is_mod(msg) then tahadevstorm:hset("flooding:settings:"..msg.chat_id_ ,"floodmax" ,text:match('ضع تكرار (.*)')) storm.sendtaha(msg.chat_id_, msg.id_, 1,'??￤ تم وضع عدد التكرار في المجموعه ( '..text:match('ضع تكرار (.*)')..' )', 1, 'md') end if text and text:match('^ضع زمن التكرار (%d+)$') and is_mod(msg) then tahadevstorm:hset("flooding:settings:"..msg.chat_id_ ,"floodtime" ,text:match('ضع زمن التكرار (.*)')) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم وضع زمن التكرار في المجموعه ( '..text:match('ضع زمن التكرار (.*)')..' )', 1, 'md') end
if text == 'الترحيب' then local tahalink = tahadevstorm:get('welcome:'..msg.chat_id_)  if tahalink then storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..tahalink..'', 1, 'html') else storm.sendtaha(msg.chat_id_, msg.id_, 1, 'ماكو رابط', 1, 'html') end end
if text == 'طرد' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then function kick_by_reply(extra, result, success) kickm(msg,msg.chat_id_,result.sender_user_id_) end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kick_by_reply) end
if text and text:match('^طرد (%d+)') and is_mod(msg) then kickm(msg,msg.chat_id_,text:match('طرد (%d+)')) end
if text and text:match('^طرد @(.*)') and is_mod(msg) then local username = text:match('طرد @(.*)') function kick_username(extra,result,success) if result.id_ then kickm(msg,msg.chat_id_,result.id_) else   storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤ العضو لا يوجد في المجموعه ', 1, 'md') end end resolve_username(username,kick_username) end
if text == 'حظر' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then function banreply(extra, result, success) ban(msg,msg.chat_id_,result.sender_user_id_) end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),banreply) end
if text and text:match('^حظر (%d+)') and is_mod(msg) then ban(msg,msg.chat_id_,text:match('حظر (%d+)')) end 
if text and text:match('^حظر @(.*)') and is_mod(msg) then local username = text:match('حظر @(.*)') function banusername(extra,result,success) if result.id_ then ban(msg,msg.chat_id_,result.id_) else  text = '🎫￤ العضو لا يوجد في المجموعه ' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end end resolve_username(username,banusername) end
if text == 'الغاء الحظر' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then function unbanreply(extra, result, success) unban(msg,msg.chat_id_,result.sender_user_id_) end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) end
if text and text:match('^الغاء الحظر (%d+)') and is_mod(msg) then unban(msg,msg.chat_id_,text:match('الغاء الحظر (%d+)')) end 
if text and text:match('^الغاء الحظر @(.*)') and is_mod(msg) then local username = text:match('الغاء الحظر @(.*)') function unbanusername(extra,result,success) if result.id_ then unban(msg,msg.chat_id_,result.id_) else  text = '🎫￤ العضو لا يوجد في المجموعه ' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end end resolve_username(username,unbanusername) end
if text == 'المحظورين' and is_mod(msg) then local list = tahadevstorm:smembers('banned'..msg.chat_id_)local t = '🎫￤ قائمه المحظورين 📥 • \n\n' for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else t = t .. k .. " ➛ •【" .. v .. "】\n" end end if #list == 0 then t = '🎫￤ لا يوجد محظورين في هاذه المجموعه' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'md') end  
if text == 'مسح المحظورين' and is_owner(msg) then  tahadevstorm:del('banned'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح المحظورين', 1, 'md') end 
if text == 'رفع مميز' and is_mod(msg) then    function vippyrep(extra, result, success)   tahadevstorm:sadd('vip:group'..msg.chat_id_,result.sender_user_id_)    local user = result.sender_user_id_   if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب'  end text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مميز   ꪜ\n💰| بواسطة •❯【 '..t..' 】'    SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user))    end  if tonumber(msg.reply_to_message_id_) == 0 then  else    storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),vippyrep)   end  end
if text and text:match('^رفع مميز @(.*)') and is_mod(msg) then  local username = text:match('^رفع مميز @(.*)') function vippyrep(extra,result,success)   if result.id_ then     if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب'  end  tahadevstorm:sadd('vip:group'..msg.chat_id_,result.id_) text = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تمت ترقيته مميز   ꪜ\n💰| بواسطة •❯【 '..t..' 】' else     text2 = taha   end    SendMetion(msg.chat_id_, result.id_, msg.id_, text, 16, string.len(result.id_))    end  resolve_username(username,vippyrep) end
if text and text:match('^رفع مميز (%d+)') and is_mod(msg) then local user = text:match('رفع مميز (%d+)')    if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب'  end  tahadevstorm:sadd('vip:group'..msg.chat_id_,user) text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مميز   ꪜ\n💰| بواسطة •❯【 '..t..' 】'  SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user))  end
if text ==('تنزيل مميز') and is_mod(msg) then function prom_reply(extra, result, success) if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب 💡'  end tahadevstorm:srem('vip:group'..msg.chat_id_,result.sender_user_id_) sos = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃|تم تنزيله من المميزين   ꪜ\n💰| بواسطة •❯【 '..t..' 】'  SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, sos,16, string.len(result.sender_user_id_)) end if tonumber(msg.reply_to_message_id_) == 0 then else storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)   end end
if text and text:match('^تنزيل مميز @(.*)') and is_mod(msg) then local username = text:match('^تنزيل مميز @(.*)')  function vippyrep(extra,result,success)   if result.id_ then     if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب'  end   tahadevstorm:srem('vip:group'..msg.chat_id_,result.id_) text = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃|تم تنزيله من المميزين   ꪜ\n💰| بواسطة •❯【 '..t..' 】'   else       text2 = taha   end   SendMetion(msg.chat_id_, result.id_, msg.id_, text, 16, string.len(result.id_))     end resolve_username(username,vippyrep) end
if text and text:match('^تنزيل مميز (%d+)') and is_mod(msg) then local user = text:match('تنزيل مميز (%d+)')    if is_devtaha(msg) then t = 'مطور اساسي ' elseif is_sudo(msg) then t = 'مطور' elseif is_owner(msg) then t = 'مدير الكروب'  end  tahadevstorm:srem('vip:group'..msg.chat_id_,user) text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت تنزيله من المميزين   ꪜ\n💰| بواسطة •❯【 '..t..' 】'  SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user))  end
if text == 'المميزين' and is_mod(msg) then  local list = tahadevstorm:smembers('vip:group'..msg.chat_id_) local t = '🎫￤ قائمه المميزين 📥 • \n\n' for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else t = t .. k .. " ➛ •【" .. v .. "】\n" end end if #list == 0 then t = '🎫￤ لا يوجد مميزين في هاذه المجموعه' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'md') end 
if text == 'مسح المميزين' and is_owner(msg) then  tahadevstorm:del('vip:group'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح المميزين', 1, 'md') end 
if text == 'رفع مميز عام' and is_devtaha(msg) then function vippyrep(extra, result, success) tahadevstorm:sadd('vip:groups',result.sender_user_id_)  if is_devtaha(msg) then t = 'المطور الاساسي' end  local user = result.sender_user_id_ text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مميز في الكروبات  ꪜ\n💰| بواسطة •❯【 '..t..' 】'   SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user))   end    if tonumber(msg.reply_to_message_id_) == 0 then    else     storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),vippyrep)       end  end
if text and text:match('^رفع مميز عام @(.*)') and is_devtaha(msg) then     local username = text:match('^رفع مميز عام @(.*)')  function vippyuser(extra,result,success)   if result.id_ then   if is_devtaha(msg) then t = 'المطور الاساسي' end  tahadevstorm:sadd('vip:groups',result.id_) text = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تمت ترقيته مميز في الكروبات  ꪜ\n💰| بواسطة •❯【 '..t..' 】'   else    text = taha    end    SendMetion(msg.chat_id_, result.id_, msg.id_, text, 16, string.len(result.id_))    end    resolve_username(username,vippyuser)  end
if text and text:match('^رفع مميز عام (%d+)') and is_devtaha(msg) then     local user = text:match('رفع مميز عام (%d+)')   if is_devtaha(msg) then t = 'المطور الاساسي' end   tahadevstorm:sadd('vip:groups',user)  text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تمت ترقيته مميز في الكروبات  ꪜ\n💰| بواسطة •❯【 '..t..' 】'    SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user))  end
if text == 'تنزيل مميز عام' and is_devtaha(msg) then   function vippyrep(extra, result, success)    if is_devtaha(msg) then t = 'المطور الاساسي' end  tahadevstorm:srem('vip:groups',result.sender_user_id_) text = '🧝‍♂| العضو •❯【 '..result.sender_user_id_..' 】\n🗃| تم تنزيله من المميزين عام  ꪜ\n💰| بواسطة •❯【 '..t..' 】'   SendMetion(msg.chat_id_, result.sender_user_id_, msg.id_, text, 16, string.len(result.sender_user_id_))   end   if tonumber(msg.reply_to_message_id_) == 0 then    else  storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),vippyrep)      end   end   
if text and text:match('^تنزيل مميز عام @(.*)') and is_devtaha(msg) then  local username = text:match('^تنزيل مميز عام @(.*)')   function vippyrep(extra,result,success)  if result.id_ then     if is_devtaha(msg) then t = 'المطور الاساسي' end    tahadevstorm:srem('vip:groups',result.id_) text = '🧝‍♂| العضو •❯【 '..result.id_..' 】\n🗃| تم تنزيله من المميزين عام  ꪜ\n💰| بواسطة •❯【 '..t..' 】'   else     text = taha  end  SendMetion(msg.chat_id_, result.id_, msg.id_, text, 16, string.len(result.id_))    end  resolve_username(username,vippyrep)   end  
if text and text:match('^تنزيل مميز عام (%d+)') and is_devtaha(msg) then   local user = text:match('تنزيل مميز عام (%d+)')  if is_devtaha(msg) then t = 'المطور الاساسي' end   tahadevstorm:srem('vip:groups',user) text = '🧝‍♂| العضو •❯【 '..user..' 】\n🗃| تم تنزيله من المميزين عام  ꪜ\n💰| بواسطة •❯【 '..t..' 】'    SendMetion(msg.chat_id_, user, msg.id_, text, 16, string.len(user))    end
if text == 'المميزين عام' and is_devtaha(msg) then  local list = tahadevstorm:smembers('vip:groups') local t = '🎫￤ قائمه المميزين عام 📥 • \n\n' for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else t = t .. k .. " ➛ •【" .. v .. "】\n" end end if #list == 0 then t = '🎫￤ لا يوجد مميزين عام في هاذه المجموعه' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'html') end 
if text == 'مسح المميزين عام' and is_devtaha(msg) then  tahadevstorm:del('vip:groups'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح المميزين عام', 1, 'md') end 
if text == 'كتم' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then function mutereply(extra, result, success) mute(msg,msg.chat_id_,result.sender_user_id_) end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),mutereply) end
if text and text:match('^كتم (%d+)') and is_mod(msg) then mute(msg,msg.chat_id_,text:match('كتم (%d+)')) end
if text and text:match('^كتم @(.*)') and is_mod(msg) then local username = text:match('كتم @(.*)') function muteusername(extra,result,success) if result.id_ then mute(msg,msg.chat_id_,result.id_) else  text = '🎫￤ العضو لا يوجد في المجموعه ' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end end resolve_username(username,muteusername) end
if text == 'الغاء الكتم' and tonumber(msg.reply_to_message_id_) > 0 and is_mod(msg) then function unmutereply(extra, result, success) unmute(msg,msg.chat_id_,result.sender_user_id_) end storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unmutereply) end  
if text and text:match('^الغاء الكتم (%d+)') and is_mod(msg) then  unmute(msg,msg.chat_id_,text:match('الغاء الكتم (%d+)')) end 
if text and text:match('^الغاء الكتم @(.*)') and is_mod(msg) then local username = text:match('الغاء الكتم @(.*)') function unmuteusername(extra,result,success) if result.id_ then unmute(msg,msg.chat_id_,result.id_) else  text = '🎫￤ العضو لا يوجد في المجموعه ' storm.sendtaha(msg.chat_id_, msg.id_, 1, text, 1, 'md') end end resolve_username(username,unmuteusername) end 
if text == 'المكتومين' and is_mod(msg) then if not tahadevstorm:get("lock:add"..msg.chat_id_) then local list = tahadevstorm:smembers('mutes'..msg.chat_id_) local t = '🎫￤ قائمه المكتومين 📥 • \n\n' for k, v in pairs(list) do local user_info = tahadevstorm:hgetall('user:'..v) if user_info and user_info.username then local username = user_info.username t = t .. k .. " ➛ •【@" ..username.."】\n" else t = t .. k .. " ➛ •【" .. v .. "】\n" end end if #list == 0 then t = '🎫￤لا يوجد مكتومين في هاذه المجموعه' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'md')       end end
if text == ('مسح المكتومين') and is_owner(msg) then  tahadevstorm:del('mutes'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤ تم مسح المكتومين', 1, 'md') end end
if text and text:match('^مسح (%d+)$') and is_owner(msg) then  local taha = tonumber(text:match('^مسح (%d+)$')) if taha > 100 then storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤تستطيح المسح للعدد 100 فقط •', 1, 'md') else function cb(a,b,c) local msgs = b.messages_  for i=1 , #msgs do delete_msg(msg.chat_id_,{[0] = b.messages_[i].id_}) end end storm.getChatHistory(msg.chat_id_, 0, 0, taha + 1,cb) storm.sendtaha(msg.chat_id_, msg.id_, 1,'￤تم مسح ( `'..taha..'` ) رساله في المجموعه', 1, 'md') end end  if tonumber(msg.reply_to_message_id_) > 0 then
if text and text:match("حذف") and is_mod(msg) then delete_msg(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_}) end	 end
if text and text:match('^منع (.*)') and is_mod(msg) then local taha = text:match('^منع (.*)') tahadevstorm:sadd('filters:'..msg.chat_id_,taha) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤الكلمه ( `'..taha..'` ) تم منعها في المجموعه بنجاح ✔', 1, 'md') end 
if text and text:match('^الغاء المنع (.*)') and is_mod(msg) then  local taha = text:match('^الغاء المنع (.*)') tahadevstorm:srem('filters:'..msg.chat_id_,taha) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤الكلمه ( `'..taha..'` ) تم الغاء منعها بنجاح ✔', 1, 'md') end 
if text and text:match('مسح قائمه المنع') and is_mod(msg) then tahadevstorm:del('filters:'..msg.chat_id_) storm.sendtaha(msg.chat_id_, msg.id_, 1,'🎫￤تم مسح قائمه المنع', 1, 'md') end 
if text and text:match('قائمه المنع') then  local list = tahadevstorm:smembers('filters:'..msg.chat_id_) local t = '🎫￤ قائمه المنع 📥 • \n\n' for k,v in pairs(list) do t = t..k.." - { `"..v.."` }\n`•➖➖➖➖➖➖➖•`\n"  end if #list == 0 then t = '🎫￤قائمه المنع فارغه' end storm.sendtaha(msg.chat_id_, msg.id_, 1,t, 1, 'md') end 
if text and text:match('تثبيت') and msg.reply_to_message_id_ ~= 0 then  local id = msg.id_ local msgs = {[0] = id} pin(msg.chat_id_,msg.reply_to_message_id_,0) storm.sendtaha(msg.chat_id_, msg.reply_to_message_id_, 1, "🎟￤ تم تثبيت الرساله", 1, 'md') end 
if text and text:match('اعدادات المجموعه') and is_mod(msg) then function gpinfo(arg,data) storm.sendtaha(msg.chat_id_, msg.id_, 1, '\n🏌￤ عدد الادمنيه ( *'..data.administrator_count_..'* )\n🏃￤ المطرودين ( *'..data.kicked_count_..'* )\n🎎￤ الاعضاء ( *'..data.member_count_..'* )\n🎗￤ الكروب (` '..msg.chat_id_..'` ) ', 1, 'md') end storm.getChannelFull(msg.chat_id_, gpinfo, nil) end
if text and text:match("^مشاهده منشور$") then tahadevstorm:set('viewchannel'..msg.sender_user_id_,true) storm.sendtaha(msg.chat_id_, msg.id_, 1, '♼￤ حسننا ارسل التوجيه من القناة سارسل عدد المشاهدات', 1, 'md') end 
if text and text:match("^ضع رد تواصل$") and is_sudo(msg) then SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤ المطور ( '..msg.sender_user_id_..' )\n💢￤ حسناا قم بارسال الرد ليتم وضعه' , 13, string.len(msg.sender_user_id_)) tahadevstorm:setex("sudo:pv" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true) end
if text and text:match("^ضع كليشه المطور$") and is_sudo(msg) then SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🎫￤ المطور ( '..msg.sender_user_id_..' )\n📬￤ حسناا قم بارسال كليشه المطور' , 13, string.len(msg.sender_user_id_)) tahadevstorm:setex("sudo:dev" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true) end

if text and text:match('^تفعيل البوت') and check_user(msg) and not tahadevstorm:get("addfrebot:"..msg.chat_id_) and not tahadevstorm:get("setmoder:"..msg.chat_id_) then if not tahadevstorm:get("lock:add:free"..msg.chat_id_) then tahadevstorm:del('lock:add'..msg.chat_id_) function gpinfo(arg,data) username = data.administrator_count_
function promote_admin(extra, result, success) vardump(result) local chat_id = msg.chat_id_ local admins = result.members_ for i=1 , #admins do if tahadevstorm:sismember('mods:'..msg.chat_id_,admins[i].user_id_) then else tahadevstorm:sadd('mods:'..msg.chat_id_,admins[i].user_id_) end end end storm.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
function promote_admin(extra, result, success) vardump(result) local chat_id = msg.chat_id_ local admins = result.members_ for i = data.administrator_count_ - 1 , #admins do if tahadevstorm:sismember('owners:'..msg.chat_id_,admins[i].user_id_) then else tahadevstorm:sadd('owners:'..msg.chat_id_,admins[i].user_id_) end end  end storm.getChannelMembers(msg.chat_id_, 0, 'Administrators', 200, promote_admin)
local add_bot_in_group = [[
🃏￤اهلا يا ]]..getname(msg.sender_user_id_)..[[

🏅￤تم تفيل المجموعه بنجاح ✔
🎫￤تم رفعك منشئ للمجموعه ✔
📫￤تم رفع الادمنيه المجموعه ✔
📮￤لتعطيل البوت ارسل غادر 🔥
`---------------------`
📥┊مطور البوت @TAHAJ20
💢┊قناتنا @TEAMSTORM   
]]
tahadevstorm:sadd('bot:gpsby:id', msg.chat_id_) tahadevstorm:sadd("botgps", msg.chat_id_) tahadevstorm:set("addfrebot:"..msg.chat_id_, true)  tahadevstorm:sadd("owners:"..msg.chat_id_, msg.sender_user_id_)  tahadevstorm:set("setmoder:"..msg.chat_id_, true)   storm.sendtaha(msg.chat_id_, msg.id_, 1,add_bot_in_group, 'md')  
local added = [[💥 اهلا عزيزي المطور 💥
📪| لقد تم تفعيل مجموعه جديده
`---------------------`
📯￤معلومات المجموعه •
♨￤ايدي المجموعه (`]]..msg.chat_id_..[[`)
💠￤اسم المجموعه (`]]..get_title(msg.chat_id_)..[[`)
🏂￤ عدد الادمنيه ( *]]..data.administrator_count_..[[* )
⛹￤ عدد المطرودين ( *]]..data.kicked_count_..[[* )
💥￤ عدد الاعضاء ( *]]..data.member_count_..[[* )
`---------------------`
📑￤معلومات المطور
📬￤اسم المطور (`]]..getname(msg.sender_user_id_)..[[`)
💢￤ايدي المطور (`]]..msg.sender_user_id_..[[`)
✨￤معرف المطور {]]..get_username(msg.sender_user_id_)..[[ }
]]
 storm.sendtaha(SUDO, msg.id_, 1,added, 'md')   sdor.forwardMessages(SUDO, msg.chat_id_,{[0] = msg.id_}, 0)  end storm.getChannelFull(msg.chat_id_, gpinfo, nil) end  end
if text and text:match("^جلب صوره") and not tahadevstorm:get("lock:get:photo"..msg.chat_id_) then  local matches = {text:match("(جلب صوره) (%d+)")} if not matches[2] then storm.sendtaha(msg.chat_id_, msg.id_, 1, '🎫￤تستطيع جلب صورك للعدد (*100*) فقط', 1,'md') else local function dl_photo(arg,data)  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,'🎫￤ايديك ( '..msg.sender_user_id_..' )\n📬￤ رقم صورتك ('..matches[2]..' )')  end tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = matches[2],limit_ = 100000}, dl_photo, nil) end end
if text == 'تفعيل الايدي' and is_owner(msg) then  if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end local lock_id = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تشغيل الايدي', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_id, 13, string.len(msg.sender_user_id_)) tahadevstorm:del('lock:id'..msg.chat_id_) end
if text == 'تعطيل الايدي' and is_owner(msg) then if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end  local lock_id = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم ايقاف الايدي', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_id, 13, string.len(msg.sender_user_id_)) tahadevstorm:set('lock:id'..msg.chat_id_,true) end
if text == 'تفعيل ردود المطور' and is_devtaha(msg) then  if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end local lock_id = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تفعيل ردود المطور', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_id, 13, string.len(msg.sender_user_id_)) tahadevstorm:del('lock:dev'..msg.chat_id_) end
if text == 'تعطيل ردود المطور' and is_devtaha(msg) then if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end  local lock_id = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تعطيل ردود المطور', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_id, 13, string.len(msg.sender_user_id_)) tahadevstorm:set('lock:dev'..msg.chat_id_,true) end
if text == 'تفعيل جلب الصوره' and is_owner(msg) then if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end  local lock_photo = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تفعيل جلب الصوره', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_photo, 13, string.len(msg.sender_user_id_)) tahadevstorm:del('lock:get:photo'..msg.chat_id_) end 
if text == 'تعطيل جلب الصوره' and is_owner(msg) then if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end local unlock_photo = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تعطيل جلب الصوره', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, unlock_photo, 13, string.len(msg.sender_user_id_)) tahadevstorm:set('lock:get:photo'..msg.chat_id_,true) end
if text == 'تفعيل ردود المجموعه' and is_owner(msg) then if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end local lock_reply_sudo = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تفعيل ردود المجموعه', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_reply_sudo, 13, string.len(msg.sender_user_id_)) if not tahadevstorm:get('lock:reply'..msg.chat_id_) then tahadevstorm:del('lock:reply'..msg.chat_id_) end end
if text == 'تعطيل ردود المجموعه' and is_owner(msg) then if is_devtaha(msg) then t = 'المطور' elseif is_sudo(msg) then t = 'المطور' elseif is_owner(msg) then t = 'المدير' elseif is_mod(msg) then t = 'الادمن' else t = '' end local lock_reply_sudo = '🎫￤ '..t..' ( '..msg.sender_user_id_..' )\n📬￤ تم تعطيل ردود المجموعه', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_reply_sudo, 13, string.len(msg.sender_user_id_))   if not tahadevstorm:get('lock:reply'..msg.chat_id_) then   tahadevstorm:set('lock:reply'..msg.chat_id_,true) end   end
if text and text == 'تفعيل البوت الخدمي' and is_devtaha then local lock_twasl_in_pv = '🎫￤ العضو •  ( '..msg.sender_user_id_..' )\n📬￤ تم تفعيل البوت الخدمي', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, lock_twasl_in_pv, 18, string.len(msg.sender_user_id_)) tahadevstorm:del('lock:add:free'..msg.chat_id_) end 
if text and text == 'تعطيل البوت الخدمي' and is_devtaha then local unlock_twasl_in_pv = '🎫￤ العضو •  ( '..msg.sender_user_id_..' )\n🎫￤ تم تعطيل البوت الخدمي', 1, 'md' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, unlock_twasl_in_pv, 18, string.len(msg.sender_user_id_)) tahadevstorm:set('lock:add:free'..msg.chat_id_,true) end
if text == 'طرد البوتات' and is_owner(msg) then  local function cb(extra,result,success) local bots = result.members_ for i=0 , #bots do kick(msg,msg.chat_id_,bots[i].user_id_) end end SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, '🚀￤تم طرد جميع البوتات \n☇￤ بواسطه ( '..msg.sender_user_id_..' )' , 41, string.len(msg.sender_user_id_)) storm.channel_get_bots(msg.chat_id_,cb)   end   
if text == "مطورين البوت" or text == "اريد بوت" or text == "المطور" or text == "مطور" then local dev = tahadevstorm:get("dev") storm.sendtaha(msg.chat_id_, msg.id_,1,dev,1,'md') end
if text == "جلب رد التواصل" then local pvstart = tahadevstorm:get("pvstart") storm.sendtaha(msg.chat_id_, msg.id_, 1,pvstart, 1, 'html') end
if text == 'رتبتي' then
if not tahadevstorm:get("lock:add"..msg.chat_id_) then local ch =  '@STORMCLl' local msgs = tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)
if is_devtaha(msg) then
t = 'مطور اساسي ??' elseif is_sudo(msg) then
t = 'مطور 🃏' elseif is_owner(msg) then
t = 'مدير الكروب 💡' elseif is_mod(msg) then
t = 'ادمن الكروب 👮' elseif is_vipgroups(msg) then
t = 'مميز عام 📪' elseif is_vipgroup(msg) then
t = 'مميز 🚸' else
t = 'مجرد عضو 🙌' end local text = '🎫￤ ايديك  ( '..msg.sender_user_id_..' )\n🛰￤ رتبتك ( '..t..' )\n☇￤ رسائلك ( '..(tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' )\n📬￤ اسمك  ( '..tahadevstorm:hget('gps:settings:'..msg.sender_user_id_ ,"setnameid")..' ) ' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, text, 13, string.len(msg.sender_user_id_)) end end
if text == 'موقعي' then
 local ch =  '@STORMCLl' local msgs = tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)
if is_devtaha(msg) then
t = 'مطور اساسي 🕹' elseif is_sudo(msg) then
t = 'مطور 🃏' elseif is_owner(msg) then
t = 'مدير الكروب 💡' elseif is_mod(msg) then
t = 'ادمن الكروب 👮' elseif is_vipgroups(msg) then
t = 'مميز عام 📪' elseif is_vipgroup(msg) then
t = 'مميز 🚸' else 
t = 'مجرد عضو 🙌' end local text = '  • موقعك في المجموعه \nٴ┄•🔹•┄༻♻༺┄•🔹•┄ •\n\n🚀￤ ايديك  ( '..msg.sender_user_id_..' )\n💥￤ موقعك ( '..t..' )\n♨￤ رسائل الكروب ( '..tahadevstorm:get('groupmsgkk:'..msg.chat_id_..':')..' )\n🎫￤ عدد رسائلك ( `'..(tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 10000000)..' )\n☇￤ اسمك  ( '..tahadevstorm:hget('gps:settings:'..msg.sender_user_id_,"setnameid")..' )' SendMetion(msg.chat_id_, msg.sender_user_id_, msg.id_, text, 56, string.len(msg.sender_user_id_)) end 
if text == "رسايلي" or text == "رسائلي" or text == "msg" then local taha = 'عدد رسائلك ( *'..tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_)..'* ) رساله' storm.sendtaha(msg.chat_id_, msg.id_, 1,taha, 1, 'md') end
if text == "معرفي" then local username = nil function getmepar(extra,result,success) username = '@'..(result.username_ or 'ماكو معرف ❌')..'' local taha = 'معرفك ( '..username..' ) ✨' storm.sendtaha(msg.chat_id_, msg.id_, 1,taha, 1, 'md') end getUser(msg.sender_user_id_, getmepar) end
if text == "اسمي" then local name = tahadevstorm:hget('gps:settings:'..msg.sender_user_id_ ,"setnameid") if not name then  function setname(extra,result,success) snm = result.first_name_ tahadevstorm:hset('gps:settings:'..msg.sender_user_id_ ,"setnameid" , snm) end  storm.getUser(msg.sender_user_id_,setname) name = tahadevstorm:hget('gps:settings:'..msg.sender_user_id_ ,"setnameid") or '...' end local taha = '` '..name..' `' storm.sendtaha(msg.chat_id_, msg.id_, 1,taha, 1, 'md') end
if text == "صورتي" then local function getpro(extra, result, success) if result.photos_[0] then sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,'') else storm.sendtaha(msg.chat_id_, msg.id_, 1,'📷 • انت لا تمتلك صوره 😹', 1, 'md') end end tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil) end
-------------------------
if text == 'باي' or text == 'باي باي' or text == 'مع السلامه' or text == 'مع سلامه'  or text == 'مع السلامة' or text == 'مع سلامة' or text == 'بااي'  or text == 'باااي' or text == 'بايي'  or text == 'جاو' then local taha = {'تعال خل نكمل سالفتنه وين رايح 😧','جاي اشاقه تعال لضوج 🙁','دفعه مردي وعصى كردي 😌','منو زعلك حته تروح 😥','شبيك ضايج تعال 😨','الله وياك دروح مختنكه ونته موجود ☹️','هاك الف شتري بيها لفتين فلافل 🌝💋','سلملي ع ئمك 🤷🏼‍♀️','بعد وكت وين ??',"لله وياكـ💙✨ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘",'تعال وين رايح عندي شغله وياك ??','تعال لضل هيج ترا مكلنه شي بسرعه دكول باي 😐','الله وياك والتكسي ع حساب المدير ??😂 ماعليه اني 🙈' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')end
if text == 'احم' or text == 'ئحم' or text == 'حم' or text == 'أحم' or text == 'أحم' or text == 'احم احم' then local taha = {'جيبوله مي 😅','شبيك تتحمحم نطو مي خطيه غص بلكمته ??','خير 🙊','تفضل ☹️','والله اشكال ??🏼‍♀️','احمات 😏','طبوله ع ضهره 🙃','ها خير شبيك 😉' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == 'تعالي خاص' or text == 'تعال خاص' or text == 'تعي خاص' or text == 'نع خاص' or text == 'خاص'  or text == 'خاصج'  or text == 'خاصك'  or text == 'شوف الخاص'  or text == 'شوف خاصك'  or text == 'شوفي خاصج' or text == 'تعاي خاص😂' then local taha = {'عيب 🙃','خالتك الشكره  احسن ترضها اخويا يزحف ع اختك 😐🤷🏼‍♀️','عب نجب و ولي منا 🙊🤷??‍♀️','محضوره دز رساله وتع خاص 🤷🏼‍♀️','شبيك مشايف بنات ؟ 🤤','ولي 🙄','ما 😌','ولي لك 😒','وعود صاك ئنته ؟','ئذا الموضوع حساس اجيك 🌝','تعال حتطفي الكهرباء 😶' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == "شلونك" or text== "شلونج" or text== "شونكم" or text== "شونك" or text== "شونجج" then local taha = {'  اۢنٰـۛتهہ شعليك بيهة','  مــﮫـمـ❥ـوﯢمـ۾☹ ','تٌمآم حٍـيَآتٌيَ ۆآنْتٌ 😊 ','ۆآلُلُہ مۆ ڒٍيَنْ😢 ','   بْخـيَر ۆصٍحٍـہةّ ۆعآفَيَہ😌','  آلُلُةّ ڒٍيَنْ لُۆ مگبْلُ😢😌 ',"آلـْ ح ـمـِْدِّ اللّـٰھ وانٓــتــٰـہ/ي ࿐❥ 🌎🌸" ,'  مۆ گنْآلُہةّ لُحٍـمدِ لُلُہةّ ','  آةّۆۆۆۆ شُگدِ تٌلُحٍ آنْتٌ😕 ','  بْلُ عبْآس آبْۆ آلُفَآضٍلُ آنْيَ لُحٍـمدِلُلُہةّ 😐😤 ','تمام وانت/ي شلونك/ج🎈','تمام وانت/ي شلونك/ج🎈'} storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end   
if text == "بوت" then  local taha = {'  آنْجٍبْ لُگ آلُبْآرحٍـةّ تٌغَلُطً علُيَةّ 😭😒 ','  ۆعمةّ آنْشُآلُلُہةّ شُبْيَگ يَلُآ گۆلُ 😒😠 ','   بْعدِ رۆحٍـيَ آمرنْيَ آنْتٌ 😍😘',' نْجٍبْ لُگ عنْدِيَ آسم ۆصٍيَحٍـنْيَ بْيَة 😟😤ّ','  غَيَر يَگعدِ رآحٍـةّ آلُڒٍآحٍـفَ 😝😂 ','  ۆلُگ شُبْيَگ خـبْصٍتٌنْيَ بْس صٍيَحٍ مۆ دِآ آنْسقَ ۆيَةّ بْنْتٌ 😒😤 ',' تٌرآ مشُتٌغَلُ مآ ۆآگفَ 😉','  آيَ آيَ آجٍتٌيَ آلُمصٍآلُحٍ يَلُآ آحٍـجٍيَ شُعنْدِگ😣😓 ','   غَيَر يَبْطًلُ ۆبْعدِ مآ يَلُحٍ ۆيَخـلُيَنْيَ آرتٌآحٍ 😒😰','  لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨ ','   شبي معاجبك 😒🍃',' تاج راسي كول حبيبي 😻🙊😚  ','  ها حياتي 😻اامرني كلبي 😇🙊 ','ها احجي شتريد 😏 صيحلي باسمي بعد لدكول بوت😹😢🚶   ','   نجب لك صارت قديمه صيحلي باسمي 😒👬💛',' حياتي انت كول بعد روحي 😽🙊  ',' فضها كول شرايد تعبتوني😢😞  ','   تفصل يروحتي 😍😻'} storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == "هلو" or text== "هلا" or text== "هاي" then     local taha = {' هـُ‘ـُلُٱ بُـ‘ـُيُـ‘ـُكُ شُـ‘ـُوٌنُـ‘ـكُ ??😇  ','   هّـلَأّوٌتٌ عٌلَ نِبًيِّ صّـمًوٌنِ حًأّر وٌلَبًلَبًيِّ 😻😹','   يِّهّـلَأّ وٌأّلَلَهّ نِوٌرتٌـنِأّ حًمًبًقُلَبًيِّ 😸','  کْوٌلَ سِـلَأّمً عٌلَيِّکْمً لَتٌـصّـيِّر مًأّيِّعٌ 😒😩 ','   هّـلَأّ حًيِّأّتٌـيِّ مًنِوٌر أّنِتٌ بًسِـ بًدٍوٌنِ ﺰحًفُـ رجّـأّئأّأّ 😂😂','لَأّ هّـلَهّ وٌلَأّ مًرحًبًأّ 😒 ','  أّهّـوٌوٌوٌ أّجّـهّ أّلَﺰأّحًفُ 😤  ','   کْلَ أّلَهّـلَأّ بًيِّکْ وٌبًجهّـأّتٌـکْ خِـصّـمً أّلَحًجّـيِّ ضًـيِّفُ جّـهّـأّتٌـکْ 😉😂','   يِّعٌمًيِّ هّـلَأّ بًيِّکْ مًنِيِّنِ مًأّ جّـيِّتٌ 😒😣','هلوات عيونـي نورت😌🌷','هلُۆآتٌ حٍـيَـ{ლ}ـآتٌيَ┆✨😽💞','هـايـات يـروحـي┋🌸😻','يههلا بيك حياتي 💛🌿'}      storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')   end
if text == "سلام عليكم" or text== "سلام" then       local taha = {'  وٌعٌلَيِّکْمً أّلَسِـلَأّمً وٌرحًمًةّ أّلَلَهّ وٌبًرکْأّتٌـهّ 😘😬','   وٌعٌلَيِّکْمً سِـلَأّمً شُـوٌنِکْ حًيِّأّتٌـيِّ شُـخِـّـبًأّرکْ 😋😇','کْلَ أّلَهّـلَأّ بًيِّکْ حًمًبًيِّ ??😆 ','   أّيِّ عٌوٌدٍ ثًـکْيِّلَ يِّسِـلَمً يِّلَأّ عٌيِّنِيِّ کْمًلَ أّلَسِـلَأّمً مًأّلَتٌـکْ وٌبًلَشُ أّﺰحًفُ 😉😂😂','   يِّهّـلَأّ وٌأّلَلَهّ أّشُـلَوٌنِکْمً شُـخِــبًأّرکْمً أّبوٌکْ شُـوٌنِهّ ','وعليـكم السلام ورحمـة الله وبركاتهُ??','وعليكم السلام والرحمه🏌🏿‍♀️','ﯛ୭ﯠ۶ـہٰٰٰٖٖٖلہٰٰٰٖٖٖيکگہٰٰٰٖٖٖمہٰٰٰٖٖٖہ ٵٴلہٰٰٰٖٖٖسہلہٰٰٰٖٖٖاٴمہٰٰٰٖٖٖہ ┆ 😸➰✌️🏿'}  storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == "منور" or text== "منورين" or text== "منوره" then       local taha = {'   أّکْيِّدٍ مًنِوٌر بًوٌجّـوٌدٍيِّ أّنِيِّ ☺',' أّيِّ عٌمًيِّ کْلَهّـأّ وٌأّسِـطِأّتٌ مًوٌ صّـوٌجّـکْمً وٌأّلَلَهّـيِّ 😣😢  ',' لَأّ مًوٌ مًنِوٌر وٌأّذِأّ تٌـعٌأّنِدٍ أّدٍفُـرکْ 😒😂 ','   أّفُـتٌـهّـمًنِأّ عٌمًيِّ مًنِوٌ أّنِتٌـ وٌهّـوٌ 😛??','   هّـأّ لَأّﺰمً خِـيِّلَتٌ عٌلَيِّةّ 😂😂',' أّيِّ وٌأّلَلَةّ فُـعٌلَأّ مًنِوٌر هّـلَ صّـأّکْ 😂😓'}   storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == "مح" or text== "محح" or text== "محح" then            local taha = {' ﺎخٰٰ̲خྀـٓربٰ ﯛ୭ات̲كھٰربْ ♥',' ﻋِﻋٰافيٰۛـۢھٰهۃ ؛??ֆ   ','ﺄموﯟعنَ ،😞💓.   ','  أّوٌفُـ أّلَلَلَهّ 😍 شُـهّـلَ بًوٌسِـهّ  ','  دٍيِّيِّيِّ لَکْ ﺰأّحًفُـ لَضًـلَ تٌـبًوٌسِ 😒😌 ','  أّهّـوٌووٌوٌ لَيِّشُـوٌفُـهّ يِّکْوٌلَ هّـوٌ مًهّـنِدٍ وٌيِّبًوٌسِ بًلَ عٌأّلَمً 😩😂  ','   دٍنِجّـبً لَکْ ﺰأّحًفُ 😝😂'}  storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')      end
if text == "ضايج" or text== "ضوجه" or text== "ضايجه" or text== "حيل ضوجه" then     local taha = {'   كٰ̲ۛكۛلٰشۢ ،🍿ֆۦ ','  ضايج لئن كلبه مكسور 🙀😿 ','  حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج🌚 ','   أّيِّ وٌأّلَلةّ ضًـوٌجّـهّـ وٌنِسِـوٌأّنِ مًأّکْوٌ وٌشُـغُلَ مًأّکْوٌ 😣😢','  أّيِّ أّلَيِّوٌمً کْآبًهّ حًيِّلَ 😞 ','  حًيِِّـأّتٌـيِّ تٌـعٌ نِلَعٌبً لَعٌبًةّ لَبًوٌسِـأّتٌ بًوٌسِـنِيِّ وٌأّبًوٌسِـکْ 😂😢 ','  هّـهّـهّـهّـهّـهّـهّ دٍنِجّـبً وٌيِّنِ أّکْوٌ ضًـوٌجّـهّ 😝😂 ',' أّلَلَلَلَلَهّـمً لَأّ شُـمًأّتٌـهّ 😂😂',"حـٍبيبي ءّ🙍‍♂️💜 اركـ🕺🏻ـصلج🌚" } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')  end
if text == "صباحو" or text== "صباح الخير" then     local taha = {'  صباحو النور اشرقت وانورت🌝🎈 ','صۢبٰاζ النور 😍😘   ','  صۢبٰاζـۢوٰﯟ ،☀️ عسل 😋😎 ','  صباحو النور يا نور 😻😹 ' } storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')      end
if text == "زاحف" or text== "زواحف" then   local taha = {'  اهوو هم زحف 😢😂 ','  على خالتك¤_¤ 😒 ',' شكو تزحف ولك 😝 خلوني بس اني ازحف 🙊??  ','  أّسِـمًيِّ 😌','  أّنِتٌ شُـعٌلَيِّکْ بًأّسِـمًيِّ 😕  '}   storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md') end
if text == "احبك" or text== "احبج" then  local taha = {'  اشتم ريحـة🙄 زحف يمعودين😺🎈 ','  مي تو واني اموت بيك/ج♥️🌝 ','  بعد روحي واني احبكم هم بس لتزحفلي رجاا 😸😸💋 ','  ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 😂🙊 ','   أّوٌفُ أّلَلَهّـهّـهّـ أّنِيِّ أّمًوٌتٌـنِ بًيِّکْ وٌلَعٌبًأّسِ 😢😍','متستحي 😐','ئوف فديتك ربك 🙈😚','ماحترمك شلون احبك 🌝💋','حبيبي المطور بس 😌??','ماحبك 🤤','كلبي انته 😶❤️','اموتن بيك ❤️😌','اموعن اذوبن 😌💔','ئنته ئلنفس مال اني ❤️😋','شبيك مشايف بنات هيج جفاف 😕','ئنته ئلعشق 😚💋','طيني بوسه وحبك 🤗','لزكت 😕','انت ليش يا ابنية اشوفها ادكول الها احبج صدك متستحي على نفسك 😒💔', 'فدوة الحلك ????', 'باع حضي مناقصني زواحف ولي راح احضرك😪😂','اني وانت كلب واحد بالنفس صاعد ونازل 🙊😻','تفووو عليك ماريد حبك 😂🙊','اموت عليك يروحي 😻💋'}      storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')   end
if text == "هه" or text== "ههه" or text== "هههه" or text== "ههههه" or text== "هههههه" or text== "ههههههه" or text== "ههههههههه" or text== "هههههههههههه" or text== "هههههههههههههههههه" then  local taha = {'دووم الضحُــكه  يرويحتي💋🍃   ',' انت شبيك تخبلت 😒😨😹😹  ',' دووم الضحكـه 😽  ','   كافي تضخك 😒 انت مو زغير 😎😻😹','انت شبيك تخبلت 😒😨😹😹   ','  وٌأّلَلَهّ مًأّکْوٌ فُـأّيِّدٍهّ وٌيِّأّکْ ','انت شبيك تخبلت 😒😨😹😹','ضحكتك 🚶 مال فروخ 😿 بطلها 😹😹😹'}    storm.sendtaha(msg.chat_id_, msg.id_, 1, ''..taha[math.random(#taha)]..'', 1, 'md')  end
if text =="🌚" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • فـﮧديت صخـﮧامك🙊👄 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text == "🌚🌚" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • فـﮧديت صخـﮧامك🙊👄 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text == "??????" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> • فـﮧديت صخـﮧامك🙊👄 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text == "🌚🌚🌚🌚" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • فـﮧديت صخـﮧامك🙊👄 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ ??💙 ۶ الماشي✨🚶🏻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻??🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ ???? ۶ الماشي✨🚶🏻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻🚶??🚶🏻🚶🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ الماشي✨🚶🏻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻🚶🏻🚶🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ الماشي✨🚶🏻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙈" then local taha = [[ <a href="https://telegram.me/STORMCLl"> » ﺷـﮭڸ خـجل ﮪ 💗😻̯͡ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙈🙈" then local taha = [[ <a href="https://telegram.me/STORMCLl"> » ﺷـﮭڸ خـجل ﮪ 💗😻̯͡ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙈🙈🙈" then local taha = [[ <a href="https://telegram.me/STORMCLl"> » ﺷـﮭڸ خـجل ﮪ 💗😻̯͡ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙈🙈🙈🙈" then local taha = [[ <a href="https://telegram.me/STORMCLl"> » ﺷـﮭڸ خـجل ﮪ 💗😻̯͡ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙊🙊🙊🙊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل يبن القرده 😹😹😢 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙊🙊🙊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل يبن القرده 😹😹😢]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙊🙊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل يبن القرده 😹??😢 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل يبن القرده 😹😹😢 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😍😍😍😍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😍😍😍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😍😍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> صعد الحب🙄 الله يستر😹💔 من الزحف 😂😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😂😂😂😂" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحـكه😽🎈  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😂😂😂" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحـكه😽🎈  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😂😂" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحـكه😽🎈  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😂" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحـكه😽🎈  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😉😉😉" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الغمزه 🙀 تموت 🙈🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😉😉😉" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الغمزه 🙀 تموت 🙈🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😉😉" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الغمزه 🙀 تموت 🙈🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😉" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الغمزه 🙀 تموت 🙈🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😳😳😳" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك ?? مصدوم شنو ?? جديده عليك حتى تنصدم ♥️🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😳😳" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😳😳" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😳" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك 🙀 مصدوم شنو 🙄 جديده عليك حتى تنصدم ♥️🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😠😠😠😠" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍??😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😠😠😠" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😠😠" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😠" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😡😡😡😡" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😡😡??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😡😡" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😡" then local taha = [[ <a href="https://telegram.me/STORMCLl"> حمه الصيني طفوه 😍😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😭😭😭😭" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا تبجي يروحي محد يسوه تبجيله ☺😘 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😭😭😭" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا تبجي يروحي محد يسوه تبجيله ☺😘 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😭😭" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا تبجي يروحي محد يسوه تبجيله ☺?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😭" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا تبجي يروحي محد يسوه تبجيله ☺😘 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😌😌😌😌" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت 🙊😻 الرقه مالتك 😉😇🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😌😌??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت 🙊😻 الرقه مالتك 😉😇🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😌😌" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت ??😻 الرقه مالتك ??😇🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😌" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت ???? الرقه مالتك 😉??🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💃💃💃??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شددها ابو سميره 😂 خوش تهز 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💃💃??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شددها ابو سميره 😂 خوش تهز 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="????" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شددها ابو سميره 😂 خوش تهز 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💃" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شددها ابو سميره 😂 خوش تهز 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="👀" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هاي وين دا تباوع ولك😹😹🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="👀👀" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هاي وين دا تباوع ولك😹😹🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😱😱😱" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عزا العزاك هاي شفت ولك 😂😂😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😱??😱" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عزا العزاك هاي شفت ولك 😂😂😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😱😱" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عزا العزاك هاي شفت ولك 😂😂😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😱" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عزا العزاك هاي شفت ولك ??😂😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😊😊😊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل كله 😎😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😊😊😊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل كله 😎😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😊??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل كله 😎?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😊" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الخجل كله 😎?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😘😘😘😘" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽??̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😘😘??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😘??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😘" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽🍯̯⁾ֆ‘ يا • ﻋٰۧﻋٰ̯ۧـسۂﻝَُّ↵⁽??̯⁾ֆ‘ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☺☺☺☺" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☺☺☺" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☺☺" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☺" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ابتسامه مال واحد شايل اهموم الدنيا كوله بگلبه 💔😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😞😞😞😞" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك🙀 دليني عليه😾💪🏼 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😞😞😞" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك🙀 دليني عليه😾💪🏼 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😞😞" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك🙀 دليني عليه😾💪🏼 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😞" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك🙀 دليني عليه😾💪🏼 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😻😻😻😻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الحب صاعد عده فول 😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😻😻😻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الحب صاعد عده فول 😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😻😻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الحب صاعد عده فول 😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> باع الحب صاعد عده فول 😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😇" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مسويلك مصيبه ودا تبتسم 😻😹😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😇😇" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مسويلك مصيبه ودا تبتسم 😻😹😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور يبعد الكلب 🌺😻😇 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🚶" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور يبعد الكلب 🌺??😇 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🚶🚶" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور يبعد الكلب 🌺😻😇 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🚶🚶??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور يبعد الكلب 🌺😻😇 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😢😢😢😢" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عيـ😻ـونك/ج✨ حرام ينزل😴 دمعهن🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😢??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عيـ😻ـونك/ج✨ حرام ينزل😴 دمعهن?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😢😢" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عيـ😻ـونك/ج✨ حرام ينزل😴 دمعهن🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😢" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عيـ😻ـونك/ج✨ حرام ينزل?? دمعهن?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😹😹😹😹" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحكه يالغالي 😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😹😹😹" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحكه يالغالي ?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😹😹" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحكه يالغالي 😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دوم الضحكه يالغالي 😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😿😿😿😿" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو وياك يرويحتي 😓😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😿😿😿" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو وياك يرويحتي 😓😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😿😿" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو وياك يرويحتي ??😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😿" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو وياك يرويحتي 😓?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😏😏😏😏" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي ??😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😏??😏" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي 🙊😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😏😏" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي 🙊😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😏" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عود شوفوني اني شخصـية 😣وهو وجـهه وجه الطلي 🙊😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😒😒😒😒" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبي🙃 ‎‏💛🙈  ggɺᓗɺÎ  ضايج💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😒😒😒" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبي🙃 ‎‏💛??  ggɺᓗɺÎ  ضايج💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😒😒" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبي🙃 ‎‏💛🙈  ggɺᓗɺÎ  ضايج💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😒" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبي🙃 ‎‏💛🙈  ggɺᓗɺÎ  ضايج💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😝😝😝😝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي😹💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😝😝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي??💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😝😝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان ??لو مريض نفسي😹?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي😹💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😕😕😕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شكو عاوج حلكك??😻😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😕😕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شكو عاوج حلكك??😻😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شكو عاوج حلكك😒😻😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶‍♀️🚶‍♀️🚶‍♀️" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶‍♀️🚶‍♀️" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶‍♀️" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـج فـاتح للـغغزل چم بـاب💅🏻💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻🚶🏻🚶🏻🚶🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـك فـاتح للـغغزل چم بـاب💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻🚶🏻🚶🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـك فـاتح للـغغزل چم بـاب💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻🚶🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـك فـاتح للـغغزل چم بـاب💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🚶🏻" then local taha = [[ <a href="https://telegram.me/STORMCLl"> - الجمال البـيـك فـاتح للـغغزل چم بـاب💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😔😔😔😔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😔😔😔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😔😔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ليش زعلان يعمري 😔 تعال احجيلي اهمومك💔🍃 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😑😑😑😑" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك☹️ פـٍـٍبيبي ءّ🙍‍♂️?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😑😑😑" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك☹️ פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😑😑" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك☹️ פـٍـٍبيبي ءّ??‍♂️?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😑" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منو مضوجك☹️ פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😐??😐😐" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك ضايج يروحي 😓😭 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😐😐??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك ضايج يروحي ??😭 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😐😐" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك ضايج يروحي 😓😭 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😐" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شبيك ضايج يروحي 😓😭 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😋😋😋😋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي😹💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😋😋😋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي??💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😋😋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي??💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لو جوعان 🤔لو مريض نفسي😹💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😎😎😎??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مسوي عمليه لعيونك 😔 لو انت خبل🙌😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??😎😎" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مسوي عمليه لعيونك 😔 لو انت خبل🙌😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😎😎" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مسوي عمليه لعيونك 😔 لو انت خبل🙌😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😎" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مسوي عمليه لعيونك 😔 لو انت خبل🙌😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😴😴😴😴" then local taha = [[ <a href="https://telegram.me/STORMCLl"> رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻   </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😴??😴" then local taha = [[ <a href="https://telegram.me/STORMCLl"> رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻   </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😴😴" then local taha = [[ <a href="https://telegram.me/STORMCLl"> رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻   </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😴" then local taha = [[ <a href="https://telegram.me/STORMCLl"> رأح, دكـّــوم تـّــمس๋͜‏ـلّـ๋͜‏ـت ولي نأم 😹☹️😻   </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😽😽😽😽" then local taha = [[ <a href="https://telegram.me/STORMCLl">  ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😽😽😽" then local taha = [[ <a href="https://telegram.me/STORMCLl">  ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😽??" then local taha = [[ <a href="https://telegram.me/STORMCLl">  ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??" then local taha = [[ <a href="https://telegram.me/STORMCLl">  ﭑإ́وُف فديـٍَــت ﭑإ́لـپـــٰٰـوُﮨﮨﮨــهٰ⇣̉ـ  😻🙈🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😾😾" then local taha = [[ <a href="https://telegram.me/STORMCLl"> خاب ديلك😐😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😾" then local taha = [[ <a href="https://telegram.me/STORMCLl"> خاب ديلك😐😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💔💔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💔💔💔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💔💔💔💔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́وُف ﭑإ́لـلــهٰ⇣̉ يـٍَﮩﮨﮨﮨـﭑإ́عـِِِِد قلـپـــٰٰـك 😢😞💋  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💛" then local taha = [[ <a href="https://telegram.me/STORMCLl"> قلبوشتي😻💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💙" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عافيتي😻💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💜" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يروحي😻💋انت </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="❤" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يعمري??💋 انت  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور ابو كلب الاخضر😐😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋💋💋💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> اوووف شنو هذا الحلك?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋??💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> اوووف شنو هذا الحلك?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> اوووف شنو هذا الحلك😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> اوووف شنو هذا الحلك😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هلا حبعمري??❤️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙋🙋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هلا حبعمري🙂❤️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙋🙋🙋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هلا حبعمري🙂❤️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ها عمو شبيك🌝💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐆" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولا يكعد راحه ابو صابر🌝😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐈" then local taha = [[ <a href="https://telegram.me/STORMCLl"> بشت بشت😐😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??🌹" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هلا حياتي عطرها🙂?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🌹" then local taha = [[ <a href="https://telegram.me/STORMCLl"> هلا حياتي عطرها🙂💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??🌝??🌝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🌝🌝🌝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="??🌝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝?? ۶ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🌝" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شـﮫـۛالـٰٰ̲ضـِۛـوٰ୭ٰۛٳٲ 🌝💙 ۶ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ماكو غيرك زاحف🙊🗯 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐍??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ماكو غيرك زاحف🙊🗯 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐍🐍🐍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ماكو غيرك زاحف???? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐍🐍🐍🐍" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ماكو غيرك زاحف🙊🗯 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐅" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور النجر🌝😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐅🐅" then local taha = [[ <a href="https://telegram.me/STORMCLl"> منور النجر???? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🐅🐅🐅" then local taha = [[ <a href="https://telegram.me/STORMCLl">  منورالنجر??💋  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🌺" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عطرها حبي🌝💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🍁" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عطرها حبي🌝💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💐" then local taha = [[ <a href="https://telegram.me/STORMCLl"> عطرها حبي🌝💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙄🙄🙄🙄" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شلگيت فوگ وتباوع🤔لو انت احول🙄💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙄🙄🙄" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شلگيت فوگ وتباوع🤔لو انت احول🙄💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙄🙄" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شلگيت فوگ وتباوع🤔لو انت احول🙄💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙄" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شلگيت فوگ وتباوع🤔لو انت احول🙄💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="طه" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́لـــﻤ̉̉ـطوُر ﻤ̉̉ـﭑإ́لـــﺗـ͜͡ہــٍّـــِّي إ́لـــعـُُـﮨ́́ﮨ́ﮨق فديـٍّــتـِّـّٰٰ̐ـ͜͜͡ާـه \n@TAHAJ20 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="خليجي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́لـــﻤ̉̉ـطوُر ﻤ̉̉ـﭑإ́لـــﺗـ͜͡ہــٍّـــِّي إ́لـــعـُُـﮨ́́ﮨ́ﮨق فديـٍّــتـِّـّٰٰ̐ـ͜͜͡ާـه \n@TAHAJ20 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="خليجي صاك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́لـــﻤ̉̉ـطوُر ﻤ̉̉ـﭑإ́لـــﺗـ͜͡ہــٍّـــِّي إ́لـــعـُُـﮨ́́ﮨ́ﮨق فديـٍّــتـِّـّٰٰ̐ـ͜͜͡ާـه \n@TAHAJ20 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="@TAHAJ20" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﭑإ́لـــﻤ̉̉ـطوُر ﻤ̉̉ـﭑإ́لـــﺗـ͜͡ہــٍّـــِّي إ́لـــعـُُـﮨ́́ﮨ́ﮨق فديـٍّــتـِّـّٰٰ̐ـ͜͜͡ާـه \n@TAHAJ20 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اريد قناة" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تفضل حياتي @TEAMSTORM </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="قناة" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تفضل حياتي @TEAMSTORM </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اريد قناه" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تفضل حياتي @TEAMSTORM </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="قناه" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تفضل حياتي @TEAMSTORM </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نرتبط" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 😂🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نكبل" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولك ما تبطل زحفك 😡😹 صارت قديمه ترا 😂🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="عرفينا" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولك ما تبطل زحفك ??😹 صارت قديمه ترا 😂🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نتعرف" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولك ما تبطل زحفك ??😹 صارت قديمه ترا 😂🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نت منين" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شكو تزحف ولك 😹😹 خلوني بس اني ازحف 🙊😹😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="خلي نتعرف" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شكو تزحف ولك 😹?? خلوني بس اني ازحف 🙊😹😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شسمك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تاج راسك انا حامي عرضك انا 😻😇 حاول لتلعب خشن وياي ??]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="عرفنا" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شكو تزحف ولك ??😹 خلوني بس اني ازحف 🙊😹😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="هاذا شنو" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="يمكن بوت" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اي بوت" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="هاذا بوت" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لۧاٲ   مو بوت😒 اقرا🙃 اسمي✨ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وين البوت" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لۧاٲ   مو بوت😒 اقرا?? اسمي✨ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعال نلعب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تعالو لعبو بمالي 😸😸 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعاي نلعب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تعالو لعبو بمالي ??😸 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نلعب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تعالو لعبو بمالي 😸?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تلعبون" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تعالو لعبو بمالي 😸😸 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🤔🤔🤔🤔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولا يكعد راحه اينشتاين الصغير 😂😂 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🤔🤔🤔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولا يكعد راحه اينشتاين الصغير 😂😂 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🤔🤔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولا يكعد راحه اينشتاين الصغير 😂😂 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🤔" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولا يكعد راحه اينشتاين الصغير 😂😂 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🖕🖕🖕🖕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> بحي هاذا لوفه وحطه فتيزك 😹😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🖕🖕🖕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> بحي هاذا لوفه وحطه فتيزك 😹😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🖕🖕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> بحي هاذا لوفه وحطه فتيزك 😹??😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🖕" then local taha = [[ <a href="https://telegram.me/STORMCLl"> بحي هاذا لوفه وحطه فتيزك 😹😹😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋💋💋💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديتك حلكك بحي ☹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋💋💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديتك حلكك بحي ☹?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋??" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديتك حلكك بحي ☹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="💋" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديتك حلكك بحي ☹?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تصبح عله خير" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام ??😉 حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="راح انام" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام 😍?? حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نعسان" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام 😍?? حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ت ع خ" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام 😍😉 حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تصبحون عله خير" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام 😍😉 حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تصبحي عله خير" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام 😍😉 حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تصبحين عله خير" then local taha = [[ <a href="https://telegram.me/STORMCLl"> روح نام 😍😉 حياتي 😌 تصبح عله خير 💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شلونجن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تمام وانت/ي شلونك/ج 😻🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شخبارج" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تمام وانت/ي شلونك/ج 😻🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شلونجن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> تمام وانت/ي شلونك/ج 😻🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اروح" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🤦🏻‍♂️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اروحح" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🤦🏻‍♂️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="راح اروح" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🤦🏻‍♂️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="رايح" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مٰٝـٍْ✋ۡـٍٰآ ترٰوۢۛඋ ،💛  احد لازمك🤦??‍♂️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اجيييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﮪﮪﮧעّ ⁞⁞ُ͡‏   💗 بيك🚶?? حمبي 👻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اجي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﮪﮪﮧעّ ⁞⁞ُ͡‏   💗 بيك🚶🏻 حمبي 👻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اجييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ﮪﮪﮧעّ ⁞⁞ُ͡‏   💗 بيك🚶🏻 حمبي 👻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ممكنن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ممكن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ببكن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="مممكن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> أإآيٰٰ    تـٴِﮧ﴿🚶🏻﴾ۣـعالۂ͡†♩❥ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ديييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يمشوك🐕 بيها🙊😹 حمبي </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="دييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يمشوك🐕 بيها🙊😹 حمبي </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ديي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يمشوك🐕 بيها??😹 حمبي </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="دي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يمشوك🐕 بيها🙊😹 حمبي </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وليييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ولييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وليي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ولي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ۽ﺈنجٰٓجٰٓہ͡‌ـبۂ 🌝 ٰٓ₎ פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اييييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يب قابل اغشكم 🙈🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اييي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يب قابل اغشكم 🙈🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ايي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يب قابل اغشكم 🙈🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يب قابل اغشكم 🙈🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعالو" then local taha = [[ <a href="https://telegram.me/STORMCLl">  ما اروح المطورين مالتي ميقبلون😐🎈  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعالوو" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا ما اروح المطورين مالتي ميقبلون😐?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعالووو" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا ما اروح المطورين مالتي ميقبلون??🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعالوووو" then local taha = [[ <a href="https://telegram.me/STORMCLl"> لا ما اروح المطورين مالتي ميقبلون😐🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شبيك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مبينه شي سلامتك/ ج🎈😌 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شبيكم" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مبينه شي سلامتك/ ج🎈😌]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شبيكك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> مبينه شي سلامتك/ ج🎈😌 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شبيكمم" then local taha = [["مبينه شي سلامتك/ ج🎈😌 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="جب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> جب بخشـ👃🏻ـمك פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نجب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> جب بخشـ👃??ـمك פـٍـٍبيبي ءّ🙍‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اانجب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> جب بخشـ👃??ـمك פـٍـٍبيبي ءّ??‍♂️💜 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وين" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وينن" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وين تريد" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ??💜ֆ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ووين" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☹️☹️☹️☹️" then local taha = [["شبيك متعصب حبي 😱😿 منو وياك 😿??😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☹️☹️☹️" then local taha = [["شبيك متعصب حبي 😱😿 منو وياك ??😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☹️☹️" then local taha = [["شبيك متعصب حبي ??😿 منو وياك 😿??😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☹️" then local taha = [["شبيك متعصب حبي 😱😿 منو وياك 😿😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙂??🙂🙂" then local taha = [["اوف شهل الابتسامه احله من الكمر 😎😻😻😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😕😕😕😕" then local taha = [["شكو عاوج حلكك😒😻😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙄🤞🏿" then local taha = [["شبيك صافن على ايدك 😹??😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙁💔" then local taha = [["ضايج لئن كلبه مكسور ??😿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end  
if text =="🙂✌️" then local taha = [["مبتسم على وجهي 😌😹😹😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😹😹😹😹😹😹😹" then local taha = [["انت شبيك تخبلت 😒😨😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😹😹😹😹😹😹😹😹😹😹" then local taha = [["انت شبيك تخبلت 😒😨??😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="بربك" then local taha = [["ي وعلي ابو الحسن 😐💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="كلكم" then  local taha = [["ليش تجمع بحي اني بوت 😞💔 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="والرب" then  local taha = [["استغفر الله جنان كم مره كتلك لتحلف جذب😑🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="حقك" then  local taha = [["ي حقك حمبي اني وياك ضدهم😐🎈 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اكلك" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> كول حبي بس لا تبول علينا 😸💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اكول" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> كول وفتح حلكك خل ابول 😸??🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="احبج" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ولكم زاحف دفره قبل لا يتكاثر بل كروب 😸😸😸💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="خاص" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> اسف مرتبط ويه بنت عمك 😸😸?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعال خاص" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ها ها تريدون تلعبون بدلي 😸😸💑 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعالي خاص" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ها ها 😸 عود هم كول ما ازحف وهاي كمشتك??💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تعال" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ولي لك ليريدني هو يجيني ??🌞 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="صوفي" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فديته هاذا اخوي ابو الوكفات فديت ابنمي??😍 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شغال" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ❞ ءيہـ͜ާي ۶ـٰٰٰོۂٰٰٰٰٰزيہزيۂٰٰٰٰٰـﮯ بـہٰٖآﻗقــ͡ي ﯙأتۂـ͜مــٰཻدد 🤓💕 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="فرخ" then local taha = [[ <a href="https://telegram.me/STORMCLl"> • ؤخـٰٰ͒ہر آﻧﮧـ͜ާۂٰٰٰٰٰي ڵہٰٰٖٖكي᪼᪳ـۂتہٰٖـﮫﮧٰٰٖٖ 😋۶ֆ كبلك </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نصعد" then local taha = [["مكالمهةة لو زرور ??🤘🏿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وف" then local taha = [["مو كتلج اريحج لتخافين 🌝💦 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اوي" then local taha = [["هاي تفله بعد ميعور حمبي ??💦 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="كحبه" then local taha = [["يب ادري بيها حته ناجها سويجد 😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="يوجع" then local taha = [["حته ترتاحين يا عيني 😺 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ولو منا" then local taha = [["ماولي اذا ما انيجكم ??🤘🏻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="الله" then local taha = [["شبي خوما ضوجك خوما كللهم مايكل ناج هذا 🙀🙌🏻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="نيجه" then local taha = [["تعال بعد عمك افتر وما تحس وي التفال 🐸💚 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="كول انجب" then local taha = [["خايب ولي لاتفل بطيزك ينطيني اوامر الفرخ 🤘🏿🤡🤘🏿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="مرحبا" then local taha = [[ <a href="https://telegram.me/STORMCLl">  مہٰ۪۫ږآحہٰ۪۫بہٰ۪۫ هلا بيك 💑💋 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شلونكم" then local taha = [[ <a href="https://telegram.me/STORMCLl">  تہۣۧمہۣۧﭑمہۣۧ بحي وانت شخبار 💛🌿 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="هلاوووووو" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يههلا بيك نورتنا 💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="خرب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> خرب وجهك حمتر لتكفر 🌞🌿  </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="سلام" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يهلا حمبي نورت ???? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="انت انجب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> اي حمبي 😸 تعال فتح حلكك 😸💙 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="وين ولك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يم خالتك الشكره بن  الصاكه </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اكرهك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شعور متبادل حبي </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="تكرهني" then local taha = [[ <a href="https://telegram.me/STORMCLl"> شي اكيد احبك حياتي 😸💛 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="اعشقك" then local taha = [[ <a href="https://telegram.me/STORMCLl"> فيدوه اني هم عشقك😊😹🙊 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="شباب" then local taha = [[ <a href="https://telegram.me/STORMCLl"> كباب وتكه وسمج 😸😸?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="ماريا" then local taha = [[ <a href="https://telegram.me/STORMCLl"> ولك هاي الصاكه العشق هاي حبيبت المطور هاي 😸🙊😻😻️ </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😂😂😂😂😂😂" then local taha = [[ <a href="https://telegram.me/STORMCLl"> يضحك الفطير 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😇" then local taha = [[ <a href="https://telegram.me/STORMCLl"> استريح بحي رايد شي 😹😹?? </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😖" then local taha = [[ <a href="https://telegram.me/STORMCLl"> دي وجهك معقد 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😄" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> حيل فتح حلكك نوب 😹😹😘 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😌😌😌😌??" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> فديت الغرور كله بحي </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😭😭😭😭😭" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> منو ويك حياتي بس كلي اله اهينه كدامك 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😫" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ها بحي منو مضوجك ??😻 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="☻" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> عساس ثكيل العينتين تاليتك تزحفبل خاص 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😠" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> طفه طفه 💦💦 تره حمه حيل </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😳😳😳😳😳" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ها شفت/ي ابوك/ج مصلخ ونصدمت 😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="😹" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> اضحك شكو عله كلبك ☹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙊🙊🙊🙊🙊" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> ها قردي شبيك مستحي 😂😂 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end 
if text =="🙈🙈🙈🙈🙈" then  local taha = [[ <a href="https://telegram.me/STORMCLl"> صار/ت قرد يعني خجلان ?😹😹😹 </a> ]] storm.sendtaha(msg.chat_id_, msg.id_, 1, taha, 1, "html") end
if text and text:match("^زخرف (.*)$") then
local taha = { string.match(text, "^(زخرف) (.*)$") }
local b = taha[2] local  q = taha[2]  local  w = taha[2]  local  r = taha[2]  local  e = taha[2] local  t = taha[2]   local  c = taha[2] local  x = taha[2] local  z = taha[2]  local  l = taha[2]  local  k = taha[2] local  j = taha[2]  local  h = taha[2]  local  g = taha[2] local  f = taha[2]
local ta = { ' •💚 ', '🍿﴿', '•  ❥˓  ', '💝﴿ֆ', ' • 🐼🌿', ' •🙊💙', '-🐥✨ ', ' 〄💖‘',' ⚡️💊', '- ⁽🌷', '🔥“', '💜💭', '💙', '🎩🍿','“̯ 🐼💗 ', '🐝🍷','❥̚͢₎ 🐣', '🌸‘', ' 💭💔ۦ', ' 💛💭ۦ', ' ⚡️🔱ۦ','℡ᴖ̈💜', '🌔☄️₎ۦ˛', '💥♩',' ☻🔥“ٰۦ', '℡ ̇ ✨🐯⇣✦', '⁞♩⁽💎🌩₎⇣✿','ۦٰ‏┋❥ ͢˓🦁💛ۦ‏', '⚡️♛ֆ₎', '♛⇣🐰☄️₎✦', '⁾⇣✿💖┊❥', ' ₎✿💥🎃 ⁞“❥', '😴🌸✿⇣', '❥┊⁽ ℡🦁🌸' }
b = b:gsub('ا','آ') b = b:gsub("ب","بّہ") b = b:gsub("ت","تَہَٰ") b = b:gsub("ح","حہٰٰ") b = b:gsub("ج","جْۧ") b = b:gsub("خ","خٰ̐ہ") b = b:gsub("د","د") b = b:gsub("ذ","ذِ") b = b:gsub("ر","ر") b = b:gsub("ز","زَ") b = b:gsub("س","سٰٰٓ") b = b:gsub("ش","شِٰہٰٰ") b = b:gsub("ص","صۛہٰٰ") b = b:gsub("ض","ضۜہٰٰ") b = b:gsub("ظ","ظۗہٰٰ") b = b:gsub("غ","غہٰٰ") b = b:gsub("ف","ف͒ہٰٰ") b = b:gsub("ق","قྀ̲ہٰٰٰ") b = b:gsub("ك","ڪٰྀہٰٰٖ") b = b:gsub("ل","ل") b = b:gsub("ن","نَِٰہٰ") b = b:gsub("ه","ھہ") b = b:gsub("و","وِ") b = b:gsub("طۨہٰٰ","ط") b = b:gsub("ث","ثہٰٰ") b = b:gsub("ي","يِٰہ") b = b:gsub("ع","؏ۤـہٰٰ")
q = q:gsub('ض', 'ضِـٰٚـ') q = q:gsub('ص', 'صِـٰٚـ') q = q:gsub('ث', 'ثِـٰٚـ') q = q:gsub('ق', 'قِـٰٚـ') q = q:gsub('ف', 'فِ͒ـٰٚـ') q = q:gsub('غ', 'غِـٰٚـ') q = q:gsub('ع', 'عِـٰٚـ') q = q:gsub('خ', 'خِ̐ـٰٚـ') q = q:gsub('ح', 'حِـٰٚـ') q = q:gsub('ج', 'جِـٰٚـِِـٰٚـِْ') q = q:gsub('ش', 'شِـٰٚـ') q = q:gsub('س', 'سِـٰٚـ') q = q:gsub('ي', 'يِـٰٚـ') q = q:gsub('ب', 'بِـٰٚـ') q = q:gsub('ل', 'لِـٰٚـ') q = q:gsub('ا', 'آ') q = q:gsub('ت', 'تِـٰٚـ') q = q:gsub('ن', 'نِـٰٚـ') q = q:gsub('م', 'مِـٰٚـ') q = q:gsub('ك', 'ڪِـٰٚـ') q = q:gsub('ط', 'طِـٰٚـ') q = q:gsub('ذ', 'ذِـٰٚـ') q = q:gsub('ظ', 'ظِـٰٚـ') q = q:gsub('ء', 'ء') q = q:gsub('ؤ', 'ؤ') q = q:gsub('ر', 'ر') q = q:gsub('ى', 'ى') q = q:gsub('ز', 'ز') q = q:gsub('ظ', 'ظِـٰٚـ') q = q:gsub('و', 'ﯛ̲୭') q = q:gsub("ه", "ۿۿہ")  
w = w:gsub('ض', 'ض͜ـ')  w = w:gsub('ص', 'ص͜ـ')  w = w:gsub('ث', 'ث͜ـ͜ـ')  w = w:gsub('ق', 'ق͜ـ')  w = w:gsub('ف', 'ف͒͜ـ')  w = w:gsub('غ', 'غ͜ـ')  w = w:gsub('ع', 'ع͜ـ')  w = w:gsub('خ', 'خ̐͜ـ')  w = w:gsub('ح', 'ح͜ـ')  w = w:gsub('ج', 'ج͜ـ')  w = w:gsub('ش', 'ش͜ـ')  w = w:gsub('س', 'س͜ـ')  w = w:gsub('ي', 'ي͜ـ')  w = w:gsub('ب', 'ب͜ـ')  w = w:gsub('ل', 'ل͜ـ')  w = w:gsub('ا', 'آ')  w = w:gsub('ت', 'ت͜ـ')  w = w:gsub('ن', 'ن͜ـ')  w = w:gsub('م', 'م͜ـ')  w = w:gsub('ك', 'ڪ͜ـ')  w = w:gsub('ط', 'ط͜ـ')  w = w:gsub('ظ', 'ظ͜ـ')  w = w:gsub('ء', 'ء')  w = w:gsub('ؤ', 'ؤ')  w = w:gsub('ر', 'ر')  w = w:gsub('ى', 'ى')  w = w:gsub('ز', 'ز')  w = w:gsub('ظ', 'ظـ')  w = w:gsub('و', 'ﯛ̲୭')  w = w:gsub("ه", "ۿۿہ")
e = e:gsub('ض', 'ضہ') e = e:gsub('ص', 'صہ') e = e:gsub('ث', 'ثہ') e = e:gsub('ق', 'قہ') e = e:gsub('ف', 'فہ') e = e:gsub('غ', 'غہ') e = e:gsub('ع', 'عہ') e = e:gsub('خ', 'خہ') e = e:gsub('ح', 'حہ') e = e:gsub('ج', 'جہ') e = e:gsub('ش', 'شہ') e = e:gsub('س', 'سہ') e = e:gsub('ي', 'يہ') e = e:gsub('ب', 'بہ') e = e:gsub('ل', 'ل') e = e:gsub('ا', 'آ') e = e:gsub('ت', 'تہ') e = e:gsub('ن', 'نہ') e = e:gsub('م', 'مہ') e = e:gsub('ك', 'كہ') e = e:gsub('ط', 'طہ') e = e:gsub('ظ', 'ظہ') e = e:gsub('ء', 'ء') e = e:gsub('ؤ', 'ؤ') e = e:gsub('ر', 'ر') e = e:gsub('ى', 'ى') e = e:gsub('ز', 'ز') e = e:gsub('و', 'ﯛ̲୭') e = e:gsub("ه", "ۿۿہ")
t = t:gsub('ض', 'ضِٰــ') t = t:gsub('ص', 'صِٰــ') t = t:gsub('ث', 'ثِٰــ') t = t:gsub('ق', 'قِٰــ') t = t:gsub('ف', 'فِٰ͒ــ') t = t:gsub('غ', 'غِٰــ') t = t:gsub('ع', 'عِٰــ') t = t:gsub('خ', 'خِٰ̐ــ') t = t:gsub('ح', 'حِٰــ') t = t:gsub('ج', 'جِٰــ') t = t:gsub('ش', 'شِٰــ') t = t:gsub('س', 'سِٰــ') t = t:gsub('ي', 'يِٰــ') t = t:gsub('ب', 'بِٰــ') t = t:gsub('ل', 'لِٰــ') t = t:gsub('ا', 'آ') t = t:gsub('ت', 'تِٰــ') t = t:gsub('ن', 'نِٰــ') t = t:gsub('م', 'مِٰــ') t = t:gsub('ك', 'ڪِٰــ') t = t:gsub('ط', 'طِٰــ') t = t:gsub('ظ', 'ظِٰــ') t = t:gsub('ء', 'ء') t = t:gsub('ؤ', 'ؤ') t = t:gsub('ر', 'ر') t = t:gsub('ى', 'ى') t = t:gsub('ز', 'ز') t = t:gsub('و', 'ﯛ̲୭') t = t:gsub("ه", "໋۠هہؚ")
local test = [[ 
💫￤اهلا بك عزيزي 
✨￤اضغط عل اسم ليتم نسخه
ٴ┄•💥•┄༻💢༺┄•💥•┄

*1 •* <code>]]..b..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*2 •* <code>]]..q..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*3 •* <code>]]..w..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*4 •* <code>]]..e..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*5 •* <code>]]..t..[[]]..ta[math.random(#ta)]..[[</code>

ٴ┄•💥•┄༻💢༺┄•💥•┄
📬￤<a href="https://telegram.me/STORMCLl"> قناتنا تابعه للسورس ✨ </a>
]]
storm.sendtaha( msg.chat_id_, msg.id_, 1, test, 1, "html") end
----------------------------------------------------------------
if text and text:match("^زخرفه (.*)$") then
local taha = { string.match(text, "^(زخرفه) (.*)$") }
local b = taha[2] local  s = taha[2]  local  t = taha[2]  local  m = taha[2]  local  n = taha[2] local  v = taha[2]   local  c = taha[2] local  x = taha[2] local  z = taha[2]  local  l = taha[2]  local  k = taha[2] local  j = taha[2]  local  h = taha[2]  local  g = taha[2] local  f = taha[2]
local ta = { ' •💚 ', '??﴿', '•  ❥˓  ', '💝﴿ֆ', ' • 🐼🌿', ' •🙊💙', '-🐥✨ ', ' 〄💖‘',' ⚡️💊', '- ⁽🌷', '🔥“', '💜💭', '💙', '🎩🍿','“̯ 🐼💗 ', '🐝🍷','❥̚͢₎ 🐣', '🌸‘', ' 💭💔ۦ', ' 💛💭ۦ', ' ⚡️🔱ۦ','℡ᴖ̈💜', '🌔☄️₎ۦ˛', '💥♩',' ☻🔥“ٰۦ', '℡ ̇ ✨🐯⇣✦', '⁞♩⁽💎🌩₎⇣✿','ۦٰ‏┋❥ ͢˓🦁💛ۦ‏', '⚡️♛ֆ₎', '♛⇣🐰☄️₎✦', '⁾⇣✿💖┊❥', ' ₎✿💥🎃 ⁞“❥', '😴🌸✿⇣', '❥┊⁽ ℡🦁🌸' }
b = b:gsub('a', 'ᴀ') b = b:gsub('b', 'ʙ') b = b:gsub('c', 'ᴄ') b = b:gsub('d', 'ᴅ') b = b:gsub('e', 'ᴇ') b = b:gsub('f', 'ᴈ') b = b:gsub('g', 'ɢ') b = b:gsub('h', 'ʜ') b = b:gsub('i', 'ɪ') b = b:gsub('j', 'ᴊ') b = b:gsub('k', 'ᴋ') b = b:gsub('l', 'ʟ') b = b:gsub('m', 'ᴍ') b = b:gsub('n', 'ɴ') b = b:gsub('o', 'ᴏ') b = b:gsub('p', 'ᴘ') b = b:gsub('q', 'ᴓ') b = b:gsub('r', 'ʀ') b = b:gsub('s', 'ᴤ') b = b:gsub('t', 'ᴛ') b = b:gsub('u', 'ᴜ') b = b:gsub('v', 'ᴠ') b = b:gsub('w', 'ᴡ') b = b:gsub('x', 'ᴥ') b = b:gsub('y', 'ʏ') b = b:gsub('z', 'ᴢ')
t = t:gsub('a','ᗩ') t = t:gsub('A','ᗩ') t = t:gsub("b","ᗷ") t = t:gsub("B","ᗷ") t = t:gsub("c","ᑕ") t = t:gsub("C","ᑕ") t = t:gsub("d","ᗪ") t = t:gsub("D","ᗪ") t = t:gsub("e","E") t = t:gsub("E","E") t = t:gsub("f","ᖴ") t = t:gsub("F","ᖴ") t = t:gsub("g","G") t = t:gsub("G","G") t = t:gsub("h","ᕼ") t = t:gsub("H","ᕼ") t = t:gsub("i","I") t = t:gsub("I","I") t = t:gsub("j","ᒍ") t = t:gsub("J","ᒍ") t = t:gsub("k","K") t = t:gsub("K","K") t = t:gsub("l","ᒪ") t = t:gsub("L","ᒪ") t = t:gsub("m","ᗰ") t = t:gsub("M","ᗰ") t = t:gsub("n","ᑎ") t = t:gsub("N","ᑎ") t = t:gsub("o","O") t = t:gsub("O","O") t = t:gsub("p","ᑭ") t = t:gsub("P","ᑭ") t = t:gsub("q","ᑫ") t = t:gsub("Q","ᑫ") t = t:gsub("r","ᖇ") t = t:gsub("R","ᖇ") t = t:gsub("s","ᔕ") t = t:gsub("S","ᔕ") t = t:gsub("t","T") t = t:gsub("T","T") t = t:gsub("u","ᑌ") t = t:gsub("U","ᑌ") t = t:gsub("v","ᐯ") t = t:gsub("V","ᐯ") t = t:gsub("w","ᗯ") t = t:gsub("x","᙭") t = t:gsub("y","Y") t = t:gsub("z","ᘔ")
s = s:gsub('a', '🄰') s = s:gsub('b', '🄱') s = s:gsub('c', '🄲') s = s:gsub('d', '🄳') s = s:gsub('e', '🄴') s = s:gsub('f', '🄵') s = s:gsub('g', '🄶') s = s:gsub('h', '🄷') s = s:gsub('i', '🄸') s = s:gsub('j', '🄹') s = s:gsub('k', '🄺') s = s:gsub('l', '🄻') s = s:gsub('m', '🄼') s = s:gsub('n', '🄽') s = s:gsub('o', '🄾') s = s:gsub('p', '🄿') s = s:gsub('q', '🅀') s = s:gsub('r', '🅁') s = s:gsub('s', '🅂') s = s:gsub('t', '🅃') s = s:gsub('u', '🅄') s = s:gsub('v', '🅅') s = s:gsub('w', '🅆') s = s:gsub('x', '🅇') s = s:gsub('y', '🅈') s = s:gsub('z', '🅉')
m = m:gsub('a', '̅α')  m = m:gsub('b', '̅в')  m = m:gsub('c', '̅c')  m = m:gsub('d', '̅ɒ')  m = m:gsub('e', '̅є')  m = m:gsub('f', '̅f')  m = m:gsub('g', '̅ɢ')  m = m:gsub('h', '̅н')  m = m:gsub('i', '̅ɪ')  m = m:gsub('j', '̅ᴊ')  m = m:gsub('k', '̅ĸ')  m = m:gsub('l', '̅ℓ')  m = m:gsub('m', '̅м')  m = m:gsub('n', '̅и')  m = m:gsub('o', '̅σ')  m = m:gsub('p', '̅ρ')  m = m:gsub('q', '̅q')  m = m:gsub('r', '̅я')  m = m:gsub('s', '̅s')  m = m:gsub('t', '̅τ')  m = m:gsub('u', '̅υ')  m = m:gsub('v', '̅v')  m = m:gsub('w', '̅ω')  m = m:gsub('x', '̅x')  m = m:gsub('y', '̅y')  m = m:gsub('z', '̅z')
n = n:gsub('a', '۰۪۫A۪۫۰') n = n:gsub('b', '۰۪۫B۪۫۰') n = n:gsub('c', '۰۪۫C۪۫۰') n = n:gsub('d', '۰۪۫D۪۫۰') n = n:gsub('e', '۰۪۫E۪۫۰') n = n:gsub('f', '۰۪۫F۪۫۰') n = n:gsub('g', '۰۪۫G۪۫۰') n = n:gsub('h', '۰۪۫H۪۫۰') n = n:gsub('i', '۰۪۫I۪۫۰') n = n:gsub('j', '۰۪۫J۪۫۰') n = n:gsub('k', '۰۪۫K۪۫۰') n = n:gsub('l', '۰۪۫L۪۫۰') n = n:gsub('m', '۰۪۫M۪۫۰') n = n:gsub('n', '۰۪۫N۪۫۰') n = n:gsub('o', '۰۪۫O۪۫۰') n = n:gsub('p', '۰۪۫P۪۫۰') n = n:gsub('q', '۰۪۫Q۪۫۰') n = n:gsub('r', '۰۪۫R۪۫۰') n = n:gsub('s', '۰۪۫S۪۫۰') n = n:gsub('t', '۰۪۫T۪۫۰') n = n:gsub('u', '۰۪۫U۪۫۰') n = n:gsub('v', '۰۪۫V۪۫۰') n = n:gsub('w', '۰۪۫W۪۫۰') n = n:gsub('x', '۰۪۫X۪۫۰') n = n:gsub('y', '۰۪۫Y۪۫۰') n = n:gsub('z', '۰۪۫Z۪۫۰')
v = v:gsub('a', 'λ') v = v:gsub('b', 'ß') v = v:gsub('c', 'Ȼ') v = v:gsub('d', 'ɖ') v = v:gsub('e', 'ε') v = v:gsub('f', 'ʃ') v = v:gsub('g', 'Ģ') v = v:gsub('h', 'ħ') v = v:gsub('i', 'ί') v = v:gsub('j', 'ĵ') v = v:gsub('k', 'κ') v = v:gsub('l', 'ι') v = v:gsub('m', 'ɱ') v = v:gsub('n', 'ɴ') v = v:gsub('o', 'Θ') v = v:gsub('p', 'ρ') v = v:gsub('q', 'ƣ') v = v:gsub('r', 'ર') v = v:gsub('s', 'Ș') v = v:gsub('t', 'τ') v = v:gsub('u', 'Ʋ') v = v:gsub('v', 'ν') v = v:gsub('w', 'ώ') v = v:gsub('x', 'Χ') v = v:gsub('y', 'ϓ') v = v:gsub('z', 'Հ') 
c = c:gsub('a', 'Ａ') c = c:gsub('b', 'Ｂ') c = c:gsub('c', 'Ｃ') c = c:gsub('d', 'Ｄ') c = c:gsub('e', 'Ｅ') c = c:gsub('f', 'Ｆ') c = c:gsub('g', 'Ｇ') c = c:gsub('h', 'Ｈ') c = c:gsub('i', 'Ｉ') c = c:gsub('j', 'Ｊ') c = c:gsub('k', 'Ｋ') c = c:gsub('l', 'Ｌ') c = c:gsub('m', 'Ｍ') c = c:gsub('n', 'Ｎ') c = c:gsub('o', 'Ｏ') c = c:gsub('p', 'Ｐ') c = c:gsub('q', 'Ｑ') c = c:gsub('r', 'Ｒ') c = c:gsub('s', 'Ｓ') c = c:gsub('t', 'Ｔ') c = c:gsub('u', 'Ｕ') c = c:gsub('v', 'Ｖ') c = c:gsub('w', 'Ｗ') c = c:gsub('x', 'Ｘ') c = c:gsub('y', 'Ｙ') c = c:gsub('z', 'Ｚ')
x = x:gsub('a', 'ᴬ') x = x:gsub('b', 'ᴮ') x = x:gsub('c', 'ᶜ') x = x:gsub('d', 'ᴰ') x = x:gsub('e', 'ᴱ') x = x:gsub('f', 'ᶠ') x = x:gsub('g', 'ᴳ') x = x:gsub('h', 'ᴴ') x = x:gsub('i', 'ᴵ') x = x:gsub('j', 'ᴶ') x = x:gsub('k', 'ᴷ') x = x:gsub('l', 'ᴸ') x = x:gsub('m', 'ᴹ') x = x:gsub('n', 'ᴺ') x = x:gsub('o', 'ᴼ') x = x:gsub('p', 'ᴾ') x = x:gsub('q', 'ᵠ') x = x:gsub('r', 'ᴿ') x = x:gsub('s', 'ˁ') x = x:gsub('t', 'ᵀ') x = x:gsub('u', 'ᵁ') x = x:gsub('v', 'ᵛ') x = x:gsub('w', 'ᵂ') x = x:gsub('x', 'ˣ') x = x:gsub('y', 'ʸ') x = x:gsub('z', 'ᶻ')
z = z:gsub('a', 'ᾋ') z = z:gsub('b', 'ϐ') z = z:gsub('c', 'Ƈ') z = z:gsub('d', 'Ɖ') z = z:gsub('e', 'Ἕ') z = z:gsub('f', 'Ғ') z = z:gsub('g', 'Ɠ') z = z:gsub('h', 'Ἤ') z = z:gsub('i', 'Ἷ') z = z:gsub('j', 'Ј') z = z:gsub('k', 'Ḱ') z = z:gsub('l', 'Ŀ') z = z:gsub('m', 'Ṃ') z = z:gsub('n', 'Ɲ') z = z:gsub('o', 'Ὃ') z = z:gsub('p', 'Ƥ') z = z:gsub('q', 'Q') z = z:gsub('r', 'Ȓ') z = z:gsub('s', 'Ṩ') z = z:gsub('t', 'Ҭ') z = z:gsub('u', 'Ȗ') z = z:gsub('v', 'V') z = z:gsub('w', 'Ẃ') z = z:gsub('x', 'Ẋ') z = z:gsub('y', 'Ὓ') z = z:gsub('z', 'Ẕ')
l = l:gsub('a', '[̲̅a̲̅]') l = l:gsub('b', '[̲̅b̲̅]') l = l:gsub('c', '[̲̅c̲̅]') l = l:gsub('d', '[̲̅d̲̅]') l = l:gsub('e', '[̲̅e̲̅]') l = l:gsub('f', '[̲̅f̲̅]') l = l:gsub('g', '[̲̅g̲̅]') l = l:gsub('h', '[̲̅h̲̅]') l = l:gsub('i', '[̲̅i̲̅]') l = l:gsub('j', '[̲̅j̲̅]') l = l:gsub('k', '[̲̅k̲̅]') l = l:gsub('l', '[̲̅l̲̅]') l = l:gsub('m', '[̲̅m̲̅]') l = l:gsub('n', '[̲̅n̲̅]') l = l:gsub('o', '[̲̅o̲̅]') l = l:gsub('p', '[̲̅p̲̅]') l = l:gsub('q', '[̲̅q̲̅]') l = l:gsub('r', '[̲̅r̲̅]') l = l:gsub('s', '[̲̅s̲̅]') l = l:gsub('t', '[̲̅t̲̅]') l = l:gsub('u', '[̲̅u̲̅]') l = l:gsub('v', '[̲̅v̲̅]') l = l:gsub('w', '[̲̅w̲̅]') l = l:gsub('x', '[̲̅x̲̅]') l = l:gsub('y', '[̲̅y̲̅]') l = l:gsub('z', 'z')
k = k:gsub('a', 'ɑ̃̾') k = k:gsub('b', 'в̃̾') k = k:gsub('c', 'c̃̾') k = k:gsub('d', 'd̃̾') k = k:gsub('e', 'ǝ̃̾') k = k:gsub('f', 'г̵̵') k = k:gsub('g', 'G̃̾') k = k:gsub('h', 'н̃̾') k = k:gsub('i', 'ı̃̾') k = k:gsub('j', 'τ̃̾') k = k:gsub('k', 'к̃̾') k = k:gsub('l', 'l̃̾') k = k:gsub('m', 'м̃̾') k = k:gsub('n', 'и̃̾') k = k:gsub('o', 'σ̃̾') k = k:gsub('p', 'ρ̃̾') k = k:gsub('q', 'Q̃̾') k = k:gsub('r', 'я̃̾') k = k:gsub('s', 'ƨ̃̾') k = k:gsub('t', 'т̃̾') k = k:gsub('u', 'υ̃̾') k = k:gsub('v', 'ν̃̾') k = k:gsub('w', 'ω̃̾') k = k:gsub('x', 'x̃̾') k = k:gsub('y', 'ч̃̾') k = k:gsub('z', 'z̃̾')
j = j:gsub('a', 'ɑ̝̚') j = j:gsub('b', 'в̝̚') j = j:gsub('c', 'c̝̚') j = j:gsub('d', 'd̝̚') j = j:gsub('e', 'ǝ̝̚') j = j:gsub('f', 'г̵̵') j = j:gsub('g', 'G̝̚') j = j:gsub('h', 'н̝̚') j = j:gsub('i', 'ı̝̚') j = j:gsub('j', 'τ') j = j:gsub('k', 'к̝') j = j:gsub('l', 'l̝̚') j = j:gsub('m', 'м̝̚') j = j:gsub('n', 'и̝̚') j = j:gsub('o', 'σ̝̚') j = j:gsub('p', 'ρ̝̚') j = j:gsub('q', 'Q̝̚') j = j:gsub('r', 'я̝̚') j = j:gsub('s', 'ƨ̝̚') j = j:gsub('t', 'т̝̚') j = j:gsub('u', 'υ̝̚') j = j:gsub('v', 'ν̝̚') j = j:gsub('w', 'ω̝̚') j = j:gsub('x', 'x̝̚') j = j:gsub('y', 'ч̝̚') j = j:gsub('z', 'z̝̚')
h = h:gsub('a', 'ค') h = h:gsub('b', '๒') h = h:gsub('c', 'ς') h = h:gsub('d', '๔') h = h:gsub('e', 'є') h = h:gsub('f', 'Ŧ') h = h:gsub('g', 'g') h = h:gsub('h', 'ђ') h = h:gsub('i', 'เ') h = h:gsub('j', 'ן') h = h:gsub('k', 'к') h = h:gsub('l', 'l') h = h:gsub('m', '๓') h = h:gsub('n', 'ภ') h = h:gsub('o', '๏') h = h:gsub('p', 'ק') h = h:gsub('q', 'ợ') h = h:gsub('r', 'г') h = h:gsub('s', 'ร') h = h:gsub('t', 't') h = h:gsub('u', 'ย') h = h:gsub('v', 'ש') h = h:gsub('w', 'ฬ') h = h:gsub('x', 'א') h = h:gsub('y', 'ץ') h = h:gsub('z', 'z') 
g = g:gsub('a', 'Á') g = g:gsub('b', 'ß') g = g:gsub('c', 'Č') g = g:gsub('d', 'Ď') g = g:gsub('e', 'Ĕ') g = g:gsub('f', 'Ŧ') g = g:gsub('g', 'Ğ') g = g:gsub('h', 'Ĥ') g = g:gsub('i', 'Ĩ') g = g:gsub('j', 'Ĵ') g = g:gsub('k', 'Ķ') g = g:gsub('l', 'Ĺ') g = g:gsub('m', 'M') g = g:gsub('n', 'Ń') g = g:gsub('o', 'Ő') g = g:gsub('p', 'P') g = g:gsub('q', 'Q') g = g:gsub('r', 'Ŕ') g = g:gsub('s', 'Ś') g = g:gsub('t', 'Ť') g = g:gsub('u', 'Ú') g = g:gsub('v', 'V') g = g:gsub('w', 'Ŵ') g = g:gsub('x', 'Ж') g = g:gsub('y', 'Ŷ') g = g:gsub('z', 'Ź') 
local test = [[ 
💫￤اهلا بك عزيزي 
✨￤اضغط عل اسم ليتم نسخه
ٴ┄•💥•┄༻💢༺┄•💥•┄

*1 •* <code>]]..b..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*2 •* <code>]]..m..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*3 •* <code>]]..n..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*4 •* <code>]]..v..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*5 •* <code>]]..c..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*6 •* <code>]]..x..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*7 •* <code>]]..z..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*8 •* <code>]]..l..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*9 •* <code>]]..k..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*10 •* <code>]]..j..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*11 •* <code>]]..h..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*12 •* <code>]]..g..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*13 •* <code>]]..s..[[]]..ta[math.random(#ta)]..[[</code>
---------------------------------
*14 •* <code>]]..t..[[]]..ta[math.random(#ta)]..[[</code>

ٴ┄•💥•┄༻💢༺┄•💥•┄
📬￤<a href="https://telegram.me/STORMCLl"> قناتنا تابعه للسورس ✨ </a>
]]
storm.sendtaha( msg.chat_id_, msg.id_, 1, test, 1, "html") end

if text == "ايدي" then function id_by_reply(extra, result, success) storm.sendtaha(msg.chat_id_, msg.id_, 1, '<b>📫 • ايديه </b> : [ <code>'..result.sender_user_id_..'</code> ]', 1, 'html') end 
if tonumber(msg.reply_to_message_id_) == 0 then else storm.getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),id_by_reply) end end
if text == 'ايدي' and  msg.reply_to_message_id_ == 0 then local gmsgs = tahadevstorm:get('groupmsgkk:'..msg.chat_id_..':') local username = nil function getmepar(extra,result,success) username = '@'..(result.username_ or 'ماكو معرف ❌')..'' local name = tahadevstorm:hget('gps:settings:'..msg.sender_user_id_ ,"setnameid")
if not name then  function setname(extra,result,success) snm = result.first_name_ tahadevstorm:hset('gps:settings:'..msg.sender_user_id_ ,"setnameid" , snm) end  storm.getUser(msg.sender_user_id_,setname) name = tahadevstorm:hget('gps:settings:'..msg.sender_user_id_ ,"setnameid") or '...' end
if not tahadevstorm:get('lock:id'..msg.chat_id_) then local function getpro(extra, result, success) local msguser = tonumber(tahadevstorm:get('total:messages:'..msg.chat_id_..':'..msg.sender_user_id_) or 1)
if result.photos_[0] then
if is_devtaha(msg) then
t = 'مطور اساسي 🕹' elseif is_sudo(msg) then
t = 'مطور 🃏' elseif is_owner(msg) then
t = 'مدير الكروب 💡'  elseif is_mod(msg) then
t = 'ادمن الكروب 👮' elseif is_vipgroups(msg) then
t = 'مميز عام 📪' elseif is_vipgroup(msg) then
t = 'مميز 🚸'  else
t = 'مجرد عضو 🙌' end sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,'\n🏅┊ ايديك  ( '..msg.sender_user_id_..' )\n📬┊ معرفك ( '..username..' )\n☇┊ موقعك ( '..t..' )\n✨┊ تفاعلك ( '..formsgg(msguser)..' )\n🎫┊ رسائلك ( '..msguser..' )\n📓┊ رسائل الكروب ( '..gmsgs..' )\n📸┊ عدد صورك ( '..result.total_count_..' )\n🏇┊ اسمك  ( '..name..' )', 1, 'md') else  storm.sendtaha(msg.chat_id_, msg.id_, 1, '❌┊ انت لا تمتلك صوره في حسابك \n??┊ الكروب ( *'..msg.chat_id_:gsub('-100','')..'* )\n🏅┊ ايديك  ( *'..msg.sender_user_id_..'* )\n📓┊ رسائل الكروب ( *'..gmsgs..'* )\n♻┊ معرفك ( '..username..' )\n🎫┊ رسائلك ( *'..msgs..'* )\n🏇┊ اسمك  ( `'..name..'` )', 1, 'md') end  end   tdcli_function ({    ID = "GetUserProfilePhotos",    user_id_ = msg.sender_user_id_,    offset_ = 0,    limit_ = 1  }, getpro, nil) end end getUser(msg.sender_user_id_, getmepar) end
if text and text:match("^الرتبه$") and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then
 function id_by_reply(extra, result, success)
if result.id_ then
if is_devtaha(result) then
t = 'مطور اساسي 🕹' elseif is_sudo(result) then
t = 'مطور ✨' elseif is_owner(result) then
t = 'مدير الكروب 💡'  elseif is_mod(result) then
t = 'ادمن الكروب 👮' elseif is_vipgroups(result) then
t = 'مميز عام 📪' elseif is_vipgroup(result) then
t = 'مميز 🚸'  else
t = 'مجرد عضو 🙌' end  end storm.sendtaha(msg.chat_id_, msg.id_, 1, "🎫┊ ايديه (`"..result.sender_user_id_.."`)\n♨┊ رتبته ( "..t..' )\n☇┊ عدد رسائله ( `'..(tahadevstorm:get('total:messages:'..msg.chat_id_..':'..result.sender_user_id_) or 0)..'` )', 1, 'md') end storm.getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) end
---------------------------------------------
if text == "" then local taha = "" storm.sendtaha(msg.chat_id_, msg.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md') end
if text == "" then local taha = "" storm.sendtaha(msg.chat_id_, msg.id_, 1,''..taha[math.random(#taha)]..'', 1, 'md')
end end
function tdcli_update_callback(data)
    if (data.ID == "UpdateNewMessage") then
     run(data.message_,data)
elseif data.ID == 'UpdateMessageEdited' then
    local function edited_cb(extra,result,success)
    if not is_mod(result) and not is_vipgroup(result) and not is_vipgroups(result) and tahadevstorm:get('edit:Lock:'..data.chat_id_) == "lock" then
delete_msg(data.chat_id_,{[0] = data.message_id_})
end 
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
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


