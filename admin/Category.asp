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

if instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '添加分类
if ubound(split(a,"_"))=2 then
id=int(split(a,"_")(2))
action=LCase(split(a,"_")(1))
end if
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [category] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
ParentID=rs("ParentID")
category=rs("category")
first=rs("first")
categoryorder=rs("categoryorder")
Icon=rs("Icon")
Meta=rs("Meta")
hide=rs("hide")
intro=rs("intro")
else
Response.Write "<Script Language=JavaScript>alert('信息有误！');history.go(-1);</Script>"
Response.end
end if
rs.close
set rs=nothing
end if
if instr(a,"_Add")>0 and id>0 then ParentID=id%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head><title>商品分类管理</title>
<link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
</head><body style="padding:10px;">
    <div class="navigation"><b>您当前的位置：首页 &gt; <a href="/admin/Category_List">商品分类管理</a> &gt; <%if instr(a,"_Add")>0 then%>添加<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>分类</b></div>
    <div class="spClear"></div>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
  <tr> 
    <td height="20" bgcolor="#6699cc" align="center"><font color="#FFFFFF">添加商品大类</font></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF">
	<table width="90%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
     <form name="form1" method="post" action="/admin/Category_Add" id="form1">
		<tr bgcolor="#FFFFFF"> 
            <td align="center">分类名称</td>
            <td><input name="category" type="text" id="category" size="24" value="<%=category%>"></td>
          </tr>
		  <tr bgcolor="#FFFFFF"> 
            <td align="center">所属分类</td>
            <td><select name="ParentID" id="ParentID">  
<option value="0">顶级分类</option>
	<%sort(0)
dim ii
ii=0
sub sort(selec)
	sql="select * from category where ParentID = "&selec&" and hide=0 and category<>'' and category is not null order by categoryorder"
	Set Rs1=Conn.Execute(sql)
	do while not rs1.eof
if selec=0 then
%>
<option value="<%=int(rs1("id"))%>" <%if int(rs1("id"))=int(ParentID) Then Response.write(" Selected") %>><%=rs1("category")%></option>
<%
else
%>
<option value="<%=int(rs1("id"))%>" <%if int(rs1("id"))=int(ParentID) Then Response.write(" Selected") %>><%=string(ii*2,"　")%><%=rs1("category")%></option>
<%
end if
ii=ii+1
	sort rs1("id")
ii=ii-1
	rs1.movenext
	loop
rs1.close
Set Rs1 = Nothing
end sub
%></select>
</td>
          </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">分类介绍</td>
		  <td><textarea name="intro" id="intro" cols="80" rows="6"><%=intro%></textarea></td>
		  </tr>
		   <tr bgcolor="#FFFFFF">
		  <td align="center">分类图片</td>
		  <td><input name="icon" type="text" id="icon" size="50" value="<%=icon%>">
		  <input type="button" name="Submit11" value="上传分类图片" onClick="window.open('upfile.asp?formname=form1&editname=icon','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
          </td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">分类Meta</td>
		  <td><textarea name="meta" cols="40" rows="4" id="meta"><%=meta%></textarea></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">分类排序</td>
		  <td><input name="categoryorder" type="text" id="categoryorder" size="4" value="<%=categoryorder%>"></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">畅销分类</td>
		  <td><input name="first" id="first" type="checkbox" <% if int(first)=1 Then Response.write("checked") %> value="1"></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">显示分类</td>
		  <td><select name="hide" id="hide">
		   <option value="0">显示</option>
           <option value="1" <% if int(hide)=1 Then Response.write("Selected") %>>隐藏</option>
		  </select></td>
		  </tr>
		   <tr bgcolor="#FFFFFF">
		  <td></td>
		  <td><input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkCategory()" /><input type="hidden" name="id" id="id" value="<%if instr(a,"_Edit")>0 then%><%=id%><%end if%>" /></td>
		  </tr>
        </form>
      </table></td>
  </tr>
</table>
<br>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
  <tr> 
    <td bgcolor="#6699cc" height="20" align="center"><font color="#FFFFFF">操作注意事项及说明</font></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
	<table width="80%" border="0" align="center" cellpadding="5" cellspacing="0">
        <tr> 
          <td height="20"><font color="#FF6600">·请注意分类名称不要含有非法字符。<br>
            ·增加一级分类后，些分类将会被列出前台一级分类中。<br>
            ·进行删除操作的同时，会删除此大类下包含的所有小分类和商品。</font></td>
        </tr>
      </table></td>
  </tr>
