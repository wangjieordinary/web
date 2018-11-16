<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
adminid=SPLIT(teh,"&")(5)
if adminid="" or isnull(adminid) then adminid=0
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="仓库管理员"
if atype=3 then ttype="业务员"
power=SPLIT(teh,"&")(3)
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if instr(power,"viewPackage")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if
if instr(a,"_view_")>0 then '打印包裹清单%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.print.js"></script>
    <title>    </title>
</head>
     <style type="text/css">
.yy{

	background:#C90;
	
}
#printlogo{	
    text-align:center;
}
         .style1
         {
             width: 12%;
         }
     </style>
<body>
  <div id="myPrintArea" align="center">
<style type="text/css" media="print"> 
 #myPrintArea input{border:0;}
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
<div style="width:676px; ">
    <table width="100%" border="0" cellspacing="1" cellpadding="1"  style="background-color:#dddddd;" align="center">
    <tr  align="left" style="background-color:#ffffff">   
       <td colspan="7" align="center">        
<%if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 then
userid=getuserid(email)
set rs=server.createobject("adodb.recordset")
sql="Select * from [Order] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
orderid=rs("id")
consignee=rs("consignee")
tel=rs("tel")
telephone=rs("telephone")
postcode=rs("postcode")
address=rs("address")
countryname=rs("countryname")
goodtype=rs("goodtype")
if goodtype=0 then goodt="普货"
if goodtype=1 then goodt="敏感货"
postwayname=rs("postwayname")
remark=rs("remark")
SpNum=rs("SpNum")
userid=rs("userid")
ordertype=rs("ordertype")
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
end if%>
       <strong>包裹详情</strong>
       </td>
       </tr>
      <tr height="25px" style="background-color:#ffffff">  
        <td width="8%" >编号</td>
        <td width="16%" align="center">快递公司</td>
        <td width="20%" align="center">快递单号</td>
        <td width="16%" align="center">仓储位置</td>
        <td width="16%" align="center">物品名称</td>    
        <td width="15%" align="center">物品数量</td> 
        <td width="15%" align="center">总价值</td> 
      </tr>
<%if orderno<>"" then
set rs=server.createobject("adodb.recordset")
exec="select * from [package] where siteid="&siteid&" and orderno='"&orderno&"' order by id asc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
i=1
do while not rs.eof
s=rs("statustext")
if s=0 then statust="未到"
if s=1 then statust="未到"'"已下单"
if s=2 then statust="已到"'"收到未出货"
if s=3 then statust="已出货"
if s=4 then statust="无效包裹"
t=t+(rs("txtprice")*rs("txtCount"))
weight=weight+rs("weight")
volumweight=volumweight+rs("weight")%><tr style="background-color:#ffffff"><td align="center"><%=i%></td><td align="center"><%=rs("expressname")%></td><td align="center"><%=rs("expressno")%></td><td align="center"><%=rs("positionid")%></td><td align="center"><%=rs("txtgoodname")%></td><td align="center"><%=rs("txtCount")%></td><td align="center"><%=FormatNumber(rs("txtprice")*rs("txtCount"),2,-1)%></td></tr><%i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing
end if
end if%>
<tr style="background-color:#ffffff"><td   colspan="2">包裹个数</td><td colspan="6"><%=i-1%></td></tr><tr style="background-color:#ffffff"><td colspan="2">特别服务</td><td colspan="6"><input type="checkbox" value="1" id="fw2" name="fw2" disabled<%if fw2=1 then%> checked="checked"<%end if%>> 纸箱包装 
<input type="checkbox" value="1" id="fw3" name="fw3" disabled<%if fw3=1 then%> checked="checked"<%end if%>> 加订木架  
<input type="checkbox" value="1" id="fw4" name="fw4" disabled<%if fw4=1 then%> checked="checked"<%end if%>> 加订木箱  
<input type="checkbox" value="1" id="fw7" name="fw7" disabled<%if fw7=1 then%> checked="checked"<%end if%>> 验货服务 
<input type="checkbox" value="1" id="fw6" name="fw6" disabled<%if fw6=1 then%> checked="checked"<%end if%>> 购买保险 </td></tr><tr style="background-color:#ffffff"><td   colspan="2">货物类型</td><td colspan="6"><%=goodt%></td></tr><tr style="background-color:#ffffff"><td  colspan="2" >客户账户</td><td colspan="6"><%=getuserno(userid)%>(<%=userid%>/<%=orderno%>)</td></tr><tr style="background-color:#ffffff"><td   colspan="2">运送方式</td><td colspan="6"><%=postwayname%></td></tr><tr style="background-color:#ffffff"><td colspan="2" >客户备注</td><td colspan="6"><%=remark%></td></tr>    
      </table></div></div>
      <div style="text-align:center;"><button id="print_button">打印</button></div>
      <script type="text/javascript">
          $("#print_button").click(function () {            
              $("#myPrintArea").printArea();
          });

