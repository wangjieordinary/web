<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
adminid=SPLIT(teh,"&")(5)
if adminid="" or isnull(adminid) then adminid=0
end if
a=Request("a")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if instr(power,"viewOrderSendList")>0 or instr(power,"haiviewOrderSendList")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('没有订单查看权限。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_List")>0 then '订单列表
if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
ddlProperty=trim(Request("ddlProperty"))
if ddlProperty="" or isnull(ddlProperty) then ddlProperty=-1
if ddlProperty>=0 and IsNumeric(ddlProperty) then osql=osql&" and ddlProperty="&ddlProperty
txtpackageno=chkstr(Request("txtpackageno"))
if txtpackageno<>"" then
gorderno=getorderno(txtpackageno)
if gorderno<>"" then osql=osql&" and orderno='"&gorderno&"'"
end if
txtordernum=chkstr(Request("txtordernum"))
if txtordernum<>"" then osql=osql&" and txtexpressno='"&txtordernum&"'"
txtKeywords=chkstr(Request("txtKeywords"))
if txtKeywords<>"" then osql=osql&" and userid='"&getuserid(txtKeywords)&"'"
txtorderid=chkstr(Request("txtorderid"))
if txtorderid<>"" then osql=osql&" and (orderno='"&txtorderid&"' or orderno like '%"&txtorderid&"%' or id="&getNum(txtorderid)&")"
if instr(a,"airorder")>0 then osql=osql&" and ordertype=0"
if instr(a,"haiorder")>0 then osql=osql&" and ordertype=1"
set rs=server.createobject("adodb.recordset")
if atype=1 or atype=2 then
exec="select * from [Order] where siteid="&siteid&osql&" order by id desc"		
else
exec="select * from [Order] where siteid="&siteid&osql&" and (saleid="&adminid&" or aeid="&adminid&" or salename='"&admin&"' or aename='"&admin&"') order by id desc"		
end if
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
rs.PageSize=20
pagecount=rs.PageSize
if page<=0 then
spage=1
else
spage=page+1
end if
rs.AbsolutePage=spage
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	运单管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
<style type="text/css">
    .datatable tr:hover,.datatable tr.hilite
    {
    background-color:#99FF66;
    color: #3C0;
    }
.datatable
{
    border-collapse:collapse;
    color:#000000;
    font-family:Arial, Helvetica, sans-serif;
    border:1px solid #000099;
    font-size:14px;
}
.datatable th,.datatable td
{
    text-align:center;
    border:1px solid #999;
    padding-left:4px;
    padding-top:5px;
    padding-bottom:5px;
    padding-left:4px;
    padding-right:4px;
}
.datatable th
{
    color:#000066;
    font-family:宋体,Arial, Helvetica, sans-serif;
    background-color:#CCCCCC;
}
.datatable caption
{
    border:solid #999 1px;
    background-color:#CCFF66;
    padding:5px 0 5px 0;
}
</style>
<script type="text/javascript">
    var rows = document.getElementsByTagName('tr');//取得行
    for(var i=0 ;i<rows.length; i++)
    {
        rows[i].onmouseover = function(){//鼠标移上去,添加一个类'hilite'
            this.className += 'hilite';
        }
        rows[i].onmouseout = function(){//鼠标移开,改变该类的名称
            this.className = this.className.replace('hilite','');
        }
    }
</script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(<%=rssum%>, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:20,
		    num_display_entries:3,
		    current_page:<%=page%>,
		    num_edge_entries:2,
		    link_to:"?act=s&ddlProperty=<%=ddlProperty%>&txtpackageno=<%=txtpackageno%>&txtordernum=<%=txtordernum%>&txtKeywords=<%=txtKeywords%>&txtorderid=<%=txtorderid%>&page=__id__"
           });
        });
        function pageselectCallback(page_id, jq) {
           //alert(page_id); 回调函数，进一步使用请参阅说明文档
        }
        
        $(function() {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
            $(".msgtable tr").hover(
			    function() {
			        $(this).addClass("tr_hover_col");
			    },
			    function() {
			        $(this).removeClass("tr_hover_col");
			    }
		    );
        });

    </script>
