<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%
Response.AddHeader "Access-Control-Allow-Origin", "http://zmw.ruid.cc" 
response.ContentType="text/json"
a=request("a")
d=request("d")
channel=request("channel")
lx=request("lx")
if lx="" or isnull(lx) then lx=2
phone=request("phone")
if k="" then
k=0
else
k=int(k)
end if

if a="data" then
if channel="news" or channel="help" or channel="eagr" or channel="food" or channel="law" or channel="prore" or channel="afair" or channel="proco" then
if channel="news" then osql=" and ddlClassId=3"
if channel="help" then osql=" and ddlClassId=4"
if channel="eagr" then osql=" and ddlClassId=5"
if channel="food" then osql=" and ddlClassId=6"
if channel="law" then osql=" and ddlClassId=7"
if channel="prore" then osql=" and ddlClassId=8"
if channel="afair" then osql=" and ddlClassId=9"
if channel="proco" then osql=" and ddlClassId=10"
set rs=server.createobject("adodb.recordset")
exec="select * from [content] where siteid="&siteid&osql&" order by cblItem_1 desc,id desc"	
rs.open exec,conn,1,1
rssum=rs.recordcount
rs.close
set rs=nothing%>{"data":[{}],"count":<%=rssum%>}<%end if
end if

'会员注册
if a="pcreg" then
email=chkstr(request("email"))
firstname=chkstr(request("firstname"))
te=request("te")
telephone=request("telephone")
address=request("address")
password=trim(request("password"))
confirm_password=trim(request("confirm_password"))
olduserno=request("userno")
salename=chkstr(request("salename"))
reuserno=chkstr(request("reuserno"))
wxid=chkstr(request("wxid"))
facebookid=chkstr(request("facebookid"))
saleinfo=getsaleinfo(salename)
csno=0
if ubound(split(saleinfo,"|"))=3 then
saleid=split(saleinfo,"|")(1)
saleno=split(saleinfo,"|")(2)
csno=split(saleinfo,"|")(3)+1
if instr(csno,"4")>0 then csno=int(Replace(csno,"4","5"))
userno=saleno&csno
end if
qq=chkstr(request("qq"))
if email="" or firstname="" or te="" or password="" or confirm_password="" or telephone="" or address="" or salename="" then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('必填资料有误，请重新提交。');history.go(-1);</Script></body></html>"
elseif gsjc(email,3)=false then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('邮箱格式错误。');history.go(-1);</Script></body></html>"
elseif emailregchk(email,0) then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('邮箱已被注册。');history.go(-1);</Script></body></html>"
elseif password<>confirm_password then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('两次输入密码不一致。');history.go(-1);</Script></body></html>"
elseif csno=0 then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('业务代表信息有误。');history.go(-1);</Script></body></html>"
else
if salename<>"" then salenameinfo=getsaleinfo(salename)
'if reuserno<>"" then reusernoinfo=getreuserno(reuserno)
saleid=SPLIT(salenameinfo,"|")(1)
conn.execute("insert into [member] (email,firstname,te,telephone,address,password,userno,olduserno,salename,saleid,reuserno,wxid,facebookid,qq,siteid) values('"&email&"','"&firstname&"','"&te&"','"&telephone&"','"&address&"','"&md5(password)&"','"&userno&"','"&olduserno&"','"&salename&"',"&saleid&",'"&reuserno&"','"&wxid&"','"&facebookid&"','"&qq&"',"&siteid&")") 
conn.Execute("update [admin] set csno = "&csno&" where txtUserName='"&salename&"' or txtReadName='"&salename&"'")
Session("email")=email
Session("firstname")=firstname
Session("userno")=userno
'Response.Cookies("teh").Expires=DateAdd("m",60,now()) 
'Response.Cookies("teh")("token")=base64Encode(email&"&"&userno&"&"&firstname&"&"&siteid)
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('注册成功！');location.href='/user.html';</Script></body></html>"
end if
end if

