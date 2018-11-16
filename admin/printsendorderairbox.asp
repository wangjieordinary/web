<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
end if
id=int(Request("id"))
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if instr(power,"viewOrderSendList")>0 or instr(power,"haiviewOrderSendList")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('没有订单查看权限。');history.go(-1);</Script></body></html>"
Response.end
end if
if id>0 then
set rs=server.createobject("adodb.recordset")
sql="Select * from [Order] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
orderid=rs("id")
userid=rs("userid")
consignee=rs("consignee")
tel=rs("tel")
telephone=rs("telephone")
email=rs("email")
postcode=rs("postcode")
address=rs("address")
countryname=rs("countryname")
countryid=rs("countryid")
goodtype=rs("goodtype")
if goodtype=0 then gtype="普货"
if goodtype=1 then gtype="敏感货"
postwayname=rs("postwayname")
postwayid=rs("postwayid")
remark=rs("remark")
ordertype=rs("ordertype")
txtweight=rs("txtweight")
orderno=rs("orderno")
goodinfo=getordergoodname(orderno)
ggoodname=SPLIT(goodinfo,"|")(0)
gprice=SPLIT(goodinfo,"|")(1)
if isnull(txtweight) then txtweight=0
txtexpressno=rs("txtexpressno") '多运单号时这里要去提
if ordertype=0 then ttype="空运"
if ordertype=1 then ttype="海运"
if isnull(rs("atime1")) then
atime=rs("atime")
else
atime=rs("atime1")
end if
if isnull(rs("atime5")) then
atime5="未发货"
else
atime5=rs("atime5")
end if
fw2=rs("fw2")
fw3=rs("fw3")
fw4=rs("fw4")
fw6=rs("fw6")
fw7=rs("fw7")
s=rs("ddlProperty")
if s=0 then st="存档中"
if s=1 then st="未处理"
if s=2 then st="订单处理中"
if s=3 then st="待付款"
if s=4 then st="已付款"
if s=5 then st="已发货"
if s=6 then st="交易成功"
if s=7 then st="无效运单"
if s=8 then st="扣货"
end if
rs.close
set rs=nothing
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="/admin/css/jquery-ui.css" />
<script src="/admin/js/jquery-1.8.3.js"></script>
<script src="/admin/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/admin/css/uistyle.css" />
<title>打印</title>
<style type="text/css" media="print">
#myPrintArea input {
	border:0;
}
</style>
<style type="text/css">
input {
	border:0;
}
</style>
<script type="text/javascript" src="/admin/js/jquery.print.js"></script>
</head>
<body>
<script>
    $(function () {
        $(".ui-state-default").each(function () {
            $(this).draggable();
        });

    });
</script>
<button id="print_button2">打印</button>
<div class="area">
  <style type="text/css" media="all">

#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 1070px;
}
#sortable li {
	margin: 3px 3px 3px 0;
	width:500px;
	height:200px;
	float: left;
	font-size: 2em;
	text-align: center;
	background:none;
	border:none;
}
#sortable li span {
	margin: 5px;
	display: inline-block;
}
.area{
width:1000px;
margin:10px auto;
background:#EEEEF9;
}
</style>
    <ul id="sortable">
 

 <li class="ui-state-default" style="position: relative; top: -39px; left: 1418px"><%=orderno%></li> <li class="ui-state-default" style="position: relative; top: 123px; left: -176px"><%=address%>,<%=postcode%></li> <li class="ui-state-default" style="position: relative; top: 60px; left: 1123px"><%=countryname%></li> <li class="ui-state-default" style="position: relative; top: 30px; left: -25px"><%=tel%></li> <li class="ui-state-default" style="position: relative; top: -175px; left: 231px"><%=consignee%></li> <li class="ui-state-default" style="position: relative; top: -344px; left: -960px">600038</li> <li class="ui-state-default" style="position: relative; top: -238px; left: 33px"><input type='text' style="border:0;" value='<%=gprice%>'  size='5'/></li> <li class="ui-state-default" style="position: relative; top: -240px; left: -659px"><textarea style='border:0;overflow:hidden; resize:none;' rows='3'><%=ggoodname%></textarea>
</li> <li class="ui-state-default" style="position: relative; top: -509px; left: -553px">0</li> <li class="ui-state-default" style="position: relative; top: -410px; left: -90px"><%=postwayname%></li> <li class="ui-state-default" style="position: relative; top: -530px; left: -390px">1</li>
  </ul>
  <div style="clear:both"></div>
</div>
<script type="text/javascript">
    oldstyle = ''
    $(".ui-state-default").each(function () {
        oldstyle += $(this).attr('style') + '|';

    });
    $("#print_button2").click(function () {

        style = ''
        $(".ui-state-default").each(function () {
            style += $(this).attr('style') + '|';

        });        
        if (oldstyle != style) {
            $.ajax({
                url: '/admin/getstyledexi',
                type: 'post',
                data: { style: style },
                success: function (result) {

                    if (result==1) {

                        console.log('Style had been saved');

                    } else {
                        console.log('Style saving is wrong');
                    }
                },
                error: function () {

                    console.log('Style saving is wrong');
                }

            })
        }
        $(".area").printArea();
    });

</script>
</body>
</html>
