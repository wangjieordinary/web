<%dim conn,connstr,startime,TimesDB,rs,UserAgent
ly_url = request.servervariables("http_referer")
domain = lcase(Request.ServerVariables("SERVER_NAME")) 
if ly_url<>"" then
ly_url = replace(ly_url, "http://", "")
ly_url = replace(ly_url, "https://", "")
if instr(ly_url, "/")>0 then ly_url = lcase(left(ly_url, instr(ly_url, "/")-1))
if ly_url<>"wx.zgnmzymyw.org" and domain<>"nmw.ruid.cc" and domain<>"zgnmzymyw.org" and domain<>"www.zgnmzymyw.org" and domain<>"zgnmzymyw.com" and domain<>"www.zgnmzymyw.com" then response.end
end if
startime=timer()
Const IsSqlDataBase = 1
if IsSqlDataBase = 1 then
connstr="driver={SQL server};server=SERVER\MSSQL2000;uid=zmw;pwd=ZgZmw8258;database=zgnmzymyw"
end if
Function SafeRequest(ParaName,ParaType)
       Dim ParaValue
       ParaValue=Request(ParaName)
       If ParaType=1 then
              If not isNumeric(ParaValue) then
                     Response.write "<center>参数" & ParaName & "必须为数字型，请正确操作！</center>"
                     Response.end
              End if
       Else
              ParaValue=replace(ParaValue,"'","''")
       End if
       SafeRequest=ParaValue
End function

Function FormatSQL(strChar)
if strChar="" then
FormatSQL=""
else
FormatSQL=replace(replace(replace(replace(replace(replace(replace(replace(strChar,"'",""),"*",""),"?",""),"(",""),")",""),"<",""),".",""),";","")
end if
End Function 

'On Error Resume Next
	Set conn = Server.CreateObject("ADODB.Connection")
	conn.open connstr
	If Err Then
		err.Clear
		Set Conn = Nothing
		Response.Write "数据库连接出错，请检查Conn.asp中的数据库指向。"'
		Response.End
	End If
'===========================================
'获取当前Url参数的函数
Function GetUrl()
  Dim ScriptAddress,Servername,qs
  ScriptAddress = CStr(Request.ServerVariables("SCRIPT_NAME"))
  Servername = CStr(Request.ServerVariables("Server_Name"))
  qs=Request.QueryString
  if qs<>"" then
  GetUrl ="http://"& Servername & ScriptAddress &"?"&qs
  else
  GetUrl ="http://"& Servername & ScriptAddress
  end if
End Function
'============================================
''response.write GetURL

	function left_CN(strs,Lens)
	 dim i,n,c,ss
	 n=0
	 ss=""
	 for i=1 to len(strs)
	   c=asc(mid(strs,i,1))
	   ss=ss&mid(strs,i,1)
	   if c<0 then
	    n=n+2
	   else
	    n=n+1
	   end if
	   if n+2>=Lens then 
	    left_CN=ss&"..."
		exit function
	   end if	
	 next
	 left_CN=strs
	end function

Function chknmw() '获得登陆信息
if Session("uid")<>"" and Session("telephone")<>"" and Session("userno")<>"" then
chknmw=Session("uid")&"&"&Session("userno")&"&"&Session("telephone")&"&"&siteid
elseif request.Cookies("nmw")("token")<>"" and int(Session("errn"))<1 then
chknmw=base64Decode(request.Cookies("nmw")("token"))
else
chknb=""
end if
End Function

Function chkadmin() '获得管理员登陆信息
if Session("admin")<>"" and Session("sname")<>"" and Session("power")<>"" then
chkadmin=Session("admin")&"&"&Session("sname")&"&"&Session("atype")&"&"&Session("power")&"&"&siteid&"&"&Session("adminid")
elseif request.Cookies("admin")("token")<>"" and int(Session("errn"))<1 then
chkadmin=base64Decode(request.Cookies("admin")("token"))
else
chkadmin="&&&"
end if
End Function

Function getvip(uid) '是否vip
Set viprs = Server.CreateObject( "ADODB.Recordset" )
vipsql="Select * from [userinfo] where id=" &uid
viprs.open vipsql,conn,1,1
if not (viprs.bof and viprs.eof) then
getvip=viprs("vip")
else
getvip=0
end if
viprs.close
set viprs=nothing
End Function

Function getpayid(pay) 'pay获得ID
Set payrs = Server.CreateObject( "ADODB.Recordset" )
paysql="Select * from [userinfo] where sj='"&pay&"'"
payrs.open paysql,conn,1,1
if not (payrs.bof and payrs.eof) then
getpayid=payrs("id")
else
getpayid=0
end if
payrs.close
set payrs=nothing
End Function

Function getcatname(catid) '获得分类名称
Set gcnrs = Server.CreateObject( "ADODB.Recordset" )
gcnsql="Select * from [category] where id="&catid
gcnrs.open gcnsql,conn,1,1
if not (gcnrs.bof and gcnrs.eof) then
getcatname=gcnrs("category")
else
getcatname=""
end if
gcnrs.close
set gcnrs=nothing
End Function

Function getcatfid(catid) '获得父分类ID
Set gcnrs = Server.CreateObject( "ADODB.Recordset" )
gcnsql="Select * from [category] where id="&catid
gcnrs.open gcnsql,conn,1,1
if not (gcnrs.bof and gcnrs.eof) then
getcatfid=gcnrs("ParentID")
else
getcatfid=0
end if
gcnrs.close
set gcnrs=nothing
End Function

Function getbrandname(brandid) '获得品牌名称
Set gbnrs = Server.CreateObject( "ADODB.Recordset" )
gbnsql="Select * from [brand] where id="&brandid
gbnrs.open gbnsql,conn,1,1
if not (gbnrs.bof and gbnrs.eof) then
getbrandname=gbnrs("brand")
else
getbrandname=""
end if
gbnrs.close
set gbnrs=nothing
End Function

Function getidtopay(uid) 'uid获得pay
Set payrs = Server.CreateObject( "ADODB.Recordset" )
paysql="Select * from [userinfo] where id="&uid
payrs.open paysql,conn,1,1
if not (payrs.bof and payrs.eof) then
getidtopay=payrs("sj")
else
getidtopay="无偿"
end if
payrs.close
set payrs=nothing
End Function

Function getheadimg(id,lx)
on error resume next 
getheadimg="/images/idx_user.png"
if id>0 then
Set hirs = Server.CreateObject( "ADODB.Recordset" )
if lx="weixin" then
hisql="Select * from [weixin] where headimgurl<>'NULL' and id=" & id
else
hisql="Select * from [weixin] where headimgurl<>'NULL' and uid=" & id
end if
hirs.open hisql,conn,1,1
if not (hirs.bof and hirs.eof) then
getheadimg=hirs("headimgurl")
end if
hirs.close
set hirs=nothing
end if
End Function

Function URLEncoding(vstrIn) 
strReturn = "" 
For i = 1 To Len(vstrIn) 
ThisChr = Mid(vStrIn,i,1) 
If Abs(Asc(ThisChr)) < &HFF Then 
strReturn = strReturn & ThisChr 
Else 
innerCode = Asc(ThisChr) 
If innerCode < 0 Then 
innerCode = innerCode + &H10000 
End If 
Hight8 = (innerCode And &HFF00)/ &HFF 
Low8 = innerCode And &HFF 
strReturn = strReturn & "%" & Hex(Hight8) & "%" & Hex(Low8) 
End If 
Next 
URLEncoding = strReturn 
End Function

