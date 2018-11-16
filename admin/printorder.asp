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
orderno=rs("orderno")
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

<html>
<head>
<title>打印运单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/jquery.print.js"></script>
</head>
<body>
<div>

 
       <div><button id="print_button">打印</button></div>
      <script type="text/javascript">
          $("#print_button").click(function () {
              $("#page1").printArea();
          });

</script>

</div>

<div class="jp-page" id="page1" style="width: 235mm; height: 127mm;">



<style>
    .jp-page{position:relative}
    .jp-text,.jp-label,.jp-image,.jp-barcode{position:absolute;overflow:hidden}
    .jp-auto-stretch,.jp-barcode object,.jp-barcode embed{width: 100%; height: 100%;}
    .jp-paper-background{position:absolute;width:100%;height:100%;
        top: 0px;
        left: 0px;
    }
    .jp-comp-1{top: 137px; left: 299px; width: 302px; height: 96px; z-index: 101; font-size:16px;font-family:Arial;}
    .jp-comp-2{top: 219px; left: 370px; width: 127px; height: 64px; z-index: 102; position: absolute; font-size: 18px; font-family:Arial;}
    .jp-comp-3{top: 223px; left: 554px; width: 127px; height: 24px; z-index: 103; font-size: 18px;font-family:Arial;}
    .jp-comp-4{top: 45px; left: 594px; width: 73px; height: 22px; z-index: 104; position: absolute; font-weight: 400; font-size: 16px;font-family:Arial;}
    .jp-comp-5{top: 338px; left: 369px; width: 16px; height: 22px; z-index: 105; position: absolute; font-size: 21px;}
    .jp-comp-6{top: 139px; left: 57px; width: 167px; height: 27px; z-index: 106; position: absolute; font-size: 22px;}
    .jp-comp-7{top: 255px; left:0px; margin-left:0px; width: 76px; height: 153px; z-index: 106; font-size: 20px; font-weight: 200;}
    .jp-comp-8{top: 305px; left: 163px; width: 66px; height: 30px; z-index: 108; position: absolute;}
    .jp-comp-9{top: 325px; left: 293px; width: 50px; height: 35px; z-index: 109;font-size: 20px;}
    .jp-comp-10{top: 325px; left: 363px; width: 50px; height: 35px; z-index: 109;font-size: 16px;}
    .jp-comp-11{top: 85px; left: 36px; width: 73px; height: 22px; z-index: 104; position: absolute; font-weight: 400; font-size: 16px;font-family:Arial;}
    .jp-comp-12{top: 25px; left: 644px; width: 273px; height: 22px; z-index: 104; position: absolute; font-weight: 400; font-size: 16px;font-family:Arial;}
</style>


 <img class="jp-paper-background screen-only" src="/images/bgprintorder.jpg">
    <div class="jp-label jp-comp-1">
     <%=address%>
    </div>
    <div class="jp-label jp-comp-2">
     <%=consignee%>
    </div>
    <div class="jp-label jp-comp-3">
     <%=tel%>
    </div>
    <div class="jp-label jp-comp-4">
        <input type="text" value=" ACE"  style="border:0;font-size:18px; font-family:Arial; width:60px;" />    
    
    </div>
     <div class="jp-label jp-comp-11">
    
     <input type="text" value="890025"  style="border:0;font-size:16px; font-family:Arial;" />  
    </div>
   
    <div class="jp-label jp-comp-6">
     
       
        <%=orderno%>
    </div>


    <div class="jp-label jp-comp-7" style="text-align:left;">
    <textarea style="border:0;  font-size: 16px; width:80px; font-weight: 200; height:140px;"><%=ggoodname%></textarea>
    </div>
    <div class="jp-label jp-comp-8">
     <input type="text" value="1"  style="border:0;font-size:18px; font-family:Arial; width:120px;" />     
    </div>
    <div class="jp-label jp-comp-9">
     <input type="text" value="2"  style="border:0;font-size:18px; font-family:Arial; width:120px;" />     
    </div>
    <div class="jp-label jp-comp-10">
     <input type="text" value="3"  style="border:0;font-size:18px; font-family:Arial; width:120px;" />     
    </div>
    <div class="jp-label jp-comp-12">
     <input type="text" value="<%=FormatDate(atime, "YYYY-MM-DD")%>"  style="border:0;font-size:18px; font-family:Arial; width:120px;" />     
    </div>
</div>

</body>
</html>
