<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.CodePage=65001%><!--#include file="../conn.asp"-->
<!--#include file="../adminconfig.asp"--><!--#include file="../jsonParse.asp"--><!--#include file="../md5.asp"-->
<%Response.Charset="utf-8"
Response.AddHeader "Access-Control-Allow-Origin", "http://zgnmzymyw.com,http://www.zgnmzymyw.com,http://wx.zgxnnj.org" 
a=request("a")
k=request("k")
lx=request("lx")
if lx="" or isnull(lx) then lx=2
phone=request("phone")
if k="" then
k=0
else
k=int(k)
end if
teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
adminid=SPLIT(teh,"&")(5)
end if

'会员注册
if a="pcreg" then
email=request("email")
firstname=request("firstname")
te=request("te")
telephone=request("telephone")
address=request("address")
password=request("password")
confirm_password=request("confirm_password")
'userno=request("userno")
salename=request("salename")
reuserno=request("reuserno")
wxid=request("wxid")
facebookid=request("facebookid")
saleinfo=getsaleinfo(salename)
csno=0
if ubound(split(saleinfo,"|"))=5 then
saleid=split(saleinfo,"|")(1)
saleno=split(saleinfo,"|")(2)
csno=split(saleinfo,"|")(3)+1
if instr(csno,"4")>0 then csno=int(Replace(csno,"4","5"))
userno=saleno&csno
end if
qq=request("qq")
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
conn.execute("insert into [member] (email,firstname,te,telephone,address,password,userno,salename,saleid,reuserno,wxid,facebookid,qq,siteid) values('"&email&"','"&firstname&"','"&te&"','"&telephone&"','"&address&"','"&md5(password)&"','"&userno&"','"&salename&"',"&saleid&",'"&reuserno&"','"&wxid&"','"&facebookid&"','"&qq&"',"&siteid&")") 
conn.Execute("update [admin] set csno = "&csno&" where txtUserName='"&salename&"' or txtReadName='"&salename&"'")
Session("email")=email
Session("firstname")=firstname
Session("userno")=userno
'Response.Cookies("teh").Expires=DateAdd("m",60,now()) 
'Response.Cookies("teh")("token")=base64Encode(email&"&"&userno&"&"&firstname&"&"&siteid)
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('注册成功！');location.href='/user.html';</Script></body></html>"
end if
end if

'后台添加会员
if a="memberaddapi" then
userno=request("txtUserName")
password=request("txtPassword")
email=request("txtEmail")
telephone=request("telephone")
rblIsLock=request("rblIsLock")
ocj=request("ocj")
cj=request("cj")
hygx=request("hygx")
id=request("userid")
con=request("con")
if id="" or isnull(id) or id="undefined" then id=0
if (id>0 and telephone="") or ((userno="" or telephone="" or password="" or rblIsLock="") and id=0) then%>0<%
elseif gsjc(telephone,4)=false and id=0 then%>2<%elseif chkuserno(userno) and id=0 then%>3<%elseif gsjc(email,3) and id=0 then%>4<%elseif sjchk(sj) and id=0 then%>5<%else
if id=0 then conn.execute("insert into [member] (userno,password,email,telephone,rblIsLock,cj,siteid) values('"&userno&"','"&md5(password)&"','"&email&"','"&telephone&"',"&rblIsLock&","&cj&","&siteid&")")%>1<%
if cj>1 then
ssql=",uid"&cj&"="&id&",uid"&cj-1&"=0"
elseif cj>0 then
ssql=",uid"&cj&"="&id
end if
if hygx<>"" then ssql=",uid0="&SPLIT(hygx,"|")(0)&",uid1="&SPLIT(hygx,"|")(1)&",uid2="&SPLIT(hygx,"|")(2)&",uid3="&SPLIT(hygx,"|")(3)&",uid4="&SPLIT(hygx,"|")(4)&",uid5="&SPLIT(hygx,"|")(5)&",uid6="&SPLIT(hygx,"|")(6)
if password<>"" and isnull(password)=false and password<>"undefined" then ssql=ssql&",password='"&md5(password)&"'"
if id>0 then conn.execute "update [member] set rblIsLock="&rblIsLock&",con='"&con&"',cj="&cj&ssql&" where id="&id
if int(cj)>int(ocj) then conn.execute("insert into [shenji] (uid,cj,ocj,sjsm,czr,siteid) values("&id&","&cj&","&ocj&",'后台管理员操作用户升级','"&admin&"',"&siteid&")")
end if
end if

'后台编辑会员
if a="membereditapi" then
userno=request("txtUserName")
userid=request("userid")
password=request("txtPassword")
email=request("txtEmail")
sex=request("rblsex")
rblIsLock=request("rblIsLock")
usergroup=request("ddusergroup")
if ubound(split(usergroup,"|"))=3 then
ddusergroup=split(usergroup,"|")(1)
AirPrice=split(usergroup,"|")(2)
Price2=split(usergroup,"|")(3)
end if
ddlsaleman=request("ddlsaleman")
if ubound(split(ddlsaleman,"|"))>0 then
saleid=split(ddlsaleman,"|")(0)
salename=split(ddlsaleman,"|")(1)
end if
olduserno=request("olduserno")
if email="" or userno="" or userid="" or rblIsLock="" or usergroup="" or ddlsaleman="" then%>0<%
elseif gsjc(email,3)=false then%>2<%elseif chkuserno(userno) then
if password<>"" then psql=",password='"&md5(password)&"'"
conn.Execute("update [member] set email = '"&email&"',sex="&sex&",rblIsLock="&rblIsLock&",ddusergroup='"&ddusergroup&"',AirPrice='"&AirPrice&"',HaiPrice='"&Price2&"',salename='"&salename&"',olduserno='"&olduserno&"',saleid="&saleid&psql&" where userno='"&userno&"' and id="&userid)%>1<%else%>3<%
end if
end if