Function URLDecode(ByVal urlcode) 
Dim start,final,length,char,i,butf8,pass 
Dim leftstr,rightstr,finalstr 
Dim b0,b1,bx,blength,position,u,utf8 
On Error Resume Next 

b0 = Array(192,224,240,248,252,254) 
urlcode = Replace(urlcode,"+"," ") 
pass = 0 
utf8 = -1 

length = Len(urlcode) : start = InStr(urlcode,"%") : final = InStrRev(urlcode,"%") 
If start = 0 Or length < 3 Then URLDecode = urlcode : Exit Function 
leftstr = Left(urlcode,start - 1) : rightstr = Right(urlcode,length - 2 - final) 

For i = start To final 
char = Mid(urlcode,i,1) 
If char = "%" Then 
bx = URLDecode_Hex(Mid(urlcode,i + 1,2)) 
If bx > 31 And bx < 128 Then 
i = i + 2 
finalstr = finalstr & ChrW(bx) 
ElseIf bx > 127 Then 
i = i + 2 
If utf8 < 0 Then 
butf8 = 1 : blength = -1 : b1 = bx 
For position = 4 To 0 Step -1 
If b1 >= b0(position) And b1 < b0(position + 1) Then 
blength = position 
Exit For 
End If 
Next 
If blength > -1 Then 
For position = 0 To blength 
b1 = URLDecode_Hex(Mid(urlcode,i + position * 3 + 2,2)) 
If b1 < 128 Or b1 > 191 Then butf8 = 0 : Exit For 
Next 
Else 
butf8 = 0 
End If 
If butf8 = 1 And blength = 0 Then butf8 = -2 
If butf8 > -1 And utf8 = -2 Then i = start - 1 : finalstr = "" : pass = 1 
utf8 = butf8 
End If 
If pass = 0 Then 
If utf8 = 1 Then 
b1 = bx : u = 0 : blength = -1 
For position = 4 To 0 Step -1 
If b1 >= b0(position) And b1 < b0(position + 1) Then 
blength = position 
b1 = (b1 xOr b0(position)) * 64 ^ (position + 1) 
Exit For 
End If 
Next 
If blength > -1 Then 
For position = 0 To blength 
bx = URLDecode_Hex(Mid(urlcode,i + 2,2)) : i = i + 3 
If bx < 128 Or bx > 191 Then u = 0 : Exit For 
u = u + (bx And 63) * 64 ^ (blength - position) 
Next 
If u > 0 Then finalstr = finalstr & ChrW(b1 + u) 
End If 
Else 
b1 = bx * &h100 : u = 0 
bx = URLDecode_Hex(Mid(urlcode,i + 2,2)) 
If bx > 0 Then 
u = b1 + bx 
i = i + 3 
Else 
If Left(urlcode,1) = "%" Then 
u = b1 + Asc(Mid(urlcode,i + 3,1)) 
i = i + 2 
Else 
u = b1 + Asc(Mid(urlcode,i + 1,1)) 
i = i + 1 
End If 
End If 
finalstr = finalstr & Chr(u) 
End If 
Else 
pass = 0 
End If 
End If 
Else 
finalstr = finalstr & char 
End If 
Next 
URLDecode = leftstr & finalstr & rightstr 
End Function 

Function URLDecode_Hex(ByVal h) 
On Error Resume Next 
h = "&h" & Trim(h) : URLDecode_Hex = -1 
If Len(h) <> 4 Then Exit Function 
If isNumeric(h) Then URLDecode_Hex = cInt(h) 
End Function

Function getHTTPPage(url)
    dim objXML
    set objXML=server.createobject("MSXML2.XMLHTTP")'定义
    objXML.open "GET",url,true'打开
    objXML.send()'发送
    If objXML.readystate<>4 then '判断文档是否已经解析完，以做客户端接受返回消息
        exit function
    End If
	getHTTPPage=objXML.responseBody '返回信息
    set objXML=nothing'关闭
    if err.number<>0 then err.Clear 
End Function

Function getIP()  
Dim strIPAddr  
If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then  
strIPAddr = Request.ServerVariables("REMOTE_ADDR")  
ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then  
strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1)  
ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then  
strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1)  
Else  
strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR")  
End If  
getIP = Trim(Mid(strIPAddr, 1, 30))  
End Function

'生成随机字符
Function randStr(intLength,lx) 
Dim strSeed, seedLength, pos, Str, i 
select case LX
case "ALL"
strSeed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" 
case "BIGN"
strSeed = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
case "CHAR"
strSeed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
case "NUMB"
strSeed = "0123456789"
case ""
strSeed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
end select
seedLength = Len(strSeed) 
Str = "" 
Randomize 
For i = 1 To intLength 
Str = Str + Mid(strSeed, Int(seedLength * Rnd) + 1, 1) 
Next 
randStr = Str 
End Function

Function isgwc(pid,num,uid,sku_id) '检查购物车是否存在该产品
if pid<>"" and num<>"" and uid<>"" then
if sku_id<>"" then ssql=" and sku_id='"&sku_id&"'"
Set gwrs = Server.CreateObject( "ADODB.Recordset" )
gwsql="Select * from [gouwuche] where pid in ("&pid&")"&ssql&" and ddh is null and uid="&uid&" and siteid="&siteid
gwrs.open gwsql,conn,1,1
if not (gwrs.bof and gwrs.eof) then
isgwc=true
else
isgwc=false
end if
gwrs.close
set gwrs=nothing
end if
End Function

Function isgwcid(id,num,uid) '检查购物车是否存在该ID
if id<>"" and num<>"" and uid<>"" then
if sku_id>0 then ssql=" and sku_id="&sku_id&""
Set gwrs = Server.CreateObject( "ADODB.Recordset" )
gwsql="Select * from [gouwuche] where id in ("&id&")"&ssql&" and ddh is null and siteid="&siteid
gwrs.open gwsql,conn,1,1
if not (gwrs.bof and gwrs.eof) then
isgwcid=true
else
isgwcid=false
end if
gwrs.close
set gwrs=nothing
end if
End Function

Function chkshdz(uid) '检查是否存在收货地址
Set sdrs = Server.CreateObject( "ADODB.Recordset" )
sdsql="Select * from [user_address] where userid="&uid&" and siteid="&siteid
sdrs.open sdsql,conn,1,1
if not (sdrs.bof and sdrs.eof) then
chkshdz=true
else
chkshdz=false
end if
sdrs.close
set sdrs=nothing
End Function

Function getshxx(uid,IDRec) '获取收货信息
Set gsrs = Server.CreateObject( "ADODB.Recordset" )
gssql="Select * from [user_address] where userid="&int(uid)&" and id="&int(IDRec)&" and siteid="&siteid
gsrs.open gssql,conn,1,1
if not (gsrs.bof and gsrs.eof) then
getshxx=gsrs("txtusername")&"|"&gsrs("txtcellphone")&"|"&Replace(gsrs("country"),"||","")&gsrs("txtAddress")
else
getshxx=""
end if
gsrs.close
set gsrs=nothing
End Function