</script>
    </form>
</body>
</html>

<%elseif instr(a,"_List")>0 then '包裹列表
if instr(a,"act")>0 then
page=Request("page")
end if
if Request("txtpagego")<>"" then txtpagego=Request("txtpagego")
if IsNumeric(txtpagego) and int(txtpagego)>0 then page=int(txtpagego)-1
if page="" or isnull(page) then page=0
statustext=chkstr(Request("ddlProperty"))
if statustext="" or isnull(statustext) then statustext=0
if statustext=1 and IsNumeric(statustext) then osql=osql&" and statustext<="&statustext
if statustext>1 and IsNumeric(statustext) then osql=osql&" and statustext="&statustext
express=Request("express")
if express<>"" then
expressid=int(express)
expressname=getexpressname(express)
end if
if expressid<>"" then osql=osql&" and expressid="&expressid
txtstarttime=Request("txtstarttime")
if txtstarttime<>"" then txtstarttime=cdate(txtstarttime)
txtEndtime=Request("txtEndtime")
if txtEndtime<>"" then txtEndtime=cdate(txtEndtime)
if txtstarttime<>"" and txtEndtime<>"" then osql=osql&" and atime2 is not null and DateDiff(s,'"&txtstarttime&"',atime2)>0 and DateDiff(s,atime2,'"&txtEndtime&"')>0"
txtKeywords=chkstr(Request("txtKeywords"))
if txtKeywords<>"" and Len(txtKeywords)>9 then
osql=osql&" and expressno='"&txtKeywords&"'"
elseif txtKeywords<>"" and Len(txtKeywords)<10 then
osql=osql&" and (expressno like '%"&txtKeywords&"%' or id="&getNum(txtKeywords)&")"
end if
positionname=chkstr(Request("positionname"))
if positionname<>"" then osql=osql&" and positionname='"&positionname&"'"

'定义变量
'TblName-表名；FldName-排列字段名；FieldName-需读取的字段名；PageSizeX-分页大小；PageCountX-总页数；PageNo-当前页;OrderType-排序方式；StrWhere-条件语句
'StrSql-总执行语句；FieldCount-总记录数；StrTmp,StrOrder-临时变量

Dim TblName,FldName,FieldName,PageSizeX,PageCountX,PageNo,OrderType,StrWhere
Dim StrSql,FieldCount,StrTmp,StrOrder,TopField

'进行赋值
PageNo=page+1
if PageNo="" then PageNo=1
if isnumeric(PageNo) or PageNo="" then '如果没有Page值，进行初始化值
PageNo=abs(PageNo)
 if PageNo=0 then PageNo=1
else
 PageNo=1
end if

TblName = "[package]"
FldName = "id" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,expressname,expressno,txtgoodname,txtCount,txtprice,weight,volumweight,atime,atime2,statustext,packageremark,jzt,packagetype,userid,positionname"
PageSizeX=20
OrderType=0 '0-为降序 1-升序
StrWhere=sql '注意: 一个条件就用()双括号括起来 第一个不用and

TopField=(PageNo-1)*PageSizeX 'TOP多少条

if OrderType=0 then
 StrTmp = "<(Select min"
 StrOrder = " Order BY ["&FldName&"] desc"
else
 StrTmp = ">(Select max"
 StrOrder = " Order BY ["&FldName&"] asc"
end if

