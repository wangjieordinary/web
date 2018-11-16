<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../adminconfig.asp"--><%teh=chkadmin()
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
if atype=1 or instr(power,"viewArticle")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '发布资讯
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [content] where siteid="&siteid&" and ctype=1 and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
txtTitle=rs("txtTitle")
txtcontent=rs("txtcontent")
ddlClassId=rs("ddlClassId")
txtSortId=rs("txtSortId")
rblIsLock=rs("rblIsLock")
txtAuthor=rs("txtAuthor")
txtAddtime=rs("txtAddtime")
txtForm=rs("txtForm")
txtKeyword=rs("txtKeyword")
txtZhaiyao=rs("txtZhaiyao")
txtDaodu=rs("txtDaodu")
txtImgUrl=rs("txtImgUrl")
cblItem_0=rs("cblItem_0")
ctype=rs("ctype")
cblItem_1=rs("cblItem_1")
cblItem_2=rs("cblItem_2")
cblItem_3=rs("cblItem_3")
cblItem_4=rs("cblItem_4")
txtClick=rs("txtClick")
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
	发布资讯
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
        $(function() {
            //显示关闭高级选项
            $("#upordown").toggle(function() {
                $(this).text("关闭高级选项");
                $(this).removeClass();
                $(this).addClass("up-01");
                $(".upordown").show();
            }, function() {
                $(this).text("显示高级选项");
                $(this).removeClass();
                $(this).addClass("up-02");
                $(".upordown").hide();
            });
        });
    </script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
</script>

</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Article_Add" id="form1">
    <div class="navigation">
      <span class="back"><a href="List.aspx">返回列表</a></span><b>您当前的位置：首页 &gt; 资讯管理 &gt; 发布资讯</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">发布资讯</th>
        </tr>
        <tr>
            <td width="15%" align="right">文章标题：</td>
            <td width="85%">
            <input name="txtTitle" type="text" maxlength="250" id="txtTitle" value="<%=txtTitle%>" class="input w380 required" minlength="3" HintTitle="发布的文章标题" HintInfo="控制在100个字数内，标题文本尽量不要太长。" />
            </td>
        </tr>
        
        <tr>
            <td align="right">文章作者：</td>
            <td>
            <input name="txtAuthor" type="text" value="<%if txtAuthor="" then%>管理员<%else%><%=txtAuthor%><%end if%>" maxlength="50" id="txtAuthor" class="input w250 required" HintTitle="文章作者" HintInfo="控制在50个字数内，如“管理员”。" />
            </td>
        </tr>
        <tr>
            <td align="right">添加时间：</td>
            <td>
                <input name="txtAddtime" type="text" value="<%if txtAddtime="" then%><%=now()%><%else%><%=txtAddtime%><%end if%>" maxlength="50" id="txtAddtime" class="必填" HintTitle="文章添加时间" HintInfo="请输入标准的时间格式”。" /></td>
        </tr>
        <tr>
            <td align="right">文章来源：</td>
            <td>
            <input name="txtForm" type="text" value="<%if txtForm="" then%>本站<%else%><%=txtForm%><%end if%>" maxlength="100" id="txtForm" class="input w250 required" HintTitle="信息来源" HintInfo="控制在50个字数内，如“本站”。" />
            <span id="upordown" class="up-02">显示高级选项</span>
            </td>
        </tr>
        <tr class="upordown hide">
            <td align="right">Meta关键字：</td>
            <td>
            <input name="txtKeyword" value="<%=txtKeyword%>" type="text" maxlength="100" id="txtKeyword" class="input w250" HintTitle="Meta关键字" HintInfo="用于搜索引擎，如有多个关健字请用英文的,号分隔，不填写将自动提取标题。" />
            </td>
        </tr>
        <tr class="upordown hide">
            <td align="right">Meta描述：</td>
            <td>
            <textarea name="txtZhaiyao" rows="2" cols="20" id="txtZhaiyao" class="textarea wh380" HintTitle="Meta描述" HintInfo="用于搜索引擎，控制在250个字数内，不填写将自动提取。"><%=txtZhaiyao%>
</textarea>
            </td>
        </tr>
        
        <tr class="upordown hide">
            <td align="right">文章导读：</td>
            <td>
            <textarea name="txtDaodu" rows="2" cols="20" id="txtDaodu" class="textarea wh380" HintTitle="文章导读属性" HintInfo="控制在250个字数内，纯文本，不填写将自动提取。"><%=txtDaodu%>
