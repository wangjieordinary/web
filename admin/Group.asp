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

if instr(a,"_List")>0 then '列表
if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [UserGroup] where siteid="&siteid&osql&" order by id desc"		
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
	会员管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
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
        items_per_page:15,
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
        var msg = "您真的确定要把密码重置成123456吗？\n\n请确认！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
</script> 
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Group_List" id="form1">
        <div class="navigation"><span class="Add"><a href="/admin/Group_Add">增加类型</a></span><b>您当前的位置：首页 &gt; 用户管理 &gt; 用户类型列表</b></div>
        <div style="padding-bottom:10px;"></div>
        <div>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="datatable">
              <tr>
               
                <th width="25%">类型名称</th>
                <th width="25%">空运报价方案</th>      
                <th width="25%">海运报价方案</th>       
                <th width="25%">操作</th>
              </tr>
<%if rssum>0 then
for i=1 to pagecount%>
              <tr>
                <td align="center"><%=rs("gname")%></td>
                <td align="center"><%=rs("airp")%></td>
                <td align="center"><%=rs("haip")%></td>
                <td align="center"><span><a href="/admin/Group_Edit_<%=rs("id")%>">【编辑】</a></span></td>
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
    </div>
    </form>
</body>
</html>
<%elseif instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '添加和编辑
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [UserGroup] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
gname=rs("gname")
airp=rs("airp")
haip=rs("haip")
fdq=rs("fdq")
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
	编辑会员类型
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
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
    <form name="form1" method="post" action="/admin/Group_Edit" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Group_List">返回管理列表</a></span><b>您当前的位置：首页 &gt; 用户管理 &gt; 编辑用户</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th colspan="2" align="left">基本信息设置</th>
              </tr>
              <tr>
                <td width="15%" align="right">用户类型：</td>
                <td width="85%">
                <input name="gname" type="text" value="<%=gname%>" maxlength="50" id="gname" class="input required" size="25" minlength="3" HintTitle="用户类型名称" HintInfo="最少3个字节。" />
                </td>
              </tr>
              
              <tr>
                <td align="right">价格方案：</td>
                <td>
<select name="airp" id="airp" style="width:130px;">
	<option value="0">请选择空运报价方案</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [quotation] where siteid="&siteid&" and qtype=0 order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("qname")%>"<%if airp=rs("qname") then%> selected="selected"<%end if%>><%=rs("qname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select>
<select name="haip" id="haip" style="width:130px;">
	<option value="0">请选择海运报价方案</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [quotation] where siteid="&siteid&" and qtype=1 order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>|<%=rs("qname")%>"<%if haip=rs("qname") then%> selected="selected"<%end if%>><%=rs("qname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select>
                  </td>
              </tr>
              
              <tr>
                <td align="right">前台报价表：</td>
                <td>
                    <textarea name="editor" rows="2" cols="20" id="editor" style=" width:1024px;height:400px;"><%=fdq%></textarea></td>
              </tr>
              
              </table>

          <div style="margin-top:10px; text-align:center;">
            <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chkgroup()" /><input type="hidden" name="id" id="id" value="<%=id%>" />
&nbsp;&nbsp; 
            <input type="reset" name="button" id="button" value="重 置" class="submit" />
          </div>
<script type="text/javascript">
function chkgroup() {    
    var id = '';
    var gname = $("#gname").val();
    var airp = $("#airp").val();
    var fdq = UE.getEditor('editor').getContent();
    var haip = $("#haip").val();
    var id = $("#id").val();
    var backurl = '';//$("#backurl").val();
    var msg = '';
    if (gname.length == 0) {
        msg += '请填写类型名称！\n';
    }
    if (airp.length == 0) {
        msg += '请选择空运报价方案！\n';
    }
    if (haip.length == 0) {
        msg += '请选择海运报价方案！\n';
    }
    if (fdq.length == 0) {
        msg += '请填写前台报价表！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Group_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(gname&&airp&&haip&&fdq&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addgroupapi",
data: { "gname": gname, "airp": airp, "haip": haip, "fdq": fdq, "id": id, "backurl": backurl },
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
</form>
</body>
</html>
<%end if%>