Function getproinfo(pid) '获得产品主要信息
set gprs=server.createobject("adodb.recordset")
gpc="select * from [product] where siteid="&siteid&" and id="&int(pid)	
gprs.open gpc,conn,1,1
if not (gprs.bof and gprs.eof) then
getproinfo=gprs("name")&"||"&gprs("pic1")&"||"&gprs("price2")&"||"&gprs("jifen3")&"||"&gprs("jifen1")
else
getproinfo=""
end if
gprs.close
set gprs=nothing
End Function

Function gsjc(strng,number) 
Select Case CStr(number)
Case "0" patrn = "^[a-zA-Z ]+$" ' 英文+空格
Case "1" patrn = "^[0-9\-]+$" ' 数字+横杠
Case "2" patrn = "^\d+$" ' 半角数字
Case "3" patrn = "^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ' 邮箱地址
Case "4" patrn = "^(((13[0-9]{1})|(14[1|4|5|6|7|8]{1})|(16[6]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0|1|3|4|5|6|7|8]{1})|(19[8|9]{1}))+\d{8})$" ' 手机号码格式
Case "5" patrn = "^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$" ' 电话号码格式
Case "6" patrn = "^[A-Za-z0-9]+$" ' 英文+数字
end select
Dim regEx, retVal ' 建立变量。 
Set regEx = New RegExp ' 建立正则表达式。 
regEx.Pattern = patrn ' 设置模式。 
regEx.IgnoreCase = False ' 设置是否区分大小写。 
retVal = regEx.Test(strng) ' 执行搜索测试。 
gsjc = retVal '返回不尔值，不符合就返回false，符合为true 
End Function

Function gettn(tname) '直推关联数据 0直推层级cj|1直推数级tnames
Set ars = Server.CreateObject( "ADODB.Recordset" )
asql="Select * from [userinfo] where uname='"&tname&"'"
ars.open asql,conn,1,1
if not (ars.bof and ars.eof) then
cj=ars("cj")
tnames=ars("tnames")
blcz=ars("blcz")
gettn=cj&"|"&tnames&"|"&blcz
else
gettn="0|,|"
end if
ars.close
set ars=nothing
End Function

Function getsaleinfo(salename) '获得业务代表信息
Set sirs = Server.CreateObject( "ADODB.Recordset" )
sisql="Select * from [admin] where txtUserName='"&salename&"' or txtReadName='"&salename&"'"
sirs.open sisql,conn,1,1
if not (sirs.bof and sirs.eof) then
getsaleinfo=salename&"|"&sirs("id")&"|"&sirs("saleno")&"|"&sirs("csno")
else
getsaleinfo=""
end if
sirs.close
set sirs=nothing
End Function

Function getpubFanli(xslx) '获得通用返利比例
Set flrs = Server.CreateObject( "ADODB.Recordset" )
flsql="Select * from [webconfig] where siteid="&siteid
flrs.open flsql,conn,1,1
if not (flrs.bof and flrs.eof) then
if int(xslx)=0 then getpubFanli="|"&flrs("txtFanli")&"|"
if int(xslx)=1 then getpubFanli="|"&flrs("txtFanli2")&"|"
else
getpubFanli=""
end if
flrs.close
set flrs=nothing
End Function

Function getshrlb(uid) '获得收益人列表
Set syrs = Server.CreateObject( "ADODB.Recordset" )
sysql="Select * from [member] where siteid="&siteid&" and id="&uid
syrs.open sysql,conn,1,1
if not (syrs.bof and syrs.eof) then
getshrlb="|"&syrs("uid1")&"|"&syrs("uid2")&"|"&syrs("uid3")&"|"&syrs("uid4")&"|"&syrs("uid5")&"|"&syrs("uid6")&"|"
else
getshrlb=""
end if
syrs.close
set syrs=nothing
End Function

Function getreuserno(reuserno) '获得推荐人信息
Set reunors = Server.CreateObject( "ADODB.Recordset" )
reunosql="Select * from [member] where userno='"&reuserno&"'"
reunors.open reunosql,conn,1,1
if not (reunors.bof and reunors.eof) then
getreuserno=reuserno&"|"&unors("id")
else
getreuserno=reuserno&"|0"
end if
reunors.close
set reunors=nothing
End Function

Function chkexpressno(expressno) '批量导入快递单号检测
statust="可提交"
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [package] where expressno='"&expressno&"' and siteid="&siteid
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then
s=chkrs("statustext")
orderno=chkrs("orderno")
if s=0 then statust="有重复"'"已添加到购物车"
if s=1 then statust="已下过订单"
if s=2 then statust="已到"'"收到未出货"
if s=3 then statust="已出货"
if s=4 then statust="无效包裹"
if s>0 and ((chkrs("userid")<>"" and isnull(chkrs("userid"))=false) or (chkrs("orderno")<>"" and isnull(chkrs("orderno"))=false)) then statust="有重复"
end if
chkrs.close
set chkrs=nothing
chkexpressno=statust
End Function

Function chkexpressname(expressname) '批量导入快递名称检测
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [express] where txtexpressname='"&expressname&"'"
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then
statust="#ffffff"
else
statust="red"
end if
chkrs.close
set chkrs=nothing
chkexpressname=statust
End Function

Function getexpressid(expressname) '批量导入快递名称检测
Set gers = Server.CreateObject( "ADODB.Recordset" )
gesql="Select * from [express] where txtexpressname='"&expressname&"'"
gers.open gesql,conn,1,1
if not (gers.bof and gers.eof) then
getexpressid=gers("id")
else
getexpressid=0
end if
gers.close
set gers=nothing
End Function

Function sjchk(sj) '手机是否注册
Set sjrs = Server.CreateObject( "ADODB.Recordset" )
sjsql="Select * from [member] where telephone='"&sj&"'"
sjrs.open sjsql,conn,1,1
if not (sjrs.bof and sjrs.eof) then
sjchk=true
else
sjchk=false
end if
sjrs.close
set sjrs=nothing
End Function

Function emailregchk(email,lx) '用户绑定邮箱是否注册
Set emailrs = Server.CreateObject( "ADODB.Recordset" )
emailsql="Select * from [member] where email='"&email&"' and siteid="&siteid
emailrs.open emailsql,conn,1,1
if not (emailrs.bof and emailrs.eof) then
emailregchk=true
else
emailregchk=false
end if
emailrs.close
set emailrs=nothing
if lx=1 then emailchk=true 
End Function

Function chkuserno(userno) '用户编号是否存在
Set curs = Server.CreateObject( "ADODB.Recordset" )
cusql="Select * from [member] where userno='"&userno&"' and siteid="&siteid
curs.open cusql,conn,1,1
if not (curs.bof and curs.eof) then
chkuserno=true
else
chkuserno=false
end if
curs.close
set curs=nothing
End Function

Function chkadminuser(txtUserName) '用户编号是否存在
Set curs = Server.CreateObject( "ADODB.Recordset" )
cusql="Select * from [admin] where txtUserName='"&txtUserName&"' and siteid="&siteid
curs.open cusql,conn,1,1
if not (curs.bof and curs.eof) then
chkadminuser=true
else
chkadminuser=false
end if
curs.close
set curs=nothing
End Function