</head>
<body>
    <form name="form1" method="post" action="/admin/Order_List<%if instr(a,"airorder")>0 then%>airorder<%end if%><%if instr(a,"haiorder")>0 then%>haiorder<%end if%><%if ddlProperty>=0 then%>?act=s<%end if%>" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 运单管理 &gt; 运单列表 &nbsp;&nbsp;<a href="/admin/Order_List"<%if instr(a,"haiorder")=0 and instr(a,"airorder")=0 then%> style="font-weight:bold"<%end if%>>全部运单</a> | <a href="/admin/Order_Listairorder"<%if instr(a,"airorder")>0 then%> style="font-weight:bold"<%end if%>>空运订单</a> | <a href="/admin/Order_Listhaiorder"<%if instr(a,"haiorder")>0 then%> style="font-weight:bold"<%end if%>>海运订单</a></b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
         <td width="50" align="center"></td>
        <td>
         <select name="ddlProperty" id="ddlProperty" class="select">
	<option value="">订单状态</option>
	<option value="0" style="background-color: #FFFFFF"<%if ddlProperty=0 then%> selected="selected"<%end if%>>存档中</option>
	<option value="1" style="background-color: #FF6699"<%if ddlProperty=1 then%> selected="selected"<%end if%>>未处理</option>
	<option value="2" style="background-color: #F4B084"<%if ddlProperty=2 then%> selected="selected"<%end if%>>订单处理中</option>
	<option value="3" style="background-color: #FFFF00"<%if ddlProperty=3 then%> selected="selected"<%end if%>>待付款</option>
	<option value="4" style="background-color: #A9D08E"<%if ddlProperty=4 then%> selected="selected"<%end if%>>已付款</option>
	<option value="5" style="background-color: #00B0F0"<%if ddlProperty=5 then%> selected="selected"<%end if%>>已发货</option>
	<option value="6" style="background-color: #D5D5D5"<%if ddlProperty=6 then%> selected="selected"<%end if%>>交易成功</option>
	<option value="7" style="background-color: #A7A7A7"<%if ddlProperty=7 then%> selected="selected"<%end if%>>无效运单</option>
	<option value="8" style="background-color: red"<%if ddlProperty=8 then%> selected="selected"<%end if%>>扣货</option>
	<option value="9"<%if ddlProperty=9 then%> selected="selected"<%end if%>>问题订单</option>

</select>
            &nbsp;</td>
        <td width="8%" align="center">包裹单号:</td>
         <td width="18%" align="center"><input name="txtpackageno" type="text" id="txtpackageno" class="input" value="<%=txtpackageno%>" /></td>
          <td width="8%" align="center">国际运号:</td>
         <td width="18%" align="center"><input name="txtordernum" type="text" id="txtordernum" class="input" value="<%=txtordernum%>" /></td>
        <td width="12%" align="right">用户关键字:</td>
        <td width="12%"><input name="txtKeywords" type="text" id="txtKeywords" class="input" value="<%=txtKeywords%>" /></td>
         <td width="8%" align="right">订单号:</td>
        <td width="10%"><input name="txtorderid" type="text" id="txtorderid" class="input" value="<%=txtorderid%>" /></td>
        <td width="8%" align="center">
            <input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="datatable">
      <tr>
        <th width="3%">选择</th> 
        <th width="8%">编号</th>       
        <th width="11%">运单号</th>
        <th width="8%">重量</th>
        <th width="9%">客户账户</th>      
        <th width="10%">收件人</th>
        <th width="8%">地区</th>
        <th width="10%">提交时间</th>
        <th width="6%">状态</th>
        <th width="8%">是否到齐</th>
        <th width="20%">操作</th>
      </tr>
<%if rssum>0 then
for i=1 to pagecount
s=rs("ddlProperty")
if s=0 then sb="#FFFFFF"
if s=1 then sb="#FF6699"
if s=2 then sb="#F4B084"
if s=3 then sb="#FFFF00"
if s=4 then sb="#A9D08E"
if s=5 then sb="#00B0F0"
if s=6 then sb="#D5D5D5"
if s=7 then sb="#A7A7A7"
if s=8 then sb="red"
if s=0 then st="存档中"
if s=1 then st="未处理"
if s=2 then st="订单处理中"
if s=3 then st="待付款"
if s=4 then st="已付款"
if s=5 then st="已发货"
if s=6 then st="交易成功"
if s=7 then st="无效运单"
if s=8 then st="扣货"
if s=9 then st="问题订单"
if rs("ordertype")=0 then act="airorder"
if rs("ordertype")=1 then act="haiorder"%>
      <tr style="background-color:<%=sb%>">
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span><span id="rptList_ctl01_lb_id" style="display:none;"><%=rs("id")%></span></td>
        <td align="center"><%=rs("Orderno")%></td>
        <td align="center"><%=rs("txtexpressno")%></td>
        <td align="center"><%if rs("txtexpressno")<>"" then%><%if rs("txtweight")>rs("txtvolume_weight") then%><%=FormatNumber(rs("txtweight"),2,-1)%><%else%><%=FormatNumber(rs("txtvolume_weight"),2,-1)%><%end if%><%end if%></td>
        <td align="center"><%=getuserno(rs("userid"))%></td>       
        <td align="center"><%=rs("consignee")%></td>
        <td align="center"><%=rs("countryname")%></td>
        <td align="center"><%=rs("atime")%></td>   
         <td align="center"><%=st%></a></td>    
        <td align="center"><%if rs("packStat")=1 then%>已到齐<%else%><%Orderdk=chkorderdk(rs("Orderno"))%><%=Orderdk%><%end if%></td>           
        <td align="center"><%if rs("packStat")=1 or Orderdk="已到齐" then%><span><a href="/admin/Package_view_<%=rs("id")%>" target="_blank">[打印清单]</a></span><span><a href="/admin/printorder<%=rs("id")%>"  target="_blank">[打印运单]</a></span><%end if%><span><a href="/admin/Order_Detail<%=act%>_<%=rs("id")%>">[详情]</a></span><span><a href="/admin/Order_Edit_<%=rs("id")%>">[修改]</a></span></td>
      </tr>
