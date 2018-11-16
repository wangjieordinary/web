<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if telephone="" or isnull(telephone) then
Response.Redirect("/login")
Response.end
end if
if telephone<>"" then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [member] where telephone='"&telephone&"' and siteid="&siteid
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
UserMoney=rs("UserMoney")
GiftPrice=rs("GiftPrice")
if GiftPrice="" or isnull(GiftPrice) then GiftPrice=0
ddusergroup=rs("ddusergroup")
else
ddusergroup=0
end if
rs.close
set rs=nothing
end if
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.Open "select * from yonjin where uid="&int(uid)&" and lx=1 and zt=0",conn,1,1
if not(rs.bof and rs.eof) then
orderno=rs("jsdh")
else
orderno=Left("W"&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(8,"NUMB"),13)
end if
rs.close
set rs=nothing%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow:auto;overflow-x:hidden">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>账户充值</title>
<META Http-Equiv="Pragma" Content="no-cache">

</head>
<body>
<link href="/share/simple-line-icons.css" rel="stylesheet" type="text/css" />
<link href="/sysTools/View/css/comm/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/share/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/share/systemStyle.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='/js/jquery.js'></script>
<link href="/js/css/tipsBox.css" rel="stylesheet" type="text/css" />
<script src="/js/tipsBox.js"></script>
<script type="application/javascript" src="/js/ubox.js"></script>
<style>	
    .v8TxtColor,.on a{color:#288ADD !important;}
	.v8BgColor{background:#288ADD;}
    .v8BorderColor,
    .on,
    .v8BorderColor,
    #UleftMenu ul li:hover,
    #UleftMenu ul li.current,
    .listTabMenu ul li.current{border-color:#288ADD;}
	#UleftMenu ul li.menuTit:hover{border-color:#DBDBDB}
	.newIco{display:inline-block;background:#f30;margin-left:12px;width:25px;height:11px;}
	.newIco img{margin:1px 0 0 1px;}
	</style>
<!--新写的页面开始-->
<div id="Uv8Top" class="v8BgColor">
	<div class="gobackHome">
		<a href="http://www.zgnmzymyw.com/" target="_blank"><i class="icon-home s-fontFamily"></i>返回网站首页</a>
	</div>
    <div class="gobackHome_m"><a href="javascript:history.go(-1);"><i class="icon-angle-left"></i><span>返回</span></a></div>
	<div class="setUser">	   
		<span class="userS">
			<span class="userTxt">您好，<font class="nickName"><%=telephone%></font></span>
			<a href="/userpanel?a=act&act=logout" id="logout" title="退出登录">退出登录</a>
		</span>
			</div>
</div>
<div id="UleftMenu">
			<ul class="pcIco">
			<li class="menuTit yahei">个人中心</li>
						<li class=" "><a href="/userpanel.php">我的个人中心</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_orders.php?order_type=0">我的订单</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_message.php">会员消息</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_liuyan.php">留言板</a><i class="icon-angle-right"></i></li>	
                                    <li class=" "><a href="/u_payrecord.php">我的现金账户</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_cart.php?idweb=9707&isCenter=1">我的购物车</a><i class="icon-angle-right"></i></li>
									<!--<li class=" "><a href="/u_red.php">我的卡券</a><i class="icon-angle-right"></i></li>-->
									<li class=" "><a href="/u_pointrecord.php">我的积分</a><i class="icon-angle-right"></i></li>
                                    <li class="current"><a href="/u_income.php">我的收入</a><i class="icon-angle-right"></i></li>
                                    <li class=" "><a href="/u_qrcode">我的分享二维码</a><i class="icon-angle-right"></i></li>
																													</ul>
						<ul class="pcIco2">
		<li class="menuTit yahei">账户管理</li>
				<li class="menuOther  "><a href="/u_address.php">收货地址管理</a><i class="icon-angle-right"></i></li>
						<li class=" "><a href="/u_info.php">个人信息</a></li>
			</ul>
	</div>
<div id="Umian">	<!--新写的页面结束-->


		<!-- <script>
    $(function(){
        $(".UlHide_icon").click(function(){
            $(this).siblings(".li_more").toggle();
        })
    })
    </script> -->


<div class="rightMenuBar">
	<div class="leftBar">
		<h5 class="yahei">余额充值</h5>
	</div>
</div>


<form action="u_pay_finish" method="post" class="rechargeForm" onSubmit="return check_sb();">
<table width="100%" cellspacing="0" cellpadding="5" border="0"  class="cssTable" style="margin-bottom:0px;">
	<tr class="thTitle">
		<td>填写充值金额</td>
	</tr>
	<tr>
	<td class="topTd">
        <table width="100%" cellspacing="0" cellpadding="0" border="0" class="fillMoney">
			<tr>
				<td nowrap align="right" width="60">充值账户:</td>
				<td  align="left" class="lastTd"><%=telephone%></td>
			</tr>
			<tr>
				<td nowrap align="right">充值金额:</td>
				<td align="left" class="lastTd"><input type="text" size="20" value="" name="jine" class="v6Input moneyInput"> 元</td>
			</tr>
			<tr class="lastTr">
				<td align="right" >会员备注:</td>
				<td  align="left" class="lastTd"><textarea rows="3" cols="55" name="user_note" class="v6Input" style="width:300px;"></textarea></td>
			</tr>
		</table>

	</td>
	</tr>
  </tbody>
 </table>

  <table width="100%" cellspacing="0" cellpadding="5" border="0" class="cssTable" style="margin-top:0px;">
  	<tr class="thTitle">
	<td colspan="3">选择支付方式</td>
	</tr>	
	<tr align="center" id="s">
	  <td >名称</td>
	  <td width="60%" >描述</td>
	  <td width="17%" >费用</td>
	</tr>
    <tr id="c">
	  <td style="padding: 15px 0 0 16px"><input type="radio" name="pay_id" id="pay_id" value="3"<%if PayType=3 or PayType="" then%> checked<%end if%>/> &nbsp; &nbsp; <label for="3"><img src="img/weixin.gif" width="128" height="48" border="0" alt=""></label>
	  </td>
	  <td id="pc">微信支付</td>
	  <td align="center">0</td>
	</tr>
		  </tbody></table>
		<div class="cartBottom cartBottom_order">
			<div class="BContent">
				<div class="cartBtn">
					<input type="hidden" value="25900" name="order_id"/>
                    <input type="hidden" value="<%=orderno%>" name="orderno"/>
					<input type="submit" name="pay" class="v8Btn2 v8BgColor" value="立即支付"/><!-- onclick="alert('功能维护中，稍后再试！');"-->
				</div>
			</div>
		</div>
 </form>
<link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script>
</div>
<div id="bottom" style="">CopyRight &copy zgnmzymyw.com 2018</div>
<script type="text/javascript">
function check_sb(){
	var jine = $('input[name="jine"]').val();
	var user_note = $('input[name="user_note"]').val();
	var pay_id = $('input[name="pay_id"]').val();
	var orderno = $('input[name="orderno"]').val();
	var msg = '';
	if(!jine){ msg += '请填写提现金额！\n';}
    if (msg.length > 0) {alert(msg);return false; }
}
</script>

<script type="text/javascript">
$(function(){
if($('body').width() <= 801){
	$('#top, #subMenu, #bottom, #left,#t').hide();
	$("body").css("background","none");
	$("#Controlright").css("padding","0");
	$("#showbtn").css({"background":"#f5f3f4","text-align":"center","height":"80px","width":"100%"});
	$("#cart_lists").height("374");
}
});
</script>
<style type="text/css">
	.menuFooter{display: none;height:0px}
	#bottom{height:20px;}
	@media screen and (max-width:767px) {
		.menuFooter{display: inline-flex;height:auto}
		#bottom{height:auto;}
		body{padding-bottom:120px;}
	}
</style>

<script>
$(".currentPage").text("账户充值")
</script>
</body>
</html>