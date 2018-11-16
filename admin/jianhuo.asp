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
end if%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	包裹拣货
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<script src="/js/artDialog.js?skin=idialog"></script>
<script src="/js/iframeTools.js?skin=idialog"></script>
<script>
    function eidtpackage(id) {
        //        art.dialog({ id: 'send_card_ok', title: '添加成功', content: document.getElementById('send_card_ok'), lock: true, fixed: true });       
        art.dialog.open('editpackage' + id, { title: '修改', lock: true, fixed: true });
		//window.open("/admin/editpackage" + id); 
        // $('#send_card_ok').dialog({
        //                    title:"添加成功",
        //                    width:500,
        //                    modal:true,
        //                    draggable:false,
        //                    resizable: false
        //   });
    }
    function CloseEditPage() {
        document.location.reload();
    }
</script>

<style type="text/css">
.printtable {
	margin:20px;
	width:95%;
	border:1px solid #999;
	/*border-top:1px solid #999;*/
	display:inline-block;
}
.printtable th {
	text-align:left;
	background: #09C;
	padding:10px;
	color:#EAEAEA;
}
.printtable li {
	text-align:left;
	padding:5px;
	margin:5px;
    display:inline-block;
    width:118;
    font-size:16px;
    height: 30px;
    line-height: 30px;
}
.printtable li span {
	cursor:pointer;
}
</style>
</head>
<body style="padding:10px;">
<%positionname=chkstr(Request("positionname"))
if positionname<>"" then osql=" and txtpositionname='"&positionname&"'"
if instr(a,"airorder")>0 then
psql=" and packagetype=0"
packagetype=0
end if
if instr(a,"haiorder")>0 then
psql=" and packagetype=1"
packagetype=1
end if
Set rs = Server.CreateObject("ADODB.Recordset")
sql="Select distinct positionname from [package] where jzt=1 and siteid="&siteid&psql
rs.open sql,conn,1,1
ct = rs.Recordcount
if not rs.eof then
i=0
do while not rs.eof
if i=0 and rs("positionname")<>"" then
positionlist="|"&rs("positionname")&"|"
else
positionlist=positionlist&rs("positionname")&"|"
end if
i=i+1
rs.movenext
loop
end if
rs.close
set rs=nothing
set rs=server.createobject("adodb.recordset")
exec="select * from [position] where siteid="&siteid&osql&" order by txtsortid asc"		
rs.open exec,conn,1,1
rssum=rs.recordcount%>
    <div class="navigation">
      <span class="back"><a href="/admin/Order_List">返回管理列表</a></span><b>您当前的位置：首页 &gt; 运单管理 &gt; 包裹拣货</b>
    </div>
    <div style="padding-bottom:10px;"></div>
          <div class="position">
          <div cellspacing="0" cellpadding="0" class="printtable"><ul><%if rssum>0 then
s=0
for i=1 to rssum
jhsum=0
if instr(a,"_jh")>0 and instr(positionlist,"|"&rs("txtpositionname")&"|")>0 then jhsum=getpacksum(rs("txtpositionname"),1,packagetype)
if instr(a,"_all")>0 then jhsum=getpacksum(rs("txtpositionname"),0,packagetype)
if (instr(a,"_jh")>0 and jhsum>0) or instr(a,"_all")>0 then
s=s+1%><li><span><a href="javascript:void(0)"<%if instr(a,"_jh")>0 then%> onClick="eidtpackage('<%=rs("id")&"_"&packagetype%>')"<%end if%>><%=rs("txtpositionname")%></a></span><%if instr(a,"_jh")>0 then%>(<font color="red"><%=jhsum%></font>)<%end if%><%if instr(a,"_all")>0 then%>(<font color="<%if jhsum>8 then%>red<%else%>blue<%end if%>"><%=jhsum%></font>)<%end if%></li><%end if%><%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
if s=0 then%><li><span>无处理中订单 或 包裹拣货已完成。</span></li><%end if
end if%></ul>  <br /></div>
</div>
</body>
</html>