<%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%>
      </table>
      

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
        <div>
            <div style="float:right;padding-left:30px;padding-right:30px;">
                输入页码：<input name="txtpagego" type="text" id="txtpagego" size="3" class="input" /><input type="submit" name="Button1" value="跳转" id="Button1" /></div><div id="Pagination" class="right flickr"></div>
            <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">删 除</a>
                &nbsp; <a href="/admin/explororderno">打印(已付款)运单</a>&nbsp;  <a href="/admin/jianhuo_jh<%if instr(a,"airorder")>0 then%>_airorder<%end if%><%if instr(a,"haiorder")>0 then%>_haiorder<%end if%>">处理中订单包裹拣货</a>&nbsp;  <a href="/admin/jianhuo_all">全位置包裹信息</a>
                </span>
            </div>
	   </div>
	</div>
    </form>
</body>
</html>

<%elseif instr(a,"Detail")>0 then '订单详细
if instr(a,"Detail")>0 and ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
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
txtvolume_weight=rs("txtvolume_weight")
ordertxtmoto=rs("txtmoto")
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
if s=9 then st="问题订单"
end if
rs.close
set rs=nothing
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	订单查看
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery-git.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
    <script type="text/javascript" src="/admin/js//multipleupload.js"></script>
    <script type="text/javascript" src="/admin/js/checkpackage.js"></script>
    <script type="text/javascript" src="/admin/js/getprice.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
<script type="text/javascript" src="/js/fmsg.js"></script>
<link href="/css/fmsg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function deldelively(id){
var msg = "您真的确定要把打包信息删除吗？\n\n请确认！";
if (confirm(msg) == true) {
if(id){
		var getUrl = "/admin/deldelivelyapi";
		var orderno = $("#orderno").val();
		var txtexpressno = $("#txtexpressno").val();
		var userid = $("#userid").val();
		var backurl = $("#backurl").val();
		$.post(getUrl,{id:id,backurl:backurl,orderno:orderno,txtexpressno:txtexpressno,userid:userid},function(result){
			//show_err_msg(result);
			var data = eval("("+result+")");
			if(data.fail){
				alert(data.Word);
			}else{
				alert(data.Word);
				location.href=backurl;
			}
		});
}
}
}
</script>
 <script type="text/javascript">
     function getweight() {
             var msg = document.getElementById("txtdeliverysize").value;
             if (msg.length > 0) {                 
                 msg = eval(msg);
                 msg = (msg / 6000).toFixed(2);
                // document.getElementById("txtvolume_weight").value = msg;
             }
     }
</script> 
<script language="javascript">
    function Change() {      
        var ddl = document.getElementById('ddldelively_name');
        var strpostway = ddl.value;
        if (strpostway == 1000) {
            var target = document.getElementById('txtdelively_name');
            target.style.display = "block";
        }
        else {
            var target = document.getElementById('txtdelively_name');
            target.style.display = "none";
        }
//        getdataprice();
    }
</script>   
<script  language="javascript">
    function getdataprice() {
        var strorderid = '30959';
        var strddlid = document.getElementById('ddldelively_name');
        var ddlid = strddlid.value;
        getprice(strorderid, ddlid);
    }
</script> 
      <style type="text/css">
.yy{

	background:#C90;
	
}
#printlogo{
	display:none;
    text-align:center;
}
          .style1
          {
              height: 25px;
          }
      </style>
</head>
<body>
    <div class="navigation">
      <span class="back"><a href="/admin/Order_List">返回列表</a></span><b>您当前的位置：首页 &gt; 订单管理 &gt; 
        订单查看</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">运单状态</th>
        </tr>
        <tr>
            <td width="15%" align="right">订单编号：</td>
            <td width="85%"><%=orderno%></td>
        </tr>
        <tr>
            <td width="15%" align="right">下单用户：</td>
            <td width="85%">
                 <%=getuserno(userid)%>/<%=userid%></td>
        </tr>
        <tr>
            <td align="right">下单时间：</td>
            <td><%=atime%></td>
        </tr>
        <tr>
            <td align="right">发货时间：</td>
            <td><%=atime5%></td>
        </tr>
        <tr>
            <td align="right">订单状态：</td>
            <td><%=st%></td>
        </tr>
             
       
    </table>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
     <tr><%if ordertype=0 then act="airorder"