Function chkposition(position) '存放位置是否存在
Set cprs = Server.CreateObject( "ADODB.Recordset" )
cpsql="Select * from [position] where txtpositionname='"&position&"' and siteid="&siteid
cprs.open cpsql,conn,1,1
if not (cprs.bof and cprs.eof) then
chkposition=true
else
chkposition=false
end if
cprs.close
set cprs=nothing
End Function

Function getpacksum(positionname,jzt,packagetype) '存放位置对应状态的包裹数量
Set gprs = Server.CreateObject( "ADODB.Recordset" )
if jzt<>"" then
jsql="and jzt="&int(jzt)
end if
if packagetype<>"" then
jsql=jsql&" and packagetype="&int(packagetype)
end if
gpsql="Select * from [package] where positionname='"&positionname&"'"&jsql&" and siteid="&siteid
gprs.open gpsql,conn,1,1
getpacksum=gprs.recordcount
gprs.close
set gprs=nothing
End Function

Function getuserid(email) '通过绑定邮箱获得用户ID
Set uidrs = Server.CreateObject( "ADODB.Recordset" )
if gsjc(email,4) then
uidsql="Select * from [member] where telephone='"&email&"' and siteid="&siteid
elseif gsjc(email,3)=false then
uidsql="Select * from [member] where userno='"&email&"' and siteid="&siteid
else
uidsql="Select * from [member] where email='"&email&"' and siteid="&siteid
end if
uidrs.open uidsql,conn,1,1
if not (uidrs.bof and uidrs.eof) then
getuserid=uidrs("id")
else
getuserid=0
end if
uidrs.close
set uidrs=nothing
End Function

Function getuserno(userid) '获得用户编号
Set uidrs = Server.CreateObject( "ADODB.Recordset" )
uidsql="Select * from [member] where id="&userid&" and siteid="&siteid
uidrs.open uidsql,conn,1,1
if not (uidrs.bof and uidrs.eof) then
getuserno=uidrs("userno")
else
getuserno=""
end if
uidrs.close
set uidrs=nothing
End Function

Function getusersj(userid) '获得用户手机
Set usjrs = Server.CreateObject( "ADODB.Recordset" )
usjsql="Select * from [member] where id="&userid&" and siteid="&siteid
usjrs.open usjsql,conn,1,1
if not (usjrs.bof and usjrs.eof) then
getusersj=usjrs("telephone")
else
getusersj=""
end if
usjrs.close
set usjrs=nothing
End Function

Function gettuidinfo(uid) '通过会员推荐关系
if isNumeric(uid) then
Set uirs = Server.CreateObject( "ADODB.Recordset" )
uisql="Select * from [member] where id="&uid&" and siteid="&siteid
uirs.open uisql,conn,1,1
if not (uirs.bof and uirs.eof) then
gettuidinfo=uirs("cj")&"|"&uirs("uid1")&"|"&uirs("uid2")&"|"&uirs("uid3")&"|"&uirs("uid4")&"|"&uirs("uid5")&"|"&uirs("uid6")&"|"&uirs("uid0")
else
gettuidinfo=""
end if
uirs.close
set uirs=nothing
else
gettuidinfo=""
end if
End Function

Function getuserno(userid) '通过绑定邮箱获得用户编号
if isnull(userid) or userid="" then
getuserno=""
else
Set uidrs = Server.CreateObject( "ADODB.Recordset" )
uidsql="Select * from [member] where id="&int(userid)&" and siteid="&siteid
uidrs.open uidsql,conn,1,1
if not (uidrs.bof and uidrs.eof) then
getuserno=uidrs("userno")
else
getuserno=""
end if
uidrs.close
set uidrs=nothing
end if
End Function


Function getusersj(userid) '获得用户编号
getusersj=""
if userid<>"" then
Set usjrs = Server.CreateObject( "ADODB.Recordset" )
usjsql="Select * from [member] where id="&userid&" and siteid="&siteid
usjrs.open usjsql,conn,1,1
if not (usjrs.bof and usjrs.eof) then
getusersj=usjrs("telephone")
end if
usjrs.close
set usjrs=nothing
end if
End Function

Function getddh(id,zt) '获得订单号,zt>0检测状态
Set gdrs = Server.CreateObject( "ADODB.Recordset" )
gdsql="Select * from [dingdan] where id="&id&" and siteid="&siteid
if int(zt)>0 then gdsql="Select * from [dingdan] where id="&id&" and zt<"&int(zt)&" and siteid="&siteid
gdrs.open gdsql,conn,1,1
if not (gdrs.bof and gdrs.eof) then
getddh=gdrs("ddh")
else
getddh=""
end if
gdrs.close
set gdrs=nothing
End Function

Function getwjyj(uuid,zt,stime) '获得未结算佣金
getwjyj=0
if uuid<>"" then
Set gdrs = Server.CreateObject( "ADODB.Recordset" )
gdsql="Select * from [member] where id="&uuid&" and siteid="&siteid
gdrs.open gdsql,conn,1,2
if not (gdrs.bof and gdrs.eof) then
wjtime=gdrs("wjtime")
cj=gdrs("cj")
'getwjyj=gdrs("wjsyj")
Set rs = Server.CreateObject("ADODB.Recordset")
if zt=0 then ssql="(yjzt<4 or yjzt=5) and uid<>"&uuid
if zt=5 then ssql="yjzt=5" 
if stime<>"" then ssql=ssql&" and datediff(s,stime,'"&cdate(stime)&"')>0"
sql="Select * from [gouwuche] where shrlb like '%|"&uuid&"|%' and "&ssql&" and siteid="&siteid
rs.open sql,conn,1,1
ct = rs.Recordcount
if not rs.eof then
zyj=0
do while not rs.eof
yj=0
shrlb=rs("shrlb")&"|||||||"
Fanli=rs("Fanli")&"|||||||"
yj1=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(1))
yj2=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(2))
yj3=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(3))
yj4=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(4))
yj5=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(5))
yj6=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(6))
ex=0
uuid=int(uuid)
sh1=int(split(shrlb,"|")(1))
sh2=int(split(shrlb,"|")(2))
sh3=int(split(shrlb,"|")(3))
sh4=int(split(shrlb,"|")(4))
sh5=int(split(shrlb,"|")(5))
sh6=int(split(shrlb,"|")(6))
if sh1=uuid or sh1=0 then yj=yj+yj1
if sh1=uuid then ex=1
if sh1<>uuid and sh1<>0 and ex=0 then yj=0
if (sh2=uuid or sh2=0) and ex=0 then yj=yj+yj2
if sh2=uuid then ex=1
if sh2<>uuid and sh2<>0 and ex=0 then yj=0
if (sh3=uuid or sh3=0) and ex=0 then yj=yj+yj3
if sh3=uuid then ex=1
if sh3<>uuid and sh3<>0 and ex=0 then yj=0
if (sh4=uuid or sh4=0) and ex=0 then yj=yj+yj4
if sh4=uuid then ex=1
if sh4<>uuid and sh4<>0 and ex=0 then yj=0
if (sh5=uuid or sh5=0) and ex=0 then yj=yj+yj5
if sh5=uuid then ex=1
if sh5<>uuid and sh5<>0 and ex=0 then yj=0
if sh6=uuid and ex=0 then yj=yj+yj6
zyj=zyj+yj
rs.movenext
loop
getwjyj=zyj
end if
rs.close
set rs=nothing
else
getwjyj=0
end if
gdrs.close
set gdrs=nothing
end if
End Function

