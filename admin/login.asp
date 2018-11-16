<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><!--#include file="../md5.asp"--><%teh=chkadmin()
if teh<>"" then admin=SPLIT(teh,"&")(0)
vcode=Session("code")
txtcode=Request("txtcode")
txtName=Request("txtName")
txtPwd=Request("txtPwd")
errn=Session("errn")
act=Request("act")
if act="logout" then
Response.Cookies("teh")("token")=""
Session("admin")=""
Session("sname")=""
Session("power")=""
Session("atype")=""
Response.Cookies("admin")("token")=""
Session("errn")=0
end if
if admin<>"" and isnull(admin)=false then Response.Redirect("/admin/")
if errn="" or isnull(errn) then errn=0
if admin="" and txtName<>"" and txtPwd<>"" and txtcode<>"" then
if UCase(txtcode)<>vcode or txtcode="" then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('请填写正确的验证码。');history.go(-1);</Script></body></html>"
else
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [admin] where txtUserName='"&txtName&"' and txtUserPwd='"&md5(txtPwd)&"'"
chkrs.open chkql,conn,1,1
'Response.Write txtName&md5(txtPwd)&chkql
'Response.end
if not (chkrs.bof and chkrs.eof) then
txtUserName=chkrs("txtUserName")
txtReadName=chkrs("txtReadName")
power=chkrs("power")
rblUserType=chkrs("rblUserType")
adminid=chkrs("id")
Session("adminid")=adminid
Session("admin")=txtUserName
Session("sname")=txtReadName
Session("power")=power
Session("atype")=rblUserType
Response.Cookies("admin").Expires=DateAdd("m",60,now()) 
Response.Cookies("admin")("token")=base64Encode(txtUserName&"&"&txtReadName&"&"&rblUserType&"&"&power&"&"&siteid&"&"&adminid)
Session("errn")=0
Response.Redirect("/admin")
else
Session("errn")=errn+1
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('账户或密码错误。');history.go(-1);</Script></body></html>"
end if
chkrs.close
set chkrs=nothing
end if
end if%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title><%=SiteName%>管理系统</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<STYLE type=text/css>BODY {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</STYLE>

<meta content="MSHTML 6.00.6000.16809" name="GENERATOR" /></head>
<body>
<form name="login_form" method="post" action="/admin/login" id="login_form">
<DIV>
<SCRIPT type="text/javascript">
<!--
    function WebForm_OnSubmit() {
        if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
        return true;
    }
// -->
</SCRIPT>

<DIV>
<DIV id="div1" 
style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>
<DIV id="div2" 
style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>
<SCRIPT language="JavaScript">
    var speed = 20;
    var temp = new Array();
    var clipright = document.body.clientWidth / 2, clipleft = 0
    for (i = 1; i <= 2; i++) {
        temp[i] = eval("document.all.div" + i + ".style");
        temp[i].width = document.body.clientWidth / 2;
        temp[i].height = document.body.clientHeight;
        temp[i].left = (i - 1) * parseInt(temp[i].width);
    }
    function openit() {
        clipright -= speed;
        temp[1].clip = "rect(0 " + clipright + " auto 0)";
        clipleft += speed;
        temp[2].clip = "rect(0 auto auto " + clipleft + ")";
        if (clipright <= 0)
            clearInterval(tim);
    }
    tim = setInterval("openit()", 100);
                </SCRIPT>
<DIV>
<TABLE cellSpacing="0" cellPadding="0" width="900" align="center" border="0">
  <TBODY>
  <TR>
    <TD style="HEIGHT: 105px"><IMG src="/admin/images/login_1.gif" 
  border="0"></TD></TR>
  <TR>
    <TD background="/admin/images/login_2.jpg" height="300">
      <TABLE height="300" cellPadding="0" width="900" border="0">
        <TBODY>
        <TR>
          <TD colSpan="2" height="35"></TD></TR>
        <TR>
          <TD width=360></TD>
          <TD>
            <TABLE cellSpacing="0" cellPadding="2" border="0">
              <TBODY>
              <TR>
                <TD style="HEIGHT: 28px" width="80">登 录 名：</TD>
                <TD style="HEIGHT: 28px" width="150"><input name="txtName" type="text" id="txtName" style="WIDTH: 130px" /></TD>
                <TD style="HEIGHT: 28px" width=370><SPAN                  
                  style="FONT-WEIGHT: bold; VISIBILITY: hidden; COLOR: white">请输入登录名</SPAN></TD></TR>
              <TR>
                <TD style="HEIGHT: 28px">登录密码：</TD>
                <TD style="HEIGHT: 28px"><input name="txtPwd" type="password" id="txtPwd" style="width: 130px" /></TD>
                <TD style="HEIGHT: 28px"><SPAN 
                  style="FONT-WEIGHT: bold; VISIBILITY: hidden; COLOR: white">请输入密码</SPAN></TD></TR>
              <TR>
                <TD style="HEIGHT: 28px">验证码：</TD>
                <TD style="HEIGHT: 28px"><input name="txtcode" type="text" id="txtcode" style="width: 130px" /></TD>
                <TD style="HEIGHT: 28px">
							<img id="log-valid-img" style="margin-left:65px; padding-top:3px; cursor:pointer;" src="/code" title="看不清？点击换一张" onClick="document.getElementById('log-valid-img').src+='?random='+Math.random()" width="80">
                  </TD></TR>
              <TR>
                <TD style="HEIGHT: 18px"></TD>
                <TD style="HEIGHT: 18px"></TD>
                <TD style="HEIGHT: 18px"></TD></TR>
              <TR>
                <TD></TD>
                <TD><input type="image" name="btnlogin" id="btnlogin" src="/admin/images/login_button.gif" style="border-width:0px;" />
              </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG src="/admin/images/login_3.jpg" 
border=0></TD></TR></TBODY></TABLE></DIV></DIV>
    
</form>
</body>
</html>