'导入包裹时检查状态
'[{"res":0,"msg":"不存在此包裹单号！","data":[{}]}]
'[{"res":1,"msg":"包裹单号存在！","data":[{"packageid":248394,"expresno":"888074646291153903","weight":1.1,"volumweight":0,"addtime":"2018-01-15 12:32:00","status":"已到仓库"}]}]
if a="getpackagestatus" then
expressno=chkstr(request("expressno"))
express=request("express")
if instr(express,"|")>0 then
expressid=SPLIT(express,"|")(0)
expressname=SPLIT(express,"|")(1)
end if
if expressid<>"" and expressno<>"" then
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [package] where expressno='"&expressno&"'" ' and expressid="&expressid
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then
res=1
id=chkrs("id")
expressno=chkrs("expressno")
weight=FormatNumber(chkrs("weight"),2,-1)
volumweight=FormatNumber(chkrs("volumweight"),2,-1)
if volumweight>weight then weight=volumweight
addtime=chkrs("atime")
s=chkrs("statustext")
orderno=chkrs("orderno")
userid=chkrs("userid")
if s=0 then statust="已添加到购物车"
if s=1 then statust="已下过订单"
if s=2 then statust="已到库"'"收到未出货"
if s=3 then statust="已出货"
if s=4 then statust="无效包裹"
if s>0 and isnull(orderno)=false and userid<>"" then statust="已下过订单"%>[{"res":1,"msg":"包裹单号存在！","data":[{"packageid":<%=id%>,"expresno":"<%=expressno%>","weight":<%=weight%>,"volumweight":<%=volumweight%>,"addtime":"<%=addtime%>","status":"<%=statust%>"}]}]<%else%>[{"res":0,"msg":"不存在此包裹单号！","data":[{}]}]<%end if
chkrs.close
set chkrs=nothing
end if
end if

'添加包裹
if a="addpackageapi" then
express=request("express")
if instr(express,"|")>0 then
expressid=SPLIT(express,"|")(0)
expressname=SPLIT(express,"|")(1)
end if
Response.Cookies("teh")("expressid")=expressid
order=request("order")
'statustext=request("statustext")
statustext=0
if instr(order,"|")>0 then
orderid=SPLIT(order,"|")(0)
orderno=SPLIT(order,"|")(1)
end if
expressno=chkstr(request("expressno"))
txtgoodname=request("txtgoodname")
txtCount=request("txtCount")
txtprice=request("txtprice")
weight=request("weight")
packageremark=request("packageremark")
packagetype=request("packagetype")
backurl=request("backurl")
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userinfo=getuserinfo(email)
if ubound(split(userinfo,"|"))>3 then
userid=SPLIT(userinfo,"|")(0)
salename=SPLIT(userinfo,"|")(1)
saleid=int(SPLIT(userinfo,"|")(2))
aename=SPLIT(userinfo,"|")(3)
aeid=int(SPLIT(userinfo,"|")(4))
end if
if expressid="" or expressno="" or txtgoodname="" or txtCount="" or txtprice="" or userinfo="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif packagechk(expressno,expressid,1) then
conn.Execute("update [package] set txtgoodname='"&txtgoodname&"',txtCount="&txtCount&",txtprice="&txtprice&",packagetype="&packagetype&",packageremark='"&packageremark&"',orderno='"&orderno&"',userid='"&userid&"',salename='"&salename&"',saleid="&saleid&",aename='"&aename&"',aeid="&aeid&" where expressno='"&expressno&"' and siteid="&siteid) '到库包裹更新订单号和归属 and expressid="&expressid&"
if orderno<>"" then conn.Execute("update [Order] set SpNum=SpNum+1,packStat=0 where orderno='"&orderno&"' and siteid="&siteid&" and userid="&userid)%>{"status":"true","Word":"添加成功。","gourl":"<%=backurl%>_<%=randStr(6,"NUMB")%>","fail":""}<%
elseif packagechk(expressno,expressid,0) then%>{"status":"fail","Word":"包裹单号已存在","fail":"true"}<%else
conn.execute("insert into [package] (expressid,expressname,expressno,txtgoodname,txtCount,txtprice,weight,statustext,packagetype,packageremark,orderno,userid,salename,saleid,aename,aeid,siteid) values("&expressid&",'"&expressname&"','"&expressno&"','"&txtgoodname&"',"&txtCount&","&txtprice&","&weight&","&statustext&","&packagetype&",'"&packageremark&"','"&orderno&"','"&userid&"','"&salename&"',"&saleid&",'"&aename&"',"&aeid&","&siteid&")") '新包裹录入
if orderno<>"" then conn.Execute("update [Order] set SpNum=SpNum+1,packStat=0 where orderno='"&orderno&"' and siteid="&siteid&" and userid="&userid)
%>{"status":"true","Word":"添加成功。","gourl":"<%=backurl%>_<%=randStr(6,"NUMB")%>","fail":""}<%end if
end if

