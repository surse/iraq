local M = {} 
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end return chat
end
M.getChatId = getChatId
local function getInputMessageContent(file, filetype, caption)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end local inmsg = {}
local filetype = filetype:lower()if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end return inmsg
end
function getParseMode(parse_mode)
	if parse_mode then
		local mode = parse_mode:lower()
		
		if mode == "html" or mode == "ht" then
			P = {ID = "TextParseModeHTML"}
		else
			P = {ID = "TextParseModeMarkdown"}
		end
	end
  return P
end
local function getAuthState()
tdcli_function ({
ID = "GetAuthState",
}, dl_cb, nil)
end M.getAuthState = getAuthState
local function setAuthPhoneNumber(phone_number, allow_flash_call, is_current_phone_number)
tdcli_function ({
ID = "SetAuthPhoneNumber",
phone_number_ = phone_number,
allow_flash_call_ = allow_flash_call,
is_current_phone_number_ = is_current_phone_number
}, dl_cb, nil)
end M.setAuthPhoneNumber = setAuthPhoneNumber
local function resendAuthCode()
tdcli_function ({
ID = "ResendAuthCode",
}, dl_cb, nil)
end M.resendAuthCode = resendAuthCode
local function checkAuthCode(code, first_name, last_name)
tdcli_function ({
ID = "CheckAuthCode",
code_ = code,
first_name_ = first_name,
last_name_ = last_name
}, dl_cb, nil)
end M.checkAuthCode = checkAuthCode
local function checkAuthPassword(password)
tdcli_function ({
ID = "CheckAuthPassword",
password_ = password
}, dl_cb, nil)
end M.checkAuthPassword = checkAuthPassword
local function requestAuthPasswordRecovery()
tdcli_function ({
ID = "RequestAuthPasswordRecovery",
}, dl_cb, nil)
end M.requestAuthPasswordRecovery = requestAuthPasswordRecovery
local function recoverAuthPassword(recovery_code)
tdcli_function ({
ID = "RecoverAuthPassword",
recovery_code_ = recovery_code
}, dl_cb, nil)
end M.recoverAuthPassword = recoverAuthPassword
local function resetAuth(force)
tdcli_function ({
ID = "ResetAuth",
force_ = force or nil
}, dl_cb, nil)
end M.resetAuth = resetAuth
local function checkAuthBotToken(token)
tdcli_function ({
ID = "CheckAuthBotToken",
token_ = token
}, dl_cb, nil)
end M.checkAuthBotToken = checkAuthBotToken
local function getPasswordState()
tdcli_function ({
ID = "GetPasswordState",
}, dl_cb, nil)
end M.getPasswordState = getPasswordState
local function setPassword(old_password, new_password, new_hint, set_recovery_email, new_recovery_email)
tdcli_function ({
ID = "SetPassword",
old_password_ = old_password,
new_password_ = new_password,
new_hint_ = new_hint,
set_recovery_email_ = set_recovery_email,
new_recovery_email_ = new_recovery_email
}, dl_cb, nil)
end M.setPassword = setPassword
local function getRecoveryEmail(password)
tdcli_function ({
ID = "GetRecoveryEmail",
password_ = password
}, dl_cb, nil)
end M.getRecoveryEmail = getRecoveryEmail
local function setRecoveryEmail(password, new_recovery_email)
tdcli_function ({
ID = "SetRecoveryEmail",
password_ = password,
new_recovery_email_ = new_recovery_email
}, dl_cb, nil)
end M.setRecoveryEmail = setRecoveryEmail
local function requestPasswordRecovery()
tdcli_function ({
ID = "RequestPasswordRecovery",
}, dl_cb, nil)
end M.requestPasswordRecovery = requestPasswordRecovery
local function recoverPassword(recovery_code)
tdcli_function ({
ID = "RecoverPassword",
recovery_code_ = tostring(recovery_code)
}, dl_cb, nil)
end M.recoverPassword = recoverPassword
local function getMe(cb)
tdcli_function ({
ID = "GetMe",
}, cb, nil)
end M.getMe = getMe
local function getUser(user_id,cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end M.getUser = getUser
local function getUserFull(user_id)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, dl_cb, nil)
end M.getUserFull = getUserFull
local function getGroup(group_id)
tdcli_function ({
ID = "GetGroup",
group_id_ = getChatId(group_id).ID
}, dl_cb, nil)
end M.getGroup = getGroup
local function getGroupFull(group_id)
tdcli_function ({
ID = "GetGroupFull",
group_id_ = getChatId(group_id).ID
}, dl_cb, nil)
end M.getGroupFull = getGroupFull
local function getChannel(channel_id,cb)
tdcli_function ({
ID = "GetChannel",
channel_id_ = getChatId(channel_id).ID
}, cb, nil)
end M.getChannel = getChannel
local function getChannelFull(channel_id,cb)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, cb, nil)
end M.getChannelFull = getChannelFull
local function getChat(chat_id)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end M.getChat = getChat
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end M.getMessage = getMessage
local function getMessages(chat_id, message_ids)
tdcli_function ({
ID = "GetMessages",
chat_id_ = chat_id,
message_ids_ = message_ids 
}, dl_cb, nil)
end M.getMessages = getMessages
local function getFile(file_id)
tdcli_function ({
ID = "GetFile",
file_id_ = file_id
}, dl_cb, nil)
end M.getFile = getFile
local function getFilePersistent(persistent_file_id)
tdcli_function ({
ID = "GetFilePersistent",
persistent_file_id_ = persistent_file_id
}, dl_cb, nil)
end M.getFilePersistent = getFilePersistent
local function getChats(offset_order, offset_chat_id, limit)
tdcli_function ({
ID = "GetChats",
offset_order_ = offset_order or 9223372036854775807,
offset_chat_id_ = offset_chat_id or 0,
limit_ = limit or 20
}, dl_cb, nil)
end M.getChats = getChats
local function searchPublicChat(username)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, dl_cb, nil)
end M.searchPublicChat = searchPublicChat
local function searchPublicChats(username_prefix)
tdcli_function ({
ID = "SearchPublicChats",
username_prefix_ = username_prefix
}, dl_cb, nil)
end M.searchPublicChats = searchPublicChats
local function searchChats(query, limit)
tdcli_function ({
ID = "SearchChats",
query_ = query,
limit_ = limit
}, dl_cb, nil)
end M.searchChats = searchChats
local function addRecentlyFoundChat(chat_id)
tdcli_function ({
ID = "AddRecentlyFoundChat",
chat_id_ = chat_id
}, dl_cb, nil)
end M.addRecentlyFoundChat = addRecentlyFoundChat
local function deleteRecentlyFoundChat(chat_id)
tdcli_function ({
ID = "DeleteRecentlyFoundChat",
chat_id_ = chat_id
}, dl_cb, nil)
end M.deleteRecentlyFoundChat = deleteRecentlyFoundChat
local function deleteRecentlyFoundChats()
tdcli_function ({
ID = "DeleteRecentlyFoundChats",
}, dl_cb, nil)
end M.deleteRecentlyFoundChats = deleteRecentlyFoundChats
local function getCommonChats(user_id, offset_chat_id, limit)
tdcli_function ({
ID = "GetCommonChats",
user_id_ = user_id,
offset_chat_id_ = offset_chat_id,
limit_ = limit
}, dl_cb, nil)
end M.getCommonChats = getCommonChats
local function getChatHistory(chat_id, from_message_id, offset, limit,cb)
tdcli_function ({
ID = "GetChatHistory",
chat_id_ = chat_id,
from_message_id_ = from_message_id,
offset_ = offset,
limit_ = limit
}, cb, nil)
end M.getChatHistory = getChatHistory
local function deleteChatHistory(chat_id, remove_from_chat_list)
tdcli_function ({
ID = "DeleteChatHistory",
chat_id_ = chat_id,
remove_from_chat_list_ = remove_from_chat_list
}, dl_cb, nil)
end M.deleteChatHistory = deleteChatHistory
local function searchChatMessages(chat_id, query, from_message_id, limit, filter,cb)
tdcli_function ({
ID = "SearchChatMessages",
chat_id_ = chat_id,
query_ = query,
from_message_id_ = from_message_id,
limit_ = limit,
filter_ = {
ID = 'SearchMessagesFilter' .. filter
},
},cb, nil)
end M.searchChatMessages = searchChatMessages
local function searchMessages(query, offset_date, offset_chat_id, offset_message_id, limit)
tdcli_function ({
ID = "SearchMessages",
query_ = query,
offset_date_ = offset_date,
offset_chat_id_ = offset_chat_id,
offset_message_id_ = offset_message_id,
limit_ = limit
}, dl_cb, nil)
end M.searchMessages = searchMessages
local function sendtaha(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode,msg)
local TextParseMode = getParseMode(parse_mode)
local entities = {}
if msg and text:match('<user>') and text:match('<user>') then
local x = string.len(text:match('(.*)<user>'))
local offset = x
local y = string.len(text:match('<user>(.*)</user>'))
local length = y
text = text:gsub('<user>','')
text = text:gsub('</user>','')
table.insert(entities,{ID="MessageEntityMentionName", offset_=0, length_=2, user_id_=234458457})
end
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = entities,
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end M.sendtaha = sendtaha
local function sendBotStartMessage(bot_user_id, chat_id, parameter)
tdcli_function ({
ID = "SendBotStartMessage",
bot_user_id_ = bot_user_id,
chat_id_ = chat_id,
parameter_ = parameter
}, dl_cb, nil)
end M.sendBotStartMessage = sendBotStartMessage
local function sendInlineQueryResultMessage(chat_id, reply_to_message_id, disable_notification, from_background, query_id, result_id)
tdcli_function ({
ID = "SendInlineQueryResultMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
query_id_ = query_id,
result_id_ = result_id
}, dl_cb, nil)
end M.sendInlineQueryResultMessage = sendInlineQueryResultMessage
local function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification)
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = message_ids, 
disable_notification_ = disable_notification,
from_background_ = 1
}, dl_cb, nil)
end M.forwardMessages = forwardMessages
local function deleteMessages(chat_id, message_ids)
tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chat_id,
message_ids_ = message_id  {[0] = id} or {id1, id2, id3, [0] = id}
}, dl_cb, nil)
end M.deleteMessages = deleteMessages
local function editMessageText(chat_id, message_id, reply_markup, text, disable_web_page_preview)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup, 
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {}
},
}, dl_cb, nil)
end M.editMessageText = editMessageText
local function editMessageCaption(chat_id, message_id, reply_markup, caption)
tdcli_function ({
ID = "EditMessageCaption",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup, 
caption_ = caption
}, dl_cb, nil)
end M.editMessageCaption = editMessageCaption
local function editMessageReplyMarkup(inline_message_id, reply_markup, caption)
tdcli_function ({
ID = "EditInlineMessageCaption",
inline_message_id_ = inline_message_id,
reply_markup_ = reply_markup, 
caption_ = caption
}, dl_cb, nil)
end M.editMessageReplyMarkup = editMessageReplyMarkup
local function editInlineMessageText(inline_message_id, reply_markup, text, disable_web_page_preview)
tdcli_function ({
ID = "EditInlineMessageText",
inline_message_id_ = inline_message_id,
reply_markup_ = reply_markup, 
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {}
},
}, dl_cb, nil)
end M.editInlineMessageText = editInlineMessageText
local function editInlineMessageCaption(inline_message_id, reply_markup, caption)
tdcli_function ({
ID = "EditInlineMessageCaption",
inline_message_id_ = inline_message_id,
reply_markup_ = reply_markup, 
caption_ = caption
}, dl_cb, nil)
end M.editInlineMessageCaption = editInlineMessageCaption
local function editInlineMessageReplyMarkup(inline_message_id, reply_markup)
tdcli_function ({
ID = "EditInlineMessageReplyMarkup",
inline_message_id_ = inline_message_id,
reply_markup_ = reply_markup 
}, dl_cb, nil)
end M.editInlineMessageReplyMarkup = editInlineMessageReplyMarkup
local function getInlineQueryResults(bot_user_id, chat_id, latitude, longitude, query, offset)
tdcli_function ({
ID = "GetInlineQueryResults",
bot_user_id_ = bot_user_id,
chat_id_ = chat_id,
user_location_ = {
ID = "Location",
latitude_ = latitude,
longitude_ = longitude
},
query_ = query,
offset_ = offset
}, dl_cb, nil)
end M.getInlineQueryResults = getInlineQueryResults
local function answerInlineQuery(inline_query_id, is_personal, cache_time, next_offset, switch_pm_text, switch_pm_parameter)
tdcli_function ({
ID = "AnswerInlineQuery",
inline_query_id_ = inline_query_id,
is_personal_ = is_personal,
results_ = results, 
cache_time_ = cache_time,
next_offset_ = next_offset,
switch_pm_text_ = switch_pm_text,
switch_pm_parameter_ = switch_pm_parameter
}, dl_cb, nil)
end M.answerInlineQuery = answerInlineQuery
local function getCallbackQueryAnswer(chat_id, message_id, text, show_alert, url)
tdcli_function ({
ID = "GetCallbackQueryAnswer",
chat_id_ = chat_id,
message_id_ = message_id,
payload_ = {
ID = "CallbackQueryAnswer",
text_ = text,
show_alert_ = show_alert,
url_ = url
},
}, dl_cb, nil)
end M.getCallbackQueryAnswer = getCallbackQueryAnswer
local function answerCallbackQuery(callback_query_id, text, show_alert, url, cache_time)
tdcli_function ({
ID = "AnswerCallbackQuery",
callback_query_id_ = callback_query_id,
text_ = text,
show_alert_ = show_alert,
url_ = url,
cache_time_ = cache_time
}, dl_cb, nil)
end M.answerCallbackQuery = answerCallbackQuery
local function setGameScore(chat_id, message_id, edit_message, user_id, score, force)
tdcli_function ({
ID = "SetGameScore",
chat_id_ = chat_id,
message_id_ = message_id,
edit_message_ = edit_message,
user_id_ = user_id,
score_ = score,
force_ = force
}, dl_cb, nil)
end M.setGameScore = setGameScore
local function setInlineGameScore(inline_message_id, edit_message, user_id, score, force)
tdcli_function ({
ID = "SetInlineGameScore",
inline_message_id_ = inline_message_id,
edit_message_ = edit_message,
user_id_ = user_id,
score_ = score,
force_ = force
}, dl_cb, nil)
end M.setInlineGameScore = setInlineGameScore
local function getGameHighScores(chat_id, message_id, user_id)
tdcli_function ({
ID = "GetGameHighScores",
chat_id_ = chat_id,
message_id_ = message_id,
user_id_ = user_id
}, dl_cb, nil)
end M.getGameHighScores = getGameHighScores
local function getInlineGameHighScores(inline_message_id, user_id)
tdcli_function ({
ID = "GetInlineGameHighScores",
inline_message_id_ = inline_message_id,
user_id_ = user_id
}, dl_cb, nil)
end M.getInlineGameHighScores = getInlineGameHighScores
local function deleteChatReplyMarkup(chat_id, message_id)
tdcli_function ({
ID = "DeleteChatReplyMarkup",
chat_id_ = chat_id,
message_id_ = message_id
}, dl_cb, nil)
end M.deleteChatReplyMarkup = deleteChatReplyMarkup
local function sendChatAction(chat_id, action, progress)
tdcli_function ({
ID = "SendChatAction",
chat_id_ = chat_id,
action_ = {
ID = "SendMessage" .. action .. "Action",
progress_ = progress or nil
}
}, dl_cb, nil)
end M.sendChatAction = sendChatAction
local function openChat(chat_id)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, dl_cb, nil)
end M.openChat = openChat
local function closeChat(chat_id)
tdcli_function ({
ID = "CloseChat",
chat_id_ = chat_id
}, dl_cb, nil)
end M.closeChat = closeChat
local function viewMessages(chat_id, message_ids)
tdcli_function ({
ID = "ViewMessages",
chat_id_ = chat_id,
message_ids_ = message_ids 
}, dl_cb, nil)
end M.viewMessages = viewMessages
local function openMessageContent(chat_id, message_id,cb)
tdcli_function ({
ID = "OpenMessageContent",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end M.openMessageContent = openMessageContent
local function createPrivateChat(user_id)
tdcli_function ({
ID = "CreatePrivateChat",
user_id_ = user_id
}, dl_cb, nil)
end M.createPrivateChat = createPrivateChat
local function createGroupChat(group_id)
tdcli_function ({
ID = "CreateGroupChat",
group_id_ = getChatId(group_id).ID
}, dl_cb, nil)
end M.createGroupChat = createGroupChat
local function createChannelChat(channel_id)
tdcli_function ({
ID = "CreateChannelChat",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end M.createChannelChat = createChannelChat
local function createSecretChat(secret_chat_id)
tdcli_function ({
ID = "CreateSecretChat",
secret_chat_id_ = secret_chat_id
}, dl_cb, nil)
end M.createSecretChat = createSecretChat
local function createNewGroupChat(user_ids, title)
tdcli_function ({
ID = "CreateNewGroupChat",
user_ids_ = user_ids, 
title_ = title
}, dl_cb, nil)
end M.createNewGroupChat = createNewGroupChat
local function createNewChannelChat(title, is_supergroup, about)
tdcli_function ({
ID = "CreateNewChannelChat",
title_ = title,
is_supergroup_ = is_supergroup,
about_ = about
}, dl_cb, nil)
end M.createNewChannelChat = createNewChannelChat
local function createNewSecretChat(user_id)
tdcli_function ({
ID = "CreateNewSecretChat",
user_id_ = user_id
}, dl_cb, nil)
end M.createNewSecretChat = createNewSecretChat
local function migrateGroupChatToChannelChat(chat_id)
tdcli_function ({
ID = "MigrateGroupChatToChannelChat",
chat_id_ = chat_id
}, dl_cb, nil)
end M.migrateGroupChatToChannelChat = migrateGroupChatToChannelChat
local function changeChatTitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end M.changeChatTitle = changeChatTitle
local function changeChatPhoto(chat_id, file)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = {
ID = "InputFileLocal",
path_ = file
}
}, dl_cb, nil)
end M.changeChatPhoto = changeChatPhoto
local function changeChatDraftMessage(chat_id, reply_to_message_id, text, disable_web_page_preview, clear_draft, parse_mode)
local TextParseMode = getParseMode(parse_mode)tdcli_function ({
ID = "ChangeChatDraftMessage",
chat_id_ = chat_id,
draft_message_ = {
ID = "DraftMessage",
reply_to_message_id_ = reply_to_message_id,
input_message_text_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = clear_draft,
entities_ = {},
parse_mode_ = TextParseMode,
},
},
}, dl_cb, nil)
end M.changeChatDraftMessage = changeChatDraftMessage
local function addChatMember(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit
}, dl_cb, nil)
end M.addChatMember = addChatMember
local function addChatMembers(chat_id, user_ids)
tdcli_function ({
ID = "AddChatMembers",
chat_id_ = chat_id,
user_ids_ = user_ids 
}, dl_cb, nil)
end M.addChatMembers = addChatMembers
local function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end M.changeChatMemberStatus = changeChatMemberStatus
local function getChatMember(chat_id, user_id)
tdcli_function ({
ID = "GetChatMember",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end M.getChatMember = getChatMember
local function downloadFile(file_id)
tdcli_function ({
ID = "DownloadFile",
file_id_ = file_id
}, dl_cb, nil)
end M.downloadFile = downloadFile
local function cancelDownloadFile(file_id)
tdcli_function ({
ID = "CancelDownloadFile",
file_id_ = file_id
}, dl_cb, nil)
end M.cancelDownloadFile = cancelDownloadFile
local function exportChatInviteLink(chat_id)
tdcli_function ({
ID = "ExportChatInviteLink",
chat_id_ = chat_id
}, dl_cb, nil)
end M.exportChatInviteLink = exportChatInviteLink
local function checkChatInviteLink(link,cb)
tdcli_function ({
ID = "CheckChatInviteLink",
invite_link_ = link
}, cb, nil)
end M.checkChatInviteLink = checkChatInviteLink
local function importChatInviteLink(invite_link)
tdcli_function ({
ID = "ImportChatInviteLink",
invite_link_ = invite_link
}, dl_cb, nil)
end M.importChatInviteLink = importChatInviteLink
local function blockUser(user_id)
tdcli_function ({
ID = "BlockUser",
user_id_ = user_id
}, dl_cb, nil)
end M.blockUser = blockUser
local function unblockUser(user_id)
tdcli_function ({
ID = "UnblockUser",
user_id_ = user_id
}, dl_cb, nil)
end M.unblockUser = unblockUser
local function getBlockedUsers(offset, limit,cb)
tdcli_function ({
ID = "GetBlockedUsers",
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end M.getBlockedUsers = getBlockedUsers
local function importContacts(phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "ImportContacts",
contacts_ = {[0] = {
phone_number_ = tostring(phone_number), 
first_name_ = tostring(first_name), 
last_name_ = tostring(last_name), 
user_id_ = user_id
},
},
}, dl_cb, nil)
end M.importContacts = importContacts
local function searchContacts(query, limit)
tdcli_function ({
ID = "SearchContacts",
query_ = query,
limit_ = limit
}, dl_cb, nil)
end M.searchContacts = searchContacts
local function deleteContacts(user_ids)
tdcli_function ({
ID = "DeleteContacts",
user_ids_ = user_ids 
}, dl_cb, nil)
end M.deleteContacts = deleteContacts
local function getUserProfilePhotos(user_id, offset, limit,cb)
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = user_id,
offset_ = offset,
limit_ = limit
}, cb, nil)
end M.getUserProfilePhotos = getUserProfilePhotos
local function getStickers(emoji,cb)
tdcli_function ({
ID = "GetStickers",
emoji_ = emoji
}, cb, nil)
end M.getStickers = getStickers
local function getStickerSets(only_enabled)
tdcli_function ({
ID = "GetStickerSets",
only_enabled_ = only_enabled
}, dl_cb, nil)
end M.getStickerSets = getStickerSets
local function getStickerSet(set_id)
tdcli_function ({
ID = "GetStickerSet",
set_id_ = set_id
}, dl_cb, nil)
end M.getStickerSet = getStickerSet
local function searchStickerSet(name)
tdcli_function ({
ID = "SearchStickerSet",
name_ = name
}, dl_cb, nil)
end M.searchStickerSet = searchStickerSet
local function updateStickerSet(set_id, is_installed, is_enabled)
tdcli_function ({
ID = "UpdateStickerSet",
set_id_ = set_id,
is_installed_ = is_installed,
is_enabled_ = is_enabled
}, dl_cb, nil)
end M.updateStickerSet = updateStickerSet
local function getSavedAnimations()
tdcli_function ({
ID = "GetSavedAnimations",
}, dl_cb, nil)
end M.getSavedAnimations = getSavedAnimations
local function addSavedAnimation(id)
tdcli_function ({
ID = "AddSavedAnimation",
animation_ = {
ID = "InputFileId",
id_ = id
},
}, dl_cb, nil)
end M.addSavedAnimation = addSavedAnimation
local function deleteSavedAnimation(id)
tdcli_function ({
ID = "DeleteSavedAnimation",
animation_ = {
ID = "InputFileId",
id_ = id
},
}, dl_cb, nil)
end M.deleteSavedAnimation = deleteSavedAnimation
local function getRecentInlineBots()
tdcli_function ({
ID = "GetRecentInlineBots",
}, dl_cb, nil)
end M.getRecentInlineBots = getRecentInlineBots
local function getWebPagePreview(message_text)
tdcli_function ({
ID = "GetWebPagePreview",
message_text_ = message_text
}, dl_cb, nil)
end M.getWebPagePreview = getWebPagePreview
local function getNotificationSettings(scope, chat_id)
tdcli_function ({
ID = "GetNotificationSettings",
scope_ = {
ID = 'NotificationSettingsFor' .. scope,
chat_id_ = chat_id or nil
},
}, dl_cb, nil)
end M.getNotificationSettings = getNotificationSettings
local function setNotificationSettings(scope, chat_id, mute_for, show_preview)
tdcli_function ({
ID = "SetNotificationSettings",
scope_ = {
ID = 'NotificationSettingsFor' .. scope,
chat_id_ = chat_id or nil
},
notification_settings_ = {
ID = "NotificationSettings",
mute_for_ = mute_for,
sound_ = "default",
show_preview_ = show_preview
}
}, dl_cb, nil)
end M.setNotificationSettings = setNotificationSettings
local function setProfilePhoto(photo_path)
tdcli_function ({
ID = "SetProfilePhoto",
photo_path_ = photo_path
}, dl_cb, nil)
end M.setProfilePhoto = setProfilePhoto
local function deleteProfilePhoto(profile_photo_id)
tdcli_function ({
ID = "DeleteProfilePhoto",
profile_photo_id_ = profile_photo_id
}, dl_cb, nil)
end M.deleteProfilePhoto = deleteProfilePhoto
local function changeName(first_name, last_name)
tdcli_function ({
ID = "ChangeName",
first_name_ = first_name,
last_name_ = last_name
}, dl_cb, nil)
end M.changeName = changeName
local function changeAbout(about)
tdcli_function ({
ID = "ChangeAbout",
about_ = about
}, dl_cb, nil)
end M.changeAbout = changeAbout
local function changeUsername(username)
tdcli_function ({
ID = "ChangeUsername",
username_ = username
}, dl_cb, nil)
end M.changeUsername = changeUsername
local function changePhoneNumber(phone_number, allow_flash_call, is_current_phone_number)
tdcli_function ({
ID = "ChangePhoneNumber",
phone_number_ = phone_number,
allow_flash_call_ = allow_flash_call,
is_current_phone_number_ = is_current_phone_number
}, dl_cb, nil)
end M.changePhoneNumber = changePhoneNumber
local function resendChangePhoneNumberCode()
tdcli_function ({
ID = "ResendChangePhoneNumberCode",
}, dl_cb, nil)
end M.resendChangePhoneNumberCode = resendChangePhoneNumberCode
local function checkChangePhoneNumberCode(code)
tdcli_function ({
ID = "CheckChangePhoneNumberCode",
code_ = code
}, dl_cb, nil)
end M.checkChangePhoneNumberCode = checkChangePhoneNumberCode
local function getActiveSessions()
tdcli_function ({
ID = "GetActiveSessions",
}, dl_cb, nil)
end M.getActiveSessions = getActiveSessions
local function terminateSession(session_id)
tdcli_function ({
ID = "TerminateSession",
session_id_ = session_id
}, dl_cb, nil)
end M.terminateSession = terminateSession
local function terminateAllOtherSessions()
tdcli_function ({
ID = "TerminateAllOtherSessions",
}, dl_cb, nil)
end M.terminateAllOtherSessions = terminateAllOtherSessions
local function toggleGroupEditors(group_id, anyone_can_edit)
tdcli_function ({
ID = "ToggleGroupEditors",
group_id_ = getChatId(group_id).ID,
anyone_can_edit_ = anyone_can_edit
}, dl_cb, nil)
end M.toggleGroupEditors = toggleGroupEditors
local function changeChannelUsername(channel_id, username)
tdcli_function ({
ID = "ChangeChannelUsername",
channel_id_ = getChatId(channel_id).ID,
username_ = username
}, dl_cb, nil)
end M.changeChannelUsername = changeChannelUsername
local function toggleChannelInvites(channel_id, anyone_can_invite)
tdcli_function ({
ID = "ToggleChannelInvites",
channel_id_ = getChatId(channel_id).ID,
anyone_can_invite_ = anyone_can_invite
}, dl_cb, nil)
end M.toggleChannelInvites = toggleChannelInvites
local function toggleChannelSignMessages(channel_id, sign_messages)
tdcli_function ({
ID = "ToggleChannelSignMessages",
channel_id_ = getChatId(channel_id).ID,
sign_messages_ = sign_messages
}, dl_cb, nil)
end M.toggleChannelSignMessages = toggleChannelSignMessages 
local function changeChannelAbout(channel_id, about)
tdcli_function ({
ID = "ChangeChannelAbout",
channel_id_ = getChatId(channel_id).ID,
about_ = about
}, dl_cb, nil)
end M.changeChannelAbout = changeChannelAbout
local function pinChannelMessage(channel_id, message_id,disable_notification)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification,
}, dl_cb, nil)
end M.pinChannelMessage = pinChannelMessage
local function unpinChannelMessage(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end M.unpinChannelMessage = unpinChannelMessage
local function reportChannelSpam(channel_id, user_id, message_ids)
tdcli_function ({
ID = "ReportChannelSpam",
channel_id_ = getChatId(channel_id).ID, 
user_id_ = user_id, 
message_ids_ = message_ids 
}, dl_cb, nil)
end M.reportChannelSpam = reportChannelSpam
local function getChannelMembers(channel_id, offset, filter, limit,cb)
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, cb, nil)
end M.getChannelMembers = getChannelMembers
local function deleteChannel(channel_id)
tdcli_function ({
ID = "DeleteChannel",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end M.deleteChannel = deleteChannel
local function getSupportUser(cb)
tdcli_function ({
ID = "GetSupportUser",
}, cb, nil)
end M.getSupportUser = getSupportUser
local function setPrivacy(key, rules, user_ids)
if user_ids and rules:match('Allow') then
rule = 'AllowUsers'
elseif user_ids and rules:match('Disallow') then
rule = 'DisallowUsers'
endtdcli_function ({
ID = "SetPrivacy",
key_ = {
ID = 'PrivacyKey' .. key,
},
rules_ = {
ID = 'PrivacyRules',
rules_ = {
[0] = {
ID = 'PrivacyRule' .. rules,
}, {
ID = 'PrivacyRule' .. rule,
user_ids_ = user_ids
}, }, }, }, dl_cb, nil)
end M.setPrivacy = setPrivacy
local function getPrivacy(key)
tdcli_function ({
ID = "GetPrivacy",
key_ = {
ID = "PrivacyKey" .. key
},
}, dl_cb, nil)
end M.getPrivacy = getPrivacy
local function getOption(name)
tdcli_function ({
ID = "GetOption",
name_ = name
}, dl_cb, nil)
end M.getOption = getOption
local function setOption(name, option, value)
tdcli_function ({
ID = "SetOption",
name_ = name,
value_ = {
ID = 'Option' .. option,
value_ = value
},
}, dl_cb, nil)
end M.setOption = setOption 
local function changeAccountTtl(days)
tdcli_function ({
ID = "ChangeAccountTtl",
ttl_ = {
ID = "AccountTtl",
days_ = days
},
}, dl_cb, nil)
end M.changeAccountTtl = changeAccountTtl 
local function getAccountTtl()
tdcli_function ({
ID = "GetAccountTtl",
}, dl_cb, nil)
end M.getAccountTtl = getAccountTtl 
local function deleteAccount(reason)
tdcli_function ({
ID = "DeleteAccount",
reason_ = reason
}, dl_cb, nil)
end M.deleteAccount = deleteAccount 
local function getChatReportSpamState(chat_id)
tdcli_function ({
ID = "GetChatReportSpamState",
chat_id_ = chat_id
}, dl_cb, nil)
end M.getChatReportSpamState = getChatReportSpamState
local function changeChatReportSpamState(chat_id, is_spam_chat)
tdcli_function ({
ID = "ChangeChatReportSpamState",
chat_id_ = chat_id,
is_spam_chat_ = is_spam_chat
}, dl_cb, nil)
end M.changeChatReportSpamState = changeChatReportSpamState
local function setBotUpdatesStatus(pending_update_count, error_message)
tdcli_function ({
ID = "SetBotUpdatesStatus",
pending_update_count_ = pending_update_count,
error_message_ = error_message
}, dl_cb, nil)
end M.setBotUpdatesStatus = setBotUpdatesStatus
local function setAlarm(seconds)
tdcli_function ({
ID = "SetAlarm",
seconds_ = seconds
}, dl_cb, nil)
end M.setAlarm = setAlarm
local function add_contact(phone, first_name, last_name, user_id)
storm.importContacts(phone, first_name, last_name, user_id)
end M.add_contact = add_contact
local function channel_get_admins(channel,cb)
local function callback_admins(extra,result,success)
limit = result.administrator_count_
if tonumber(limit) > 0 then
storm.getChannelMembers(channel, 0, 'Administrators', limit,cb)
 else return storm.sendMessage(channel, 0, 1,'', 1, 'html') end
end
storm.getChannelFull(channel,callback_admins)
end M.channel_get_admins = channel_get_admins
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
storm.getChannelMembers(channel, 0, 'Bots', limit,cb)
end
storm.getChannelFull(channel,callback_admins)
end M.channel_get_bots = channel_get_bots
local function channel_get_kicked(channel,cb)
local function callback_admins(extra,result,success)
limit = result.kicked_count_
storm.getChannelMembers(channel, 0, 'Kicked', limit,cb)
end
storm.getChannelFull(channel,callback_admins)
end M.channel_get_kicked = channel_get_kicked

local function chat_change_role(chat_id, user_id, role)
storm.changeChatMemberStatus(chat_id, user_id, role)
end M.chat_change_role = chat_change_role
local function chat_del_user(chat_id, user_id)
storm.changeChatMemberStatus(chat_id, user_id, 'Editor')
end M.chat_del_user = chat_del_user
local function chat_info(chat_id)
storm.getChat(chat_id)
end M.chat_info = chat_info
local function chat_join(chat_id)
storm.importChatInviteLink(chat_id)
end M.chat_join = chat_join
local function chat_leave(chat_id, user_id)
storm.changeChatMemberStatus(chat_id, user_id, "Left")
end M.chat_leave = chat_leave
local function chat_create_broadcast(title, about)
storm.createNewChannelChat(title, 0, about)
end M.chat_create_broadcast = chat_create_broadcast
local function chat_create_group(title, user_ids)
storm.createNewGroupChat(title, user_ids)
end M.chat_create_group = chat_create_group
local function chat_create_supergroup(title, about)
storm.createNewChannelChat(title, 1, about)
end M.chat_create_supergroup = chat_create_supergroup
local function contact_list(limit)
storm.searchContacts("", limit)
end M.contact_list = contact_list
local function dialog_list(limit)
storm.searchChats("", limit)
end M.dialog_list = dialog_list
local function group_upgrade(chat_id)
storm.migrateGroupChatToChannelChat(chat_id)
end M.group_upgrade = group_upgrade
local function mark_read(chat_id, message_ids)
storm.viewMessages(chat_id, message_ids)
end M.mark_read = mark_read
local function mute(chat_id, mute_for)
storm.setNotificationSettings(chat_id, mute_for or 60, 0)
end M.mute = mute
local function push_button(message, button_id)
end M.push_button = push_button
local function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end M.resolve_username = resolve_username
local function reply_file(chat_id, msg_id, type, file, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = msg_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, dl_cb, nil)
end M.reply_file = reply_file
local function reply_fwd(msg_id, fwd_id)
end M.reply_fwd = reply_fwd
local function reply_location(chat_id, msg_id, latitude, longitude)
tdcli_function ({
ID="SendMessage",
chat_id_=chat_id,
reply_to_message_id_=msg_id,
disable_notification_=0,
from_background_=1,
reply_markup_=nil,
input_message_content_={
ID="InputMessageLocation",
location_={
ID = "Location",
latitude_ = latitude,
longitude_ = longitude
},
},
}, dl_cb, nil)
end M.reply_location = reply_location
local function send_file(chat_id, type, file, caption,cb)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = 0,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, cb, nil)
end M.send_file = send_file
local function send_location(chat_id, latitude, longitude)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = 0,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageLocation",
location_ = {
ID = "Location",
latitude_ = latitude,
longitude_ = longitude
},
},
}, dl_cb, nil)
end M.send_location = send_location
local function start_bot(user_id, chat_id, data)
storm.sendBotStartMessage(user_id, chat_id, 'start')
end
M.start_bot = start_bot
local function timer(timeout)
storm.setAlarm(timeout)
end
M.timer = timer
local function unmute(chat_id)
storm.setNotificationSettings(chat_id, 0, 1)
end
M.unmute = unmute
end
return M