if ordertype=1 then act="haiorder"%>
            <th colspan="2" align="left">收货信息<%if (instr(power,"editOrderListDetail")>0 and oldordertype=0) or (instr(power,"haieditOrderListDetail")>0 and oldordertype=1) then%><%if instr(a,"MDetail")>0 then%><a href="/admin/Order_Detail<%=act%>_<%=id%>"  style=" float:right; margin-right:10px;">取消编辑</a><%else%><a href="/admin/Order_MDetail<%=act%>_<%=id%>"  style=" float:right; margin-right:10px;">编辑</a><%end if%><%end if%></th>
        </tr> <form id="form1" name="form1" method="post" action="/admin/Order_Detail_<%=id%>">
        <tr>
            <td align="right" width="15%">收件人：</td>
            <td width="85%"><%if instr(a,"MDetail")>0 then%><input name="consignee" type="text" value="<%=consignee%>" id="consignee" class="input" size="25" style="height:20px;" /><%else%><span id="lbcustomer"><%=consignee%></span><%end if%></td>
        </tr>
        <tr>
            <td align="right">手机号码：</td>
            <td><%if instr(a,"MDetail")>0 then%><input name="tel" type="text" value="<%=tel%>" id="tel" class="input" size="25" style="height:20px;" /><%else%><span id="lbcellphone"><%=tel%></span><%end if%></td>
        </tr>
        <tr>
            <td align="right">电话号码：</td>
            <td><%if instr(a,"MDetail")>0 then%><input name="telephone" type="text" id="telephone" class="input" value="<%=telephone%>" size="25" style="height:20px;" /><%else%><span id="lbphone"><%=telephone%></span><%end if%></td>
        </tr>
        <tr>
            <td align="right">电子邮箱：</td>
            <td><%if instr(a,"MDetail")>0 then%><input name="email" type="text" id="email" class="input" size="25" value="<%=email%>" style="height:20px;" /><%else%><span id="lbemail"><%=email%></span><%end if%></td>
        </tr>
        <tr>
            <td align="right">收货地址：</td>
            <td><%if instr(a,"MDetail")>0 then%><textarea style="width:350px; border:1px solid #d4d4d4; background-color:#fafafa;" id="address" rows="3" cols="20" name="address"><%=address%></textarea><%else%><span id="lbaddress"><%=address%></span><%end if%></td>
        </tr>
        <tr>
            <td align="right">邮政编码：</td>
            <td><%if instr(a,"MDetail")>0 then%><input name="postcode" type="text" id="postcode" class="input" value="<%=postcode%>" size="25" style="height:20px;" /><%else%><span id="lbpostcode"><%=postcode%></span><%end if%></td>
        </tr>
        <tr>
            <td align="right">收货地区：</td>
            <td><%if instr(a,"MDetail")>0 then%><select name="country" id="country">
<%set rs=server.createobject("adodb.recordset")
exec="select * from [area] where siteid="&siteid&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("txtTitle")%>"<%if rs("id")=countryid then%> selected="selected"<%end if%> ><%=rs("txtTitle")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select><%else%><span id="lbarea"><%=countryname%></span><%end if%></td>
        </tr>
         <tr>
           
            <td align="right">订单类型：</td>
            <td><%if instr(a,"MDetail")>0 then%><select name="ordertype" id="ordertype" onchange="selectpostway(this.value)">
	<option<%if ordertype=0 then%> selected<%end if%> value="0">空运</option>
	<option<%if ordertype=1 then%> selected<%end if%> value="1">海运</option>
</select><%else%><span id="lbordertype1"><%=ttype%></span><%end if%></td>
        </tr>
       <tr>
           
            <td align="right">货物类型：</td>
            <td><%if instr(a,"MDetail")>0 then%><select name="goodtype" id="goodtype">
	<option<%if goodtype=0 then%> selected<%end if%> value="0">普通货物</option>
	<option<%if goodtype=1 then%> selected<%end if%> value="1">敏感货物</option>
</select>
<%else%><span id="lbordertype"><%=gtype%></span><%end if%></td>
        </tr>
        <tr >
            <td align="right">运输方式：</td>
            <td><%if instr(a,"MDetail")>0 then%><select name="postway" id="postway">
<%set rs=server.createobject("adodb.recordset")
exec="select * from [postway] where siteid="&siteid&" and rblUserType="&ordertype&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("txtpostwayname")%>"<%if rs("id")=int(postwayid) then%> selected="selected"<%end if%> ><%=rs("txtpostwayname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select><%else%><span id="lbdelively_name"><%=postwayname%></span><%end if%></td>
        </tr>
        <tr >
            <td align="right">特别服务：</td>
            <td><input type="checkbox" value="1" id="fw2" name="fw2"<%if instr(a,"MDetail")=0 then%> disabled<%end if%><%if fw2=1 then%> checked="checked"<%end if%>> 纸箱包装（海运）  要求加纸箱包装吗？（8元RMB/个）<br />
