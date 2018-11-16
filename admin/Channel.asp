<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
sname=SPLIT(teh,"&")(1)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
adminid=SPLIT(teh,"&")(5)
if adminid="" or isnull(adminid) then adminid=0
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="仓库管理员"
if atype=3 then ttype="业务员"
if atype=5 then ttype="财务"
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if atype=1 or instr(power,"viewContents")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_List")>0 then '管理员列表
if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
ddlClassId=Request("ddlClassId")
if ddlClassId<>"" then
ddlClassId=int(ddlClassId)
osql=" and ddlClassId="&ddlClassId
else
ddlClassId=0
end if
set rs=server.createobject("adodb.recordset")
exec="select * from [contentclass] where siteid="&siteid&osql&" and ctype=0 order by id desc"		
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
<head><title>
	类别管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
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
		    link_to:"?act=s&ddlClassId=<%=Request("ddlClassId")%>&page=__id__"
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
    <form name="form1" method="post" action="/admin/Channel_List" id="form1">
        <div class="navigation"><span class="add"><a href="/admin/Channel_Add">增加顶级类别</a></span><b>您当前的分类：首页 &gt; 类别管理 &gt; 类别列表</b></div>
        <div style="padding-bottom:10px;"></div>

        
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
                    <tr>
                        <th width="7%">编号</th>
                        <th align="left">类别名称</th>
                        <th width="90">优先级别</th>
                        <th width="150">管理操作</th>
                    </tr>
<%if rssum>0 then
for i=1 to pagecount%>
                    <tr>
                        <td align="center">
                          <input type="hidden" name="txtClassId" id="txtClassId" value="<%=rs("id")%>" />
                          <input type="hidden" name="txtClassLayer" id="txtClassLayer" value="<%=rs("aid")%>" />
                          <%=rs("id")%>
                        </td>
                        <td>
                          <img src=../images/folder_open.gif align=absmiddle />
                         <%=rs("txtTitle")%>
                        </td>
                        <td align="center">0</td>
                        <td align="left">
                            <span><a href="/admin/Channel_Edit_<%=rs("id")%>">修改</a></span>
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
</body><%end if%>
<%if instr(a,"_Add")>0 or instr(a,"_Edit")>0  then
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [contentclass] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
txtTitle=rs("txtTitle")
aid=rs("aid")
txtClassOrder=rs("txtClassOrder")
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
	添加分类
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Channel_Add" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Channel_List">返回管理列表</a></span><b>您当前的分类：首页 &gt; 分类管理 &gt; 增加分类</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th colspan="2" align="left">基本信息设置</th>
              </tr>
              <tr>
                <td width="25%" align="right">分类名称：</td>
                <td width="75%">
                <input name="txtTitle" type="text" value="<%=txtTitle%>" maxlength="50" id="txtTitle" class="input required" size="25" minlength="3" HintTitle="分类名称" HintInfo="填写分类名称！" />
                </td>
              </tr>
              <tr>
                <td width="25%" align="right">所属分类：</td>
                <td width="75%">
<select name="aid" id="aid" class="select">
<option value="0">顶级分类</option>
<%set ddrs=server.createobject("adodb.recordset")
ddexec="select * from [contentclass] where siteid="&siteid&" and ctype=0 order by id asc"		
ddrs.open ddexec,conn,1,1
if ddrs.recordcount>0 then
do while not ddrs.eof
%><option value="<%=ddrs("id")%>"<%if int(aid)=ddrs("id") then%> selected="selected"<%end if%>><%=ddrs("txtTitle")%></option><%		
ddrs.movenext
Loop
ddrs.close
set ddrs=nothing
end if%>

</select>                </td>
              </tr>
              <tr>
                <td align="right">排序ID：</td>
                <td>
                    <input name="txtClassOrder" type="text" value="<%=txtClassOrder%>" maxlength="250" id="txtClassOrder" class="input digits required " size="25" /> </td>
              </tr>
              
              </table>
              <div style="margin-top:10px; text-align:center;">           
            <input type="button" value="确认保存" id="btnSave" class="submit" onclick="chkChannel()" /><input type="hidden" name="id" id="id" value="<%=id%>" />
&nbsp;&nbsp; 
            <input type="reset" name="button" id="button" value="重 置" class="submit" />
          </div>
              </form>
<script type="text/javascript">
function chkChannel() {    
    var id = '';
    var txtTitle = $("#txtTitle").val();
    var aid = $("#aid").val();
    var txtClassOrder = $("#txtClassOrder").val();
    var id = $("#id").val();
    var backurl = '';//$("#backurl").val();
    var msg = '';
    if (txtTitle.length == 0) {
        msg += '请填写分类名称！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Channel_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(txtTitle&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addChannelapi",
data: { "txtTitle": txtTitle, "aid": aid, "txtClassOrder": txtClassOrder, "id": id, "backurl": backurl },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '1') {
                alert('添加成功！');
                location.href = backurl;
            } else if (data == '2') {
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