'后台添加和编辑管理员
if a="adminaddapi" then
txtUserName=request("txtUserName")
txtUserPwd=request("txtUserPwd")
rblIsLock=request("rblIsLock")
txtReadName=request("txtReadName")
txtUserEmail=request("txtUserEmail")
tel=request("tel")
rblUserType=request("rblUserType")
power=request("cbLevel")
id=request("id")
if int(rblUserType)=1 then power="editConfig,viewUserGroup,addUserGroup,editUserGroup,delUserGroup,viewUser,addUser,PayUser,PayminusUser,viewPayLog,viewUserReffer,editUser,resetUser,DelUser,viewMoneyList,editMoneyList,delMoneyList,viewMoneyBack,eidtMoneyBack,delMoneyBack,addManage,editManage,delManage,exportorderexpress,logreport,viewadminlog,selfexport,viewChannel,addChannel,editChannel,delChannel,viewArticle,addArticle,editArticle,delArticle,viewInternation,addInternation,editInternation,delInternation,viewContents,addContents,editContents,delContents,viewPostCompany,addPostCompany,editPostCompany,viewLinks,addLinks,editLinks,delLinks,delPostCompany,viewAdvertising,addAdvertising,editAdvertising,delAdvertising,viewPackage,addpackage,editpackage,viewOrderSendList,editOrderListDetail,editOrderSend,haiviewOrderSendList,haieditOrderListDetail,haieditOrderSend,viewPostway,editPostway,viewSystemprice,editSystemPrice,countprice"
if (txtUserName="" and id<>"") or (txtUserPwd="" and id="") or rblIsLock="" or rblUserType="" then%>0<%
elseif (chkadminuser(txtUserName) and id="") or (chkadminuser(txtUserName)=false and id<>"") then%>2<%elseif chkadminuser(txtUserName)=false and id="" then
conn.execute("insert into [admin] (txtUserName,txtUserPwd,rblIsLock,txtReadName,txtUserEmail,tel,rblUserType,power,siteid) values('"&txtUserName&"','"&md5(txtUserPwd)&"',"&rblIsLock&",'"&txtReadName&"','"&txtUserEmail&"','"&tel&"',"&rblUserType&",'"&power&"',"&siteid&")")%>1<%
elseif chkadminuser(txtUserName) and id<>"" then
if txtUserPwd<>"" then psql=",txtUserPwd='"&md5(txtUserPwd)&"'"
conn.Execute("update [admin] set rblIsLock ="&rblIsLock&",rblUserType="&rblUserType&",txtReadName='"&txtReadName&"',txtUserEmail='"&txtUserEmail&"',tel='"&tel&"',power='"&power&"'"&psql&" where txtUserName='"&txtUserName&"' and id="&int(id))%>1<%
end if
end if