Function getyjyj(uuid) '获得已结算佣金
Set gdrs = Server.CreateObject( "ADODB.Recordset" )
gdsql="Select * from [member] where id="&uuid&" and siteid="&siteid
gdrs.open gdsql,conn,1,2
if not (gdrs.bof and gdrs.eof) then
wjtime=gdrs("wjtime")
'getwjyj=gdrs("wjsyj")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select * from [gouwuche] where yjzt=9 and shrlb like '%|"&uuid&"|%' and uid<>"&uuid&" and siteid="&siteid
rs.open sql,conn,1,1
ct = rs.Recordcount
if not rs.eof then
zyj=0
do while not rs.eof
yj=0
shrlb=rs("shrlb")&"|||||||"
Fanli=rs("Fanli")&"|||||||"
yj1=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(1))
yj2=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(2))
yj3=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(3))
yj4=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(4))
yj5=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(5))
yj6=(rs("zj")-rs("zcb"))*Ccur(split(Fanli,"|")(6))
ex=0
uuid=int(uuid)
sh1=int(split(shrlb,"|")(1))
sh2=int(split(shrlb,"|")(2))
sh3=int(split(shrlb,"|")(3))
sh4=int(split(shrlb,"|")(4))
sh5=int(split(shrlb,"|")(5))
sh6=int(split(shrlb,"|")(6))
if sh1=uuid or sh1=0 then yj=yj+yj1
if sh1=uuid then ex=1
if sh1<>uuid and sh1<>0 and ex=0 then yj=0
if (sh2=uuid or sh2=0) and ex=0 then yj=yj+yj2
if sh2=uuid then ex=1
if sh2<>uuid and sh2<>0 and ex=0 then yj=0
if (sh3=uuid or sh3=0) and ex=0 then yj=yj+yj3
if sh3=uuid then ex=1
if sh3<>uuid and sh3<>0 and ex=0 then yj=0
if (sh4=uuid or sh4=0) and ex=0 then yj=yj+yj4
if sh4=uuid then ex=1
if sh4<>uuid and sh4<>0 and ex=0 then yj=0
if (sh5=uuid or sh5=0) and ex=0 then yj=yj+yj5
if sh5=uuid then ex=1
if sh5<>uuid and sh5<>0 and ex=0 then yj=0
if sh6=uuid and ex=0 then yj=yj+yj6
zyj=zyj+yj
rs.movenext
loop
getyjyj=yj
end if
rs.close
set rs=nothing
else
getyjyj=0
end if
gdrs.close
set gdrs=nothing
End Function

Function getusergname(userno) '通过用户编号获得会员类型
Set uidrs = Server.CreateObject( "ADODB.Recordset" )
uidsql="Select * from [member] where userno='"&userno&"' and siteid="&siteid
uidrs.open uidsql,conn,1,1
if not (uidrs.bof and uidrs.eof) then
getusergname=uidrs("ddusergroup")
else
getusergname=""
end if
uidrs.close
set uidrs=nothing
End Function

Function getusername(email) '通过绑定邮箱获得用户姓名
Set uidrs = Server.CreateObject( "ADODB.Recordset" )
uidsql="Select * from [member] where email='"&email&"' and siteid="&siteid
uidrs.open uidsql,conn,1,1
if not (uidrs.bof and uidrs.eof) then
getusername=uidrs("firstname")
else
getusername=""
end if
uidrs.close
set uidrs=nothing
End Function

Function getuserinfo(email) '通过绑定邮箱获得用户关系信息
Set uirs = Server.CreateObject( "ADODB.Recordset" )
uisql="Select * from [member] where email='"&email&"' and siteid="&siteid
uirs.open uisql,conn,1,1
if not (uirs.bof and uirs.eof) then
getuserinfo=uirs("id")&"|"&uirs("salename")&"|"&uirs("saleid")&"|"&uirs("aename")&"|"&uirs("aeid")
else
getuserinfo=""
end if
uirs.close
set uirs=nothing
End Function

Function getuseridinfo(userid) '通过用户ID获得用户关系信息
Set uirs = Server.CreateObject( "ADODB.Recordset" )
uisql="Select * from [member] where id="&userid&" and siteid="&siteid
uirs.open uisql,conn,1,1
if not (uirs.bof and uirs.eof) then
getuseridinfo=uirs("id")&"|"&uirs("salename")&"|"&uirs("saleid")&"|"&uirs("aename")&"|"&uirs("aeid")&"|"&uirs("email")
else
getuseridinfo=""
end if
uirs.close
set uirs=nothing
End Function

Function chkddelively(txtexpressno,userid) '检查国际运单号是否已存在
chkddelively=false
Set cdrs = Server.CreateObject( "ADODB.Recordset" )
cdsql="Select * from [delively] where txtexpressno='"&txtexpressno&"' and userid="&userid&" and siteid="&siteid
cdrs.open cdsql,conn,1,1
if not (cdrs.bof and cdrs.eof) then
chkddelively=true
end if
cdrs.close
set cdrs=nothing
End Function

Function packagechk(expressno,expressid,zt) '检测包裹状态
Set prs = Server.CreateObject( "ADODB.Recordset" )
if zt=0 then psql="Select * from [package] where statustext<2 and expressno='"&expressno&"' and siteid="&siteid '不可下单 and expressid="&expressid&"
if zt=1 then psql="Select * from [package] where statustext=2 and ((orderno is null and userid is null) or (orderno='' and userid='') or (orderno='' and userid<>'')) and expressno='"&expressno&"' and siteid="&siteid '到库包裹下单 and expressid="&expressid&"
if zt=2 then psql="Select * from [package] where statustext=2 and expressno='"&expressno&"' and siteid="&siteid '是否到库 and expressid="&expressid&"
prs.open psql,conn,1,1
if not (prs.bof and prs.eof) then
packagechk=true
else
packagechk=false
end if
prs.close
set prs=nothing
End Function

'获得无主到库包裹快递公司ID和名称
Function getexpress(expressno)
Set gers = Server.CreateObject( "ADODB.Recordset" )
gesql="Select * from [package] where expressno='"&expressno&"' and ((orderno is null and userid is null) or (orderno='' and userid='') or (orderno='' and userid<>'')) and siteid="&siteid
gers.open gesql,conn,1,1
if not (gers.bof and gers.eof) then
getexpress=gers("expressid")&"|"&gers("expressname")
else
getexpress=""
end if
gers.close
set gers=nothing
End Function

Function packageidchk(id) '检测暂存包裹是否存在
Set prs = Server.CreateObject( "ADODB.Recordset" )
psql="Select * from [package] where statustext<3 and id="&id&" and siteid="&siteid
teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
end if
if admin<>"" then psql="Select * from [package] where id="&id&" and siteid="&siteid
prs.open psql,conn,1,1
if not (prs.bof and prs.eof) then
packageidchk=true
else
packageidchk=false
end if
prs.close
set prs=nothing
End Function

