--[[

--]]
local function GET_TEXT(msg)
if chat_type == 'super' then 
if text then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_}, function(arg,data) 
if IRAQBOT:get(IRAQ_ID.."chencher"..msg.sender_user_id_) then 
if IRAQBOT:get(IRAQ_ID.."chencher"..msg.sender_user_id_) ~= data.first_name_ then 
tahan = '['..(IRAQBOT:get(IRAQ_ID.."chencher"..msg.sender_user_id_) or '')..']'
taham = '['..data.first_name_..']'
local taha ={ 
'\n شكو غيرت اسمك  يا حلو 😹🌚',
'\n شهل اسم الفيطي '..taham.. ' \n رجعه ؏ قديم \n '..tahan..'',
'\n  ها ها شو غيرت اسمك 🤔😹',
'\n شكو غيرت اسمك شنو قطيت وحده جديده 😹😹🌚',
'\n شو غيرت اسمك شنو تعاركت ويه الحب ؟😹🌞',
'\n ها ولك مو جان  اسمك   '..tahan..'  شكو غيرته ',
'\n شكو غيرت اسمك شسالفه ؟؟ 🤔🌞'
}
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,taha[math.random(#taha)], 1, 'html')
end  
end
IRAQBOT:set(IRAQ_ID.."chencher"..msg.sender_user_id_, data.first_name_) 
end,nil) 
end
if text == (IRAQBOT:get(IRAQ_ID..':Set_Hzorh:'..msg.chat_id_) or '&57788') then -- // حزوره
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:del(IRAQ_ID..':Set_Hzorh:'..msg.chat_id_)
t = '*  🎁  احسنت اجابتك صحيحه   \n*   \n'
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end

if text == (IRAQBOT:get(IRAQ_ID..':Set_Amthlh:'..msg.chat_id_) or '*678988') then -- // امثله
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:del(IRAQ_ID..':Set_Amthlh:'..msg.chat_id_)
t = '*  🎁  احسنت اجابتك صحيحه   \n*   \n'
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end

if text == (IRAQBOT:get(IRAQ_ID..':Set_alii:'..msg.chat_id_) or '*67888') then -- // المختلف
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:del(IRAQ_ID..':Set_alii:'..msg.chat_id_)
t= '*  🎁  احسنت اجابتك صحيحه   \n*   \n'
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end 

if (text == (IRAQBOT:get(IRAQ_ID.."GAME:CHER"..msg.chat_id_) or '&6-88')) then  
t = '📮¦ اجابتك صحيحه ذكي وربي 😙'
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:del(IRAQ_ID.."GAME:S"..msg.chat_id_)
IRAQBOT:del(IRAQ_ID.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'الفيل' or msg.text == 'الثور' or msg.text == 'الحصان' or msg.text == '7' or msg.text == '9' or msg.text == '8' or msg.text == 'لوين' or msg.text == 'موسكو' or msg.text == 'مانكو' or msg.text == '20' or msg.text == '30' or msg.text == '28' or msg.text == 'ترامب' or msg.text == 'اوباما' or msg.text == 'كيم جونغ' or msg.text == '50' or msg.text == '70' or msg.text == '40' or msg.text == '7' or msg.text == '3' or msg.text == '10' or msg.text == '4' or msg.text == 'الاذن' or msg.text == 'الثلاجه' or msg.text == 'الغرفه' or msg.text == '15' or msg.text == '17' or msg.text == '25' or msg.text == 'الفرات' or msg.text == 'نهر الكونغو' or msg.text == 'المسيبي' or msg.text == 'بيا بايج' or msg.text == 'لاري بيج' or msg.text == 'بيا مارك زوكيربرج' or msg.text == 'الفيل' or msg.text == 'النمر' or msg.text == 'الفهد' or msg.text == 'بانكول' or msg.text == 'نيو دلهي' or msg.text == 'بيكن' or msg.text == 'الهاتف' or msg.text == 'التلفاز' or msg.text == 'المذياع' or msg.text == 'لفرسول' or msg.text == 'تركيا' or msg.text == 'بغداد' or msg.text == 'النحاس' or msg.text == 'الحديد' or msg.text == 'الفضه' or msg.text == 'امريكا الشماليه' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'القرش' or msg.text == 'الثعلب' or msg.text == 'الكلب' or msg.text == 'للجرو' or msg.text == 'العجل' or msg.text == 'الحمار' or msg.text == '3' or msg.text == '5' or msg.text == '6' or msg.text == 'اوربا' or msg.text == 'افريقيا' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'امريكا الشماليه' or msg.text == 'اوربا' or msg.text == 'الصاروخ' or msg.text == 'المسدس' or msg.text == 'الطائرات' or msg.text == 'سيدات' or msg.text == 'قوانص' or msg.text == 'عوانس' or msg.text == 'المكارم' or msg.text == 'المبائم' or msg.text == 'المعازم' or msg.text == 'حرف الغاء' or msg.text == 'حرف الواو' or msg.text == 'حرف النون' or msg.text == 'نحاس' or msg.text == 'الماس' or msg.text == 'حديد' or msg.text == 'العمر' or msg.text == 'ساعه' or msg.text == 'الحذاء' or msg.text == 'بئر' or msg.text == 'نهر' or msg.text == 'شلال' or msg.text == 'ادم' or msg.text == 'نوح' or msg.text == 'عيسئ' or msg.text == 'الاضافر' or msg.text == 'الاسنان' or msg.text == 'الدموع' or msg.text == 'الاخلاق' or msg.text == 'الضل' or msg.text == 'حرف النون'  then
if IRAQBOT:get(IRAQ_ID.."GAME:S"..msg.chat_id_) then  
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if msg.text ~= v then
t = '📮¦ اجابتك غلطططط '    
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
IRAQBOT:del(IRAQ_ID.."GAME:S"..msg.chat_id_)
IRAQBOT:del(IRAQ_ID.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end

if text == ''..(IRAQBOT:get(IRAQ_ID..'SMALE:GAME'..msg.chat_id_) or '')..'' and not IRAQBOT:get(IRAQ_ID..'SMALE:GAMES'..msg.chat_id_) then
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:set(IRAQ_ID..'SMALE:GAMES'..msg.chat_id_,true)
NUMPGAME = (IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_))
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*🎊¦ مبروك فزت 🍂\n🎁¦ اصبح عدد نقودك » { '..NUMPGAME..' }\n🎭¦* للعب مره اخرى ارسل `الاسرع` \n', 1, 'md')
end 

if text == ''..(IRAQBOT:get(IRAQ_ID..'CHEK:CHER'..msg.chat_id_) or '')..'' and not IRAQBOT:get(IRAQ_ID..'RTEP:CHER'..msg.chat_id_) then
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:set(IRAQ_ID..'RTEP:CHER'..msg.chat_id_,true)
NUMPGAME = (IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_))
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*🎊¦ مبروك فزت 🍂\n🎁¦ اصبح عدد نقودك » { '..NUMPGAME..' }\n🎭¦* للعب مره اخرى ارسل `معاني` \n', 1, 'md')
end 

if text == ''..(IRAQBOT:get(IRAQ_ID..'klmo'..msg.chat_id_) or 'لفاتع')..'' and not IRAQBOT:get(IRAQ_ID..'CHER:GAME'..msg.chat_id_) then
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_, 1)  
IRAQBOT:set(IRAQ_ID..'CHER:GAME'..msg.chat_id_,true)
NUMPGAME = (IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*🎊¦ مبروك فزت 🍂\n🎁¦ اصبح عدد نقودك » { '..NUMPGAME..' }\n🎭¦* للعب مره اخرى ارسل `ترتيب` \n', 1, 'md')
end 

if IRAQBOT:get(IRAQ_ID.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^(%d+)$") then
if tonumber(text:match("^(%d+)$")) > 50000 then
taha = "*📬¦ لا تستطيع اضافة اكثر من 50000 رساله\n*" 
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
IRAQBOT:del(IRAQ_ID.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = IRAQBOT:get(IRAQ_ID..'SET:ID:USER'..msg.chat_id_)  
taha = "\n📬*¦ روح خالي 😉 تم اضافة له { "..text:match("^(%d+)$").." }* رساله"
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
IRAQBOT:incrby(IRAQ_ID..'user:messages:'..msg.chat_id_..':'..GET_IDUSER,text:match("^(%d+)$"))  

end
IRAQBOT:del(IRAQ_ID.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end

if IRAQBOT:get(IRAQ_ID.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^(%d+)$") then
if tonumber(text:match("^(%d+)$")) > 50000 then
taha = "*📬¦ لا تستطيع اضافة اكثر من 1000 نقطه\n*"
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
IRAQBOT:del(IRAQ_ID.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = IRAQBOT:get(IRAQ_ID..'SET:ID:USER:NUM'..msg.chat_id_)  
taha = "\n📬*¦ طكو طكو عمي 😻 تم اضافة له { "..text:match("^(%d+)$").." }* نقطه"
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,taha, 1, 'md') 
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..GET_IDUSER, text:match("^(%d+)$"))  
end
IRAQBOT:del(IRAQ_ID.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
end


if IRAQBOT:get(IRAQ_ID.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,"*📬¦ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*\n", 1, "md")    
return false  end 
local GETNUM = IRAQBOT:get(IRAQ_ID.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
IRAQBOT:del(IRAQ_ID.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,'*📮¦ مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n🎊¦ لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل *', 1, "md")    
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
IRAQBOT:del(IRAQ_ID.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,'\n*📮¦ للاسف لقد خسرت \n📬¦ المحيبس بل ايد رقم { '..GETNUM..' }\n💥¦ حاول مره اخرى للعثور على المحيبس *', 1, "md")    
end
end
end
if IRAQBOT:get(IRAQ_ID.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,"*📬¦ عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *\n", 1, "md")    
return false  end 
local GETNUM = IRAQBOT:get(IRAQ_ID.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
IRAQBOT:del(IRAQ_ID..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
IRAQBOT:del(IRAQ_ID.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
IRAQBOT:incrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,5)  
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,'*🔖¦ مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸¦ تم اضافة { 5 } من النقاط *\n', 1, "md")    
elseif tonumber(NUM) ~= tonumber(GETNUM) then
IRAQBOT:incrby(IRAQ_ID..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(IRAQBOT:get(IRAQ_ID..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
IRAQBOT:del(IRAQ_ID..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
IRAQBOT:del(IRAQ_ID.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,'\n*📮¦ اوبس لقد خسرت في اللعبه \n📬¦ حظآ اوفر في المره القادمه \n🔰¦ كان الرقم الذي تم تخمينه { '..GETNUM..' }\n*', 1, "md")    
else
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1,'\n*📛¦ اوبس تخمينك غلط \n📌¦ ارسل رقم تخمنه مره اخره \n*', 1, "md")    
end
end
end
end
------
end
end

local function GAMES(msg, MSG_TEXT)
if chat_type == 'super' then 
if not IRAQBOT:get(IRAQ_ID.."LOCK:GAMES"..msg.chat_id_) then 
if MSG_TEXT[1] == 'محيبس' or MSG_TEXT[1] == 'بات' then   
Num = math.random(1,6)
IRAQBOT:set(IRAQ_ID.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊


📮¦ اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
🎁¦ الفائز يحصل على { 3 } من النقاط *
]]
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
IRAQBOT:setex(IRAQ_ID.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end

if MSG_TEXT[1] == 'خمن' or MSG_TEXT[1] == 'تخمين' then   
Num = math.random(1,20)
IRAQBOT:set(IRAQ_ID.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n📮¦ اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'⚠¦ ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'🔖¦ سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ \n🎊¦ الفائز سيحصل على { 5 } من النقود \n💥*'
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
IRAQBOT:setex(IRAQ_ID.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if MSG_TEXT[1] == 'اسئله' or MSG_TEXT[1] == 'ختيارات' or MSG_TEXT[1] == 'بدء الاسئله' then   
IRAQBOT:set(IRAQ_ID.."GAME:S"..msg.chat_id_,true) 
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو


 📮¦ ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه?
1- 15
2- 13
3- 14 

 📮¦ ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون?

1- الفم 
2- الاذن
3- الثلاجه


 📮¦ ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب?

1- 7
2- 15
3- 11


 📮¦ ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم?

1- 60
2- 70
3- 30 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم??

1- ترامب
2- اوباما
3- بوتين  


 📮¦ ارسل الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- مارك زوكيربرج


 📮¦ ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا?

1- باريس 
2- لوين 
3- موسكو 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

 📮¦ ارسل  الجواب الصحيح فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه ?
1-الفيل
2- النمل  
3- الثور


 📮¦ ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  


 📮¦ ارسل  الجواب الصحيح فقطز
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر


 📮¦ ارسل الجواب الصحيح فقط
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر


 📮¦ ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الحذاء


 📮¦ ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب


 📮¦ ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء


 📮¦ ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي?
1- العزائم 
2- المكارم
3- المبائب


 📮¦ ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمه انسه ?
1- سيدات
2- انسات 
3- قوانص


 📮¦ ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب?
1- الصاروخ
2- المسدس
3- المنجنيق 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره?
1- افريقيا 
2- اسيا  
3- امركيا الشماليه


 📮¦ ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه?
1-الفيل
2- الاسد 
3- النمر


 📮¦ ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفرا للمليون ?
1- 4 
2- 3
3-6

 📮¦ ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان?
1- مهر  
2- جرو
3- عجل


 📮¦ ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه?

1- القرش
2- الدلفين 
3- الثعلب


 📮¦ ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز?

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق  


 📮¦ ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا?
1- لندن  
2- لفرسول
3- تركيا


 📮¦ ارسل  الجواب الصحيح فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ?
1- بانكول
2- نيو دلهي
3- طوكيو 


 📮¦ ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ?

1- حفضه
2- زينب 
3- خديجه 


 📮¦ ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'النيل') 
elseif SENDTEXT:find('14') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'14') 
elseif SENDTEXT:find('الفم') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الفم') 
elseif SENDTEXT:find('11') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'11') 
elseif SENDTEXT:find('30') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'30') 
elseif SENDTEXT:find('بوتين') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'باريس') 
elseif SENDTEXT:find('10') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'10') 
elseif SENDTEXT:find('النمل') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'سحاب') 
elseif SENDTEXT:find('الاسم') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الاسم') 
elseif SENDTEXT:find('ذهب') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'العزائم') 
elseif SENDTEXT:find('انسات') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'اسيا') 
elseif SENDTEXT:find('الاسد') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الاسد') 
elseif SENDTEXT:find('6') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'6') 
elseif SENDTEXT:find('مهر') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'مهر') 
elseif SENDTEXT:find('الدلفين') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الزئبق') 
elseif SENDTEXT:find('لندن') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'لندن') 
elseif SENDTEXT:find('الانسان') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
IRAQBOT:set(IRAQ_ID.."GAME:CHER"..msg.chat_id_,'خديجه') 
end
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,SENDTEXT, 1, 'md')
return false  
end