'编辑包裹
if a="editpackageapi" then
id=request("id")
txtgoodname=request("goodname")
txtCount=request("goodCount")
txtprice=request("goodprice")
packageremark=request("remark")
packagetype=request("packagetype")
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if id="" or txtgoodname="" or txtCount="" or txtprice="" or userid=0 then
zt=3
elseif packageidchk(id)=false then
zt=0
else
conn.Execute("update [package] set txtgoodname = '"&txtgoodname&"',txtCount="&txtCount&",txtprice="&txtprice&",packagetype="&packagetype&",packageremark='"&packageremark&"' where id="&id&" and statustext<3 and siteid="&siteid&" and packagetype="&packagetype&" and userid="&userid)
conn.Execute("update [package] set orderno='',txtgoodname = '"&txtgoodname&"',txtCount="&txtCount&",txtprice="&txtprice&",packagetype="&packagetype&",packageremark='"&packageremark&"' where id="&id&" and statustext<3 and siteid="&siteid&" and packagetype<>"&packagetype&" and userid="&userid) '修改了转运类型
zt=1
end if
%><%=zt%><%end if

'批量删除
if a="cartdelallapi" then
strdel=request("strdel")
order=request("order")
if instr(order,"|")>0 then
orderid=SPLIT(order,"|")(0)
orderno=SPLIT(order,"|")(1)
end if
if strdel="" then
d=request("d")
if instr(d,"|")>0 then
strdel=SPLIT(d,"|")(0)
orderno=SPLIT(d,"|")(1)
end if
end if
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if strdel<>"" then
strdel=Replace(strdel,"|",",") 
if right(strdel,1)="," then strdel=left(strdel,len(strdel)-1) '去结尾,
SpNum=ubound(split(strdel,","))+1
conn.execute "delete from [package] where statustext=0 and id in ("&strdel&")"
conn.execute "update [package] set userid='',orderno='',txtgoodname='',txtCount=0,txtprice=0,packageremark='' where statustext>0 and id in ("&strdel&")" '已到库包裹不可删除，只更新为无归属状态
if orderno<>"" then conn.execute "update [Order] set SpNum=SpNum-"&SpNum&" where userid='"&userid&"' and orderno = '"&orderno&"' and siteid="&siteid
zt=1
else
zt=0
end if%><%=zt%><%end if

'添加收货地址
if a="adduseraddressapi" then
txtusername=request("consignee")
txtcellphone=request("tel")
txttelphone=request("telephone")
txtPostcode=request("postcode")
country=request("country")
countryid=SPLIT(country,"|")(0)
countrytxt=SPLIT(country,"|")(1)
txtAddress=request("address")
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if userid=0 then
zt=1
elseif txtusername<>"" and txtcellphone<>"" and txttelphone<>"" and txtPostcode<>"" and countrytxt<>"" and countryid<>"" and txtAddress<>"" then
conn.execute("insert into [user_address] (txtusername,txtcellphone,txttelphone,txtPostcode,country,countryid,txtAddress,userid,IsDefault,siteid) values('"&txtusername&"','"&txtcellphone&"','"&txttelphone&"','"&txtPostcode&"','"&countrytxt&"','"&countryid&"','"&txtAddress&"',"&userid&",0,"&siteid&")") 
zt=2
else
zt=0
end if
%><%=zt%><%end if

'输出运输方式
if a="postwayapi" then
ordertype=int(request("ordertype"))
set rs=server.createobject("adodb.recordset")
exec="select * from [postway] where siteid="&siteid&" and rblUserType="&ordertype&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
i=1%>[<%do while not rs.eof
if i=1 then%>{"CityID":<%=rs("id")%>,"CityName":"<%=rs("txtpostwayname")%>"}<%else%>,{"CityID":<%=rs("id")%>,"CityName":"<%=rs("txtpostwayname")%>"}<%end if
i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing%>]<%end if%>
<%end if

