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
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if%>
<%Dim uppath,filelx,formName,EditName
uppath="/upfile/"
formName=FormatSQL(SafeRequest("formName",0))
EditName=FormatSQL(SafeRequest("EditName",0))
set2=FormatSQL(SafeRequest("set2",0))
%>
<html>
<head>
<title>图片上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
td{font-size:12px}
a{color:#000000;text-decoration: none}
a:hover{text-decoration: underline}
.tx{height:16px;width:30px;border-color:black black #000000;border-top-width:0px;border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; font-size: 12px; background-color: #eeeeee; color: #0000FF}
.button{font-size:12px;border-top-width:0px;border-right-width:0px;border-bottom-width:0px;border-left-width: 0px; height: 16px; width: 80px; background-color: #eeeeee; cursor: hand}
.tx1{height:20px;width:30px;font-size:12px;border:1px solid;border-color:black black #000000;color: #0000FF}
-->
</style>
<script language="javascript">
<!--
function mysub()
{
		esave.style.visibility="visible";
}
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="upload.asp" enctype="multipart/form-data" >
  <div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
    <TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
      <TR><td width=20%></td>
	<TD bgcolor=#104A7B width="60%"> 
	<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
	<TR> 
	          <td bgcolor=#eeeeee align=center><font color=red>正在上传文件，请稍候...</font></td>
	</tr>
	</table>
	</td><td width=20%></td>
	</tr></table></div>
  <table width="400" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#6699ff">
    <tr> 
      <td height="22" align="left" valign="middle" width="400">&nbsp;图片上传 
        <input type="hidden" name="filepath" value="<%=uppath%>">
        <input type="hidden" name="filelx" value="<%=filelx%>">
        <input type="hidden" name="EditName" value="<%=EditName%>">
        <input type="hidden" name="FormName" value="<%=formName%>">
		<input type="hidden" name="set2" value="<%=set2%>">
        <input type="hidden" name="act" value="uploadfile">
      </td>
    </tr>
    <tr align="center" valign="middle" bgcolor="#FFFFFF"> 
      <td align="left" id="upid" height="80" width="400"> 选择文件: 
        <input type="file" name="file1" style="width:318px" class="tx1" value="">
      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td height="24" width="400"> 
        <input type="submit" name="Submit" value="上传 " class="button" onClick="javascript:mysub()">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