if MSG_TEXT[1] == 'المختلف' then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
IRAQBOT:set(IRAQ_ID..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂','🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙍‍♂🙎‍♂🙎‍♂🙎‍♂')
name = string.gsub(name,'🧖‍♂','🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♂🧖‍♀🧖‍♀🧖‍♀🧖‍♀')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
t=  '  اول واحد يطلع المختلف » {* '..name..' * } '
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end

if MSG_TEXT[1] == 'امثله' then
katu = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = katu[math.random(#katu)]
IRAQBOT:set(IRAQ_ID..':Set_Amthlh:'..msg.chat_id_,name)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
t =  'اكمل المثل التالي {* '..name..' *}'
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end

if MSG_TEXT[1] == 'حزوره' then
katu = {'امي','انا','المخده','الهواء','الهواء','القمر','الباب المفتوح','النهر','الكف','الغيم','اسمك','حرف الام','الابجديه','الدائره','الساعه','تموز','الصمت','السلحفات','كم الساعه','شجره العائله','ضفدع','خليه النحل','الصوت','الجوع','الكتاب','البيض','الاسفنجه','البرتقال','الكفن','الساعه','ارجل المنضده','البصل','الوقت','النار','الثلج','العمر','المسمار','الحفره','المشط','التلفون','الجرص','المراه','الغداء','الفيل','الصدئ','الهواء','عقرب الساعه'};
name = katu[math.random(#katu)]
IRAQBOT:set(IRAQ_ID..':Set_Hzorh:'..msg.chat_id_,name)
name = string.gsub(name,'امي','اخت خالك ومو خالتك منو')
name = string.gsub(name,'انا','بنت امك وابنت ابوك ومش اختك ولاخوك منو')
name = string.gsub(name,'المخده','اني خفيفه واني لطيفه اكوم من حضن الوزير اكعد بحضن الخليفه أزيح الهموم  واخلي لحبيب نايم منو انني')
name = string.gsub(name,'الهواء','ماهو الشيء الذي يسير امامك ولا تراه')
name = string.gsub(name,'القمر','ماهو الشيء الذي يحيا اول الشهر ويموت في اخره')
name = string.gsub(name,'الباب المفتوح','ماهو الباب الذي لا يمكن فتحه')
name = string.gsub(name,'النهر','ماهو الشي الذي يجري ولا يمشي')
name = string.gsub(name,'الكف','ماهو الشي الذي لو خمس اصابع دون لحم او عضم')
name = string.gsub(name,'الغيم','ماهو الشي الذي يمشي بلا رجلين ويبكي بلا عينين')
name = string.gsub(name,'اسمك','ماهو الشيء الذي لك ويستخدمه الناس من دون اذنك')
name = string.gsub(name,'حرف الام','ماهو الشيء الذي تراه في الليل ثلاث مرات والنهار مره واحده')
name = string.gsub(name,'الابجديه','كلمه تتكون من 8 احرف لكنها تجمع كل الحروف')
name = string.gsub(name,'الدائره','ماهو الشيء الذي ليس له بدايه وليس له نهايه')
name = string.gsub(name,'الساعه','ماهو الشيء الذي لا يتكلم واذا اكل صدق واذا جاع كذب')
name = string.gsub(name,'تموز','ماهو اسم الشهر الميلادي الذي اذا حذفت اوله تحول الى فاكهه')
name = string.gsub(name,'الصمت','ماهي الكلمه الذي يبطل معناها اذا نطقت بها ')
name = string.gsub(name,'السلحفات','ماهو الذي لحمهه من الداخل وعضمهه من الخارج ')
name = string.gsub(name,'كم الساعه','ماهوه السوال الذي تختلف اجابته دائماً')
name = string.gsub(name,'شجره العائله','ما اسم الشجره التي ليس لها ضل ولا لها ثمار ')
name = string.gsub(name,'الضفدع','ماهو الحيوان الذي لسانه طويل وجسمه صغير')
name = string.gsub(name,'خليه النحل','ماهو الشيء الذي يتسع مئاات الالوف ولا يتسع طير منتوف')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا ب الاذنين؟؟')
name = string.gsub(name,'الجوع','ماهو الشيء الذي يقرصك ولا تراه')
name = string.gsub(name,'الكتاب','له اوراق وماهو بنبات . له جلد وماهو بحيوان . وعلم وماهو ب انسان من هو')
name = string.gsub(name,'البيض','ماهو الشي الذي اسمه علئ لونه')
name = string.gsub(name,'الاسفنجه','كلي ثقوب ومع ذالك احفظ الماء فمن انا ')
name = string.gsub(name,'البرتقال','ماهو الشيء نرميه بعد العصر')
name = string.gsub(name,'الكفن','ماهو الشيء لاتحب ان تلبسة وان لبستة لاترة')
name = string.gsub(name,'الساعه','ماهو الشيء الذي يمشي ويقف وليس له ارجل')
name = string.gsub(name,'ارجل المنضده','اننا اربعة اخوه ولنا راس واحد فمن نحن')
name = string.gsub(name,'البصل','شيء تذبحه وتبكي عليه؟')
name = string.gsub(name,'الوقت','يذهب ولا يرجع')
name = string.gsub(name,'النار','شيء ياكل ولايشبع وان شرب الماء مات')
name = string.gsub(name,'الثلج','شيء مصنوع من الماء. وان عاش في الماء يموت')
name = string.gsub(name,'العمر','ماهو الشيء الذي كلما زاد نقص')
name = string.gsub(name,'المسمار','ماهو الشيء الذي لا يمشي الا ب الضرب')
name = string.gsub(name,'الحفره','ماهو الشيء الذي كلما اخذنا منهه زاد وكبر')
name = string.gsub(name,'المشط','له اسنان ولا يعض ماهو ')
name = string.gsub(name,'التلفون','يسمع بلا اذن ويحكي بلا لسان فما هو')
name = string.gsub(name,'الجرص','ماهو الشيء الذي اذا لمستهه صاح')
name = string.gsub(name,'المراه','ارى كل شيء من دون عيون فمن اكون')
name = string.gsub(name,'الغداء','ماهو الشيء الذي لايؤكل في الليل ')
name = string.gsub(name,'الفيل','من هوه الحيوان الذي يحك اذنه في انفه')
name = string.gsub(name,'الصدئ','ماهو الشيء الذي يتكلم جميع اللغات ')
name = string.gsub(name,'الهواء','شيء بيني وبينك لا تراه عينك ولا عيني فما هوه')
name = string.gsub(name,'عقرب الساعه','هناك عقرب لا يلدغ ولا يخاف منه الاطفال فما هوه')
t =  '  اول واحد يحلها » {* '..name..' *} ' 
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end
end

if MSG_TEXT[1] == 'الاسرع' and not IRAQBOT:get(IRAQ_ID.."LOCK:GAMES"..msg.chat_id_) then 
IRAQBOT:del(IRAQ_ID..'SMALE:GAMES'..msg.chat_id_)
katu = {'🍏','🍎','843578','9755','25677','578866','14589','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','7643','93289','3457','95439','378865','24568','9976','289','2288','2854','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌','📍','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
IRAQBOT:set(IRAQ_ID..'SMALE:GAME'..msg.chat_id_,katu[math.random(#katu)])
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'اسرع واحد يدز هذهہٓ ››  `'..IRAQBOT:get(IRAQ_ID..'SMALE:GAME'..msg.chat_id_)..'`', 1, 'md')
end

if MSG_TEXT[1] == 'معاني' and not IRAQBOT:get(IRAQ_ID.."LOCK:GAMES"..msg.chat_id_) then 
IRAQBOT:del(IRAQ_ID..'RTEP:CHER'..msg.chat_id_)
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديج','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
IRAQBOT:set(IRAQ_ID..'CHEK:CHER'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديج','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'اسرع واحد يدز معنى السمايل يفوز » { '..name..' }', 1, 'md')
end

if MSG_TEXT[1] == 'ترتيب' and not IRAQBOT:get(IRAQ_ID.."LOCK:GAMES"..msg.chat_id_) then 
IRAQBOT:del(IRAQ_ID..'CHER:GAME'..msg.chat_id_)
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
IRAQBOT:set(IRAQ_ID..'klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*💥¦ اسرع واحد يرتب هاي الكلمه » {'..name..'} يفوز 🎉*\n', 1, 'md')
end

if MSG_TEXT[1] =='نقودي' then 
if tonumber((IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1, ' *💬¦ ليس لديك نقود ،\n📬¦ للحصول ؏ النقود ،\n📮¦ ارسل الالعاب وابدأ اللعب ! *', 1, 'md') 
else
NUMPGAME = (IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_))
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*📮¦ عدد النقود التي ربحتها هي » { '..NUMPGAME..' }\n📬¦ تسطيع بيع نقودك ولحصول على (50) رساله مقابل كل نقطه من النقود *\n', 1, 'md') 
end
end

if MSG_TEXT[1] == ('بيع نقودي') then 
local NUMPY = MSG_TEXT[2]
if tonumber(NUMPY) == (0) then
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,"\n*📮¦ لا استطيع البيع اقل من 1 \n*", 1, 'md') 
return false end
if tonumber(IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)) == 0 then
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'\n*📮¦ ليس لديك نقود من الالعاب \n📬¦ اذا كنت تريد ربح النقود \n🎮¦ ارسل الالعاب وابدأ اللعب ! *', 1, 'md') 
else
local NUM_GAMES = IRAQBOT:get(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'\n*📮¦ ليس لديك نقود بهاذا العدد \n📬¦ لزيادة نقودك في اللعبه \n🎮¦ ارسل الالعاب وابدأ اللعب ! *', 1, 'md') 
return false end
local NUMNKO = (NUMPY * 50)
IRAQBOT:decrby(IRAQ_ID..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,NUMPY)  
IRAQBOT:incrby(IRAQ_ID..'user:messages:'..msg.chat_id_..':'..msg.sender_user_id_,NUMNKO)  
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'\n*📬¦ تم خصم » { '..NUMPY..' } من نقودك \n📨¦ وتم اضافة » { '..(NUMPY * 50)..' } رساله الى رسالك *\n💥', 1, 'md')
end return false 
end

if MSG_TEXT[1] == 'تفعيل الالعاب' or MSG_TEXT[1] == 'تفعيل اللعبه' then
if not is_monsh(msg) then   
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,"\n*📮¦ هاذا الامر خاص للمدراء فما فوق\n*", 1, 'md') 
return false  end 
if IRAQBOT:get(IRAQ_ID..'LOCK:GAMES'..msg.chat_id_) then
taha = '*📮¦ تم تفعيل الالعاب في المجموعه *\n✓' 
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
IRAQBOT:del(IRAQ_ID..'LOCK:GAMES'..msg.chat_id_) 
else
taha = '*📮¦ بالتاكيد تم تفعيل الالعاب *\n✓' 
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end

if MSG_TEXT[1] == 'تعطيل الالعاب' or MSG_TEXT[1] == 'تعطيل اللعبه' then
if not is_monsh(msg) then   
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,"\n*📮¦ هاذا الامر خاص للمدراء فما فوق\n*", 1, 'md') 
return false  end 
if not IRAQBOT:get(IRAQ_ID..'LOCK:GAMES'..msg.chat_id_) then
taha = '*📮¦ تم تعطيل الالعاب في المجموعه *\n✓' 
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
IRAQBOT:set(IRAQ_ID..'LOCK:GAMES'..msg.chat_id_,true) 
else
taha = '*📮¦ بالتاكيد تم تعطيل الالعاب *\n✓' 
IRAQ_sendMsg( msg.chat_id_, msg.id_, 1, taha, 1, "md") 
end
end

if MSG_TEXT[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not is_monsh(msg) then   
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,"\n*📮¦ هاذا الامر خاص للمدراء فما فوق\n*", 1, 'md') 
return false  end 
local ID_USER = MSG_TEXT[2]
IRAQBOT:set(IRAQ_ID..'SET:ID:USER'..msg.chat_id_,ID_USER)  
IRAQBOT:setex(IRAQ_ID.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*📊¦ ارسل لي عدد الرسائل الذي تريده*\n', 1, 'md') 
end
if MSG_TEXT[1] == "اضف نقود" and msg.reply_to_message_id_ == 0 then       
if not is_monsh(msg) then   
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,"\n*📮¦ هاذا الامر خاص للمدراء فما فوق\n*", 1, 'md') 
return false  end 
local ID_USER = MSG_TEXT[2]
IRAQBOT:set(IRAQ_ID..'SET:ID:USER:NUM'..msg.chat_id_,ID_USER)  
IRAQBOT:setex(IRAQ_ID.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,'*📊¦ ارسل لي عدد النقاط الذي تريده*\n', 1, 'md') 
end

if MSG_TEXT[1] == 'الالعاب' or MSG_TEXT[1] == 'اللعبه' then
if IRAQBOT:get(IRAQ_ID.."LOCK:GAMES"..msg.chat_id_) then 
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,"\n*📮¦ الالعاب تم تعطيلها هنا \n*", 1, 'md') 
else
local COMGAME = [[*
🤹‍♂¦ اهلا بك في قائمه الالعاب
📮¦ العآب الپوت المتآحة حاليا ↓
ٴ━━━━━━━━━━
⚜¦ ترتيب الكلمات ارسل › ترتيب
🎖¦ اسرع واحد ارسل › الاسرع
💭¦ معاني السمايلات ارسل › معاني
🗳¦ لعبة المحيبس ارسل › بات
🔖¦ لعبة التخمين ارسل › خمن
💭¦ لعبه اسئله › اسئله
🗳¦ لعبه المختلف › المختلف
🔖¦ لعبه الامثله › امثله
📥¦ لعبه الحزوره › حزوره
📛¦ اضف رسائل + الايدي 
🚸¦ اضف نقاط + الايدي
*
]]
IRAQ_sendMsg(msg.chat_id_, msg.id_, 1,COMGAME, 1, 'md') 
end
end

end
end
return {
CMDS = {
"^(محيبس)$", 
"^(بات)$", 
"^(تخمين)$", 
"^(خمن)$", 
"^(الاسرع)$",
"^(ترتيب)$",
"^(اسئله)$", 
"^(امثله)$", 
"^(المختلف)$",
"^(حزوره)$",
"^(معاني)$",
"^(نقودي)$",
"^(تفعيل اللعبه)$",
"^(تفعيل الالعاب)$",
"^(تعطيل اللعبه)$",
"^(تعطيل الالعاب)$",
"^(اضف رسائل) (%d+)$",
"^(اضف نقود) (%d+)$",
"^(اللعبه)$",
"^(الالعاب)$",
"^(بيع نقودي) (%d+)$",
},
IRAQ = GAMES,
IRAQ_TEXT = GET_TEXT
}