<input type="checkbox" value="1" id="fw3" name="fw3"<%if instr(a,"MDetail")=0 then%> disabled<%end if%><%if fw3=1 then%> checked="checked"<%end if%>> 加订木架  需要钉木架吗？（250元/立方，最低0.1立方起25元人民币 备注单号）<br />
<input type="checkbox" value="1" id="fw4" name="fw4"<%if instr(a,"MDetail")=0 then%> disabled<%end if%><%if fw4=1 then%> checked="checked"<%end if%>> 加订木箱  需要钉木箱吗？（600元/立方，最低0.1立方起60元人民币 备注单号）<br />
<input type="checkbox" value="1" id="fw7" name="fw7"<%if instr(a,"MDetail")=0 then%> disabled<%end if%><%if fw7=1 then%> checked="checked"<%end if%>> 验货服务 （简单验货3元/个包裹，其他是验货联系我们的业务员确认沟通 备注单号）<br />
<input type="checkbox" value="1" id="fw6" name="fw6"<%if instr(a,"MDetail")=0 then%> disabled<%end if%><%if fw6=1 then%> checked="checked"<%end if%>> 购买保险  （空运快递）购买保险：货物按美金申报，按总金额5%收取，最低收费100元人民币起。汇率1美金：6人民币 换算。货物全部丢失按申报价值赔偿，丢失部分按比例。(注：赔丢不赔坏）
            </td>
        </tr>
        <tr>
            <td align="right">客户备注：</td>
            <td><%=remark%></td>
        </tr>
        <tr>
            <td align="center" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="submit" onclick="window.open('printsendorderairbox<%=id%>')" value="DEXI"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="submit" onclick="window.open('printordersendcomone<%=id%>')" value="COM1"/></td>         
        </tr>

<%if instr(a,"MDetail")>0 then%><tr>
            <td align="center" colspan="2"><input name="orderno" type="hidden" value="<%=orderno%>" id="orderno"/><input name="oldordertype" type="hidden" value="<%=ordertype%>" id="oldordertype"/>  <input type="button" name="btneditorder" onclick="editorderDetail()" value="保存" id="btneditorder" class="submit" style="width:100px;"/></td>         
        </tr><%end if%></form>
    </table>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
     <tr>
            <th colspan="2" align="left">包裹详情</th>
        </tr>
        <tr>
        <td width="40%">
       <textarea ID="txtcheck" rows="10" cols="30"></textarea>
  <input type="button" id="btncheck"  class="submit" onclick="checkexpressno(<%=orderno%>);return false;" value="检测"></td>
  <td width="60%">
  <textarea ID="txresult" rows="10" cols="30">
  </textarea>
 
        </td>
        </tr>
         <tr>
       <td  width="100%" colspan="2">
     
       <div id="myPrintArea">
<style type="text/css" media="print"> 
#myPrintArea{ backgound:#000;} 
table {
  margin:20px;
  width:95%;
  border-top:1px solid #999;
  border-right:1px solid #999;
}
th {
 
  background: #09C;
  padding:10px;
  color:#EAEAEA; 
  border-bottom:1px solid #999;
  border-left:1px solid #999;
  text-align:center;
}
td {
  padding:5px;
  margin:5px;
  border-bottom:1px solid #999;
  border-left:1px solid #999;
  text-align:center;
}


</style>

<div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
    <tr  align="left">
    <td >
      
      
       </td>
       <td colspan="6" align="center">        
       <strong>包裹详情</strong>
       </td>
       </tr>
      <tr>  
        <td width="8%">编号</td>
        <td width="8%">快递公司</td>
        <td width="12%">快递单号</td>
        <td width="8%">仓储位置</td>
        <td width="9%">仓储时间</td>
        <td width="9%">物品名称</td>   
        <td width="8%">物品数量</td> 
        <td width="8%">单价</td>  
        <td width="8%">总价</td>  
        <td width="8%">包裹重量</td>
        <td width="8%">备注</td>           
        <td width="8%">状态</td> 
      </tr>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [package] where siteid="&siteid&" and orderno='"&orderno&"' order by id asc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
i=1
do while not rs.eof
ps=rs("statustext")
if ps=0 then statust="未到"
if ps=1 then statust="未到"'"已下单"
if ps=2 then statust="已到"'"收到未出货"
if ps=3 then statust="已出货"
if ps=4 then statust="无效包裹"
t=t+(rs("txtprice")*rs("txtCount"))
weight=weight+rs("weight")
volumweight=volumweight+rs("weight")%><tr><td><%=i%></td><td><%=rs("expressname")%></td><td><a href="https://www.kuaidi100.com/chaxun?com=&nu=<%=rs("expressno")%>" target="_blank" title="点击查询"><%=rs("expressno")%></a></td><td><%=rs("positionname")%></td><td><%if isnull(rs("atime2")) then%>0<%else%><%=Datediff("d",rs("atime2"),now()) %><%end if%>天</td><td><%=rs("txtgoodname")%></td><td><%=rs("txtCount")%></td><td><%=FormatNumber(rs("txtprice"),2,-1)%></td><td><%=FormatNumber(rs("txtprice")*rs("txtCount"),2,-1)%></td><td><%if rs("weight")>rs("volumweight") then%><%=FormatNumber(rs("weight"),2,-1)%><%else%><%=FormatNumber(rs("volumweight"),2,-1)%><%end if%></td><td><%=rs("packageremark")%></td><td><%=statust%></td></tr>
<%i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
<tr><td >客户帐号</td><td colspan="5"><%=getuserno(userid)%>/<%=userid%></td></tr><tr><td >编号</td><td colspan="5"><%=orderno%></td></tr><tr><td >备注</td><td colspan="5"><%=remark%></td></tr>    
      </table></div>
      </td>
           
        </tr>       
    </table>
    <div class="spClear"></div>
    <div style="margin-top:10px;text-align:left;">
 <input type="button" id="print_button"  class="submit" onclick="window.open('/admin/Package_view_<%=id%>')" value="打印包裹信息">
 <script type="text/javascript" src="/js/jquery.print.js"></script>

    <input type="button" class="submit" onclick="window.open('/invoice_<%=id%>')" value="打印商业发票"/>
  <div class="spClear"></div>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
   <tr>
    <th colspan="2" align="left">运费列表</th>
    </tr>
      <tr>
    <td colspan="2" align="left">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">  
            <tr style="height:28px;">
            <th bgcolor="#ffffff">运单号</th>
            <th bgcolor="#ffffff">运送方式</th>
            <th bgcolor="#ffffff">是否敏感货</th>
            <th bgcolor="#ffffff">打包重量</th>
            <th bgcolor="#ffffff">打包材积重</th>  
            <th bgcolor="#ffffff">打包尺寸</th>
            <th id="thcountway" bgcolor="#ffffff">运费</th>

            <th bgcolor="#ffffff" >运费成本</th>
            <th bgcolor="#ffffff">服务费</th>
            <th bgcolor="#ffffff">总计</th>
            <th bgcolor="#ffffff">操作</th>
            </tr> 
<%set rs=server.createobject("adodb.recordset")
exec="select * from [delively] where siteid="&siteid&" and orderno='"&orderno&"' order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
countway=0
goodtype=0
do while not rs.eof
countway=rs("countway")
goodtype=rs("rblUserType")
postwayid=rs("ddldelively_id")
txtdeliverysize=rs("txtdeliverysize")
txtmoto=rs("txtmoto")
zfee=zfee+rs("txtdelive_fee")+rs("txtservice_fee")%><tr style="height:28px;"><td bgcolor="#ffffff" align="center"><%=rs("txtexpressno")%></td><td bgcolor="#ffffff" align="center"><%=rs("ddldelively_name")%></td><td bgcolor="#ffffff" align="center"><%if rs("rblUserType")=0 then%>普货<%end if%><%if rs("rblUserType")=1 then%>敏感货<%end if%></td><td bgcolor="#ffffff" align="center"><%=FormatNumber(rs("txtweight"),2,-1)%></td><td bgcolor="#ffffff" align="center"><%=FormatNumber(rs("txtvolume_weight"),2,-1)%></td><td bgcolor="#ffffff" align="center"><%=rs("txtdeliverysize")%></td><td bgcolor="#ffffff" align="center">￥<%=FormatNumber(rs("txtdelive_fee"),2,-1)%></td><td bgcolor="#ffffff" align="center">￥<%=FormatNumber(rs("txtcostmoney"),2,-1)%></td><td bgcolor="#ffffff" align="center">￥<%=FormatNumber(rs("txtservice_fee"),2,-1)%></td><td bgcolor="#ffffff" align="center">￥<%=FormatNumber(rs("txtdelive_fee")+rs("txtservice_fee"),2,-1)%></td><td bgcolor="#ffffff" align="center"><a href="#">[更新重量]</a><a href="#"  onclick="javascript:return deldelively(<%=rs("id")%>)" >[删除]</a></td></tr><%		
rs.movenext
Loop
rs.close
set rs=nothing%><tr style="height:28px;"> <td bgcolor="#ffffff" align="right" colspan="8">总计费用：</td><td bgcolor="#ffffff" align="center">$<%=FormatNumber(zfee,2,-1)%></td></tr>
<%else%><tr style="height:28px;"> <td bgcolor="#ffffff" align="center" colspan="8">暂无打包记录</td></tr>         
<%end if%></table>
    </table>
    </td>
    </tr>
  </table><form id="form2" name="form2" method="post" action="/admin/Order_Detail_<%=id%>">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">运单费用</th>
        </tr>
        <tr>
            <td width="15%" align="right">打包重量：</td>
            <td width="85%">
               <input name="txtweight" type="text" value="<%=FormatNumber(txtweight,2,-1)%>" maxlength="250" id="txtweight" size="25" />
                 [单位KG]</td>
        </tr>       
        <tr>
            <td align="right">尺寸：</td>
            <td>
                <input name="txtdeliverysize" value="<%=txtdeliverysize%>" type="text" maxlength="250" id="txtdeliverysize" size="25" onblur="getweight();" /></td>
        </tr>
         <tr>
            <td align="right">材积重：</td>
            <td>
              <input name="txtvolume_weight" type="text" value="<%if txtvolume_weight<>"" then%><%=txtvolume_weight%><%else%>0<%end if%>" maxlength="250" id="txtvolume_weight" size="25" /> [单位KG]</td>
        </tr>
         <tr>
            <td align="right">运输方式：</td>
            <td>
                <select name="ddldelively_name" id="ddldelively_name" onchange="Change();" >
	<option value="0">请选择渠道</option>
<%if ordertype=0 then psql=" and rblUserType=0"
if ordertype=1 then psql=" and rblUserType=1"
set rs=server.createobject("adodb.recordset")
exec="select * from [postway] where siteid="&siteid&psql&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if showr="yes" then
if rs("rblUserType")=0 then showt="[空运]"
if rs("rblUserType")=1 then showt="[海运]"
end if
%><option value="<%=rs("id")%>|<%=rs("txtpostwayname")%>"<%if rs("id")=int(postwayid) then%> selected="selected"<%end if%> ><%=showt&rs("txtpostwayname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select> 客户选择渠道： <%=postwayname%></td>
        </tr>
        

        <tr>
            <td align="right">国际运单：</td>
            <td>              
                 <input name="txtexpressno" type="text" maxlength="250" id="txtexpressno" size="25" value="<%=txtexpressno%>" /></td>
        </tr>
           <tr>
            <td align="right" class="style1">物品类型：</td>
            <td class="style1">
                 <span id="rblUserType"><input id="rblUserType_0" type="radio" name="rblUserType" value="0"<%if goodtype=0 then%> checked="checked"<%end if%> /><label for="rblUserType_0">普货</label><input id="rblUserType_1" type="radio" name="rblUserType" value="1"<%if goodtype=1 then%> checked="checked"<%end if%> /><label for="rblUserType_1">敏感货</label></span></td>
        </tr>  
            
          <tr id="contbutton">
	<td align="right" class="style1">计算运费方式：</td>
	<td class="style1">
               <input type="radio" name="countway" value="0"<%if countway=0 then%> checked="true"<%end if%> >普通<input type="radio" name="countway" value="1"<%if countway=1 then%> checked="true"<%end if%> >半抛<input type="radio" name="countway" value="2"<%if countway=2 then%> checked="true"<%end if%>>免抛&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span ><a href="javascript:void(0)" onclick="getdataprice();return false;" class="submit">自动计费</a></span>
                 
            </td>
</tr>

        <tr id="trservicefree">
	<td align="right">服务费：</td>
	<td>
                <input name="txtservice_fee" type="text" value="0.00" maxlength="250" id="txtservice_fee" size="25" /></td>
</tr>

        
        <tr id="deliveryfree">
	<td align="right" class="style1">运输费用：</td>
	<td class="style1">
                 <input name="txtdelive_fee" type="text" value="0.00" maxlength="250" id="txtdelive_fee" class="input  " size="25" />
                 
          &nbsp; &nbsp;&nbsp;&nbsp; <span id="priceresult" style="color:Red"></span></td>
</tr>
      
             <tr id="deliverycost">
	<td align="right" class="style1">运输成本：</td>
	<td class="style1">
                 <input name="txtcostmoney" type="text" value="0.00" maxlength="250" id="txtcostmoney" class="input  " size="25" /></td>
</tr>
       
    </table>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
            <th colspan="2" align="left">运单状态修改</th>
        </tr>
         <tr>
            <td align="right">状态：</td>
            <td>
<select name="DropDownList1" id="DropDownList1">
<option Value="0"<%if s=0 then%> selected<%end if%>>存档中</option>  
<option Value="1" style="background-color: #FF6699"<%if s=1 then%> selected<%end if%>>未处理</option>
<option Value="2" style="background-color: #F4B084"<%if s=2 then%> selected<%end if%>>订单处理中</option>
<option Value="3" style="background-color: #FFFF00"<%if s=3 then%> selected<%end if%>>待付款</option>
<option Value="4" style="background-color: #A9D08E"<%if s=4 then%> selected<%end if%>>已付款</option>
<option Value="5" style="background-color: #00B0F0"<%if s=5 then%> selected<%end if%>>已发货</option>
<option Value="6" style="background-color: #D5D5D5"<%if s=6 then%> selected<%end if%>>交易成功</option>
<option Value="8" style="background-color: red"<%if s=8 then%> selected<%end if%>>扣货</option>            
<option Value="7" style="background-color: #A7A7A7"<%if s=7 then%> selected<%end if%>>无效运单</option>
<option Value="9"<%if s=9 then%> selected<%end if%>>问题订单</option>
</select>
            </td>
        </tr>
             
       
        <tr>
            <td align="right">备注：</td>
            <td>
                <textarea name="txtmoto" rows="2" cols="20" id="txtmoto" style="height:96px;width:254px;"><%if ordertxtmoto<>"" then%><%=ordertxtmoto%><%else%><%=txtmoto%><%end if%></textarea></td>
        </tr>
           
        <tr>
            <td align="center" colspan="2"><input name="DropDownList2" type="hidden" value="<%=s%>" id="DropDownList2"/><input name="userid" type="hidden" value="<%=userid%>" id="userid"/><input name="orderno" type="hidden" value="<%=orderno%>" id="orderno"/>
            <input name="backurl" type="hidden" value="/admin/Order<%=a%>" id="backurl"/><input type="button" onclick="checkadddelively()" name="Button2" value="保存" id="Button2" class="submit"/></td>
           
        </tr>
        </table></form>
</div>
    
</body>
</html>

<%elseif instr(a,"_Edit")>0 then '订单修改
if instr(a,"_Edit")>0 and ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
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
if s=9 then st="问题订单"
end if
rs.close
set rs=nothing
end if%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	订单修改
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
    <script type="text/javascript" src="/admin/js//multipleupload.js"></script>
    <script type="text/javascript">
        function packagedel(id,orderno) {
            var msg = "您真的确定要把该包裹删除吗?\n\n请确认！";
            if (confirm(msg) == true) {
if(id){
		var getUrl = "/admin/delpackageapi";
		$.post(getUrl,{id:id,orderno:orderno},function(result){
			var data = eval("("+result+")");
			if(data.fail){
				alert('删除失败');
			}else{
				alert('删除成功');
				location.href = '/admin/Order_Edit_<%=id%>';
			}
		});
}
            } else {
                return false;
            }
        }
function addpackage() {
    var expressno = $("#expressno").val();
    var msg = '';
    if (expressno.length == 0) {
        msg += '快递单号不能为空！\n';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
	if(expressno&&msg.length==0){
		var getUrl = "/admin/packageaddapi";
		$.post(getUrl,{expressno:expressno,orderno:'<%=orderno%>',userid:'<%=userid%>',ordertype:<%=ordertype%>},function(result){
			//show_err_msg(result);
			var data = eval("("+result+")");
			if(data.fail){
				alert('添加失败');
			}else{
				alert('添加成功');location.href = '/admin/Order_Edit_<%=id%>';
			}
		});
	}
}
</script> 
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
    </style>
</head>
<body>
  <form name="form1" method="post" action="/admin/Order_Edit_<%=id%>" id="form1" onsubmit="addpackage()">
    <div class="navigation">
      <span class="back"><a href="/admin/Order_List">返回列表</a></span><b>您当前的位置：首页 &gt; 订单管理 &gt; 
        订单修改</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
          <tr>
            <th colspan="2" align="left">订单详情</th>
        </tr>
        <tr>
            <td width="15%" align="right">订单编号：</td>
            <td width="85%">
                <%=id%></td>
        </tr>
        <tr>
            <td width="15%" align="right" class="style1">下单用户：</td>
            <td width="85%" class="style1">
                 <%=getuserno(userid)%></td>
        </tr>
        <tr>
            <td align="right">下单时间：</td>
            <td>
               <%=atime%></td>
        </tr>
        <tr>
            <td align="right">发货时间：</td>
            <td><%=atime5%></td>
        </tr>
        <tr>
            <td align="right">运单状态：</td>
            <td><%=st%></td>
        </tr>
        <tr>
            <td align="right">添加包裹：</td>
            <td>
                <input name="expressno" type="text" id="expressno" class="input" size="25" style="height:20px;" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" name="btnaddpackage" value="添加包裹" id="btnaddpackage" class="submit" onclick="addpackage()" />
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">运单包裹：</td>
            <td>
                
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>  
       <th width="12%">编号</th>
        <th width="12%">快递公司</th>
        <th width="">快递单号</th>
        <th width="15%">仓储位置</th>
        <th width="15%">重量</th>
        <th width="15%">材积重</th>
        <th width="15%">操作</th>
      </tr>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [package] where siteid="&siteid&" and orderno='"&orderno&"' order by id asc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
i=1
expressnolist=""
do while not rs.eof
ps=rs("statustext")
if ps=0 then statust="未到"
if ps=1 then statust="未到"'"已下单"
if ps=2 then statust="已到"'"收到未出货"
if ps=3 then statust="已出货"
if ps=4 then statust="无效包裹"
t=t+(rs("txtprice")*rs("txtCount"))
weight=weight+rs("weight")
volumweight=volumweight+rs("weight")%><tr<%if instr(expressnolist,"|"&rs("expressno")&"|")>0 then%> bgcolor="#FF0000"<%end if%>><td align="center"><%=i%></td><td align="center"><%=rs("expressname")%></td><td align="center"><a href="https://www.kuaidi100.com/chaxun?com=&nu=<%=rs("expressno")%>" target="_blank" title="点击查询"><%=rs("expressno")%></a><%if instr(expressnolist,"|"&rs("expressno")&"|")>0 then%>重复<%end if%></td><td align="center"><%=rs("positionname")%></td><td align="center"><%=FormatNumber(rs("weight"),2,-1)%></td><td align="center"><%=FormatNumber(rs("volumweight"),2,-1)%></td><td align="center"><span><a href="#" onclick="packagedel(<%=rs("id")%>,<%=orderno%>)">[删除]</a></span></td></tr>
<%if i=1 then
expressnolist="|"&rs("expressno")&"|"
else
expressnolist=expressnolist&rs("expressno")&"|"
end if
i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
      </table>
      </td>
        </tr>
     
        <tr>
            <td align="right" class="style1">顾客备注：</td>
            <td class="style1"><%=remark%></td>
        </tr>
        <tr>
            <td align="right">运单状态：</td>
            <td><%=st%></td>
        </tr>
        </table>
    <div style="margin-top:10px;text-align:center;">

</div>
    </form>
</body>
</html>

<%end if%>