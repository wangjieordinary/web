<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
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
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if instr(power,"viewPackage")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('没有订单查看权限。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [quotation] where siteid="&siteid&osql&" order by id desc"		
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

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	运费方案管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" /><link href="/admin/css/jquery-ui.css" rel="stylesheet" /><style type="text/css">
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
    <script src="/admin/js/jquery.js"></script>
    <script src="/admin/js/jquery-ui.js"></script>  
    
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
      <script type="text/javascript" src="/admin/js/systempriceinital.js"></script> 
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(<%=rssum%>, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:15,
		    num_display_entries:3,
		    current_page:<%=page%>,
		    num_edge_entries:2,
		    link_to:"?page=__id__"
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
<body style="padding:10px;">
    <form name="form1" method="post" action="List.aspx" id="form1">
    <div class="navigation"><span class="add"><a href="#" id="dialo" class="ui-state-default">增加运费方案</a>  </span><b>您当前的位置：首页 &gt; 
        运费报价管理 &gt; 运费报价列表</b></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="datatable">
      <tr>
       
        <th width="10%">编号</th>
        <th width="15%">报价方案名</th>
        <th width="15%">报价类型</th>
        <th width="35%">备注</th>        
        <th width="25%">操作</th>
      </tr>
<%if rssum>0 then
for i=1 to pagecount%>
      <tr>
        <td align="center"><span id="rptList_ctl01_lb_id"><%=rs("id")%></span></td>
        <td align="center"><%=rs("qname")%></td>
        <td align="center"><%if rs("qtype")=0 then%>空运<%end if%><%if rs("qtype")=1 then%>海运<%end if%></td>
        <td align="center"><%=rs("remark")%></td>
        <td align="center"><span><a href="PricePostway.aspx?id=1">【增加报价渠道】</a></span><span><a href="pricedetails.aspx?id=1">【报价明细】</a></span><span><a href="edit.aspx?id=1">【修改】</a></span></td>
      </tr>
<%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%> 
      </table>
      

    <div class="spClear"></div>
        
    
   <div id="dialog" title="Dialog Title">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">      
      <tr>
        <td width="25%" align="right">方案名称：</td>
        <td  width="75%">
           <input name="pricename" type="text" maxlength="50" id="pricename" class="input required" size="27" HintTitle="方案名称" HintInfo="方案名称。" />
    </td>
       </tr>
        <tr>
        <td width="25%" align="right" class="style1">备注：</td>
        <td width="75%" class="style1">
            <textarea name="txtmoto" rows="2" cols="20" id="txtmoto" style="height:96px;width:180px;">
</textarea></td>
       </tr>
       </table>
       <div style="margin-top:10px; text-align:center;">
            <input type="button" value="确认保存" CssClass="submit" 
                onclick="initailselect();" />
&nbsp;&nbsp;           
     </div>
</div>

       
    </form>     
</body>
</html>