</textarea>
            </td>
        </tr>
        <tr class="upordown hide">
            <td align="right">优先级别：</td>
            <td>
            <input name="txtSortId" type="text" value="<%=txtSortId%>" maxlength="10" id="txtSortId" class="input required number" size="10" HintTitle="内容的优先级别" HintInfo="纯数字，数值越小越靠前。" />
            </td>
        </tr>
        <tr>
            <td align="right">所属栏目：</td>
            <td><select name="ddlClassId" id="ddlClassId" class=" required">
	<option value="">请选择所属类别...</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [contentclass] where siteid="&siteid&" and ctype=1 order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("txtTitle")%>"<%if ddlClassId=rs("id") then%> selected<%end if%>><%=rs("txtTitle")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select></td>
        </tr>
        <tr>
            <td align="right">文章图片：</td>
            <td>
                <input name="txtImgUrl" type="text" id="txtImgUrl" class="input w380 left"<%if txtImgUrl<>"" then%> value="<%=txtImgUrl%>"<%end if%> />
                <a href="javascript:void(0);" class="files"><input type="file" id="FileUpload" name="FileUpload" /></a>
                <span class="uploading">正在上传，请稍候...</span><%if txtImgUrl<>"" then%><img src="<%=txtImgUrl%>" width="80" /><%end if%>
            最合适大小为670*400</td>
        </tr>
        <tr>
            <td align="right" valign="top">文章内容：</td>
            <td>
            <textarea name="editor" rows="2" cols="20" id="editor" style="height:400px; width:1024px"><%=txtcontent%></textarea>
         
            </td>
        </tr>
        
        <tr>
            <td align="right">文章属性：</td>
            <td>
                <span id="cblItem"><input id="cblItem_0" type="checkbox" name="cblItem$0"<%if cblItem_0=1 then%> checked<%end if%>/><label for="cblItem_0">允许评论</label><input id="cblItem_1" type="checkbox" name="cblItem$1"<%if cblItem_1=1 then%> checked<%end if%>/><label for="cblItem_1">置顶</label><input id="cblItem_2" type="checkbox" name="cblItem$2"<%if cblItem_2=1 then%> checked<%end if%>/><label for="cblItem_2">推荐</label><input id="cblItem_3" type="checkbox" name="cblItem$3"<%if cblItem_3=1 then%> checked<%end if%>/><label for="cblItem_3">热点</label><input id="cblItem_4" type="checkbox" name="cblItem$4"<%if cblItem_4=1 then%> checked<%end if%>/><label for="cblItem_4">幻灯</label></span>
            </td>
        </tr>
        <tr>
            <td align="right">浏览次数：</td>
            <td>
            <input name="txtClick" type="text" value="<%if txtForm="" then%>0<%else%><%=txtClick%><%end if%>" maxlength="10" id="txtClick" class="input required number" size="10" HintTitle="文章的浏览次数" HintInfo="纯数字，本文章被阅读的次数。" />
            </td>
        </tr>
    </table>
    <div style="margin-top:10px;text-align:center;">
  <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkArticle()" /><input type="hidden" name="id" id="id" value="<%=id%>" />
  &nbsp;
  <input name="重置" type="reset" class="submit" value="重置" />
