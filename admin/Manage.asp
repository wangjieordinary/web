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
if atype=2 then ttype="操作员"
if atype=3 then ttype="业务员"
if atype=5 then ttype="财务"
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if atype=1 then
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
exec="select * from [admin] where siteid="&siteid&osql&" order by id asc"		
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
	管理员管理
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
        <div class="navigation"><b>您当前的位置：首页 &gt; 系统管理 &gt; 管理员列表</b></div>
        <div style="padding-bottom:10px;"></div>
        <div>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th width="7%">选择</th>
                <th width="17%">管理帐号</th>
                <th width="16%">真实姓名</th>
                <th width="25%">电子邮件/收货联系电话</th>
                <th width="11%">超级管理员</th>
                <th width="11%">状态</th>
                <th width="13%">操作</th>
              </tr>
<%if rssum>0 then
for i=1 to pagecount%>
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span>
                    
                </td>
                <td align="center"><%=rs("txtUserName")%></td>
                <td align="center"><%=rs("txtReadName")%></td>
                <td align="center"><%=rs("txtUserEmail")%> / <%=rs("tel")%></td>
                <td align="center"><%if rs("rblUserType")=1 then%><img title="是" src="../images/correct.gif" /><%else%><img title="否" src="../images/disable.gif" /><%end if%></td>
                <td align="center"><%if rs("rblIsLock")=0 then%><img title="正常" src="../images/correct.gif" /><%end if%><%if rs("rblIsLock")=1 then%><img title="禁用" src="../images/disable.gif" /><%end if%></td>
                <td align="center"><span><a href="/admin/Manage_Edit_<%=rs("id")%>">编辑</a></span></td>
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
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">批量删除</a>
                  </span>
              &nbsp;<span class="btn_all"><a href="/admin/Manage_Add">添加用户</a></span></div>
	  </div>
    </div>
    </form>
</body>
</html>
<%elseif instr(a,"_Add")>0 or instr(a,"_Edit")>0 then
rblUserType=3
cbLevel="viewUser,addUser,PayUser,PayminusUser,viewPayLog,viewUserReffer,editUser,resetUser,exportorderexpress,viewPackage,addpackage,editpackage,viewOrderSendList,editOrderListDetail,editOrderSend,haiviewOrderSendList,haieditOrderListDetail,haieditOrderSend"
set rs=server.createobject("adodb.recordset")
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
sql="Select * from [admin] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
txtUserName=rs("txtUserName")
txtReadName=rs("txtReadName")
txtUserEmail=rs("txtUserEmail")
tel=rs("tel")
rblIsLock=rs("rblIsLock")
rblUserType=rs("rblUserType")
saleno=rs("saleno")
csno=rs("csno")
cbLevel=rs("power")
end if
rs.close
set rs=nothing
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	<%if instr(a,"_Add")>0 then%>添加<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>管理员
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
    <script type="text/javascript">
        $(function() {
            //分配管理权限
            $("#rblUserType input").eq(0).click(function() {
                $("#tbList1").hide();
                $("#tbList2").hide();
                $("#tbList3").hide();
            });
            $("#rblUserType input").eq(1).click(function() {
                $("#tbList1").show();
                $("#tbList2").show();
                $("#tbList3").show();
            });  
            $("#rblUserType input").eq(2).click(function() {
                $("#tbList1").show();
                $("#tbList2").show();
                $("#tbList3").show();
            });   
            $("#rblUserType input").eq(3).click(function() {
                $("#tbList1").show();
                $("#tbList2").show();
                $("#tbList3").show();
            });      
            //用户权限赋值
            var typeArr = '<%=rblUserType%>';
            if (typeArr == 1) {
                $("#tbList1").hide();
                $("#tbList2").hide();
                $("#tbList3").hide();
            }
            if (typeArr == 2) {
                $("#tbList1").show();
                $("#tbList2").show();
                $("#tbList3").show();
            }
            if (typeArr == 3) {
                $("#tbList1").show();
                $("#tbList2").show();
                $("#tbList3").show();
            }
            if (typeArr == 5) {
                $("#tbList1").show();
                $("#tbList2").show();
                $("#tbList3").show();
            }
            var cbLevelArr = '';
            $("input[name='cbLevel']").each(function() {
                var cllarr = "," + $(this).attr("value") + ",";
                if (cbLevelArr.indexOf(cllarr) != -1) {
                    $(this).attr("checked", true);
                }
            });
        });
   </script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Manage_List" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Manage_List">返回管理列表</a></span><b>您当前的位置：首页 &gt; 系统管理 &gt; <%if instr(a,"_Add")>0 then%>添加<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>管理员</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
              <tr>
                <th colspan="2" align="left">基本信息设置</th>
              </tr>
              <tr>
                <td width="25%" align="right">登录帐号：</td>
                <td width="75%">
                <input name="txtUserName" type="text" value="<%=txtUserName%>"<%if txtUserName<>"" then%> readonly="readonly"<%end if%> maxlength="50" id="txtUserName" class="input" size="25" minlength="3" HintTitle="登录用户名（帐号）" HintInfo="必须以字母开头，大于3个字符，小于20个字符，字母或数字或下划线的组合。" />
                </td>
              </tr>
              <tr>
                <td align="right">登录密码：</td>
                <td>
                <input name="txtUserPwd" type="password" maxlength="50" id="txtUserPwd" class="input" size="25" minLength="6" HintTitle="登录密码" HintInfo="大于6个字符，小于50个字符，必须是字母或数字或下划线的组合，不修改请留空。" />
                </td>
              </tr>