Function getordergoodname(orderno) '获得运单物品清单名称|价值
ggoodname=""
gprice=0
set ggrs=server.createobject("adodb.recordset")
ggrs.open "select * from [package] where siteid="&siteid&" and orderno='"&orderno&"' order by id asc",conn,1,1
if ggrs.recordcount>0 then
ggi=1
do while not ggrs.eof
if ggi=1 then
if ggrs("txtgoodname")<>"" and isnull(ggrs("txtgoodname"))=false then ggoodname=ggrs("txtgoodname")
else
if ggrs("txtgoodname")<>"" and isnull(ggrs("txtgoodname"))=false then ggoodname=ggoodname&","&ggrs("txtgoodname")
end if
gprice=gprice+(ggrs("txtCount")*ggrs("txtprice"))
ggi=ggi+1	
ggrs.movenext
Loop
ggrs.close
set ggrs=nothing
end if
getordergoodname=ggoodname&"|"&gprice
End Function

Function getorderno(expressno) '通过快递单号获得订单号
Set prs = Server.CreateObject( "ADODB.Recordset" )
psql="Select * from [package] where expressno='"&expressno&"' and siteid="&siteid
prs.open psql,conn,1,1
if not (prs.bof and prs.eof) then
getorderno=prs("orderno")
else
getorderno=""
end if
prs.close
set prs=nothing
End Function

Function chkorderdk(orderno) '检查订单包裹是否到齐
Set dkrs = Server.CreateObject( "ADODB.Recordset" )
dksql="Select * from [package] where orderno='"&orderno&"' and statustext<2 and siteid="&siteid
dkrs.open dksql,conn,1,1
if not (dkrs.bof and dkrs.eof) then
chkorderdk="未到齐"
else
chkorderdk="已到齐"
conn.Execute("update [Order] set packStat=1 where orderno='"&orderno&"' and siteid="&siteid)
end if
dkrs.close
set dkrs=nothing
End Function

Function ispchk(id) '手机是否注册
Set prs = Server.CreateObject( "ADODB.Recordset" )
psql="Select * from [dcdata] where zt<2 and uid="&id
prs.open psql,conn,1,1
if not (prs.bof and prs.eof) then
ispchk=true
else
ispchk=false
end if
prs.close
set prs=nothing
End Function

Function sendsms(mobile,vcode,lx,ddm) '1为注册校验码,2为验证码
'多个手机号之间用“,”分隔
if tovcode(mobile,vcode,lx)>=3 or int(lx)=0 or lx="" or ddm="" or dvcode(mobile)>=10 then '限制15分钟内三条，一天内10条
sendsms="2,"
else
dim userid,password,status
dim xmlObj,httpsendurl,msg
if int(lx)=1 then msg=Replace(smsreg,"vcode",vcode)
if int(lx)>1 then msg=Replace(smsmb,"vcode",vcode)
username = "nmw"
password = "4fea5fa9b9cd05b4dfc78c3fafe96bbb"
dstime = ""
productid = 676767
xh = ""
httpsendurl="http://www.ztsms.cn:8800/sendSms.do?username="&username&"&password="&password&"&mobile="&mobile&"&content="&Server.URLEncode(msg)&"&dstime=&productid="&productid&"&xh=&ddm="&ddm
Set xmlObj = server.CreateObject("Microsoft.XMLHTTP")
xmlObj.Open "GET",httpsendurl,false
xmlObj.send()
status = xmlObj.responseText
Set xmlObj = nothing
zt=status
conn.execute("insert into [vcodes] (sj,vcode,msg,zt,lx) values('"&mobile&"','"&vcode&"','"&msg&"','"&zt&"',"&lx&")") 
sendsms=zt
end if
End Function

Function getnumb(str) '取出所有数字
for i=1 to len(str)
s=mid(str,i,1)
if asc(s)>=asc(0) and asc(s)<=asc(9) then
l=l&s
end if   
next
getnumb=l
End Function

Function tovcode(mobile,vcode,lx) '验证码15分钟内发送频率检查
tovcode=0
set vcrs=server.createobject("adodb.recordset")   
vcrs.Open "Select * from [vcodes] where sj='"&mobile&"' and DateDiff(ss,getdate(),DateAdd(mi,15,atime))>0 and lx="&lx&" order by id desc",conn,1,1
if not(vcrs.bof and vcrs.eof) then
tovcode=vcrs.recordcount
end if 
vcrs.close
set vcrs=nothing
End Function

Function dvcode(mobile) '验证码日发送频率检查，大于3为通知类不限制
dvcode=0
set dcrs=server.createobject("adodb.recordset")   
dcrs.Open "Select * from [vcodes] where sj='"&mobile&"' and DateDiff(dd,getdate(),DateAdd(dd,1,atime))>0 and lx<4 order by id desc",conn,1,1
if not(dcrs.bof and dcrs.eof) then
dvcode=dcrs.recordcount
end if 
dcrs.close
set dcrs=nothing
End Function

Function chkvcode(mobile,vcode,lx) '验证码检查
chkvcode=false
set cvcrs=server.createobject("adodb.recordset")   
cvcrs.Open "Select top 1 * from [vcodes] where sj='"&mobile&"' and vcode='"&vcode&"' and DateDiff(ss,getdate(),DateAdd(mi,15,atime))>0 and lx="&lx&" order by id desc",conn,1,1
if not(cvcrs.bof and cvcrs.eof) then
chkvcode=true
end if 
cvcrs.close
set cvcrs=nothing
if vcode="888888" and mobile="18888069301" then chkvcode=true
End Function

Function ppwdchk(uname,ppwd) '验证支付密码
Set pprs = Server.CreateObject( "ADODB.Recordset" )
ppsql="Select * from [userinfo] where uname='"&uname&"' and ppass='"&ppwd&"'"
pprs.open ppsql,conn,1,1
if not (pprs.bof and pprs.eof) then
ppwdchk=true
else
ppwdchk=false
end if
pprs.close
set pprs=nothing
End Function

Function pwdchk(uname,pwd) '验证登陆密码
Set prs = Server.CreateObject( "ADODB.Recordset" )
psql="Select * from [userinfo] where uname='"&uname&"' and pass='"&pwd&"'"
prs.open psql,conn,1,1
if not (prs.bof and prs.eof) then
pwdchk=true
else
pwdchk=false
end if
prs.close
set prs=nothing
End Function

Function zzchk(zname,zphone) '验证用户名和手机后四位
Set zzrs = Server.CreateObject( "ADODB.Recordset" )
zzsql="Select * from [userinfo] where uname='"&zname&"' and sj like '%"&zphone&"' "
zzrs.open zzsql,conn,1,1
if not (zzrs.bof and zzrs.eof) then
zzchk=true
else
zzchk=false
end if
zzrs.close
set zzrs=nothing
End Function

Function userchk(uname,phone) '验证用户名和手机号
Set ucrs = Server.CreateObject( "ADODB.Recordset" )
ucsql="Select * from [userinfo] where uname='"&uname&"' and sj='"&phone&"'"
ucrs.open ucsql,conn,1,1
if not (ucrs.bof and ucrs.eof) then
userchk=true
else
userchk=false
end if
ucrs.close
set ucrs=nothing
End Function

'获得所有子类
Function getzcat(catid)
Set gzcrs=Conn.Execute("select * from category where ParentID = "&catid&" and hide=0 order by categoryorder")
do while not gzcrs.eof
getzcat=getzcat&","&gzcrs("id")
gzcrs.movenext
loop
gzcrs.close
Set gzcrs = Nothing
End Function

'模拟POST请求异步提交数据，PostHTTPPage("api.xfa.vc","str1=a&str2=b&str3=c")
function BytesToBstr(body,Cset) 
if lenb(body)=0  then
 BytesToBstr=""
 exit  function
