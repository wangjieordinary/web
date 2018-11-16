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
exec="select * from [content] where siteid="&siteid&osql&" and ctype=0 order by id desc"		
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
	内容管理
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
    <form name="form1" method="post" action="/admin/Contents_List" id="form1">
    <div class="navigation"><span class="add"><a href="/admin/Contents_Add">增加内容</a></span><b>您当前的位置：首页 &gt; 内容管理 &gt; 内容列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="center">请选择：</td>
        <td><select name="ddlClassId" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ddlClassId\&#39;,\&#39;\&#39;)&#39;, 0)" id="ddlClassId" class="select">
	<option selected="selected" value="">所有类别</option>
<%set ddrs=server.createobject("adodb.recordset")
ddexec="select * from [contentclass] where siteid="&siteid&" and ctype=0 order by id asc"		
ddrs.open ddexec,conn,1,1
if ddrs.recordcount>0 then
do while not ddrs.eof
%><option value="<%=ddrs("id")%>"<%if int(ddlClassId)=ddrs("id") then%> selected="selected"<%end if%>><%=ddrs("txtTitle")%></option><%		
ddrs.movenext
Loop
ddrs.close
set ddrs=nothing
end if%>

</select></td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" class="keyword" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th width="6%">编号</th>
        <th align="left">内容标题</th>
        <th width="13%">所属类别</th>
        <th width="90">优先级别</th>
        <th width="8%">操作</th>
      </tr>
<%if rssum>0 then
for i=1 to pagecount%>
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl01_lb_id"><%=rs("id")%></span></td>
        <td><a href="/admin/Contents_Edit_<%=rs("id")%>"><%=rs("txtTitle")%></a></td>
        <td align="center"><%=rs("ddlClassId")%></td>
        <td align="center"><%=rs("txtSortId")%></td>
        <td align="center"><span><a href="/admin/Contents_Edit_<%=rs("id")%>">修改</a></span></td>
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
            <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">删 除</a>
                </span>
            </div>
	</div>
    </form>
</body>
</html>
<%elseif instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '发布内容
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [content] where siteid="&siteid&" and ctype=0 and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
txtTitle=rs("txtTitle")
txtcontent=rs("txtcontent")
ddlClassId=rs("ddlClassId")
txtSortId=rs("txtSortId")
rblIsLock=rs("rblIsLock")
txtImgUrl=rs("txtImgUrl")
else
Response.Write "<Script Language=JavaScript>alert('信息有误！');history.go(-1);</Script>"
Response.end
end if
rs.close
set rs=nothing
end if
if txtSortId="" then txtSortId=0%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	增加内容
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
    <script type="text/javascript" src="/admin/js/singleupload.js"></script>
    <script type="text/javascript" charset="utf-8" src="/admin/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/admin/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/admin/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
</script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Contents_Add" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Contents_List">返回列表</a></span><b>您当前的位置：首页 &gt; 内容管理 &gt; 增加内容</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">增加内容</th>
        </tr>
        <tr>
            <td width="15%" align="right">内容标题：</td>
            <td width="85%">
            <input name="txtTitle" type="text" maxlength="250" value="<%=txtTitle%>" id="txtTitle" class="input w380 required" minlength="3" HintTitle="增加的内容信息标题" HintInfo="控制在100个字数内，标题文本尽量不要太长。" />
            </td>
        </tr>
        
        <tr>
            <td align="right">所属类别：</td>
            <td><select name="ddlClassId" id="ddlClassId" class=" required">
	<option value="">请选择所属类别...</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [contentclass] where siteid="&siteid&" and ctype=0 order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("txtTitle")%>"<%if int(ddlClassId)=rs("id") then%> selected="selected"<%end if%>><%=rs("txtTitle")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select></td>
        </tr>
        <tr>
            <td align="right">优先级别：</td>
            <td>
            <input name="txtSortId" type="text" value="<%=txtSortId%>" maxlength="10" id="txtSortId" class="input required number" size="10" HintTitle="内容的优先级别" HintInfo="纯数字，数值越小越靠前。" />
            </td>
        </tr>
          <tr>
                <td align="right">是否显示：</td>
                <td>
                    <span id="rblIsLock"><input id="rblIsLock_0" type="radio" name="rblIsLock" value="0"<%if rblIsLock=0 then%> checked="checked"<%end if%> /><label for="rblIsLock_0">显示</label><input id="rblIsLock_1" type="radio" name="rblIsLock" value="1"<%if rblIsLock=1 then%> checked="checked"<%end if%> /><label for="rblIsLock_1">不显示</label></span>
                </td>
              </tr>
        <tr>
            <td align="right">内容图片：</td>
            <td>
                <input name="txtImgUrl" type="text" id="txtImgUrl" class="input w380 left"<%if txtImgUrl<>"" then%> value="<%=txtImgUrl%>"<%end if%> />
                <a href="javascript:void(0);" class="files"><input type="file" id="FileUpload" name="FileUpload" /></a>
                <span class="uploading">正在上传，请稍候...</span><%if txtImgUrl<>"" then%><img src="<%=txtImgUrl%>" width="80" /><%end if%>
            最合适大小为320*200</td>
        </tr>
        <tr>
            <td align="right" valign="top">内容详细：</td>
            <td>
            <textarea name="editor" rows="2" cols="20" id="editor" style="height:400px; width:1024px"><%=txtcontent%></textarea>
            </td>
        </tr>
        
    </table>
    <div style="margin-top:10px;text-align:center;">
  <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkContents()" /><input type="hidden" name="id" id="id" value="<%=id%>" />
  &nbsp;
  <input name="重置" type="reset" class="submit" value="重置" />
</div>
</form>
<script type="text/javascript">
function chkContents() {    
    var id = '';
    var txtTitle = $("#txtTitle").val();
    var ddlClassId = $("#ddlClassId").val();
    var txtcontent = UE.getEditor('editor').getContent();
    var txtSortId = $("#txtSortId").val();
    var txtImgUrl = $("#txtImgUrl").val();
    var id = $("#id").val();
    var rblIsLock_0 = $("#rblIsLock_0").is(':checked') //允许评论
    var rblIsLock_1 = $("#rblIsLock_1").is(':checked') //置顶
    var backurl = '';//$("#backurl").val();
    var msg = '';
    if (txtTitle.length == 0) {
        msg += '请填写标题！\n';
    }
    if (ddlClassId.length == 0) {
        msg += '请选择所属栏目！\n';
    }
    if (txtcontent.length == 0) {
        msg += '请填写文章内容！\n';
    }
    if (rblIsLock_0) {
       rblIsLock=0;
    }
    if (rblIsLock_1) {
       rblIsLock=1;
    }
    if (backurl.length == 0) {
        backurl='/admin/Contents_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(txtTitle&&ddlClassId&&txtcontent&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addContentsapi",
data: { "txtTitle": txtTitle, "ddlClassId": ddlClassId, "txtcontent": txtcontent, "txtSortId": txtSortId, "rblIsLock": rblIsLock,"txtImgUrl":txtImgUrl, "id": id, "backurl": backurl },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '1') {
                alert('<%if id="" then%>添加成功<%else%>修改成功<%end if%>！');
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