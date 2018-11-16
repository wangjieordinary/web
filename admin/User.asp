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
if instr(power,"viewUser")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if
'会员管理查看,添加,充值,扣款,消费日志,返利日志,修改,重置密码
'viewUser,addUser,PayUser,PayminusUser,viewPayLog,viewUserReffer,editUser,resetUser

if instr(a,"_List")>0 then '会员列表

if instr(a,"act")>0 then
page=Request("page")
end if
if page="" or isnull(page) then page=0
txtKeywords=chkstr(Request("txtKeywords"))
if txtKeywords<>"" then osql=" and (userno='"&txtKeywords&"' or olduserno='"&txtKeywords&"' or email='"&txtKeywords&"' or telephone='"&txtKeywords&"') "
if getNum(txtKeywords)<>"" then osql=" and (userno='"&txtKeywords&"' or olduserno='"&txtKeywords&"' or email='"&txtKeywords&"' or telephone='"&txtKeywords&"' or id="&getNum(txtKeywords)&") "
set rs=server.createobject("adodb.recordset")
if atype=1 or atype=5 then
exec="select * from [member] where siteid="&siteid&osql&" order by id desc"	
else
exec="select * from [member] where siteid="&siteid&osql&" and (saleid="&adminid&" or aeid="&adminid&" or salename='"&admin&"' or aename='"&admin&"') order by id desc"	
end if	
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
        items_per_page:20,
		num_display_entries:3,
		current_page:<%=page%>,
		num_edge_entries:2,
		link_to:"?act=s&txtKeywords=<%=txtKeywords%>&page=__id__"
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
    <form name="form1" method="post" action="/admin/User_List" id="form1">
        <div class="navigation"><span class="add"><a href="/admin/User_Add">增加会员</a></span><b>您当前的位置：首页 &gt; 用户管理 &gt; <a href="/admin/User_List">用户列表</a></b></div>
        <div style="padding-bottom:10px;"></div>
        <div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" >
      <tr>
         <td width="75%" colspan="4">现用户信息很多暂未完善，显示用户的位置暂用ID代替，以方便检查问题，后期将修改为显示会员名。</td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" value="<%=txtKeywords%>" class="keyword" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td></tr>
    </table>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="datatable">
            
              <tr>
               
               <th>用户代号</th>
                <th>用户帐号</th>
                <th>用户余额</th>
                <th>积分余额</th>
                <th>手机号码</th>
                <th>电子邮件</th>
                <th>用户等级</th>
                <th>推荐关系（ID）</th>
                <th>分享码</th>
                <th>状态</th>
                <th>注册时间</th>
                <th>备注</th>
                <th>操作</th>
              </tr>
<%if rssum>0 then
for i=1 to pagecount%>
              <tr>
                <td align="center"><%=rs("id")%></td>
                <td align="center"><%=rs("userno")%><%if isnull(rs("olduserno"))=false and rs("olduserno")<>"" and rs("olduserno")<>"0" then%>(<%=rs("olduserno")%>)<%end if%></td>
                <td align="center"><%=gshjg(rs("UserMoney"))%></td>
                <td align="center"><%=rs("GiftPrice")%></td>
                <td align="center"><%=rs("te")&rs("telephone")%></td>
                <td align="center"><%=rs("email")%></td>
                <td align="center"><%if rs("cj")=0 then%>普通会员<%elseif rs("cj")=1 then%>共享会员<%elseif rs("cj")=2 then%>VIP会员<%elseif rs("cj")=3 then%>社区运营中心<%elseif rs("cj")=4 then%>县区运营中心<%elseif rs("cj")=5 then%>市运营中心<%elseif rs("cj")=6 then%>省运营中心<%end if%></td>
                <td align="center"><%=rs("uid0")%>|<%=rs("uid1")%>|<%=rs("uid2")%>|<%=rs("uid3")%>|<%=rs("uid4")%>|<%=rs("uid5")%>|<%=rs("uid6")%></td>
                <td align="center"><a href="/vip_qrcode.php?data=<%=rs("telephone")%>" target="_blank">查看</a></td><td align="center">
                  <%if rs("rblIsLock")=0 then%><img title="正常" src="../images/correct.gif" /><%end if%><%if rs("rblIsLock")=1 then%><img title="禁用" src="../images/disable.gif" /><%end if%>
                </td><td align="center"><%=rs("atime")%></td><td align="center"><%=rs("con")%></td>
                <td align="center"><%if instr(power,"editUser")>0 then%><span><a href="/admin/User_Edit_<%=rs("id")%>">[编辑]</a></span><%end if%><%'if instr(power,"DelUser")>0 then%> <span><a href="#" onClick="if (confirm('确认要删除该用户吗？操作后不可逆！'))deluser(<%=rs("id")%>);">[删除]</a></span><%'end if%></td>
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
             
	  </div><input name="backurl" type="hidden" value="/admin/User<%=Request("a")%>&txtKeywords=<%=txtKeywords%>&page=<%=page%>" id="backurl"/>
    </div>
    </form><script type="text/javascript">