'后台添加和编辑新闻
if a="addArticleapi" then
txtTitle=request("txtTitle")
txtAuthor=request("txtAuthor")
txtAddtime=request("txtAddtime")
txtForm=request("txtForm")
txtKeyword=request("txtKeyword")
txtZhaiyao=request("txtZhaiyao")
txtDaodu=request("txtDaodu")
ddlClass=request("ddlClassId")
if instr(ddlClass,"|")>0 then
ddlClassId=SPLIT(ddlClass,"|")(0)
'ddlClassname=SPLIT(ddlClass,"|")(1)
end if
txtImgUrl=request("txtImgUrl")
txtcontent=request("txtcontent")
txtcontent=Replace(txtcontent,"'","")
cblItem_0=request("cblItem_0")
cblItem_1=request("cblItem_1")
cblItem_2=request("cblItem_2")
cblItem_3=request("cblItem_3")
cblItem_4=request("cblItem_4")
txtClick=request("txtClick")
txtSortId=request("txtSortId")
rblIsLock=request("rblIsLock")
ctype=1
if txtSortId="" or isnull(txtSortId) then txtSortId=0
if rblIsLock="" or isnull(rblIsLock) then rblIsLock=0
id=request("id")
if txtTitle="" or txtcontent="" or ddlClassId="" then%>0<%
elseif id="" then
conn.execute("insert into [content] (txtTitle,txtAuthor,txtAddtime,txtForm,txtKeyword,txtZhaiyao,txtDaodu,ddlClassId,txtImgUrl,txtcontent,cblItem_0,cblItem_1,cblItem_2,cblItem_3,cblItem_4,txtClick,txtSortId,rblIsLock,ctype,siteid) values('"&txtTitle&"','"&txtAuthor&"','"&txtAddtime&"','"&txtForm&"','"&txtKeyword&"','"&txtZhaiyao&"','"&txtDaodu&"',"&int(ddlClassId)&",'"&txtImgUrl&"','"&txtcontent&"',"&cblItem_0&","&cblItem_1&","&cblItem_2&","&cblItem_3&","&cblItem_4&","&txtClick&","&txtSortId&","&rblIsLock&",1,"&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [content] set txtTitle ='"&txtTitle&"',txtAuthor='"&txtAuthor&"',txtAddtime='"&txtAddtime&"',txtForm='"&txtForm&"',txtKeyword='"&txtKeyword&"',txtZhaiyao='"&txtZhaiyao&"',txtDaodu='"&txtDaodu&"',ddlClassId="&ddlClassId&",txtImgUrl='"&txtImgUrl&"',txtcontent='"&txtcontent&"',cblItem_0="&cblItem_0&",cblItem_1="&cblItem_1&",cblItem_2="&cblItem_2&",cblItem_3="&cblItem_3&",cblItem_4="&cblItem_4&",txtClick="&txtClick&",txtSortId="&txtSortId&",rblIsLock="&rblIsLock&" where id="&int(id))%>1<%
end if
end if

'后台添加和编辑商品
if a="addProductapi" then
teh=chkadmin()
if teh<>"" then admin=SPLIT(teh,"&")(0)
catid=request("catid")
if catid="" or isnull(catid) or catid="undefined" then catid=""
if catid<>"" then catid1=catid
catid2=request("catid2")
if catid2="" or isnull(catid2) or catid2="undefined" then catid2=""
if catid2<>"" then catid=catid2
catid3=request("catid3")
if catid3="" or isnull(catid3) or catid3="undefined" then catid3=""
if catid3<>"" then catid=catid3
catidlist="|"&catid1&"|"&catid2&"|"&catid3&"|$"
if request("catidlist")<>"" then catidlist=catidlist&"|"&request("catidlist")&"|"
catidlist=Replace(catidlist,"||","|")
brandid=request("brandid")
Title=request("name")
danwei=request("danwei")
ontime=request("ontime")
price1=request("price1")
price2=request("price2")
price3=request("price3")
qpsl=request("qpsl")
weight=request("weight")
Package_weight=request("Package_weight")
volume_weight=request("volume_weight")
pic1=request("pic1")
pic2=request("pic2")
pic3=request("pic3")
pic4=request("pic4")
pic5=request("pic5")
pic6=request("pic6")
pic7=request("pic7")
pic8=request("pic8")
huohao=request("huohao")
colors=request("colors")
sizes=request("sizes")
guige=request("guige")
zuhe=request("zuhe")
homepic=request("homepic")
Keywords=request("Keywords")
Descriptions=request("Descriptions")
content=request("content")
jifen1=request("jifen1")
jifen2=request("jifen2")
jifen3=request("jifen3")
onsale=request("onsale")
recommend=request("recommend")
kucun=request("kucun")
viewnum=request("viewnum")
ordercount=request("ordercount")
xslx=request("xslx")
ghsid=request("ghsid")
Fanli=request("Fanli")
id=request("id")
if Title="" or pic1="" or price1="" then%>0<%
elseif id="" then
Session("catid")=int(catid)
conn.execute("insert into [product] (catid,catidlist,brandid,name,ontime,price1,price2,price3,qpsl,weight,Package_weight,volume_weight,pic1,pic2,pic3,pic4,pic5,pic6,pic7,pic8,huohao,colors,sizes,guige,zuhe,homepic,Keywords,Descriptions,jifen1,jifen2,jifen3,content,onsale,recommend,kucun,viewnum,ordercount,xslx,ghsid,Fanli,czy,siteid) values("&int(catid)&",'"&catidlist&"',"&int(brandid)&",'"&Title&"','"&ontime&"',"&price1&","&price2&","&price3&","&int(qpsl)&","&weight&","&Package_weight&","&volume_weight&",'"&pic1&"','"&pic2&"','"&pic3&"','"&pic4&"','"&pic5&"','"&pic6&"','"&pic7&"','"&pic8&"','"&huohao&"','"&colors&"','"&sizes&"','"&guige&"','"&zuhe&"','"&homepic&"','"&Keywords&"','"&Descriptions&"',"&jifen1&","&jifen2&","&jifen3&",'"&content&"',"&int(onsale)&","&int(recommend)&","&int(kucun)&","&int(viewnum)&","&int(ordercount)&","&xslx&","&ghsid&",'"&Fanli&"','"&admin&"',"&siteid&")")%>1<%
elseif id<>"" then
Session("catid")=int(catid)
conn.Execute("update [product] set addtime=getdate(),catid="&int(catid)&",catidlist='"&catidlist&"',brandid="&int(brandid)&",name ='"&Title&"',ontime='"&ontime&"',price1="&price1&",price2="&price2&",price3="&price3&",qpsl="&int(qpsl)&",weight="&weight&",Package_weight="&Package_weight&",volume_weight="&volume_weight&",pic1='"&pic1&"',pic2='"&pic2&"',pic3='"&pic3&"',pic4='"&pic4&"',pic5='"&pic5&"',pic6='"&pic6&"',pic7='"&pic7&"',pic8='"&pic8&"',huohao='"&huohao&"',colors='"&colors&"',sizes='"&sizes&"',guige='"&guige&"',zuhe='"&zuhe&"',homepic='"&homepic&"',Keywords='"&Keywords&"',Descriptions='"&Descriptions&"',jifen1="&jifen1&",jifen2="&jifen2&",jifen3="&jifen3&",content='"&content&"',onsale="&int(onsale)&",recommend="&int(recommend)&",kucun="&int(kucun)&",viewnum="&int(viewnum)&",ordercount="&int(ordercount)&",xslx="&int(xslx)&",ghsid="&int(ghsid)&",Fanli='"&Fanli&"' where id="&int(id))%>1<%
end if
end if

'删除商品图片
if a="delpropicapi" then
id=request("id")
pic=request("pic")
pname=request("pname")
if id="" or pic="" or pname="" then%>{"status":"true","Word":"参数错误，删除失败！","gourl":"","fail":"true"}<%else%>{"status":"true","Word":"删除成功！","gourl":"","fail":""}<%
filename=server.MapPath(pic)
conn.execute("update product set "&pname&"='' where id="&id)
Set fso = CreateObject("Scripting.FileSystemObject")     
fso.DeleteFile(filename)    
Set fso = nothing
end if
end if

'添加和编辑商品分类
if a="addCategoryapi" then
category=request("category")
ParentID=request("ParentID")
first=request("first")
categoryorder=request("categoryorder")
if categoryorder="" then categoryorder=0
Icon=request("Icon")
Meta=request("Meta")
hide=request("hide")
intro=request("intro")
id=request("id")
if category="" or ParentID="" then%>0<%
elseif id="" then
conn.execute("insert into [category] (ParentID,category,first,categoryorder,Icon,Meta,hide,intro,siteid) values("&int(ParentID)&",'"&category&"',"&int(first)&","&int(categoryorder)&",'"&Icon&"','"&Meta&"',"&int(hide)&",'"&intro&"',"&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [category] set ParentID="&int(ParentID)&",category='"&category&"',first="&int(first)&",categoryorder="&int(categoryorder)&",Icon='"&Icon&"',Meta='"&Meta&"',hide="&int(hide)&",intro='"&intro&"' where id="&int(id))%>1<%
end if
end if

'删除商品分类
if a="delCategoryapi" then
id=request("id")
if id="" then%>0<%
else
conn.Execute("delete from [category] where id="&int(id)&" and siteid="&siteid)%>1<%
end if
end if

'添加和编辑商品品牌
if a="addBrandapi" then
brand=request("brand")
ParentID=request("ParentID")
if ParentID="" or ParentID="undefined" then ParentID=0
catid=request("catid")
if catid="" or isnull(catid) or catid="undefined" then catid=""
if catid<>"" then catid1=catid
catid2=request("catid2")
if catid2="" or isnull(catid2) or catid2="undefined" then catid2=""
if catid2<>"" then catid=catid2
catid3=request("catid3")
if catid3="" or isnull(catid3) or catid3="undefined" then catid3=""
if catid3<>"" then catid=catid3
catidlist="|"&catid1&"|"&catid2&"|"&catid3&"|$"
if request("catidlist")<>"" then catidlist=catidlist&"|"&request("catidlist")&"|"
catidlist=Replace(catidlist,"||","|")
first=request("first")
brandorder=request("brandorder")
if brandorder="" then brandorder=0
Icon=request("Icon")
Meta=request("Meta")
hide=request("hide")
intro=request("intro")
id=request("id")
if brand="" or ParentID="" then%>0<%
elseif id="" then
conn.Execute("insert into [brand] (ParentID,brand,catid,catidlist,first,brandorder,Icon,Meta,hide,intro,siteid) values("&int(ParentID)&",'"&brand&"',"&catid&",'"&catidlist&"',"&int(first)&","&int(brandorder)&",'"&Icon&"','"&Meta&"',"&int(hide)&",'"&intro&"',"&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [brand] set ParentID="&int(ParentID)&",brand='"&brand&"',catid="&catid&",catidlist='"&catidlist&"',first="&int(first)&",brandorder="&int(brandorder)&",Icon='"&Icon&"',Meta='"&Meta&"',hide="&int(hide)&",intro='"&intro&"' where id="&int(id))%>1<%
end if
end if

'删除商品品牌
if a="delBrandapi" then
id=request("id")
if id="" then%>0<%
else
conn.Execute("delete from [brand] where id="&int(id)&" and siteid="&siteid)%>1<%
end if
end if

'后台添加和编辑内容
if a="addContentsapi" then
txtTitle=request("txtTitle")
ddlClass=request("ddlClassId")
if instr(ddlClass,"|")>0 then
ddlClassId=SPLIT(ddlClass,"|")(0)
'ddlClassname=SPLIT(ddlClass,"|")(1)
end if
txtcontent=request("txtcontent")
txtcontent=Replace(txtcontent,"'","")
txtSortId=request("txtSortId")
txtImgUrl=request("txtImgUrl")
rblIsLock=request("rblIsLock")
ctype=0
id=request("id")
if txtTitle="" or txtcontent="" or ddlClassId="" then%>0<%
elseif id="" then
conn.execute("insert into [content] (txtTitle,ddlClassId,txtcontent,txtSortId,rblIsLock,txtImgUrl,ctype,siteid) values('"&txtTitle&"',"&int(ddlClassId)&",'"&txtcontent&"',"&txtSortId&","&rblIsLock&",'"&txtImgUrl&"',0,"&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [content] set txtTitle ='"&txtTitle&"',ddlClassId="&ddlClassId&",txtcontent='"&txtcontent&"',txtSortId="&txtSortId&",rblIsLock="&rblIsLock&",txtImgUrl='"&txtImgUrl&"' where id="&int(id))%>1<%
end if
end if

if a="ibtnMsg" then '评论
id=request("id")
zt=request("zt")
cblItem_0=0
if id<>"" and isnumeric(id) then
if int(zt)=0 then cblItem_0=1
conn.Execute("update [content] set cblItem_0 ="&cblItem_0&" where id="&int(id))%>1<%
else
end if
end if

if a="ibtnTop" then '置顶
id=request("id")
zt=request("zt")
cblItem_1=0
if id<>"" and isnumeric(id) then
if int(zt)=0 then cblItem_1=1
conn.Execute("update [content] set cblItem_1 ="&cblItem_1&" where id="&int(id))%>1<%
else
end if
end if

if a="ibtnRed" then '推荐
id=request("id")
zt=request("zt")
cblItem_2=0
if id<>"" and isnumeric(id) then
if int(zt)=0 then cblItem_2=1
conn.Execute("update [content] set cblItem_2 ="&cblItem_2&" where id="&int(id))%>1<%
else
end if
end if

if a="ibtnHot" then '热点
id=request("id")
zt=request("zt")
cblItem_3=0
if id<>"" and isnumeric(id) then
if int(zt)=0 then cblItem_3=1
conn.Execute("update [content] set cblItem_3 ="&cblItem_3&" where id="&int(id))%>1<%
else
end if
end if

if a="ibtnSlide" then '幻灯
id=request("id")
zt=request("zt")
cblItem_4=0
if id<>"" and isnumeric(id) then
if int(zt)=0 then cblItem_4=1
conn.Execute("update [content] set cblItem_4 ="&cblItem_4&" where id="&int(id))%>1<%
else
end if
end if

'后台添加和编辑会员类型
if a="addgroupapi" then
gname=request("gname")
airp=request("airp")
if instr(airp,"|")>0 then
price1=SPLIT(airp,"|")(1)
end if
haip=request("haip")
if instr(haip,"|")>0 then
price2=SPLIT(haip,"|")(1)
end if
fdq=request("fdq")
id=request("id")
if gname="" or airp="" or haip="" or fdq="" then%>0<%
elseif id="" then
conn.execute("insert into [UserGroup] (gname,airp,haip,fdq,siteid) values('"&gname&"','"&price1&"','"&price2&"','"&fdq&"',"&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [UserGroup] set gname ='"&gname&"',airp ='"&price1&"',haip ='"&price2&"',fdq ='"&fdq&"' where id="&int(id))%>1<%
end if
end if

'后台添加和编辑位置
if a="addpositionapi" then
txtpositionname=request("txtpositionname")
txtsortid=request("txtsortid")
if txtsortid="" or isnull(txtsortid) then txtsortid=0
txtremark=request("txtremark")
id=request("id")
if txtpositionname="" then%>0<%
elseif id="" then
conn.execute("insert into [position] (txtpositionname,txtsortid,txtremark,siteid) values('"&txtpositionname&"',"&txtsortid&",'"&txtremark&"',"&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [position] set txtpositionname ='"&txtpositionname&"',txtsortid ="&txtsortid&",txtremark ='"&txtremark&"' where id="&int(id))%>1<%
end if
end if

'后台添加和编辑内容分类
if a="addChannelapi" then
txtTitle=request("txtTitle")
aid=request("aid")
if aid="" or isnull(aid) then aid=0
txtClassOrder=request("txtClassOrder")
id=request("id")
if txtTitle="" then%>0<%
elseif id="" then
conn.execute("insert into [contentclass] (txtTitle,ctype,class,aid,txtClassOrder,siteid) values('"&txtTitle&"',0,1,"&aid&","&txtClassOrder&","&siteid&")")%>1<%
elseif id<>"" then
conn.Execute("update [contentclass] set txtTitle ='"&txtTitle&"',aid ="&aid&",txtClassOrder ="&txtClassOrder&" where id="&int(id))%>2<%
end if
end if

'系统参数设置
if a="editsysconfigapi" then
txtWebName=request("txtWebName")
txtWebUrl=request("txtWebUrl")
txtFanli=request("txtFanli")
txtFanli2=request("txtFanli2")
txtHuilv=request("txtHuilv")
rbnotice=request("rbnotice")
txtnoticetile=request("txtnoticetile")
txtnoticecontent=request("txtnoticecontent")
txtSysCopyright=request("txtSysCopyright")
txtWebEnglishName=request("txtWebEnglishName")
txtWebTel=request("txtWebTel")
txtKfQQ=request("txtKfQQ")
txtWebFax=request("txtWebFax")
txtWebEmail=request("txtWebEmail")
txtWebCrod=request("txtWebCrod")
txtWebCopyright=Replace(request("txtWebCopyright"),"©","&copy;")
txtWebProSize=request("txtWebProSize")
txtWebNewsSize=request("txtWebNewsSize")
txtWebKeywords=request("txtWebKeywords")
txtWebDescription=request("txtWebDescription")
rblWebLogStatus=request("rblWebLogStatus")
txtWebKillKeywords=request("txtWebKillKeywords")
txtWebFilePath=request("txtWebFilePath")
txtWebFileType=request("txtWebFileType")
txtWebFileSize=request("txtWebFileSize")
rblIsThumbnail=request("rblIsThumbnail")
txtProWidth=request("txtProWidth")
txtProHight=request("txtProHight")
rblIsWatermark=request("rblIsWatermark")
rblWatermarkStatus=request("rblWatermarkStatus")
txtImgQuality=request("txtImgQuality")
txtImgWaterPath=request("txtImgWaterPath")
txtImgWaterTransparency=request("txtImgWaterTransparency")
txtWaterText=request("txtWaterText")
ddlWaterFont=request("ddlWaterFont")
txtFontSize=request("txtFontSize")
conn.Execute("update [webconfig] set txtWebName ='"&txtWebName&"',txtWebUrl='"&txtWebUrl&"',txtFanli='"&txtFanli&"',txtFanli2='"&txtFanli2&"',txtWebTel='"&txtWebTel&"',txtKfQQ='"&txtKfQQ&"',txtWebFax='"&txtWebFax&"',txtWebEmail='"&txtWebEmail&"',txtWebCrod='"&txtWebCrod&"',txtWebCopyright='"&txtWebCopyright&"' where siteid="&siteid)
'conn.Execute("update [webconfig] set txtWebName ='"&txtWebName&"',txtWebUrl='"&txtWebUrl&"',txtFanli="&txtFanli&",txtHuilv="&txtHuilv&",rbnotice="&rbnotice&",txtnoticetile='"&txtnoticetile&"',txtnoticecontent='"&txtnoticecontent&"',txtSysCopyright='"&txtSysCopyright&"',txtWebEnglishName='"&txtWebEnglishName&"',txtWebTel='"&txtWebTel&"',txtKfQQ='"&txtKfQQ&"',txtWebFax='"&txtWebFax&"',txtWebEmail='"&txtWebEmail&"',txtWebCrod='"&txtWebCrod&"',txtWebCopyright='"&txtWebCopyright&"',txtWebProSize="&txtWebProSize&",txtWebNewsSize="&txtWebNewsSize&",txtWebKeywords='"&txtWebKeywords&"',txtWebDescription='"&txtWebDescription&"',rblWebLogStatus="&rblWebLogStatus&",txtWebKillKeywords='"&txtWebKillKeywords&"',txtWebFilePath='"&txtWebFilePath&"',txtWebFileType='"&txtWebFileType&"',txtWebFileSize="&txtWebFileSize&",rblIsThumbnail="&rblIsThumbnail&",txtProWidth="&txtProWidth&",txtProHight="&txtProHight&",rblIsWatermark="&rblIsWatermark&",rblWatermarkStatus="&rblWatermarkStatus&",txtImgQuality="&txtImgQuality&",txtImgWaterPath='"&txtImgWaterPath&"',txtImgWaterTransparency="&txtImgWaterTransparency&",txtWaterText='"&txtWaterText&"',ddlWaterFont='"&ddlWaterFont&"',txtFontSize="&txtFontSize&" where siteid="&siteid)%>1<%
end if

'检查订单包裹
if a="HCheckpackageapi" then
orderno=request("orderid")
strckeck=trim(request("strckeck"))
strckeck=Replace(strckeck,"'","")
strckeck=Replace(strckeck,chr(34),"") '"号
strckeck=Replace(strckeck,"，",",")
strckeck=Replace(strckeck,"/",";")
strckeck=Replace(strckeck,"?",";")
strckeck=Replace(strckeck,chr(9),"") 'Tab空格
strckeck=Replace(strckeck,chr(255),"") '特殊空格
strckeck=Replace(strckeck,chr(32),"") '空格
strckeck=Replace(strckeck,chr(13),";") '回车
strckeck=Replace(strckeck,chr(10),";") '换行
strckeck=Replace(strckeck,"ゴ","")
strckeck=Replace(strckeck,"ガ","")
strckeck=Replace(strckeck,"ギ","")
strckeck=Replace(strckeck,"グ","")
strckeck=Replace(strckeck,"ゲ","")
strckeck=Replace(strckeck,"ザ","")
strckeck=Replace(strckeck,"ジ","")
strckeck=Replace(strckeck,"ズ","")
strckeck=Replace(strckeck,"ヅ","")
strckeck=Replace(strckeck,"デ","")
strckeck=Replace(strckeck,"ド","")
strckeck=Replace(strckeck,"ポ","")
strckeck=Replace(strckeck,"ベ","")
strckeck=Replace(strckeck,"プ","")
strckeck=Replace(strckeck,"ビ","")
strckeck=Replace(strckeck,"パ","")
strckeck=Replace(strckeck,"ヴ","")
strckeck=Replace(strckeck,"ボ","")
strckeck=Replace(strckeck,"ペ","")
strckeck=Replace(strckeck,"ブ","")
strckeck=Replace(strckeck,"ピ","")
strckeck=Replace(strckeck,"バ","")
strckeck=Replace(strckeck,"ヂ","")
strckeck=Replace(strckeck,"ダ","")
strckeck=Replace(strckeck,"ゾ","")
strckeck=Replace(strckeck,"ゼ","")
strckeck=Replace(strckeck,vbcrlf,";")
strckeck=";"&strckeck&";"
strckeck=Replace(strckeck,";;;",";")
strckeck=Replace(strckeck,";;",";")
strckeck=Replace(strckeck,";;",";")
if orderno<>"" then
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [package] where orderno='"&orderno&"'"
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then
do while not chkrs.eof
if instr(strckeck,";"&chkrs("expressno")&";")>0 then
strckeck=Replace(strckeck,";"&chkrs("expressno")&";",";")
else
strckesk=strckesk&";"&chkrs("expressno")
end if
chkrs.movenext
Loop
strckeck=left(strckeck,len(strckeck)-1)
st=Replace(strckeck,";",","&"多了")&Replace(strckesk,";",","&"少了")
if left(st,1)="," then st=right(st,len(st)-1) '去掉第一个
if st="" then st="一切正常"
st=Replace(st,",",vbcrlf)
%><%=st%><%else%>0<%end if
chkrs.close
set chkrs=nothing
end if
end if

'修改订单信息
if a="editorderDetailapi" then
consignee=request("consignee")
tel=request("tel")
telephone=request("telephone")
postcode=request("postcode")
address=request("address")
email=request("email")
country=request("country")
if instr(country,"|")>0 then
countryid=SPLIT(country,"|")(0)
countryname=SPLIT(country,"|")(1)
end if
goodtype=request("goodtype")
postway=request("postway")
if instr(postway,"|")>0 then
postwayid=SPLIT(postway,"|")(0)
postwayname=SPLIT(postway,"|")(1)
end if
ordertype=request("ordertype")
oldordertype=request("oldordertype")
fw2=request("fw2")
if fw2 then
fw2=1
else
fw2=0
end if
fw3=request("fw3")
if fw3 then
fw3=1
else
fw3=0
end if
fw4=request("fw4")
if fw4 then
fw4=1
else
fw4=0
end if
fw6=request("fw6")
if fw6 then
fw6=1
else
fw6=0
end if
fw7=request("fw7")
if fw7 then
fw7=1
else
fw7=0
end if
orderno=request("orderno")
backurl=request("backurl")
if (instr(power,"editOrderListDetail")>0 and oldordertype=0) or (instr(power,"haieditOrderListDetail")>0 and oldordertype=1) then '权限检查
conn.Execute("update [Order] set consignee = '"&consignee&"',tel= '"&tel&"',telephone= '"&telephone&"',postcode= '"&postcode&"',address= '"&address&"',email= '"&email&"',countryname='"&countryname&"',countryid= "&countryid&",ordertype= "&ordertype&",goodtype= "&goodtype&",postwayid= "&postwayid&",postwayname= '"&postwayname&"',fw2= "&fw2&",fw3= "&fw3&",fw4= "&fw4&",fw6= "&fw6&",fw7= "&fw7&" where orderno='"&orderno&"' and siteid="&siteid)
if ordertype<>oldordertype then conn.Execute("update [package] set packagetype="&ordertype&" where siteid="&siteid&" and orderno='"&orderno&"'")%>{"status":"true","Word":"修改成功。","gourl":"<%=backurl%>","fail":""}<%else%>{"status":"true","Word":"修改失败。","gourl":"<%=backurl%>","fail":"Y"}<%end if
end if

'添加国际运单及打包信息
if a="adddelivelyapi" then
txtweight=request("txtweight")
txtdeliverysize=request("txtdeliverysize")
txtvolume_weight=request("txtvolume_weight")
ddldelively=request("ddldelively_name")
if instr(ddldelively,"|")>0 then
ddldelively_id=SPLIT(ddldelively,"|")(0)
ddldelively_name=SPLIT(ddldelively,"|")(1)
end if
txtexpressno=chkstr(request("txtexpressno"))
rblUserType=request("rblUserType")
countway=request("countway")
txtservice_fee=request("txtservice_fee")
txtdelive_fee=request("txtdelive_fee")
txtcostmoney=request("txtcostmoney")
DropDownList1=request("DropDownList1")
DropDownList2=request("DropDownList2")
if int(DropDownList1)<>1 then tsql=",atime"&DropDownList1&"=getdate()"
txtmoto=request("txtmoto")
userid=request("userid")
orderno=request("orderno")
backurl=request("backurl")
if instr(cwadmin,"|"&adminid&"|")=0 and int(DropDownList1)=5 then%>{"status":"true","Word":"越权操作，修改失败。","gourl":"<%=backurl%>","fail":"Y"}<%
Response.end
end if
if txtweight<>"" and isnumeric(txtweight) and userid<>"" and isnumeric(userid) then
userinfo=getuseridinfo(userid)
if ubound(split(userinfo,"|"))>4 then
userid=SPLIT(userinfo,"|")(0)
salename=SPLIT(userinfo,"|")(1)
saleid=int(SPLIT(userinfo,"|")(2))
aename=SPLIT(userinfo,"|")(3)
aeid=int(SPLIT(userinfo,"|")(4))
email=SPLIT(userinfo,"|")(5)
end if
if txtexpressno<>"" and userid<>"" then
if chkddelively(txtexpressno,userid) then
conn.Execute("update [Order] set ddlProperty="&DropDownList1&tsql&",txtexpressno= '"&txtexpressno&"',txtweight="&txtweight&",txtvolume_weight= "&txtvolume_weight&",zfee= "&CCur(txtservice_fee)+CCur(txtdelive_fee)&",zcost= "&txtcostmoney&",txtmoto='"&txtmoto&"' where orderno='"&orderno&"' and siteid="&siteid)
conn.Execute("update [delively] set txtweight="&txtweight&",txtdeliverysize='"&txtdeliverysize&"',txtvolume_weight= "&txtvolume_weight&",ddldelively_name='"&ddldelively_name&"',ddldelively_id="&ddldelively_id&",rblUserType= "&rblUserType&",countway= "&countway&",txtservice_fee="&txtservice_fee&",txtcostmoney="&txtcostmoney&",txtmoto='"&txtmoto&"' where orderno='"&orderno&"' and txtexpressno='"&txtexpressno&"' and siteid="&siteid)
else
conn.execute("insert into [delively] (orderno,txtweight,txtdeliverysize,txtvolume_weight,ddldelively_name,ddldelively_id,txtexpressno,rblUserType,countway,txtservice_fee,txtdelive_fee,txtcostmoney,txtmoto,userid,salename,saleid,aename,aeid,siteid) values('"&orderno&"',"&txtweight&",'"&txtdeliverysize&"',"&txtvolume_weight&",'"&ddldelively_name&"',"&ddldelively_id&",'"&txtexpressno&"',"&rblUserType&","&countway&","&txtservice_fee&","&txtdelive_fee&","&txtcostmoney&",'"&txtmoto&"','"&userid&"','"&salename&"',"&saleid&",'"&aename&"',"&aeid&","&siteid&")") 
conn.Execute("update [Order] set ddlProperty="&DropDownList1&tsql&",txtexpressno= '"&txtexpressno&"',txtweight="&txtweight&",txtvolume_weight= "&txtvolume_weight&",zfee= "&CCur(txtservice_fee)+CCur(txtdelive_fee)&",zcost= "&txtcostmoney&",txtmoto='"&txtmoto&"' where orderno='"&orderno&"' and siteid="&siteid)
end if
else
conn.Execute("update [Order] set ddlProperty="&DropDownList1&tsql&",txtmoto='"&txtmoto&"' where orderno='"&orderno&"' and siteid="&siteid)
end if
if DropDownList1=2 then conn.execute("update [package] set jzt=1 where orderno='"&orderno&"' and jzt=0 and siteid="&siteid) '更新订单的已到和未到包裹为待拣货状态
if DropDownList1=3 then conn.execute("update [package] set jzt=9 where orderno='"&orderno&"' and statustext=2 and siteid="&siteid) '更新订单的已到包裹为拣货完成
if DropDownList1=1 and DropDownList2=2 then conn.execute("update [package] set jzt=0 where orderno='"&orderno&"' and jzt=1 and siteid="&siteid) '更新待拣货状态包裹为无需处理,已拣货包裹不再提示
if DropDownList1=5 then conn.execute("update [package] set statustext=3,atime3=getdate(),jzt=9 where orderno='"&orderno&"' and statustext=2 and siteid="&siteid) '更新已到包裹为已出货,拣货完成，未到包裹暂未处理
if DropDownList1=5 then conn.Execute("update [Order] set atime4=atime5 where orderno='"&orderno&"' and atime4 is null and siteid="&siteid) '未有付款时间的订单自动以发货时间作为已付款时间
'if DropDownList1=4 and DropDownList2=5 then conn.execute("update [package] set statustext=2 where orderno='"&orderno&"' and siteid="&siteid) '更新包裹为收到未出货
%>{"status":"true","Word":"修改成功。","gourl":"<%=backurl%>","fail":""}<%else%>{"status":"true","Word":"修改失败。","gourl":"<%=backurl%>","fail":"Y"}<%end if
end if

'删除国际运单及打包信息
if a="deldelivelyapi" then
id=request("id")
orderno=request("orderno")
txtexpressno=request("txtexpressno")
userid=request("userid")
if orderno<>"" and id<>"" then
conn.Execute("delete from [delively] where id="&int(id)&" and siteid="&siteid)
conn.Execute("update [Order] set txtexpressno= '',txtweight=0,zfee= 0,zcost= 0 where orderno='"&orderno&"' and siteid="&siteid)
%>{"status":"true","Word":"删除成功。","gourl":"<%=backurl%>","fail":""}<%else%>{"status":"true","Word":"数据错误！","gourl":"<%=backurl%>","fail":"Y"}<%end if
end if

'仓库添加包裹
if a="packageinitalapi" then
express=request("expressid")
if instr(express,"|")>0 then
expressid=SPLIT(express,"|")(0)
expressname=SPLIT(express,"|")(1)
end if
expressno=chkstr(request("expressno"))
weight=chkstr(request("weight"))
volumweight=chkstr(request("volume_weight"))
position=request("position")
packageremark=request("packageremark")
Response.Cookies("admin")("expressid")=expressid
Response.Cookies("admin")("position")=position
if expressid="" or expressno="" or instr(expressno,".")>0 or weight="" or volumweight="" or position="" then%>数据异常<%elseif chkposition(position)=false and position<>"0" then%>2<%'位置不存在
elseif packagechk(expressno,expressid,2) then '已到库存在包裹
if packageremark<>"" then
conn.Execute("update [package] set positionname='"&position&"',packageremark='"&packageremark&"' where expressno='"&expressno&"' and siteid="&siteid) '已到库再次更新包裹，只更新位置(用于位置调整) and expressid="&expressid&"%>0<%
else
conn.Execute("update [package] set positionname='"&position&"' where expressno='"&expressno&"' and siteid="&siteid) '已到库再次更新包裹，只更新位置(用于位置调整) and expressid="&expressid&"%>0<%
end if
elseif packagechk(expressno,expressid,0) then
if packageremark<>"" then
conn.Execute("update [package] set atime2 = getdate(),statustext=2,weight="&weight&",volumweight="&volumweight&",positionname='"&position&"',packageremark='"&packageremark&"' where expressno='"&expressno&"' and siteid="&siteid) '新到库更新包裹 and expressid="&expressid&"
else
conn.Execute("update [package] set atime2 = getdate(),statustext=2,weight="&weight&",volumweight="&volumweight&",positionname='"&position&"' where expressno='"&expressno&"' and siteid="&siteid) '新到库更新包裹 and expressid="&expressid&"
end if
conn.Execute("update [package] set expressid="&expressid&",expressname='"&expressname&"' where expressno='"&expressno&"' and expressid=0 and siteid="&siteid) '修正有误的快递公司名称%>1<%
else
if packageremark<>"" then
conn.execute("insert into [package] (atime2,expressid,expressname,expressno,weight,volumweight,statustext,positionname,packageremark,siteid) values(getdate(),"&expressid&",'"&expressname&"','"&expressno&"',"&weight&","&volumweight&",2,'"&position&"','"&packageremark&"',"&siteid&")") '新到库新增包裹
else
conn.execute("insert into [package] (atime2,expressid,expressname,expressno,weight,volumweight,statustext,positionname,siteid) values(getdate(),"&expressid&",'"&expressname&"','"&expressno&"',"&weight&","&volumweight&",2,'"&position&"',"&siteid&")") '新到库新增包裹
end if%>1<%end if
end if

'编辑包裹
if a="packageeditapi" then
id=request("packageid")
express=request("express")
if instr(express,"|")>0 then
expressid=SPLIT(express,"|")(0)
expressname=SPLIT(express,"|")(1)
end if
weight=request("weight")
volumweight=request("volume_weight")
position=request("position")
statustext=request("statustext")
packageremark=request("packageremark")
if id="" or expressid="" or weight="" or volumweight="" or statustext="" then
zt=3
elseif packageidchk(id)=false then
zt=0
else
conn.Execute("update [package] set expressid = "&expressid&",expressname='"&expressname&"',weight="&weight&",volumweight="&volumweight&",positionname='"&position&"',statustext="&statustext&",packageremark='"&packageremark&"' where id="&id&" and siteid="&siteid)
'conn.Execute("update [package] set orderno='',txtgoodname = '"&txtgoodname&"',txtCount="&txtCount&",txtprice="&txtprice&",packagetype="&packagetype&",packageremark='"&packageremark&"' where id="&id&" and statustext=0 and siteid="&siteid&" and packagetype<>"&packagetype&" and userid="&userid)
zt=1
end if
%><%=zt%><%end if

'删除包裹
if a="delpackageapi" then
id=int(request("id"))
orderno=request("orderno")
if id="" or id=0 or orderno="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("delete from [package] where statustext<2 and id="&id&" and siteid="&siteid) '直接删除未到包裹
conn.execute("update [package] set userid='',orderno='' where statustext=2 and id="&id&" and siteid="&siteid) '只更新包裹为无归属
conn.Execute("update [Order] set SpNum=SpNum-1 where orderno='"&orderno&"' and siteid="&siteid)
%>{"status":"true","Word":"删除成功！","gourl":"","fail":""}<%
end if
end if

'删除用户
if a="deluserapi" then
id=int(request("id"))
if id="" or id=0 then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("delete from [member] where (rblIsLock=1 or rblIsLock=0) and id="&id&" and siteid="&siteid)
%>{"status":"true","Word":"删除成功！","gourl":"","fail":""}<%
end if
end if

'设为无效包裹
if a="wxPackageapi" then
id=int(request("id"))
if id="" or id=0 then%><%else
conn.execute("update [package] set statustext=4 where id="&id&" and siteid="&siteid) '只更新包裹为无效包裹
%>1<%
end if
end if

'包裹拣货
if a="packagejhapi" then
positionname=request("positionname")
packagelist=request("packagelist")
packagetype=request("packagetype")
if positionname="" or packagelist="" then
zt=3
elseif getpacksum(positionname,1,packagetype)=0 then
zt=0
else
conn.Execute("update [package] set jzt=9,jtime=getdate() where jzt=1 and positionname='"&positionname&"' and siteid="&siteid)
zt=1
end if
%><%=zt%><%end if

'后台添加包裹，更新归属
if a="packageaddapi" then
expressno=chkstr(request("expressno"))
orderno=request("orderno")
userid=request("userid")
ordertype=request("ordertype")
express=getexpress(expressno)
if instr(express,"|")>0 then
expressid=split(express,"|")(0)
expressname=split(express,"|")(1)
end if
if expressno="" or orderno="" or expressid="" or userid="" or ordertype="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%elseif packagechk(expressno,expressid,1) then
conn.execute("update [package] set userid='"&userid&"',orderno='"&orderno&"',packagetype="&ordertype&",atime=getdate() where expressno='"&expressno&"' and siteid="&siteid) '只更新包裹为无归属
conn.Execute("update [Order] set SpNum=SpNum+1,packStat=0 where orderno='"&orderno&"' and siteid="&siteid)
%>{"status":"true","Word":"添加成功！","gourl":"","fail":""}<%else%>{"status":"true","Word":"添加失败！","gourl":"","fail":"true"}<%
end if
end if

'后台包裹状态检查
if a="chkpackagestatus" then
expressno=chkstr(request("expressno"))
if expressno<>"" then
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [package] where expressno='"&expressno&"' and statustext>1"
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then%>[{"res":1,"msg":"包裹单号存在！"}]<%else%>[{"res":0,"msg":"新到包裹！"}]<%end if
chkrs.close
set chkrs=nothing
end if
end if

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
conn.execute "delete from [package] where id in ("&strdel&")"
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
%>{"status":"true","Word":"设置默认地址成功！","gourl":"/user.html?act=address_list","fail":""}<%
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
%>{"status":"true","Word":"删除成功！","gourl":"/user.html?act=address_list","fail":""}<%
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