'定义sql语句
StrSql="Select Top "&Clng(PageSizeX)&" "& FieldName &" From "&TblName&" "
if atype=1 or atype=2 then
StrWhere="siteid="&siteid&osql
else
StrWhere="siteid="&siteid&osql&" and (saleid="&adminid&" or aeid="&adminid&" or salename='"&admin&"' or aename='"&admin&"' or userid='' or orderno='' or orderno is null or userid is null)"
end if

if PageNo=1 then '如果是第一页时，执行如下代码查库速度快
if StrWhere<>"" then
 StrSql=StrSql&" Where "&StrWhere & StrOrder&""
 else
 StrSql=StrSql & StrOrder
 end if
else
 if StrWhere<>"" then
 StrSql=StrSql&" Where "& FldName & StrTmp&"("&FldName&") From (Select top "& Clng(TopField)&" "&FldName &" From "&TblName&" Where "& StrWhere & StrOrder &") as tblTmp) and "& StrWhere & StrOrder&""
 else
 StrSql=StrSql&" Where "& FldName & StrTmp&"("&FldName&") From (Select top "& Clng(TopField)&" "&FldName &" From "&TblName & StrOrder &") as tblTmp) "&StrOrder&""
 end if 
end if
'response.Write StrSql
Set rs=Conn.exeCute(StrSql) '执行查询

if StrWhere<>"" then '求总记录数
FieldCount=Conn.exeCute("Select Count("&FldName&") From "&TblName&" Where "&StrWhere&"")(0)
else
FieldCount=Conn.exeCute("Select Count("&FldName&") From "&TblName&"")(0)
end if

if (FieldCount mod PageSizeX)>0 then '求总页数 PageCountX
 PageCountX=((FieldCount - (FieldCount mod PageSizeX))/ PageSizeX)+1
else
 PageCountX= (FieldCount / PageSizeX)
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	包裹管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" /><link href="/admin/css/jquery-ui.css" rel="stylesheet" /><link href="/admin/css/chosen.css" rel="stylesheet" type="text/css" />
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
    <script src="/admin/js/jquery.min.js" type="text/javascript"></script>
     <script>
         $j = jQuery.noConflict();
      </script>
    <script src="/admin/js/jquery.js"></script>
    <script src="/admin/js/jquery-ui.js"></script>   