function deluser(id){
if(id){
		var getUrl = "/admin/deluserapi";
		var backurl = $("#backurl").val();
		$.post(getUrl,{id:id,backurl:backurl},function(result){
			//show_err_msg(result);
			var data = eval("("+result+")");
			if(data.fail){
				show_err_msg(data.Word);
			}else{
				//show_msg(data.Word,data.gourl);
				location.href=backurl;
			}
		});
}
}
</script>
</body>
</html>
<%elseif instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '用户添加和编辑
if (instr(power,"addUser")>0 and instr(a,"_Add")>0) or (instr(power,"editUser")>0 and instr(a,"_Edit")>0) then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 then
set rs=server.createobject("adodb.recordset")
sql="Select * from [member] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
userno=rs("userno")
email=rs("email")
telephone=rs("telephone")
rblIsLock=rs("rblIsLock")
GiftPrice=rs("GiftPrice")
UserMoney=rs("UserMoney")
cj=rs("cj")
con=rs("con")
hygx=rs("uid0")&"|"&rs("uid1")&"|"&rs("uid2")&"|"&rs("uid3")&"|"&rs("uid4")&"|"&rs("uid5")&"|"&rs("uid6")
end if
rs.close
set rs=nothing
end if%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	<%if instr(a,"_Add")>0 then%>添加用户<%end if%><%if instr(a,"_Edit")>0 then%>编辑用户<%end if%>
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/User_Edit" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/User_List">返回管理列表</a></span><b>您当前的位置：首页 &gt; 用户管理 &gt; <%if instr(a,"_Add")>0 then%>添加用户<%end if%><%if instr(a,"_Edit")>0 then%>编辑用户<%end if%></b>
    </div>
    <div style="padding-bottom:15px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th colspan="2" align="left">基本信息设置</th>
              </tr>
              <tr>
                <td width="25%" align="right">登录帐号：</td>
                <td width="75%">
                <input name="txtUserName" value="<%=userno%>" type="text"<%if instr(a,"_Edit")>0 then%> readonly<%end if%> id="txtUserName" class="input" size="25" minlength="3" HintTitle="登录用户名（帐号）" HintInfo="用户帐号不能修改" />
                </td>
              </tr>
              <tr>
                <td align="right">登录密码：</td>
                <td>
                <input name="txtPassword" type="password" maxlength="50" id="txtPassword" class="input required" size="25" minLength="4" HintTitle="登录密码" HintInfo="大于4个字符，小于50个字符，必须是字母或数字或下划线的组合，不修改请留空。" />
                </td>
              </tr>

              <tr>
                <td align="right">手机号码：</td>
                <td>
                <input name="telephone"  value="<%=telephone%>"type="text" maxlength="250" id="telephone" class="input telephone" size="25" />
                </td>
              </tr>

              <tr>
                <td align="right">邮箱地址：</td>
                <td>
                <input name="txtEmail"  value="<%=email%>"type="text" maxlength="250" id="txtEmail" class="input email" size="25" />
                </td>
              </tr>
              
              <tr>
                <td align="right">是否禁用：</td>
                <td>
                    <span id="rblIsLock"><input id="rblIsLock" type="radio" name="rblIsLock" value="0"<%if rblIsLock=0 then%> checked="checked"<%end if%> /><label for="rblIsLock">正常</label><input id="rblIsLock" type="radio" name="rblIsLock" value="1"<%if rblIsLock=1 then%> checked="checked"<%end if%> /><label for="rblIsLock">锁定</label></span>
                  </td>
              </tr>
              
              <tr>
                <td align="right">用户级别：</td>
                <td>
              <select name="cj" id="cj">
	<option value="">请选择用户级别</option>
<%for c=0 to 6
%><option value="<%=c%>"<%if int(cj)=c then%> selected<%end if%>><%=SPLIT("普通会员,共享会员,VIP会员,社区运营中心,县区运营中心,市运营中心,省运营中心",",")(c)%></option><%		
next%>
</select>
                  </td>
              </tr>
              <%if instr(a,"_Edit")>0 then%>
              <tr>
                <td align="right">会员关系：</td>
                <td><input name="hygx"  value="" type="text" maxlength="250" id="hygx" class="input email" size="25" /><br /><%=hygx%></td>
              </tr>
              <tr>
                <td align="right">会员备注：</td>
                <td><input name="con"  value="<%=con%>" type="text" maxlength="250" id="con" class="input email" size="25" /></td>
              </tr>
              <tr>
                <td align="right">账户金额：</td>
                <td><%=FormatNumber(UserMoney,2,-1)%></td>
              </tr>
              <tr>
                <td align="right">账户积分：</td>
                <td><%=GiftPrice%></td>
              </tr>
              <%end if%>
         
              </table>
                     
          
          <div style="margin-top:10px; text-align:center;">
            <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="editmember()" />
&nbsp;&nbsp; 
            <input type="reset" name="button" id="button" value="重 置" class="submit" /><input type="hidden" name="userid" id="userid" value="<%=id%>" /><input type="hidden" name="ocj" id="ocj" value="<%=cj%>" />
          </div>
    </form>
<script type="text/javascript">
function editmember() {    
    var txtUserName = $("#txtUserName").val();
    var userid = $("#userid").val();
    var txtPassword = $("#txtPassword").val();
    var txtEmail = $("#txtEmail").val();
    var telephone = $("#telephone").val();
    var rblIsLock = $('input:radio[name="rblIsLock"]:checked').val();
	var cj = $("#cj").val();
	var hygx= $("#hygx").val();
	var con= $("#con").val();
	var ocj = $("#ocj").val();
    var backurl = '/admin/User_List';
	if(telephone){
    $.ajax({
        type: "post",
        url: "/admin/memberaddapi",
        data: { "telephone":telephone,"txtUserName": txtUserName, "txtPassword": txtPassword, "txtEmail": txtEmail,"userid":userid, "rblIsLock": rblIsLock, "cj": cj,"hygx": hygx,"con":con, "ocj": ocj,"backurl": backurl },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '2') {
                alert('手机号码错误！');
            }
            else if (data == '3') {
                alert('用户账号被占用！');
            }
            else if (data == '4') {
                alert('邮箱格式错误！');
            }
            else if (data == '5') {
                alert('手机号码已注册！');
            }
            else if (data == '1') {
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