<%if txtUserName="" then%>
              <tr>
                <td align="right">确认密码：</td>
                <td>
                <input name="txtUserPwd1" type="password" maxlength="50" id="txtUserPwd1" class="input" size="25" minLength="6" equalTo="#txtUserPwd" HintTitle="再次输入密码" HintInfo="请再次输入密码，大于6个字符，小于50个字符，必须与登录密码一致。" />
                </td>
              </tr><%end if%>
              <tr>
                <td align="right">是否禁用：</td>
                <td>
                    <span id="rblIsLock"><input id="rblIsLock_0" type="radio" name="rblIsLock" value="0"<%if rblIsLock=0 then%> checked="checked"<%end if%> /><label for="rblIsLock_0">正常</label><input id="rblIsLock_1" type="radio" name="rblIsLock" value="1" <%if rblIsLock=1 then%> checked="checked"<%end if%>/><label for="rblIsLock_1">锁定</label></span>
                </td>
              </tr>
              <tr>
                <td align="right">真实姓名：</td>
                <td>
                <input name="txtReadName" type="text" value="<%=txtReadName%>" maxlength="50" id="txtReadName" class="input required" size="25" HintTitle="管理员真实姓名" HintInfo="请输入该管理员的真实姓名，必须为中文汉字。" />
                </td>
              </tr>
              <tr>
                <td align="right">收货手机：</td>
                <td>
                <input name="tel" type="text" value="<%=tel%>" maxlength="50" id="tel" class="input tel" size="25" HintTitle="业务员收货联系手机号" HintInfo="请输入该业务员收货联系手机号，用于客户发货联系。" />
                </td>
              </tr>
              <tr>
                <td align="right">邮箱地址：</td>
                <td>
                <input name="txtUserEmail" type="text" value="<%=txtUserEmail%>" maxlength="50" id="txtUserEmail" class="input email" size="25" HintTitle="管理员的邮箱地址" HintInfo="请输入该管理员的邮箱地址，以便日后工作联系。" />
                </td>
              </tr>
              <tr>
                <td align="right">客户编号前缀：</td>
                <td>
                <%if txtUserName="" then%><input name="saleno" type="text" value="" maxlength="50" id="saleno" class="input" size="25" HintTitle="客户编号前缀" HintInfo="请输入客户编号前缀，例如：S，设置后不可修改。" /><%else%><%=saleno%><%end if%>
                </td>
              </tr>
              <tr>
                <td align="right">客户编号基数：</td>
                <td>
                <%if txtUserName="" then%><input name="csno" type="text" value="" maxlength="50" id="csno" class="input" size="25" HintTitle="客户编号基数" HintInfo="请输入客户编号基数，例如：60001，设置后不可修改。" /><%else%><%=csno%><%end if%>
                </td>
              </tr>
              <tr>
                <td align="right">管理类型：</td>
                <td>
                    <span id="rblUserType"><input id="rblUserType_0" type="radio" name="rblUserType" value="1"<%if rblUserType=1 then%> checked="checked"<%end if%> /><label for="rblUserType_0">超级管理员</label><input id="rblUserType_1" type="radio" name="rblUserType" value="2"<%if rblUserType=2 then%> checked="checked"<%end if%>/><label for="rblUserType_1">仓库管理员</label><input id="rblUserType_2" type="radio" name="rblUserType" value="3"<%if rblUserType=3 then%> checked="checked"<%end if%>/><label for="rblUserType_2">业务员</label><input id="rblUserType_3" type="radio" name="rblUserType" value="5"<%if rblUserType=5 then%> checked="checked"<%end if%>/><label for="rblUserType_3">财务</label></span>
                
                </td>
              </tr>
            </table>
            
          <table id="tbList1" width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable" style="margin-top:5px;display:none;">
              <tr>
                <th colspan="2" align="left">系统权限设置</th>
              </tr>
              <tr>
                <td width="25%" align="right">系统参数设置：</td>
                <td width="75%">
                  <input name="cbLevel" type="checkbox" value="editConfig"<%if instr(cbLevel,"editConfig")>0 then%> checked="checked"<%end if%> />
                    修改</td>
              </tr>
               <tr>
                <td align="right">会员类型：</td>
                <td>
                 <input name="cbLevel" type="checkbox" value="viewUserGroup"<%if instr(cbLevel,"viewUserGroup")>0 then%> checked="checked"<%end if%> />查看 
                 <input name="cbLevel" type="checkbox" value="addUserGroup"<%if instr(cbLevel,"addUserGroup")>0 then%> checked="checked"<%end if%> />添加
                 <input name="cbLevel" type="checkbox" value="editUserGroup"<%if instr(cbLevel,"editUserGroup")>0 then%> checked="checked"<%end if%> />编辑 
                 <input name="cbLevel" type="checkbox" value="delUserGroup"<%if instr(cbLevel,"delUserGroup")>0 then%> checked="checked"<%end if%> />删除           
                </td>
              </tr>
             <tr>
                <td align="right">会员管理：</td>
                <td>
                <input name="cbLevel" type="checkbox" value="viewUser"<%if instr(cbLevel,"viewUser")>0 then%> checked="checked"<%end if%> />查看 
                 <input name="cbLevel" type="checkbox" value="addUser"<%if instr(cbLevel,"addUser")>0 then%> checked="checked"<%end if%> />添加 
                 <input name="cbLevel" type="checkbox" value="PayUser"<%if instr(cbLevel,"PayUser")>0 then%> checked="checked"<%end if%> />充值 
                 <input name="cbLevel" type="checkbox" value="PayminusUser"<%if instr(cbLevel,"PayminusUser")>0 then%> checked="checked"<%end if%> />扣款
                 <input name="cbLevel" type="checkbox" value="viewPayLog"<%if instr(cbLevel,"viewPayLog")>0 then%> checked="checked"<%end if%> />消费日志
                 <input name="cbLevel" type="checkbox" value="viewUserReffer"<%if instr(cbLevel,"viewUserReffer")>0 then%> checked="checked"<%end if%> />返利日志
                 <input name="cbLevel" type="checkbox" value="editUser"<%if instr(cbLevel,"editUser")>0 then%> checked="checked"<%end if%> />修改 
                 <input name="cbLevel" type="checkbox" value="resetUser"<%if instr(cbLevel,"resetUser")>0 then%> checked="checked"<%end if%> />重置密码
                 <input name="cbLevel" type="checkbox" value="DelUser"<%if instr(cbLevel,"DelUser")>0 then%> checked="checked"<%end if%> />删除会员
                </td>
              </tr>
               <tr>
                <td align="right">会员充值：</td>
                <td>
                 <input name="cbLevel" type="checkbox" value="viewMoneyList"<%if instr(cbLevel,"viewMoneyList")>0 then%> checked="checked"<%end if%> />查看 
                 <input name="cbLevel" type="checkbox" value="editMoneyList"<%if instr(cbLevel,"editMoneyList")>0 then%> checked="checked"<%end if%> />审核 
                 <input name="cbLevel" type="checkbox" value="delMoneyList"<%if instr(cbLevel,"delMoneyList")>0 then%> checked="checked"<%end if%> />删除           
                </td>
              </tr>
              <tr>
                <td align="right">会员退款：</td>
                <td>
                 <input name="cbLevel" type="checkbox" value="viewMoneyBack"<%if instr(cbLevel,"viewMoneyBack")>0 then%> checked="checked"<%end if%> />查看 
                 <input name="cbLevel" type="checkbox" value="eidtMoneyBack"<%if instr(cbLevel,"eidtMoneyBack")>0 then%> checked="checked"<%end if%> />审核 
                 <input name="cbLevel" type="checkbox" value="delMoneyBack"<%if instr(cbLevel,"delMoneyBack")>0 then%> checked="checked"<%end if%> />删除           
                </td>
              </tr>
              <tr>
                <td align="right">管理员管理：</td>
                <td>
                <input name="cbLevel" type="checkbox" value="addManage"<%if instr(cbLevel,"addManage")>0 then%> checked="checked"<%end if%> />添加 
                 <input name="cbLevel" type="checkbox" value="editManage"<%if instr(cbLevel,"editManage")>0 then%> checked="checked"<%end if%> />修改 
                 <input name="cbLevel" type="checkbox" value="delManage"<%if instr(cbLevel,"delManage")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
                 <tr>
                  <td align="right">报表管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="exportorderexpress"<%if instr(cbLevel,"exportorderexpress")>0 then%> checked="checked"<%end if%> />导出报表   
                    <input name="cbLevel" type="checkbox" value="logreport"<%if instr(cbLevel,"logreport")>0 then%> checked="checked"<%end if%> />导出日志报表 
                    <input name="cbLevel" type="checkbox" value="viewadminlog"<%if instr(cbLevel,"viewadminlog")>0 then%> checked="checked"<%end if%> />操作日志查看 
                    <input name="cbLevel" type="checkbox" value="selfexport"<%if instr(cbLevel,"selfexport")>0 then%> checked="checked"<%end if%> />自定义报表导出                  
                </td>
              </tr>
          </table>
          
          <table id="tbList2" width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable" style="margin-top:5px;display:none;">
              <tr>
                <th colspan="2" align="left">内容权限设置</th>
              </tr>
              <tr>
                <td width="25%" align="right" valign="top">类别管理：</td>
                <td width="75%">
                    <input name="cbLevel" type="checkbox" value="viewChannel"<%if instr(cbLevel,"viewChannel")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addChannel"<%if instr(cbLevel,"addChannel")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editChannel"<%if instr(cbLevel,"editChannel")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delChannel"<%if instr(cbLevel,"delChannel")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
              <tr>
                <td align="right" valign="top">新闻管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewArticle"<%if instr(cbLevel,"viewArticle")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addArticle"<%if instr(cbLevel,"addArticle")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editArticle"<%if instr(cbLevel,"editArticle")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delArticle"<%if instr(cbLevel,"delArticle")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
              <tr>
                <td align="right">国际化：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewInternation"<%if instr(cbLevel,"viewInternation")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addInternation"<%if instr(cbLevel,"addInternation")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editInternation"<%if instr(cbLevel,"editInternation")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delInternation"<%if instr(cbLevel,"delInternation")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
              <tr>
                <td align="right" valign="top">内容管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewContents"<%if instr(cbLevel,"viewContents")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addContents"<%if instr(cbLevel,"addContents")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editContents"<%if instr(cbLevel,"editContents")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delContents"<%if instr(cbLevel,"delContents")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
              <tr>
                <td align="right">快递公司：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewPostCompany"<%if instr(cbLevel,"viewPostCompany")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addPostCompany"<%if instr(cbLevel,"addPostCompany")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editPostCompany"<%if instr(cbLevel,"editPostCompany")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delPostCompany"<%if instr(cbLevel,"delPostCompany")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>             
              <tr>
                <td align="right">链接管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewLinks"<%if instr(cbLevel,"viewLinks")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addLinks"<%if instr(cbLevel,"addLinks")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editLinks"<%if instr(cbLevel,"editLinks")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delLinks"<%if instr(cbLevel,"delLinks")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
              <tr>
                <td align="right">广告管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewAdvertising"<%if instr(cbLevel,"viewAdvertising")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addAdvertising"<%if instr(cbLevel,"addAdvertising")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editAdvertising"<%if instr(cbLevel,"editAdvertising")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="delAdvertising"<%if instr(cbLevel,"delAdvertising")>0 then%> checked="checked"<%end if%> />删除
                </td>
              </tr>
          </table>
           <table id="tbList3" width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable" style="margin-top:5px;display:none;">
            <tr>
                <th colspan="2" align="left">销售管理</th>
              </tr>
               <tr>
                <td align="right" width="25%" >包裹管理：</td>
                <td width="75%" >
                    <input name="cbLevel" type="checkbox" value="viewPackage"<%if instr(cbLevel,"viewPackage")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="addpackage"<%if instr(cbLevel,"addpackage")>0 then%> checked="checked"<%end if%> />添加
                    <input name="cbLevel" type="checkbox" value="editpackage"<%if instr(cbLevel,"editpackage")>0 then%> checked="checked"<%end if%> />修改                  
                </td>
              </tr>
               <tr>
                <td align="right">空运运单管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewOrderSendList"<%if instr(cbLevel,"viewOrderSendList")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="editOrderListDetail"<%if instr(cbLevel,"editOrderListDetail")>0 then%> checked="checked"<%end if%> />编辑明细
                    <input name="cbLevel" type="checkbox" value="editOrderSend"<%if instr(cbLevel,"editOrderSend")>0 then%> checked="checked"<%end if%> />修改                  
                </td>
              </tr>
               <tr>
                <td align="right">海运运单管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="haiviewOrderSendList"<%if instr(cbLevel,"haiviewOrderSendList")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="haieditOrderListDetail"<%if instr(cbLevel,"haieditOrderListDetail")>0 then%> checked="checked"<%end if%> />编辑明细
                    <input name="cbLevel" type="checkbox" value="haieditOrderSend"<%if instr(cbLevel,"haieditOrderSend")>0 then%> checked="checked"<%end if%> />修改  
                </td>
                </tr>      
               <tr>
                <td align="right">渠道管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewPostway"<%if instr(cbLevel,"viewPostway")>0 then%> checked="checked"<%end if%> />查看
                    <input name="cbLevel" type="checkbox" value="editPostway"<%if instr(cbLevel,"editPostway")>0 then%> checked="checked"<%end if%> />编辑明细                                   
                </td>
                </tr>       
                   
                <tr>
                <td align="right">报价管理：</td>
                <td>
                    <input name="cbLevel" type="checkbox" value="viewSystemprice"<%if instr(cbLevel,"viewSystemprice")>0 then%> checked="checked"<%end if%> />查看                   
                    <input name="cbLevel" type="checkbox" value="editSystemPrice"<%if instr(cbLevel,"editSystemPrice")>0 then%> checked="checked"<%end if%> />修改
                    <input name="cbLevel" type="checkbox" value="countprice"<%if instr(cbLevel,"countprice")>0 then%> checked="checked"<%end if%> />自动计算  
                </td>
                </tr>              
           </table>
          
          <div style="margin-top:10px; text-align:center;">
            <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="addadmin()" /><%if txtUserName<>"" then%><input type="hidden" name="id" id="id" value="<%=id%>" /><%end if%>
