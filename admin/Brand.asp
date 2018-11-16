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

if instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '发布商品
if ubound(split(a,"_"))=2 then
id=int(split(a,"_")(2))
action=LCase(split(a,"_")(1))
end if
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [brand] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
ParentID=rs("ParentID")
brand=rs("brand")
catid=rs("catid")
catidlist=rs("catidlist")
first=rs("first")
brandorder=rs("brandorder")
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
<head><title>品牌管理</title>
<link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
</head><body style="padding:10px;">
<div class="navigation"><b>您当前的位置：首页 &gt; <a href="/admin/Brand_List">品牌管理</a> &gt; <%if instr(a,"_Add")>0 then%>添加<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>品牌</b></div>
    <div class="spClear"></div>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
  <tr> 
    <td height="20" bgcolor="#6699cc" align="center"><font color="#FFFFFF">添加品牌</font></td>
  </tr>
  <tr> 
    <td bgcolor="#FFFFFF">
	<table width="90%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
     <form name="form1" method="post" action="/admin/Brand_Add" id="form1">
		<tr bgcolor="#FFFFFF"> 
            <td align="center">品牌名称</td>
            <td><input name="brand" type="text" id="brand" size="24" value="<%=brand%>"></td>
          </tr>
		  <tr bgcolor="#FFFFFF"> 
            <td align="center">所属分类</td>
            <td><select name="catid" class="inputcc" id="catid" onChange="selectcatid2(this.value)" > 
	<option value="">请选择所属分类...</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [category] where (ParentID=1 or ParentID=2) and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if a=rs("id") then category=rs("category")
%><option value='<%=rs("id")%>'<%if catid=rs("id") or instr(catidlist,"|"&rs("id")&"|")>0 then%> selected<%end if%>><%=rs("category")&rs("id")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select> 
<select name="catid2" class="inputcc" id="catid2" onChange="selectcatid3(this.value)" > 
	<option value="">请选择子分类...</option>
</select>
<select name="catid3" class="inputcc" id="catid3" > 
	<option value="">请选择子分类...</option>
</select>　<%if int(catid)>0 then%><%=getcatname(catid)%><%end if%>
</td>
          </tr>
        <tr>
            <td align="center">关联分类</td>
            <td><input name="catidlist" type="text" id="catidlist" value="<%if instr(catidlist,"$")>0 then%><%=split(catidlist,"$")(1)%><%end if%>" class="input w380 required" HintTitle="输入分类ID，多分类用|分隔" HintInfo="输入分类ID，多分类用|分隔" /> 选填项</td>
        </tr>
		  <tr bgcolor="#FFFFFF"> 
            <td align="center">所属品牌</td>
            <td><select name="ParentID" id="ParentID">  
	<%bsort(0)
dim bb
bb=0
sub bsort(selec)
	sql="select * from brand where ParentID = "&selec&" and hide=0 order by brandorder"
	Set rs2=Conn.Execute(sql)
	do while not rs2.eof
if selec=0 then
%>
<option value="<%if int(ParentID)=0 then%>0<%else%><%=int(rs2("id"))%><%end if%>" <%if int(rs2("id"))=int(ParentID) or int(rs2("id"))=int(id) Then Response.write(" Selected") %>><%=rs2("brand")%></option>
<%
else
%>
<option value="<%if int(ParentID)=0 then%>0<%else%><%=int(rs2("id"))%><%end if%>" <%if int(rs2("id"))=int(ParentID) or int(rs2("id"))=int(id) Then Response.write(" Selected") %>><%=string(bb*2,"　")%><%=rs2("brand")%></option>
<%
end if
bb=bb+1
	bsort rs2("id")
bb=bb-1
	rs2.movenext
	loop