<script type="text/javascript" src="/js/jquery.pagination.js"></script>
<script type="text/javascript" src="/admin/js/function.js"></script>
<script type="text/javascript" src="/admin/js/date.js"></script>
<script type="text/javascript" src="/admin/js/packageinital.js"></script>
<script type="text/javascript" src="/js/tooltips.js"></script>
<script type="text/javascript">
    $(function() {
        
        //分页参数设置
        $("#Pagination").pagination(<%=FieldCount%>, {
        callback: pageselectCallback,
        prev_text: "« 上一页",
        next_text: "下一页 »",
        items_per_page:20,
		num_display_entries:3,
		current_page:<%=page%>,
		num_edge_entries:2,
		 link_to:"?act=s&positionname=<%=positionname%>&ddlProperty=<%=statustext%>&txtstarttime=<%=txtstarttime%>&txtEndtime=<%=txtEndtime%>&txtKeywords=<%=txtKeywords%>&express=<%=express%>&page=__id__"
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
function WxPackage(id,wxid){
	if(id){
    $.ajax({
        type: "post",
        url: "/admin/wxPackageapi"+id,
        data: { "id": id },
        beforeSend: function () { },
        error: function () {alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('包裹不存在！');
                return false;
            }
            else if (data == '1') {
                show_msg('设置成功！','#');
                wxid.innerHTML="无效包裹";
            }
            else {
                alert('数据异常！');
                return false;
            }
        }
    })
	}
}
</script> 
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Package_List" id="form1">
        <div class="navigation"><span class="add"><a href="#" id="dialo">添加包裹</a></span><span class="add" style=" margin-right:15px;"><a href="/admin/Package_uploadpackage">批量增加包裹</a></span><b>您当前的位置：首页 &gt; 包裹管理 &gt; <a href="/admin/Package_List" id="dialo">包裹列表</a></b></div>
         <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
         <td width="50" align="center">状态：</td>
        <td>
<select name="ddlProperty" id="ddlProperty" class="select">
	<option value="0">包裹状态</option>
	<option value="1"<%if statustext=1 then%> selected="selected"<%end if%> style="background-color: #fff">未到</option>
	<option value="2"<%if statustext=2 then%> selected="selected"<%end if%> style="background-color: #0198F1">已到</option>
	<option value="3"<%if statustext=3 then%> selected="selected"<%end if%> style="background-color: #8EFFFF">已发货</option>
	<option value="4"<%if statustext=4 then%> selected="selected"<%end if%> style="background-color: #C0C0C0">无效</option>
</select>
            </td>
         <td width="50" align="center">位置：</td>
        <td><input name="positionname" type="text" id="positionname" class="keyword" value="<%=positionname%>" size="5" /></td>
        <td width="18%" align="center">开始时间：<input name="txtstarttime" type="text" maxlength="50" id="txtstarttime" class="input" size="25" onclick="javascript:calendar.setHook(this)" value="<%=txtstarttime%>" /></td>
         <td width="18%" align="center">结束时间：<input name="txtEndtime" type="text" maxlength="50" id="txtEndtime" class="input required" size="25" onclick="javascript:calendar.setHook(this)" value="<%=txtEndtime%>" /></td>
          <td width="18%" align="center">快递单号:<input name="txtKeywords" type="text" id="txtKeywords" class="keyword" value="<%=txtKeywords%>" /></td>
         <td width="18%" align="center">快递公司:<select name='express' id="express" style="font-size:12px;"><option value="">选择快递公司</option>
<%set ers=server.createobject("adodb.recordset")
eexec="select * from [express] where siteid="&siteid&" order by id asc"		
ers.open eexec,conn,1,1
if ers.recordcount>0 then
do while not ers.eof
%><option value="<%=ers("id")%>"<%if int(expressid)=ers("id") then%> selected="selected"<%end if%>><%=ers("txtexpressname")%></option><%		
ers.movenext
Loop
ers.close
set ers=nothing
end if%></select ></td>
        <td width="8%" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
        <div>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="datatable" style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word;">
              <tr>              
                <td width="13%">快递单号</td>
                <td width="8%">快递公司</td>
                <td width="6%">重量</td>
                <td width="15%">物品名称</td>   
                <td width="6%">物品数量</td>  
                <td width="7%">单价</td>           
                <td width="6%">当前状态</td>
                <td width="6%">存放位置</td>
                <td width="10%">备注</td>
                <td width="8%">录入时间</td>
                <td width="11%">操作</td>
              </tr>
<%if FieldCount>0 then
do while not rs.eof
s=rs("statustext")
if s=0 then sb="#fff"
if s=1 then sb="#fff"
if s=2 then sb="#0198F1"
if s=3 then sb="#8EFFFF"
if s=4 then sb="#C0C0C0"
if s=0 then statust="未到"
if s=1 then statust="未到"'"已下单"
if s=2 then statust="已到"'"收到未出货"
if s=3 then statust="已出货"
if s=4 then statust="无效包裹"
if rs("packagetype")=0 then act="airorder"
if rs("packagetype")=1 then act="haiorder"%>
<tr style="background-color:<%=sb%>"><td align="center"><a href="https://www.kuaidi100.com/chaxun?com=&nu=<%=rs("expressno")%>" target="_blank" title="点击查询"><%=rs("expressno")%></a><!--<%=rs("userid")%>--></td><td align="center"><%=rs("expressname")%></td><td align="center"><%if rs("weight")>rs("volumweight") then%><%=FormatNumber(rs("weight"),2,-1)%><%else%><%=FormatNumber(rs("volumweight"),2,-1)%><%end if%></td><td align="center"><%=rs("txtgoodname")%></td><td align="center"><%=rs("txtCount")%></td><td align="center"><%=FormatNumber(rs("txtprice"),2,-1)%></td><td align="center"><span id="wx<%=rs("id")%>"><%=statust%></span><%if rs("jzt")=1 then%>/待拣货<%end if%></td><td><%=rs("positionname")%></td><td align="center"><%=rs("packageremark")%></td><td align="center"><%if isnull(rs("atime2")) then%><%=rs("atime")%><%else%><%=rs("atime2")%><%end if%></td><td align="center"><span><a href="/admin/Package_edit_<%=rs("id")%>">【编辑】</a></span><span><a href="#" onclick="if (confirm('您确认【<%=rs("expressname")%><%=rs("expressno")%>】为无效包裹吗？操作后不可恢复！'))WxPackage(<%=rs("id")%>,wx<%=rs("id")%>)">【无效】</a></span></td></tr>
<%rs.movenext
loop
rs.close
set rs=nothing
end if%>            
            </table>
            
            
            <div class="spClear"></div>
            <div style="line-height:30px;height:30px;">
             <div style="float:right;padding-left:30px;padding-right:30px;"> 输入页码：<input name="txtpagego" type="text" id="txtpagego" value="<%=txtpagego%>" size="3" class="input" /><input type="button" onclick="location.href='/admin/Package_List?act=s&positionname=<%=positionname%>&ddlProperty=<%=statustext%>&txtstarttime=<%=txtstarttime%>&txtEndtime=<%=txtEndtime%>&txtKeywords=<%=txtKeywords%>&express=<%=express%>&txtpagego='+document.getElementById('txtpagego').value" name="Button1" value="跳转" id="Button1" /></div> <div id="Pagination" class="right flickr"></div>
             
	  </div>
    </div></form>
    <div id="dialog" title="Dialog Title"><form name="form2" action="/admin/Package_List" id="form2"><%expressid=request.Cookies("admin")("expressid")
position=request.Cookies("admin")("position")%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable"> 
              <tr>
                <td align="right">存放位置：</td>
                <td>
                     <input name="txtposition" type="text" maxlength="250" id="txtposition" class="input" size="25" value="<%=position%>" onkeydown="if(event.keyCode==13) focusNextInput(this);" /></td>
              </tr>
              <tr>
                <td align="right">快递公司：</td>
                <td>
        <select name='ddexpress' id="ddexpress" style="font-size:12px;">
<option value="">选择快递公司</option>
<%if expressid<>"" then expressid=int(expressid)
set rs=server.createobject("adodb.recordset")
exec="select * from [express] where siteid="&siteid&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("txtexpressname")%>"<%if expressid=rs("id") then%> selected="selected"<%end if%>><%=rs("txtexpressname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%></select >
                </td>
              </tr>
              <tr>
                <td width="25%" align="right">快递单号：</td>
                <td width="75%">
                <input name="txtexpressno" type="text" maxlength="50" id="txtexpressno" class="input" size="25" minlength="3" HintTitle="快递单号" HintInfo="是一排数字的组合！" onkeydown="if(event.keyCode==13) focusNextInput(this);" /></td>
              </tr>
              <tr>
                <td align="right" class="style1">重量：</td>
                <td class="style1">
                <input name="txtweight" type="text" value="" maxlength="250" id="txtweight" class="input" size="25" onkeydown="if(event.keyCode==13) focusNextInput(this);" oninput="if(this.value.length != 0 && this.value!=0)initailselect(this)"/>
                 [单位KG]</td>
              </tr>
              <tr>
                <td align="right">材积重：</td>
                <td>
                    <input name="txtvolume_weight" type="text" value="0" maxlength="250" id="txtvolume_weight" class="input" size="25" onkeydown="if(event.keyCode==13) focusNextInput(this);" /> [单位KG]</td>
              </tr>
              </table></form><script type="text/javascript">   
    //jQuery实现在一个输入框按回车键后光标跳到下一个输入框   initailselect(this);
    function focusNextInput(thisInput)  
    {   
        var inputs = document.getElementsByTagName("input");   
        for(var i = 0;i<inputs.length;i++){   
            // 如果是最后一个，则焦点回到第一个   
            if(i==(inputs.length-1)){
				if (inputs[i].value.length == 0)inputs[i].value="0"; //如果焦点值为空时设为
                inputs[0].focus(); break;   
            }else if(thisInput == inputs[i]){   
				if (inputs[i].value.length == 0)inputs[i].value="0"; //如果焦点值为空时设为0
                inputs[i+1].focus(); break;   
            }   
        }   
    }   
</script> 
       <div style="margin-top:10px; text-align:center;">
            <input type="button" value="确认保存" CssClass="submit" 
                onclick="initailselect();" />
&nbsp;&nbsp;           
 <input type="button" value="退出" CssClass="submit" 
                onclick="cancel();" /><div id="div1"></div>
&nbsp;&nbsp;           
     </div>
</div>
     <script src="/admin/js/chosen.jquery.js" type="text/javascript"></script>
     <script type="text/javascript">
         $j(".chzn-select").chosen();
         $j(".chzn-select-deselect").chosen({ allow_single_deselect: true });
    </script>
</body>
</html>
<%elseif instr(a,"uploadpackage")>0 then '出货报表导入包裹%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	出货报表导入
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<script type="text/javascript" src="/Js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/Js/jquery.form.js"></script>
<script type="text/javascript" src="/admin/js/multipleupload.js"></script>
    <style type="text/css">
        .style1
        {
            width: 430px;
        }
    </style>
    </head>
<body style="padding:10px;">
<div id="doing" style="Z-INDEX:12000;LEFT:0px;WIDTH:100%;CURSOR:wait;POSITION:absolute;TOP:0px;HEIGHT:100%;visibility:hidden;"> 
<table width="100%" height="100%"> 
<tr align="center" valign="middle"> 
<td> 
<table width="169" height="62" bgcolor="#99cccc" style="FILTER: Alpha(Opacity=75); WIDTH: 169px; HEIGHT: 62px"> 
<tr align="center" valign="middle"> 
<td>系统生成中请耐心等待.<br> 
<img src="/admin/Images/loading.gif" /></td> 
</tr> 
</table> 
</td> 
</tr> 
</table> 
</div>
    <form name="form1" method="post" action="/admin/Package_uploadpackage" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Package_List">返回列表</a></span><b>您当前的位置：首页 &gt; 订单管理 &gt; 包裹导入</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="1" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">导入出货报表<font color="red">(注意：导入的EXCEL只能为2003以下的版本)</font></th>
        </tr>
   
        <tr>
            <td align="right">导入报表：</td>
            <td>
                <input name="txtImgUrl" type="text" id="txtImgUrl" class="input w380 left" HintTitle="产品的图片" HintInfo="请在右边“选择/上传”上传产品大图，自动生成缩位图。" />
                <a href="javascript:void(0);" class="files"><input type="file" id="FileUpload" name="FileUpload" /></a>
                <span class="uploading">正在上传，请稍候...</span><font color="red">模版下载地址：<a href="/UpLoadFiles/packagelist.xls">下载</a></font></td>
        </tr>       
        </table>
    <div style="margin-top:10px;text-align:center;">
    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
  <input type="submit" name="btnSave" value="提交" onclick="javascript:document.getElementById(&#39;doing&#39;).style.visibility=&#39;visible&#39;;" id="btnSave" class="submit" />

  
</div>
    </form>
    <table width="100%" border="1" cellspacing="1" cellpadding="1" class="msgtable">
        <tr>
            <th colspan="2" align="left">导入结果</th>
        </tr>
        <tr>
            <td align="right">成功导入的记录</td>  <td align="left"><font color="red"></font></td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style1" width="15%"><font color="red"><strong>未能导入成功的记录：</strong></font></td>
            <td width="85%">               
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>      
        <th width="12%">快递单号</th>
        <th width="10%">位置</th>
        <th width="12%">快递公司</th>     
        
         
      </tr>  
     
    
      </table>
     </td>
        </tr>
     
        </table>
    
    </body>
</html>

<%elseif instr(a,"_edit")>0 then '编辑包裹
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 then
expressno=request("expressno")
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [package] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
expressid=rs("expressid")
expressno=rs("expressno")
weight=rs("weight")
volumweight=rs("volumweight")
positionname=rs("positionname")
packageremark=rs("packageremark")
s=rs("statustext")
else
Response.Write "<Script Language=JavaScript>alert('信息有误！');history.go(-1);</Script>"
Response.end
end if
rs.close
set rs=nothing
end if%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	编辑包裹
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Package_edit_<%=id%>" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Package_List">返回管理列表</a></span><b>您当前的位置：首页 &gt; 包裹管理 &gt; 编辑包裹</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th colspan="2" align="left">基本信息设置</th>
              </tr>
              <tr>
                <td width="25%" align="right">快递单号：</td>
                <td width="75%">
                    <span id="txtexpressno"><%=expressno%></span>
                </td>
              </tr>
              <tr>
                <td align="right">快递公司：</td>
                <td>
              <select name="ddlexpress" id="ddlexpress">
<option value="">选择快递公司</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [express] where siteid="&siteid&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("txtexpressname")%>"<%if expressid=rs("id") then%> selected="selected"<%end if%>><%=rs("txtexpressname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%></select >
                </td>
              </tr>
              
              <tr>
                <td align="right">重量：</td>
                <td>
                <input name="txtweight" type="text" value="<%=FormatNumber(weight,2,-1)%>" maxlength="250" id="txtweight" class="input" size="25" />
                 [单位KG]</td>
              </tr>
              
              <tr>
                <td align="right">材积重：</td>
                <td>
                    <input name="txtvolume_weight" type="text" value="<%=FormatNumber(volumweight,2,-1)%>" maxlength="250" id="txtvolume_weight" class="input" size="25" /> [单位KG]</td>
              </tr>
              
              <tr>
                <td align="right">存放位置：</td>
                <td>
                     <input name="txtposition" type="text" maxlength="250" id="txtposition" class="input" size="25" value="<%=positionname%>" /></td>
              </tr>
              
              <tr>
                <td align="right">状态：</td>
                <td>
                     <select name="DropDownList1" id="DropDownList1">
	<option value="1"<%if s=0 then%> selected="selected"<%end if%> style="background-color: #fff">未到仓库</option>
<!--<option value="1"<%if s=1 then%> selected="selected"<%end if%> style="background-color: #fff">已下单</option>-->
	<option value="2"<%if s=2 then%> selected="selected"<%end if%> style="background-color: #0198F1">收到未出货</option>
	<option value="3"<%if s=3 then%> selected="selected"<%end if%> style="background-color: #8EFFFF">已出货</option>
	<option value="4"<%if s=4 then%> selected="selected"<%end if%> style="background-color: #C0C0C0">无效包裹</option>
</select>
                  </td>
              </tr>
        <td align="right">备注：</td>
        <td style="text-align:left;"> <textarea style="width:250px; border:1px solid #d4d4d4; background-color:#fafafa;" id="packageremark" rows="6" cols="20" name="packageremark"><%=packageremark%></textarea></td>
        </tr>
              </table>
                     
          
          <div style="margin-top:10px; text-align:center;"><input type="hidden" name="packageid" id="packageid" value="<%=id%>" /><input type="hidden" name="backurl" id="backurl" value="<%=request.servervariables("http_referer")%>" />
            <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="editpackage()" />
&nbsp;&nbsp; 
            <input type="reset" name="button" id="button" value="重 置" class="submit" />
          </div>
    </form>
<script type="text/javascript">
function editpackage() {    
    var packageid = $("#packageid").val();
    var express = $("#ddlexpress").val();
    var weight = $("#txtweight").val();
    var volume_weight = $("#txtvolume_weight").val();
    var position = $("#txtposition").val();
    var statustext = $("#DropDownList1").val();
    var packageremark = $("#packageremark").val();
    var backurl = $("#backurl").val();
    var msg = '';
    if (weight.length == 0) {
        msg += '请填写重量！\n';
    }
    if (volume_weight.length == 0) {
        msg += '请填写材积重！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Package_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
	if(packageid&&express&&weight&&volume_weight&&statustext&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/packageeditapi",
        data: { "packageid": packageid, "express": express, "weight": weight,"volume_weight":volume_weight, "position": position, "statustext": statustext, "packageremark": packageremark },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('包裹不存在！');
            }
            else if (data == '1') {
                alert('修改成功！');
                location.href = backurl;
            }
            else {
                alert('数据异常！');
            }

        }
    })
	}
}
</script>
</body>
</html>

<%end if%>
