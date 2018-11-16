<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.CodePage=65001%><!--#include file="conn.asp"-->
<!--#include file="config.asp"--><!--#include file="jsonParse.asp"--><!--#include file="upload_wj.asp"-->
<%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="仓库管理员"
if atype=3 then ttype="业务员"
power=SPLIT(teh,"&")(3)
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")%>
<%const upload_type=0  	 '上传方法：0=无惧无组件上传类，1=FSO上传 2=lyfupload，3=aspupload，4=chinaaspupload
const MaxFileSize=50000        '上传文件大小限制
Const UpFileType="jpg|png|gif|jpeg"        '允许的上传文件类型
dim upload,file,formName,SavePath,filename,fileExt
dim upNum
dim EnableUpload
dim Forumupload
dim ranNum
dim uploadfiletype
dim msg,founderr
msg=""
founderr=false
EnableUpload=false
SavePath = "uploadxsl"   '存放上传文件的目录
if right(SavePath,1)<>"/" then SavePath=SavePath&"/" '在目录后加(/)
	select case upload_type
	  case 0
		call upload_0()  '使用化境无组件上传类
	  case else
		'response.write "本系统未开放插件功能"
		'response.end
	end select
sub upload_0()    '使用化境无组件上传类
	set upload=new upload_file    '建立上传对象
	for each formName in upload.file '列出所有上传了的文件
		set file=upload.file(formName)  '生成一个文件对象
		if file.filesize<100 then
 			msg="请先选择你要上传的文件！"
			founderr=true
		end if
		if file.filesize>(MaxFileSize*1024) then
 			msg="文件大小超过了限制，最大只能上传" & CStr(MaxFileSize) & "K的文件！"
			founderr=true
		end if

		fileExt=lcase(file.FileExt)
		Forumupload=split(UpFileType,"|")
		for i=0 to ubound(Forumupload)
			if fileEXT=trim(Forumupload(i)) then
				EnableUpload=true
				exit for
			end if
		next
		if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" or fileEXT="php" then
			EnableUpload=false
		end if
		if EnableUpload=false then
			msg="这种文件类型不允许上传！\n\n只允许上传这几种文件类型：" & UpFileType
			founderr=true
		end if
		if fileEXT<>"xsl" then SavePath = "UpLoadFiles/" '非xsl存放上传文件的目录
		if founderr<>true then
			randomize
			ranNum=int(900*rnd)+100
			filename=SavePath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
			file.SaveToFile Server.mappath(FileName)   '保存文件
filename1=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt	
	'	   set rs=server.createobject("adodb.recordset")
        '   sql="select * from uploadpic" 
        '   rs.open sql,dataconn,1,3
        '   rs.addnew
        '   rs("picname")=filename1
        '   username=session("usersessionname")
        '   rs("username")=username
        '   rs.update
        '   rs.close
         '  set rs=nothing
         '  dataconn.close
         '  set dataconn=nothing
			msg="上传文件成功！"
		end if
	  	if msg="上传文件成功！" then
		Session("MultipleUpload")=filename
		response.write "{""msg"": 1, ""msbox"": ""/"&Replace(filename,"uploadxsl","UpLoadFiles")&"""}"
		else
		response.write "{""msg"": 0, ""msbox"": """&msg&"""}"
		end if
		set file=nothing
	next
	set upload=nothing
end sub%>