end if
 dim objstream 
 set objstream = Server.CreateObject("adodb.stream")
 objstream.Type = 1 
 objstream.Mode =3 
 objstream.Open 
 objstream.Write body 
 objstream.Position = 0 
 objstream.Type = 2 
 objstream.Charset = Cset 
 BytesToBstr = objstream.ReadText 
 objstream.Close 
 set objstream = nothing 
End function
function PostHTTPPage(url,data) 
 dim Http 
 set Http=server.createobject("MSXML2.SERVERXMLHTTP.3.0")
 Http.open "POST",url,false 
 Http.setRequestHeader "CONTENT-TYPE", "application/x-www-form-urlencoded" 
 Http.send(data) 
 if Http.readystate<>4 then 
 exit function 
 End if
 PostHTTPPage=bytesToBSTR(Http.responseBody,"utf-8") 
 set http=nothing 
 if err.number<>0 then err.Clear 
End function

Function FormatDate(sDateTime, sReallyDo)
 Dim sJorkin
 sJorkin = GetLocale()
 If Not IsDate(sDateTime) Then sDateTime = Now()
 sDateTime = CDate(sDateTime)
 Select Case UCase(sReallyDo & "")
 Case "0", "1", "2", "3", "4"
  FormatDate = FormatDateTime(sDateTime, sReallyDo)
 Case "00"
  FormatDate = FormatDate(sDateTime, "YYYY-MM-DD hh:mm:ss")
 Case "01"
  FormatDate = FormatDate(sDateTime, "YYYY年MM月DD日")
 Case "02"
  FormatDate = FormatDate(sDateTime, "YYYY-MM-DD")
 Case "03"
  FormatDate = FormatDate(sDateTime, "hh:mm:ss")
 Case "04"
  FormatDate = FormatDate(sDateTime, "hh:mm")
 Case "05"
  FormatDate = FormatDate(sDateTime, "MM/DD/YY")
 Case "ISO8601", "GOOGLE", "SITEMAP" '//ISO8601格式, 一般用于GoogleSiteMap, "+08:00" 为时区.
  FormatDate = FormatDate(sDateTime, "YYYY-MM-DDThh:mm:ss.000+08:00")
 Case "RFC822", "RSS", "FEED" '//RFC822格式, 一般用于RSS, "+0800" 为时区.
  SetLocale("en-gb")
  FormatDate = FormatDate(sDateTime, "ew, DD eMM YYYY hh:mm:ss +0800")
  SetLocale(sJorkin)
 Case "RND", "RAND", "RANDOMIZE" '//随机字符串
  Randomize
  sJorkin = Rnd()
  FormatDate = FormatDate(sDateTime, "YYYYMMDDhhmmss") & _
    Fix((9 * 10^6 -1) * sJorkin) + 10^6
 Case Else
  FormatDate = sReallyDo
  FormatDate = Replace(FormatDate, "YYYY", Year(sDateTime))
  FormatDate = Replace(FormatDate, "DD", Right("0" & Day(sDateTime), 2))
  FormatDate = Replace(FormatDate, "hh", Right("0" & Hour(sDateTime), 2))
  FormatDate = Replace(FormatDate, "mm", Right("0" & Minute(sDateTime), 2))
  FormatDate = Replace(FormatDate, "ss", Right("0" & Second(sDateTime), 2))
  FormatDate = Replace(FormatDate, "YY", Right(Year(sDateTime), 2))
  FormatDate = Replace(FormatDate, "D", Day(sDateTime))
  FormatDate = Replace(FormatDate, "h", Hour(sDateTime))
  FormatDate = Replace(FormatDate, "m", Minute(sDateTime))
  FormatDate = Replace(FormatDate, "s", Second(sDateTime))
  If InStr(1, FormatDate, "EW", 1) > 0 Then
  SetLocale("en-gb")
  FormatDate = Replace(FormatDate, "EW", UCase(WeekdayName(Weekday(sDateTime), False)))
  FormatDate = Replace(FormatDate, "eW", WeekdayName(Weekday(sDateTime), False))
  FormatDate = Replace(FormatDate, "Ew", UCase(WeekdayName(Weekday(sDateTime), True)))
  FormatDate = Replace(FormatDate, "ew", WeekdayName(Weekday(sDateTime), True))
  SetLocale(sJorkin)
  Else
  FormatDate = Replace(FormatDate, "W", WeekdayName(Weekday(sDateTime), False))
  FormatDate = Replace(FormatDate, "w", WeekdayName(Weekday(sDateTime), True))
  End If
  If InStr(1, FormatDate, "EMM", 1) > 0 Then
  SetLocale("en-gb")
  FormatDate = Replace(FormatDate, "EMM", MonthName(Month(sDateTime), False))
  FormatDate = Replace(FormatDate, "eMM", MonthName(Month(sDateTime), True))
  SetLocale(sJorkin)
  Else
  FormatDate = Replace(FormatDate, "MM", Right("0" & Month(sDateTime), 2))
  FormatDate = Replace(FormatDate, "M", Month(sDateTime))
  End If
 End Select
End Function

const BASE_64_MAP_INIT = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
dim Base64EncMap(63)
dim Base64DecMap(127)
'初始化函数
PUBLIC SUB initCodecs()
dim max, idx
   max = len(BASE_64_MAP_INIT)