'账户管理
if a="muser" then
sname=request("sname")
nbxfa=chkxfa()
uname=SPLIT(nbxfa,"&")(2)
if sname="" or uname="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("update [userinfo] set sname = '"&sname&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/muser41","fail":""}<%
end if
end if

'添加银行卡号
if a="cardno" then
khh=request("khh")
cardno=request("cardno")
sname=request("sname")
moren=request("moren")
nbxfa=chkxfa()
uname=SPLIT(nbxfa,"&")(2)
if moren or getmrk(uname)="" then
moren=1
else
moren=0
end if
if khh="" or cardno="" or sname="" or moren="" or uname="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
if moren=1 then conn.Execute("update [cardno] set moren = 0 where uname='"&uname&"'")
conn.execute("insert into [cardno] (uname,khh,cardno,sname,moren) values('"&uname&"','"&khh&"','"&cardno&"','"&sname&"',"&moren&")")
%>{"status":"true","Word":"账户添加成功！","gourl":"/mcard43","fail":""}<%
end if
end if

'设置默认地址
if a="mraddressno" then
id=int(request("id"))
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if id="" or id=0 or email="" or int(userid)=0 then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("update [user_address] set IsDefault = 0 where userid='"&userid&"' and siteid="&siteid)
conn.Execute("update [user_address] set IsDefault = 1 where userid='"&userid&"' and id="&id&" and siteid="&siteid)
%>{"status":"true","Word":"设置默认地址成功！","gourl":"/user_address_list_<%=randStr(6,"NUMB")%>","fail":""}<%
end if
end if

'删除地址
if a="deladdressno" then
id=int(request("id"))
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if id="" or id=0 or email="" or int(userid)=0 then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("delete from [user_address] where userid='"&userid&"' and id="&id&" and siteid="&siteid)
%>{"status":"true","Word":"删除成功！","gourl":"/user_address_list_<%=randStr(6,"NUMB")%>","fail":""}<%
end if
end if

'修改登陆密码
if a="pass" then
opass=request("opass")
npass=request("npass")
vcode=request("vcode")
nbxfa=chkxfa()
sj=SPLIT(nbxfa,"&")(1)
uname=SPLIT(nbxfa,"&")(2)
if opass="" or npass="" or vcode="" or uname="" or sj="" or gsjc(sj,4)=false then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif pwdchk(uname,opass)=false then%>{"status":"fail","Word":"当前登陆密码错误！","fail":"true"}<%
elseif chkvcode(sj,vcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set pass = '"&npass&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/user4","fail":""}<%
end if
end if

'修改支付密码
if a="ppass" then
oppass=request("oppass")
nppass=request("nppass")
pvcode=request("pvcode")
nbxfa=chkxfa()
sj=SPLIT(nbxfa,"&")(1)
uname=SPLIT(nbxfa,"&")(2)
if oppass="" or nppass="" or pvcode="" or uname="" or sj="" or gsjc(sj,4)=false then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif ppwdchk(uname,oppass)=false then%>{"status":"fail","Word":"当前支付密码错误！","fail":"true"}<%
elseif chkvcode(sj,pvcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set ppass = '"&nppass&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/user4","fail":""}<%
end if
end if

'找回登陆密码
if a="fpass" then
uname=request("uname")
pwd=request("pwd")
vcode=request("vcode")
if uname="" or pwd="" or vcode="" or phone="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif gsjc(phone,4)=false then%>{"status":"fail","Word":"手机号码错误！","fail":"true"}<%
elseif userchk(uname,phone)=false then%>{"status":"fail","Word":"用户信息校验失败！","fail":"true"}<%
elseif chkvcode(phone,vcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set pass = '"&pwd&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！正在前往登陆","gourl":"/login","fail":""}<%
end if
end if

'找回支付密码
if a="fppass" then
uname=request("uname")
pwd=request("pwd")
vcode=request("vcode")
if uname="" or pwd="" or vcode="" or phone="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif gsjc(phone,4)=false then%>{"status":"fail","Word":"手机号码错误！","fail":"true"}<%
elseif userchk(uname,phone)=false then%>{"status":"fail","Word":"用户信息校验失败！","fail":"true"}<%
elseif chkvcode(phone,vcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set ppass = '"&pwd&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/user4","fail":""}<%
end if
end if%>