rs2.close
Set rs2 = Nothing
end sub
%></select>
</td>
          </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">品牌介绍</td>
		  <td><textarea name="intro" id="intro" cols="80" rows="6"><%=intro%></textarea></td>
		  </tr>
		   <tr bgcolor="#FFFFFF">
		  <td align="center">品牌图片</td>
		  <td><input name="icon" type="text" id="icon" size="50" value="<%=icon%>">
		  <input type="button" name="Submit11" value="上传品牌图片" onClick="window.open('upfile.asp?formname=form1&editname=icon','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
          </td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">品牌Meta</td>
		  <td><textarea name="meta" cols="40" rows="4" id="meta"><%=meta%></textarea></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">品牌排序</td>
		  <td><input name="brandorder" type="text" id="brandorder" size="4" value="<%=brandorder%>"></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">畅销品牌</td>
		  <td><input name="first" id="first" type="checkbox" <% if int(first)=1 Then Response.write("checked") %> value="1"></td>
		  </tr>
		  <tr bgcolor="#FFFFFF">
		  <td align="center">显示品牌</td>
		  <td><select name="hide" id="hide">
		   <option value="0">显示</option>
           <option value="1" <% if int(hide)=1 Then Response.write("Selected") %>>隐藏</option>
		  </select></td>
		  </tr>
		   <tr bgcolor="#FFFFFF">
		  <td></td>
		  <td><input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkBrand()" /><input type="hidden" name="id" id="id" value="<%if instr(a,"_Edit")>0 then%><%=id%><%end if%>" /></td>
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
          <td height="20"><font color="#FF6600">·请注意品牌名称不要含有非法字符。<br>
            ·增加一级品牌后，些品牌将会被列出前台一级品牌中。<br>
            ·进行删除操作的同时，会删除此大类下包含的所有小品牌和商品。</font></td>
        </tr>
      </table></td>
  </tr>