&nbsp;&nbsp; 
            <input type="reset" name="button" id="button" value="重 置" class="submit" />
          </div>
    </form>
<script type="text/javascript">
function addadmin() {    
    var txtUserName = $("#txtUserName").val();
    var txtUserPwd = $("#txtUserPwd").val();<%if txtUserName="" then%>
    var txtUserPwd1 = $("#txtUserPwd1").val();
    var saleno = $("#saleno").val();
    var csno = $("#csno").val();<%else%>
    var id = $("#id").val();<%end if%>
    var txtReadName = $("#txtReadName").val();
    var tel = $("#tel").val();
    var txtUserEmail = $("#txtUserEmail").val();
    var rblIsLock_0 = $("#rblIsLock_0").is(':checked')
    var rblIsLock_1 = $("#rblIsLock_1").is(':checked')
    var rblUserType_0 = $("#rblUserType_0").is(':checked')
    var rblUserType_1 = $("#rblUserType_1").is(':checked')
    var rblUserType_2 = $("#rblUserType_2").is(':checked')
    var cbLevel = $("input[name='cbLevel']:checked");  
    var checkBoxValue = "";   
    cbLevel.each(function(){  
    checkBoxValue += $(this).val()+",";  
    })  
    checkBoxValue = checkBoxValue.substring(0,checkBoxValue.length-1);  
    var backurl = '';//$("#backurl").val();
    var msg = '';
    if (txtUserName.length == 0) {
        msg += '请填写登陆账号！\n';
    }<%if txtUserName="" then%>
    if (txtUserPwd.length == 0) {
        msg += '请填写密码！\n';
    }
    if (txtUserPwd!=txtUserPwd1) {
        msg += '两次密码不一致！\n';
    }<%end if%>
    if (rblIsLock_0) {
       rblIsLock=0;
    }
    if (rblIsLock_1) {
       rblIsLock=1;
    }
    if (rblUserType_0) {
       rblUserType=1;
    }
    if (rblUserType_1) {
       rblUserType=2;
    }
    if (rblUserType_2) {
       rblUserType=3;
    }
    if (backurl.length == 0) {
        backurl='/admin/Manage_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
<%if txtUserName="" then%>if(txtUserName&&txtUserPwd&&msg.length==0){<%else%>if(msg.length==0){<%end if%>
    $.ajax({
        type: "post",
        url: "/admin/adminaddapi",
<%if txtUserName="" then%>data: { "txtUserName": txtUserName, "txtUserPwd": txtUserPwd, "txtUserPwd1": txtUserPwd1,"txtReadName":txtReadName,"txtUserEmail":txtUserEmail,"tel":tel, "rblIsLock": rblIsLock, "rblUserType": rblUserType, "cbLevel": checkBoxValue,"saleno": saleno,"csno": csno, "backurl": backurl },<%else%>data: { "txtUserName": txtUserName, "txtUserPwd": txtUserPwd, "txtReadName":txtReadName,"txtUserEmail":txtUserEmail,"tel":tel, "rblIsLock": rblIsLock, "rblUserType": rblUserType, "cbLevel": checkBoxValue,"id": id, "backurl": backurl },<%end if%>
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '2') {
                alert('<%if txtUserName="" then%>用户重复<%else%>用户不存在<%end if%>！');
            }
            else if (data == '1') {
                alert('<%if txtUserName="" then%>添加成功<%else%>修改成功<%end if%>！');
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