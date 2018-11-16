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
if instr(power,"viewPosition")>0 or atype=1 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_List")>0 then '列表
if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [position] where siteid="&siteid&osql&" order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
rs.PageSize=48
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
	位置管理
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
        items_per_page:48,
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
        var msg = "您真的确定要删除该位置？\n\n请确认！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
</script> 
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Position_List" id="form1">
        <div class="navigation"><span class="add"><a href="/admin/Position_Add">添加位置</a></span><b>您当前的位置：首页 &gt; 位置管理 &gt; 位置列表</b></div>
         <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    </table>
        <div>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable" style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word;">
              <tr>              
               <th width="14%">选择</th>                 
                <th width="18%">位置名称</th>
                <th width="18%">排序编号</th>              
                <th width="10%">备注</th>        
                <th width="11%">操作</th>
              </tr>
<%if rssum>0 then
for i=1 to pagecount%>
              <tr >
                <td align="center">
                    <input name="rptList$ctl01$cb_id" type="checkbox" id="rptList_ctl01_cb_id" class="checkall" value="2121" /><span id="rptList_ctl01_lb_id" style="display:none;"><%=rs("id")%></span>
                </td>
                <td align="center"><%=rs("txtpositionname")%></td>
                <td align="center"><%=rs("txtsortid")%></td> 
                 <td align="center"><%=rs("txtremark")%></td>             
                <td align="center"><span><a href="/admin/Position_Edit_<%=rs("id")%>">【修改】</a></span><span><a href="/admin/Position_List" onclick="javascript:return p_del()">【删除】</a></span></td>
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
             <div style="float:right;padding-left:30px;padding-right:30px;"> 输入页码：<input name="txtpagego" type="text" id="txtpagego" size="3" class="input" /><input type="submit" name="Button1" value="跳转" id="Button1" /></div> <div id="Pagination" class="right flickr"></div>
              <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel1" href="javascript:__doPostBack(&#39;lbtnDel1&#39;,&#39;&#39;)">批量删除</a>
                  </span>
           </div>
	  </div>
    </div>
    
</form>
</body>
</html>
<%elseif instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '添加和编辑
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [position] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
txtpositionname=rs("txtpositionname")
txtsortid=rs("txtsortid")
txtremark=rs("txtremark")
else
Response.Write "<Script Language=JavaScript>alert('信息有误！');history.go(-1);</Script>"
Response.end
end if
rs.close
set rs=nothing
end if%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	添加位置
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Position_Add" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Position_List">返回管理列表</a></span><b>您当前的位置：首页 &gt; 位置管理 &gt; 增加位置</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th colspan="2" align="left">基本信息设置</th>
              </tr>
              <tr>
                <td width="25%" align="right">位置名称号：</td>
                <td width="75%">
                <input name="txtpositionname" type="text" value="<%=txtpositionname%>" maxlength="50" id="txtpositionname" class="input required" size="25" minlength="3" HintTitle="位置名称" HintInfo="填写位置名称！" />
                </td>
              </tr>
              
              <tr>
                <td align="right">排序ID：</td>
                <td>
                    <input name="txtsortid" type="text" value="<%=txtsortid%>" maxlength="250" id="txtsortid" class="input digits required " size="25" /> </td>
              </tr>
              
              <tr>
                <td align="right">备注信息：</td>
                <td>
                     <textarea name="txtremark" rows="2" cols="20" id="txtremark" class="input  " size="25" style="height:83px;width:156px;"><%=txtremark%></textarea></td>
              </tr>
              
              </table>
              <div style="margin-top:10px; text-align:center;">           
            <input type="button" value="确认保存" id="btnSave" class="submit" onclick="chkposition()" /><input type="hidden" name="id" id="id" value="<%=id%>" />
&nbsp;&nbsp; 
            <input type="reset" name="button" id="button" value="重 置" class="submit" />
          </div>
              </form>
<script type="text/javascript">
function chkposition() {    
    var id = '';
    var txtpositionname = $("#txtpositionname").val();
    var txtsortid = $("#txtsortid").val();
    var txtremark = $("#txtremark").val();
    var id = $("#id").val();
    var backurl = '';//$("#backurl").val();
    var msg = '';
    if (txtpositionname.length == 0) {
        msg += '请填写位置名称！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Position_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(txtpositionname&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addpositionapi",
data: { "txtpositionname": txtpositionname, "txtsortid": txtsortid, "txtremark": txtremark, "id": id, "backurl": backurl },
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