</table>
<script type="text/javascript">
function chkCategory() {    
    var ParentID = $("#ParentID").val();
    var category = $("#category").val();
    var intro = $("#intro").val();
    var icon = $("#icon").val();
    var meta = $("#meta").val();
    var categoryorder = $("#categoryorder").val();
    var first = $("#first").is(':checked')
    var hide = $("#hide").val();
    var id = $("#id").val();
    var backurl = ''; //$("#backurl").val();
    var msg = '';
    if (ParentID.length == 0) {
        msg += '请选择所属分类！\n';
    }
    if (category.length == 0) {
        msg += '请填写分类名称！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Category_List';
    }
    if (first){first=1;}else{first=0;}
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(ParentID&&category&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addCategoryapi",
data: {"ParentID": ParentID, "category": category, "intro": intro, "icon": icon, "meta": meta, "categoryorder": categoryorder, "first": first,"hide":hide,"id":id,"backurl": backurl },
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
<%elseif instr(a,"_List")>0 then%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head><title>商品分类管理</title>
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
<SCRIPT LANGUAGE="JavaScript">
<!--
function ValidateTextboxAdd(box, button)
{
 var buttonCtrl = document.getElementById( button );
 if ( buttonCtrl != null )
 {
 if (box.value == "" || box.value == box.helptext)
 {
 buttonCtrl.disabled = true;
 }
 else
 {
 buttonCtrl.disabled = false;
 }
 } 
}
//-->
</script>      
<link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
</head><body style="padding:10px;">
    <div class="navigation"><b>您当前的位置：首页 &gt; 商品管理 &gt; 分类管理</b></div>
    <div class="spClear"></div>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
<tr>
		<td align="center" colspan="2">
<form name="form1" method="post" action="/admin/Category_Add" id="form1">
添加一级分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
分类名称：（例如：时尚数码）<input name="category" id="category">
分类排序：<input name="categoryorder" type="text" size="3" value="0" id="categoryorder">
<input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkCategory()" /></form>
</td>
	</tr>
	</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable datatable">
  <tr> 
    <td height="20" bgcolor="#6699cc" align="center" colspan="2"><font color="#FFFFFF">商品分类管理</font></td>
  </tr>
<%
sort1(0)
dim ss
ss=0
sub sort1(selec)
	sql="select * from category where ParentID = "&selec&" and hide=0 and category<>'' and category is not null order by categoryorder"
	Set Rs1=Conn.Execute(sql)
	do while not rs1.eof
if selec=0 then
%>
  <tr height=25>
<td>&nbsp;&nbsp;<a href=/admin/Category_Edit_<%=int(rs1("id"))%>><%=rs1("category")%></a></td>
<td align="right" width="300">
<a href=/admin/Category_Add_<%=int(rs1("id"))%>>添加二级分类</a> | <a href=/admin/Category_Edit_<%=int(rs1("id"))%>>编辑分类</a> | 
<a href="javascript:if (confirm('注意:删除后数据将不能恢复！\n\n确定删除--<%=rs1("category")%>--请按【确定】\n\n不执行删除请按【取消】'))delcat(<%=int(rs1("id"))%>);">删除分类</a></td>
</tr>
<%
else
%>
<tr height=25>
<td>　<%=string(ss*2,"　")%><a href=/admin/Category_Edit_<%=int(rs1("id"))%>><%=rs1("category")%></a></td>
<td align="right" width="300">
<a href=/admin/Category_Add_<%=int(rs1("id"))%>>添加<% = ss+2 %>级分类</a> | <a href=/admin/Category_Edit_<%=int(rs1("id"))%>>编辑分类</a> | 
<a href="javascript:if (confirm('注意:删除后数据将不能恢复！\n\n确定删除--<%=rs1("category")%>--请按【确定】\n\n不执行删除请按【取消】'))delcat(<%=int(rs1("id"))%>);">删除分类</a></td>
</tr>
<%
end if
ss=ss+1
	sort1 rs1("id")
ss=ss-1
	rs1.movenext
	loop
rs1.close
Set Rs1 = Nothing
end sub

%></table>
<br>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
  <tr> 
    <td bgcolor="#6699cc" height="20" align="center"><font color="#FFFFFF">操作注意事项及说明</font></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF"> 
	<table width="80%" border="0" align="center" cellpadding="5" cellspacing="0">
        <tr> 
          <td height="20"><font color="#FF6600">·请注意分类名称不要含有非法字符。<br>
            ·推荐分类只有商品大类才有作用，只有推荐的商品分类才会在头部文件显示。<br>
            ·进行删除操作的同时，会删除此分类下包含的商品。</font></td>
        </tr>
      </table></td>
  </tr>
</table>
<script type="text/javascript">
function chkCategory() {    
    var ParentID = '0';
    var category = $("#category").val();
    var categoryorder = $("#categoryorder").val();
    var backurl = ''; //$("#backurl").val();
    var msg = '';
    if (category.length == 0) {
        msg += '请填写分类名称！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Category_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(ParentID&&category&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addCategoryapi",
data: {"ParentID": ParentID, "category": category, "categoryorder": categoryorder, "backurl": backurl },
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
function delcat(id) {    
var backurl = '/admin/Category_List';
if(id){
    $.ajax({
        type: "post",
        url: "/admin/delCategoryapi",
data: {id:id, "backurl": backurl },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '1') {
                alert('删除成功！');
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

<%end if%></body>