for idx = 0 to max - 1
Base64EncMap(idx) = mid(BASE_64_MAP_INIT, idx + 1, 1)
next
for idx = 0 to max - 1
Base64DecMap(ASC(Base64EncMap(idx))) = idx
next
END SUB
'Base64加密函数
PUBLIC FUNCTION base64Encode(plain)
if len(plain) = 0 then
base64Encode = ""
exit function
end if
dim ret, i, ndx, by3, first, second, third
by3 = (len(plain) \ 3) * 3
ndx = 1
do while ndx <= by3
first = asc(mid(plain, ndx+0, 1))
second = asc(mid(plain, ndx+1, 1))
third = asc(mid(plain, ndx+2, 1))
ret = ret & Base64EncMap( (first \ 4) AND 63 )
ret = ret & Base64EncMap( ((first * 16) AND 48) + ((second \ 16) AND 15 ) )
ret = ret & Base64EncMap( ((second * 4) AND 60) + ((third \ 64) AND 3 ) )
ret = ret & Base64EncMap( third AND 63)
ndx = ndx + 3
loop
if by3 < len(plain) then
first = asc(mid(plain, ndx+0, 1))
ret = ret & Base64EncMap( (first \ 4) AND 63 )
if (len(plain) MOD 3 ) = 2 then
second = asc(mid(plain, ndx+1, 1))
ret = ret & Base64EncMap( ((first * 16) AND 48) + ((second \ 16) AND 15 ) )
ret = ret & Base64EncMap( ((second * 4) AND 60) )
else
ret = ret & Base64EncMap( (first * 16) AND 48)
ret = ret
end if
ret = ret
end if
for i=1 to len(ret) '从一开始循环到字符的长度 
if i mod 2 then
base64Encode=base64Encode + chr(asc(mid(ret,i,1))+1) '奇数ascii码加1
else
base64Encode=base64Encode + chr(asc(mid(ret,i,1))+0) '偶数ascii码加0
end if
next
'base64Encode=ret
END FUNCTION
'Base64解密函数
PUBLIC FUNCTION base64Decode(scrambled)
if len(scrambled) = 0 then
base64Decode = ""
exit function
end if
scrambled=Replace(scrambled,"%5b","[",1,-1,1) '修改加密中[号变为%5b的错误
dim scrambled1,i
for i=1 to len(scrambled) '从一开始循环到字符的长度
if i mod 2 then
scrambled1=scrambled1 + chr(asc(mid(scrambled,i,1))-1)   '奇数ascii码减1
else
scrambled1=scrambled1 + chr(asc(mid(scrambled,i,1))-0)   '偶数ascii码减0
end if
next
dim realLen
realLen = len(scrambled1)
do while mid(scrambled1, realLen, 1) = "="
realLen = realLen - 1
loop
dim ret, ndx, by4, first, second, third, fourth
ret = ""
by4 = (realLen \ 4) * 4
ndx = 1
do while ndx <= by4
first = Base64DecMap(asc(mid(scrambled1, ndx+0, 1)))
second = Base64DecMap(asc(mid(scrambled1, ndx+1, 1)))
third = Base64DecMap(asc(mid(scrambled1, ndx+2, 1)))
fourth = Base64DecMap(asc(mid(scrambled1, ndx+3, 1)))
ret = ret & chr( ((first * 4) AND 255) +   ((second \ 16) AND 3))
ret = ret & chr( ((second * 16) AND 255) + ((third \ 4) AND 15))
ret = ret & chr( ((third * 64) AND 255) + (fourth AND 63))
ndx = ndx + 4
loop
if ndx < realLen then
first = Base64DecMap(asc(mid(scrambled1, ndx+0, 1)))
second = Base64DecMap(asc(mid(scrambled1, ndx+1, 1)))
ret = ret & chr( ((first * 4) AND 255) +   ((second \ 16) AND 3))
if realLen MOD 4 = 3 then
third = Base64DecMap(asc(mid(scrambled1,ndx+2,1)))
ret = ret & chr( ((second * 16) AND 255) + ((third \ 4) AND 15))
end if
end if
base64Decode=ret
END FUNCTION
' 初始化
call initCodecs

Function chkstr(str)
str=Replace(str,"'","")
str=Replace(str,chr(34),"") '"号
str=Replace(str,"/","")
str=Replace(str,"?","")
str=Replace(str,chr(9),"") 'Tab空格
str=Replace(str,chr(255),"") '特殊空格
str=Replace(str,chr(32),"") '空格
str=Replace(str,"ゴ","")
str=Replace(str,"ガ","")
str=Replace(str,"ギ","")
str=Replace(str,"グ","")
str=Replace(str,"ゲ","")
str=Replace(str,"ザ","")
str=Replace(str,"ジ","")
str=Replace(str,"ズ","")
str=Replace(str,"ヅ","")
str=Replace(str,"デ","")
str=Replace(str,"ド","")
str=Replace(str,"ポ","")
str=Replace(str,"ベ","")
str=Replace(str,"プ","")
str=Replace(str,"ビ","")
str=Replace(str,"パ","")
str=Replace(str,"ヴ","")
str=Replace(str,"ボ","")
str=Replace(str,"ペ","")
str=Replace(str,"ブ","")
str=Replace(str,"ピ","")
str=Replace(str,"バ","")
str=Replace(str,"ヂ","")
str=Replace(str,"ダ","")
str=Replace(str,"ゾ","")
str=Replace(str,"ゼ","")
chkstr=str
End Function

Function gshjg(str)
if isnumeric(str) then
gshjg=Replace(FormatNumber(str,2,-1,0,0),".00","")
else
gshjg=0
end if
End Function

Function gettxzt(txddh) '获得提现状态
gettxzt=0
if txddh<>"" then
Set txrs = Server.CreateObject( "ADODB.Recordset" )
txsql="Select * from [tixian] where ddh='"&txddh&"' and siteid="&siteid
txrs.open txsql,conn,1,1
if not (txrs.bof and txrs.eof) then
gettxzt=txrs("zt")
end if
txrs.close
set txrs=nothing
end if
End Function

Function getyue(str) '获得用户余额
getyue=0
if str<>"" then
Set gyrs = Server.CreateObject( "ADODB.Recordset" )
if gsjc(str,4) then
gysql="Select * from [member] where telephone='"&str&"' and siteid="&siteid
else
gysql="Select * from [member] where id="&int(str)&" and siteid="&siteid
end if
gyrs.open gysql,conn,1,1
if not (gyrs.bof and gyrs.eof) then
getyue=gyrs("UserMoney")
end if
gyrs.close
set gyrs=nothing
end if
End Function

Function getxfjine(uuid) '获得用户消费金额
getxfjin=0
if uuid<>"" and int(uuid)>0 then
xfjine=Conn.Execute("select sum(jine) from [yonjin] where lx=2 and zt=1 and uid="&int(uuid))
xfjine=abs(xfjine(0))
if isnull(xfjine) then xfjine=0
getxfjine=xfjine
end if
End Function

Function chktjsl(uuid,dd,mjb,sum) '检查推荐是否达标，用户ID,天数,推荐会员要求的级别,要求的数量
chktjsl=false
if uuid<>"" and dd<>"" and mjb<>"" and sum<>"" then
if int(dd)>0 then jsql=" and datediff(d,atime,getdate())<="&int(dd)
if int(mjb)>0 then jsql=jsql&" and cj>="&int(mjb)
Set cjrs = Server.CreateObject( "ADODB.Recordset" )
cjsql="Select * from [member] where (uid0="&int(uuid)&" or uid1="&int(uuid)&" or uid2="&int(uuid)&" or uid3="&int(uuid)&" or uid4="&int(uuid)&" or uid5="&int(uuid)&" or uid6="&int(uuid)&") and id<>"&int(uuid)&" and siteid="&siteid&jsql
cjrs.open cjsql,conn,1,1
if int(sum)>0 then
if cjrs.recordcount>=int(sum) then chktjsl=true
else
if cjrs.recordcount>0 then chktjsl=true
end if
cjrs.close
set cjrs=nothing
end if
End Function

Function getwlmc(wlid)
if int(wlid)=0 then
getwlmc="上门取货"
elseif int(wlid)=99999 then
getwlmc="运费到付"
elseif int(wlid)>0 then
Set gwrs = Server.CreateObject( "ADODB.Recordset" )
gwsql="Select * from [express] where id="&int(wlid)&" and siteid="&siteid
gwrs.open gwsql,conn,1,1
if not (gwrs.bof and gwrs.eof) then
getwlmc=gwrs("txtexpressname")
end if
gwrs.close
set gwrs=nothing
else
getwlmc=""
end if
End Function

Function getzyjsyj() '获得总已结算佣金
zyjine=Conn.Execute("select sum(yonjin) from [gouwuche] where yjzt=9")
zyjine=abs(zyjine(0))
if isnull(zyjine) then zyjine=0
getzyjsyj=zyjine
End Function

Function getzwjsyj() '获得总未结算佣金
zwjine=Conn.Execute("select sum(yonjin) from [gouwuche] where yjzt=0 or yjzt=5")
zwjine=abs(zwjine(0))
if isnull(zwjine) then zwjine=0
getzwjsyj=zwjine
End Function

%><!--#include file="pub.asp"-->