</div>
</form>
<script type="text/javascript">
function chkArticle() {    
    var txtTitle = $("#txtTitle").val();
    var txtAuthor = $("#txtAuthor").val();
    var txtAddtime = $("#txtAddtime").val();
    var txtForm = $("#txtForm").val();
    var txtKeyword = $("#txtKeyword").val();
    var txtZhaiyao = $("#txtZhaiyao").val();
    var txtDaodu = $("#txtDaodu").val();
    var ddlClassId = $("#ddlClassId").val();
    var txtImgUrl = $("#txtImgUrl").val();
    var txtcontent = UE.getEditor('editor').getContent();
    var txtSortId = $("#txtSortId").val();
    var id = $("#id").val();
    var txtClick = $("#txtClick").val();
    var cblItem_0 = $("#cblItem_0").is(':checked') //允许评论
    var cblItem_1 = $("#cblItem_1").is(':checked') //置顶
    var cblItem_2 = $("#cblItem_2").is(':checked') //推荐
    var cblItem_3 = $("#cblItem_3").is(':checked') //热点
    var cblItem_4 = $("#cblItem_4").is(':checked') //幻灯
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
    if (cblItem_0) {
       cblItem_0=1;
    }else{cblItem_0=0;}
    if (cblItem_1) {
       cblItem_1=1;
    }else{cblItem_1=0;}
    if (cblItem_2) {
       cblItem_2=1;
    }else{cblItem_2=0;}
    if (cblItem_3) {
       cblItem_3=1;
    }else{cblItem_3=0;}
    if (cblItem_4) {
       cblItem_4=1;
    }else{cblItem_4=0;}
    if (backurl.length == 0) {
        backurl='/admin/Article_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(txtTitle&&ddlClassId&&txtcontent&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addArticleapi",
data: { "txtTitle": txtTitle, "txtAuthor": txtAuthor, "txtAddtime": txtAddtime,"txtForm":txtForm,"txtSortId": txtSortId,"id":id, "txtKeyword": txtKeyword, "txtZhaiyao": txtZhaiyao, "txtDaodu": txtDaodu,"ddlClassId": ddlClassId,"txtImgUrl": txtImgUrl, "txtcontent": txtcontent, "txtClick": txtClick, "cblItem_0": cblItem_0, "cblItem_1": cblItem_1, "cblItem_2": cblItem_2, "cblItem_3": cblItem_3, "cblItem_4": cblItem_4, "backurl": backurl },
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
</html><%elseif instr(a,"_List")>0 then '新闻列表
page=Request("page")
if page="" or isnull(page) then page=0
ddlClassId=Request("ddlClassId")
if ddlClassId<>"" then
ddlClassId=int(ddlClassId)
osql=" and ddlClassId="&ddlClassId
else
ddlClassId=0
end if
ddlProperty=Request("ddlProperty")
set rs=server.createobject("adodb.recordset")
exec="select * from [content] where siteid="&siteid&osql&" and ctype=1 order by id desc"		
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
	资讯管理
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
		    link_to:"Article_List&act=m&ddlClassId=<%=Request("ddlClassId")%>&page=__id__"
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
    <form name="form1" method="post" action="/admin/Article_List" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 资讯管理 &gt; 资讯列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="center">请选择：</td>
        <td>
            <select name="ddlClassId" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ddlClassId\&#39;,\&#39;\&#39;)&#39;, 0)" id="ddlClassId" class="select">
	<option selected="selected" value="">所有类别</option>
<%set crs=server.createobject("adodb.recordset")
exec="select * from [contentclass] where siteid="&siteid&" and ctype=1 order by txtClassOrder asc"		
crs.open exec,conn,1,1
if crs.recordcount>0 then
do while not crs.eof
%><option value="<%=crs("id")%>"<%if int(ddlClassId)=crs("id") then%> selected="selected"<%end if%>><%=crs("txtTitle")%></option><%		
crs.movenext
Loop
crs.close
set crs=nothing
end if%>

</select>&nbsp;
            <select name="ddlProperty" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ddlProperty\&#39;,\&#39;\&#39;)&#39;, 0)" id="ddlProperty" class="select">
	<option selected="selected" value="">所有属性</option>
	<option value="isMsg">评论</option>
	<option value="isTop">置顶</option>
	<option value="isRed">推荐</option>
	<option value="isHot">热门</option>
	<option value="isSlide">幻灯片</option>

</select>
        <span class="add"><a href="/admin/Article_Add">发布文章</a></span></td>
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
        <th align="left">文章标题</th>
        <th width="13%">所属类别</th>
        <th width="16%">发布时间</th>
        <th width="110">属性</th>
        <th width="8%">操作</th>
      </tr>
<%if rssum>0 then
for i=1 to pagecount%>
      <tr>
        <td align="center"><span class="checkall"><input id="rptList<%=rs("id")%>" type="checkbox" name="rptList[]" /></span></td>
        <td align="center"><%=rs("id")%></td>
        <td><a href="/admin/Article_Edit_<%=rs("id")%>"><%=rs("txtTitle")%></a></td>
        <td align="center"><%=rs("ddlClassId")%></td>
        <td><%=rs("txtAddtime")%></td>
        <td>
          <input type="image" onclick="ibtnMsg(<%=rs("id")%>,Msg<%=rs("id")%>,this.value);return false;" name="Msg<%=rs("id")%>" id="Msg<%=rs("id")%>" title="<%if rs("cblItem_0")=0 then%>允许<%else%>取消<%end if%>评论" value="<%=rs("cblItem_0")%>" src="../Images/ico-0<%if rs("cblItem_0")=0 then%>_<%end if%>.png" style="border-width:0px;" />
          <input type="image" onclick="ibtnTop(<%=rs("id")%>,Top<%=rs("id")%>,this.value);return false;" name="Top<%=rs("id")%>" id="Top<%=rs("id")%>" title="<%if rs("cblItem_1")=0 then%>允许<%else%>取消<%end if%>置顶" value="<%=rs("cblItem_1")%>" src="../Images/ico-1<%if rs("cblItem_1")=0 then%>_<%end if%>.png" style="border-width:0px;" />
          <input type="image" onclick="ibtnRed(<%=rs("id")%>,Red<%=rs("id")%>,this.value);return false;" name="Red<%=rs("id")%>" id="Red<%=rs("id")%>" title="<%if rs("cblItem_2")=0 then%>允许<%else%>取消<%end if%>推荐" value="<%=rs("cblItem_2")%>" src="../Images/ico-2<%if rs("cblItem_2")=0 then%>_<%end if%>.png" style="border-width:0px;" />
          <input type="image" onclick="ibtnHot(<%=rs("id")%>,Hot<%=rs("id")%>,this.value);return false;" name="Hot<%=rs("id")%>" id="Hot<%=rs("id")%>" title="<%if rs("cblItem_3")=0 then%>允许<%else%>取消<%end if%>热门" value="<%=rs("cblItem_3")%>" src="../Images/ico-3<%if rs("cblItem_3")=0 then%>_<%end if%>.png" style="border-width:0px;" />
          <input type="image" onclick="ibtnSlide(<%=rs("id")%>,Slide<%=rs("id")%>,this.value);return false;" name="Slide<%=rs("id")%>" id="Slide<%=rs("id")%>" title="<%if rs("cblItem_4")=0 then%>允许<%else%>取消<%end if%>幻灯片" value="<%=rs("cblItem_4")%>" src="../Images/ico-4<%if rs("cblItem_4")=0 then%>_<%end if%>.png" style="border-width:0px;" />
        </td>
        <td align="center"><span><a href="/admin/Article_Edit_<%=rs("id")%>">修改</a></span></td>
      </tr>
<%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%>
 
      </table>
<script type="text/javascript">
function ibtnMsg(id,Msgid,zt){
	var postUrl = '/admin/adminapi.asp?a=ibtnMsg';
	var postData = {'id':id,'zt':zt};
	$.post(postUrl,postData,function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
//if(zt==0){Msgid.src="../Images/ico-0.png";}else{Msgid.src="../Images/ico-0_.png";}
window.location.href = "/admin/Article_List&act=m&ddlClassId=<%=Request("ddlClassId")%>&page=<%=page%>"
		}else{
		}
	});
}
function ibtnTop(id,Topid,zt){
	var postUrl = '/admin/adminapi.asp?a=ibtnTop';
	var postData = {'id':id,'zt':zt};
	$.post(postUrl,postData,function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
//if(zt==0){Topid.src="../Images/ico-1.png";}else{Topid.src="../Images/ico-1_.png";}
window.location.href = "/admin/Article_List&act=m&ddlClassId=<%=Request("ddlClassId")%>&page=<%=page%>"
		}else{
		}
	});
}
function ibtnRed(id,Redid,zt){
	var postUrl = '/admin/adminapi.asp?a=ibtnRed';
	var postData = {'id':id,'zt':zt};
	$.post(postUrl,postData,function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
//if(zt==0){Redid.src="../Images/ico-2.png";}else{Redid.src="../Images/ico-2.png";}
window.location.href = "/admin/Article_List&act=m&ddlClassId=<%=Request("ddlClassId")%>&page=<%=page%>"
		}else{
		}
	});
}
function ibtnHot(id,Hotid,zt){
	var postUrl = '/admin/adminapi.asp?a=ibtnHot';
	var postData = {'id':id,'zt':zt};
	$.post(postUrl,postData,function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
//if(zt==0){Hotid.src="../Images/ico-3.png";}else{Hotid.src="../Images/ico-3_.png";}
window.location.href = "/admin/Article_List&act=m&ddlClassId=<%=Request("ddlClassId")%>&page=<%=page%>"
		}else{
		}
	});
}
function ibtnSlide(id,Slideid,zt){
	var postUrl = '/admin/adminapi.asp?a=ibtnSlide';
	var postData = {'id':id,'zt':zt};
	$.post(postUrl,postData,function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
//if(zt==0){Slideid.src="../Images/ico-4.png";}else{Slideid.src="../Images/ico-4_.png";}
window.location.href = "/admin/Article_List&act=m&ddlClassId=<%=Request("ddlClassId")%>&page=<%=page%>"
		}else{
		}
	});
}
</script>

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
</html><%end if%>