</table>
<script type="text/javascript">
function selectcatid2(catid) {
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
//$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
<%if split(catidlist&"||||","|")(2)<>"" then%>
if (msg[i].CatID=='<%=split(catidlist&"||||","|")(2)%>'){$("#catid2").append("<option value='" + msg[i].CatID + "' Selected>" + msg[i].CatName + "</option>");}else{$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");}<%else%>
$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");<%end if%>
                        }
                    }
                    else {                        
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
function selectcatid3(catid) {
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
//$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
<%if split(catidlist&"||||","|")(3)<>"" then%>
if (msg[i].CatID=='<%=split(catidlist&"||||","|")(3)%>'){$("#catid3").append("<option value='" + msg[i].CatID + "' Selected>" + msg[i].CatName + "</option>");}else{$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");}<%else%>
$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");<%end if%>
                        }
                    }
                    else {                        
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
<%if split(catidlist&"||||","|")(1)<>"" then%>$(document).ready(function(){  
window.onload=selectcatid2('<%=split(catidlist,"|")(1)%>');<%if split(catidlist&"||||","|")(2)<>"" then%>selectcatid3('<%=split(catidlist,"|")(2)%>');<%end if%>
}); <%end if%> 
</script>
<script type="text/javascript">
function chkBrand() {    
    var ParentID = $("#ParentID").val();
    var catid = $("#catid").val();
    var catidlist = $("#catidlist").val();
    var catid2 = $("#catid2").val();
    var catid3 = $("#catid3").val();
    var brand = $("#brand").val();
    var intro = $("#intro").val();
    var icon = $("#icon").val();
    var meta = $("#meta").val();
    var brandorder = $("#brandorder").val();
    var first = $("#first").is(':checked')
    var hide = $("#hide").val();
    var id = $("#id").val();
    var backurl = ''; //$("#backurl").val();
    var msg = '';
    if (brand.length == 0) {
        msg += '请填写品牌名称！\n';
    }
    if (catid.length == 0) {
        msg += '请选择所属产品分类！\n';
    }
    //if (catid2) { catid=catid2;}
    //if (catid3) { catid=catid3;}
    //if (ParentID.length == 0) {
    //    msg += '请选择所属品牌！\n';
    //}
    if (backurl.length == 0) {
        backurl='/admin/Brand_List';
    }
    if (first){first=1;}else{first=0;}
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(ParentID&&brand&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addBrandapi",
data: {"ParentID": ParentID, "brand": brand, "catid": catid,"catid2": catid2,"catid3": catid3,"catidlist": catidlist, "intro": intro, "icon": icon, "meta": meta, "brandorder": brandorder, "first": first,"hide":hide,"id":id,"backurl": backurl },
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
<head><title>商品品牌管理</title>
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
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
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
    <div class="navigation"><b>您当前的位置：首页 &gt; 商品管理 &gt; 品牌管理</b></div>
    <div class="spClear"></div>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
<tr>
		<td align="center" colspan="2">
<form name="form1" method="post" action="/admin/Brand_Add" id="form1">
添加一级品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
品牌名称：（例如：联想）<input name="brand" id="brand">
<select name="catid" class="inputcc" id="catid" onChange="selectcatid2(this.value)" > 
	<option value="">请选择所属分类...</option>
<%if catid<>"" then%><option value='<%=catid%>' selected><%=getcatname(catid)%></option><%end if%>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [category] where (ParentID=1 or ParentID=2) and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if a=rs("id") then category=rs("category")
%><option value='<%=rs("id")%>'<%if catid=rs("id") then%> selected<%end if%>><%=rs("category")&rs("id")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select> 
<select name="catid2" class="inputcc" id="catid2" onChange="selectcatid3(this.value)" > 
	<option value="">请选择子分类...</option>
</select>
<select name="catid3" class="inputcc" id="catid3"> 
	<option value="">请选择子分类...</option>
</select>
品牌排序：<input name="brandorder" type="text" size="3" value="0" id="brandorder">
<input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkBrand()" /></form>
</td>
	</tr>
	</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" class="msgtable datatable">
  <tr> 
    <td height="20" bgcolor="#6699cc" align="center" colspan="2"><font color="#FFFFFF">商品品牌管理</font></td>
  </tr>
<%
sort1(0)
dim ss
ss=0
sub sort1(selec)
	sql2="select * from brand where ParentID = "&selec&" order by brandorder"
	Set Rs1=Conn.Execute(sql2)
	do while not rs1.eof
if selec=0 then
%>
  <tr height=25>
<td>&nbsp;&nbsp;<a href=/admin/Brand_Edit_<%=int(rs1("id"))%>><%=rs1("brand")%></a></td>
<td align="right" width="300">
<a href=/admin/Brand_Add_<%=int(rs1("id"))%>>添加二级品牌</a> | <a href=/admin/Brand_Edit_<%=int(rs1("id"))%>>编辑品牌</a> | 
<a href="javascript:if (confirm('注意:删除后数据将不能恢复！\n\n确定删除--<%=rs1("brand")%>--请按【确定】\n\n不执行删除请按【取消】'))delcat(<%=int(rs1("id"))%>);">删除品牌</a></td>
</tr>
<%
else
%>
<tr height=25>
<td>　<%=string(ss*2,"　")%><a href=/admin/Brand_Edit_<%=int(rs1("id"))%>><%=rs1("brand")%></a></td>
<td align="right" width="300">
<a href=/admin/Brand_Add_<%=int(rs1("id"))%>>添加<% = ss+2 %>级品牌</a> | <a href=/admin/Brand_Edit_<%=int(rs1("id"))%>>编辑品牌</a> | 
<a href="javascript:if (confirm('注意:删除后数据将不能恢复！\n\n确定删除--<%=rs1("brand")%>--请按【确定】\n\n不执行删除请按【取消】'))delcat(<%=int(rs1("id"))%>);">删除品牌</a></td>
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
          <td height="20"><font color="#FF6600">·请注意品牌名称不要含有非法字符。<br>
            ·推荐品牌只有商品大类才有作用，只有推荐的商品品牌才会在头部文件显示。<br>
            ·进行删除操作的同时，会删除此品牌下包含的商品。</font></td>
        </tr>
      </table></td>
  </tr>
</table>
<script type="text/javascript">
function selectcatid2(catid) {
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
                        }
                    }
                    else {                        
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
function selectcatid3(catid) {
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
                        }
                    }
                    else {                        
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
</script>
<script type="text/javascript">
function chkBrand() {    
    var ParentID = '0';
    var brand = $("#brand").val();
	var catid = $("#catid").val();
    var catid2 = $("#catid2").val();
    var catid3 = $("#catid3").val();
    var brandorder = $("#brandorder").val();
    var backurl = ''; //$("#backurl").val();
    var msg = '';
    if (brand.length == 0) {
        msg += '请填写品牌名称！\n';
    }
    if (catid.length == 0) {
        msg += '请选择产品分类！\n';
    }
//    if (catid2) { catid=catid2;}
//    if (catid3) { catid=catid3;}
    if (backurl.length == 0) {
        backurl='/admin/Brand_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(ParentID&&brand&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addBrandapi",
data: {"ParentID": ParentID, "brand": brand, "catid": catid,"catid2": catid2,"catid3": catid3, "brandorder": brandorder, "backurl": backurl },
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
var backurl = '/admin/Brand_List';
if(id){
    $.ajax({
        type: "post",
        url: "/admin/delBrandapi",
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