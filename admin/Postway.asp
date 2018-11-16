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
if atype=1 or instr(power,"viewPostway")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_List")>0 then '管理员列表
if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [postway] where siteid="&siteid&osql&" order by id asc"		
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
	转单号管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" /><link href="/admin/css/jquery-ui.css" rel="stylesheet" />   
    <script src="/admin/js/jquery.js"></script>
    <script src="/admin/js/jquery-ui.js"></script>  
    
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
      <script type="text/javascript" src="/admin/js/postwayinital.js"></script> 
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
		    link_to:"?act=s&page=__id__"
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
    <script type="text/javascript">
        function p_del() {
            var msg = "您真的确定要删除该渠道吗？这将会删除与该渠道所有有关的报价！\n\n请确认！";
            if (confirm(msg) == true) {
                return true;
            } else {
                return false;
            }
        }
</script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="List.aspx" id="form1">
    <div class="navigation"><span class="add"><a href="#" id="dialo" class="ui-state-default">增加渠道</a>  </span><b>您当前的位置：首页 &gt; 
        渠道管理 &gt; 渠道列表</b></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
       
        <th width="7%">编号</th>
        <th width="10%">运送方式</th>
        <th width="10%">类型</th>
        <th width="10%">操作</th>
      </tr>
<%if rssum>0 then
for i=1 to pagecount%>
      <tr>
        <td align="center"><span id="rptList_ctl01_lb_id"><%=rs("id")%></span></td>
        <td align="center"><%=rs("txtpostwayname")%></td>
        <td align="center"><%if rs("rblUserType")=0 then%>空运<%end if%><%if rs("rblUserType")=1 then%>海运<%end if%></td>
        <td align="center"><span><a href="/admin/Postway_Edit_<%=rs("id")%>">【修改】</a></span><span><a href="/admin/Postway_List" onclick="javascript:return p_del()">【删除】</a></span></td>
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
            <div id="Pagination" class="right flickr"></div>
           
	</div>
    
   <div id="dialog" title="Dialog Title">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">      
      <tr>
        <td width="25%" align="right">渠道名称：</td>
        <td  width="75%">
           <input name="postwayname" type="text" maxlength="50" id="postwayname" class="input required" size="27" HintTitle="渠道名称" HintInfo="渠道。" />
    &nbsp;渠道的名称</td>
       </tr>     
           <tr>
        <td width="25%" align="right">排序ID：</td>
        <td width="75%">
             <input name="txtorderid" type="text" value="0" maxlength="50" id="txtorderid" class="input required" size="27" HintTitle="排序ID" HintInfo="排序ID。" />
          </td>
       </tr> 
           <tr>
        <td width="25%" align="right">渠道类型：</td>
        <td width="75%">
             <input type="radio" name="posttype" value="0"  checked/>空运<input type="radio" name="posttype" value="1" />海运</td>
       </tr> 
       </table>
       <div style="margin-top:10px; text-align:center;">
            <input type="button" value="确认保存" CssClass="submit"    onclick="initailselect();" />
&nbsp;&nbsp;           
     </div>
</div>

       
    </form>     
</body>
</html><%end if%>
