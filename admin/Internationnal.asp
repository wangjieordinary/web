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
if atype=1 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('没有订单查看权限。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_List")>0 then '管理员列表
if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [area] where siteid="&siteid&osql&" order by id asc"		
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
	国际化管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
            $(".msgtable tr").hover(
			    function () {
			        $(this).addClass("tr_hover_col");
			    },
			    function () {
			        $(this).removeClass("tr_hover_col");
			    }
		    );
        });
    </script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="List.aspx" id="form1">

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>

        <div class="navigation"><span class="add"><a href="Add.aspx">增加顶级区域</a></span><b>您当前的位置：首页 &gt; 国际化管理 &gt; 国际化列表</b></div>
        <div style="padding-bottom:10px;"></div>

        
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                    <tr>
                        <th width="7%">编号</th>
                        <th align="left"">类别名称</th>
                        <th width="90">优先级别</th>
                        <th width="150">管理操作</th>
                    </tr>
<%if rssum>0 then
for i=1 to pagecount%>
                    <tr>
                        <td align="center">
                        <%=rs("id")%>
                        </td>
                        <td>
                          <img src=../images/folder_open.gif align=absmiddle />
                          <%=rs("txtTitle")%>/<%=rs("txtarecode")%>
                        </td>
                        <td align="center"><%=rs("txtClassOrder")%></td>
                        <td align="left">
                            <span><a href="/admin/Internationnal_Add_parentid_<%=rs("id")%>">添加子类</a></span>
                         
                            <span><a href="/admin/Internationnal_Edit_<%=rs("id")%>">修改</a></span>
                            <span><a onclick="return confirm( &#39;该操作会删除本类别和下属类别，确定要删除吗？ &#39;);" id="rptClassList_ctl01_lbDel" href="javascript:__doPostBack(&#39;rptClassList$ctl01$lbDel&#39;,&#39;&#39;)">删除</a></span>
                        </td>
                    </tr>
<%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%>

                </table>
            
 
     </form>
</body>
</html><%end if%>
