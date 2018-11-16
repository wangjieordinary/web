<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
end if
a=Request("a")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if instr(power,"viewOrderSendList")>0 or instr(power,"haiviewOrderSendList")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('没有订单查看权限。');history.go(-1);</Script></body></html>"
Response.end
end if
str=request("id")
if ubound(split(str,"_"))=1 then
id=int(split(str,"_")(0))
packagetype=split(str,"_")(1)
else
id=int(str)
end if
if id>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [position] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
positionname=rs("txtpositionname")
rs.close
set rs=nothing
end if
end if%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Keywords" content="" />
<meta name="Description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<script type="text/javascript" src="/Js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/Js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/Js/messages_cn.js"></script>
<script type="text/javascript" src="/js/focus.js"></script>
<script type="text/javascript" src="/Js/checksearch.js"></script>
<script type="text/javascript" src="/Js/function.js"></script>
<script type="text/javascript" src="/js/utils.js"></script>
<script type="text/javascript" src="/admin/js/editpackage.js"></script>
<script src="/js/artDialog.js?skin=idialog"></script>
<script src="/js/iframeTools.js?skin=idialog"></script>
<title>包裹拣货 - </title>
<style type="text/css">
.STYLE1 {font-size:16px;}
.STYLE2 {font-size:14px; line-height:20px; color:blue}
</style>
</head>
<body>
  
  <table width="100%" cellspacing="0" cellpadding="5" bgcolor="#ffffff" border="0" align="center" style="font-size:12px;width:550px;">
        <tbody>
		   <tr>
            <td align="center" height="30"><span class="STYLE1">拣货说明：</span></td>
            <td width="80%"><span class="STYLE1"><font color="red">确认已拣出所有显示包裹后点击"拣货完成"</font></span>
		   </td></tr>
		   <tr>
            <td align="center" height="30"><span class="STYLE1">拣货位置：</span></td>
            <td width="80%"><span class="STYLE1"><b><%=positionname%></b></span></td></tr>		
<%set rs=server.createobject("adodb.recordset")
if packagetype<>"" then psql=" and packagetype="&int(packagetype)
exec="select * from [package] where siteid="&siteid&" and positionname='"&positionname&"'"&psql&" and jzt=1 order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount%>        <tr>
          <td align="center" height="100"><span class="STYLE1">需拣包裹：<BR /><BR /><b><font color="blue"><%=rssum%></font></b> 个</span></td>
          <td valign="top"><span class="STYLE2">
<%if rssum>0 then
for i=1 to rssum
if i=1 then
packagelist=rs("expressno")
else
packagelist=packagelist&","&rs("expressno")
end if%><%if rs("packagetype")=0 then%>空 <%end if%><%if rs("packagetype")=1 then%>海 <%end if%><%=rs("expressno")%>［<%=rs("expressname")%>］<%if rs("orderno")<>"" and isnull(rs("orderno"))=false and rs("userid")<>"" and isnull(rs("userid"))=false then%><%=rs("orderno")%>［<%=getuserno(rs("userid"))%>］<%end if%><br />
<%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%></span></td>
        </tr>
        <tr height="50">        
          <td align="center" colspan="2">
           <input name="positionname" id="positionname" type="hidden" value="<%=positionname%>"/>
          <input type="submit" name="submit" id="packagesubmit" class="bnt_blue_1" onClick="editpackage();" style="font-size:14px; cursor:pointer" value="拣货完成"/>
          <input name="act" type="hidden" value="viewflow"/><input name="packagelist" type="hidden" value="<%=packagelist%>" id="packagelist" />
          <input name="packagetype" type="hidden" value="<%=packagetype%>" /><input name="step" type="hidden" value="addorder" />
          </td>
        </tr>
      </tbody></table>
<script type="text/javascript" src="/js/fmsg.js"></script>
<link href="/css/fmsg.css" rel="stylesheet" type="text/css" />
</body>
</html>