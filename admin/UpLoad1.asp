<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../adminconfig.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
sname=SPLIT(teh,"&")(1)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
adminid=SPLIT(teh,"&")(5)
if adminid="" or isnull(adminid) then adminid=0
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="仓库管理员"
if atype=3 then ttype="业务员"
if atype=5 then ttype="财务"
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if atype=1 or instr(power,"viewArticle")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('你无权上传图片！');window.close();</Script></body></html>"
Response.end
end if%><!--#include file="upload.inc"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
td{font-size:9pt;line-height:120%;color:#353535} 
body{font-size:9pt;line-height:120%} 

a:link          { color: #000000; text-decoration: none }
a:visited       { color: #000000; text-decoration: none }
a:active        { color: #000000; text-decoration: none }
a:hover         { color: #336699; text-decoration: none; position: relative; right: 0px; top: 1px }
</style>
<%
set upload=new upload_file
if upload.form("act")="uploadfile" then
	filepath=trim(upload.form("filepath"))
	
	i=0
	for each formName in upload.File
		set file=upload.File(formName)
 
 fileExt=lcase(file.FileExt)	'得到的文件扩展名不含有.
 if file.filesize<100 then
 	response.write "<span style=""font-family: 宋体; font-size: 9pt"">请先选择你要上传的文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
	response.end
 end if

if fileext<>"gif" and fileext<>"jpg" and fileext<>"jpeg" and  fileext<>"png" then
		response.write "<span style=""font-family: 宋体; font-size: 9pt"">只能上传jpg或jpeg或gif或png格式的图片！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
		response.end
     end if
		
if file.filesize>(1000*1024) then
		response.write "<span style=""font-family: 宋体; font-size: 9pt"">最大只能上传 1000K 的图片文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
		response.end
end if 

 randomize
 ranNum=int(90000*rnd)+10000
 set fso = server.CreateObject("Scripting.FileSystemObject") 
 if int(month(now))<10 then
  filenamepath = "/upfile/"&year(now)&"0"&month(now)&"/"
 else
 filenamepath = "/upfile/"&year(now)&month(now)&"/"
 end if
if fso.FolderExists(server.MapPath(filenamepath)) then
 

 

else
  fso.CreateFolder(server.MapPath(filenamepath)) 
end if
set fso = nothing
 filename=filenamepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
 filenamelst=filenamepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
  file.SaveToFile Server.mappath(FileName)
  if upload.form("set2")<>"" then
   response.write "<script>window.opener.document.all."&upload.form("set2")&".src='"&filenamelst&"'</script>"
 end if
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&filenamelst&"'</script>"
  'response.end
%>
<script language="javascript">
//window.alert("文件上传成功!");
window.close();
</script>
<%
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>