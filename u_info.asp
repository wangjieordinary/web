<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><!--#include file="md5.asp"-->
<%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
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
country=rs("country")
address=rs("address")
firstname=rs("firstname")
userno=rs("userno")
company=rs("company")
linkman=rs("linkman")
Postcode=rs("Postcode")
email=rs("email")
cj=rs("cj")
iscom=rs("iscom")
else
nb=0
end if
rs.close
set rs=nothing
end if
is_set_option=trim(Request("is_set_option"))
if is_set_option="1" then
userno=trim(Request("userno"))
pwd=trim(Request("pwd"))
pwd2=trim(Request("pwd2"))
email=trim(Request("email"))
telephone=trim(Request("telephone"))
firstname=trim(Request("firstname"))
RecProvince=trim(Request("RecProvince"))
RecCity=trim(Request("RecCity"))
RecArea=trim(Request("RecArea"))
country=RecProvince&"||"&RecCity&"||"&RecArea
address=trim(Request("address"))
Postcode=trim(Request("Postcode"))
company=trim(Request("company"))
linkman=trim(Request("linkman"))
if telephone<>"" then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [member] where telephone='"&telephone&"' and siteid="&siteid
rs.open sql,conn,1,3
if not (rs.bof and rs.eof) then
if isnull(rs("userno")) then rs("userno")=userno
if pwd<>"" and pwd2<>"" and pwd=pwd2 then rs("password")=md5(pwd)
rs("email")=email
rs("telephone")=telephone
rs("firstname")=firstname
rs("country")=country
rs("address")=address
rs("Postcode")=Postcode
rs("company")=company
rs("linkman")=linkman
rs.update
msg="修改成功！"
end if
rs.close
set rs=nothing
end if
end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1"> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>个人信息</title>
<META Http-Equiv="Pragma" Content="no-cache">

<!-- <script type="text/javascript">
function CheckMail(mail) {
	var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(filter.test(mail)){
		return true;
	}else{
		return false;
	}
}
function check_ver(){
	var email = $("intput[name=name]");
	var mobile_phone = $("#tel");
	var position=$('#pcode');
	var address=$('#address');
	var myreg = /^(1[3|5|8])[\d]{9}$/;
	if(mobile_phone.val()==""){
		alert('手机不能为空!');
		mobile_phone.focus();
		return false;
	}else if(!myreg.test(mobile_phone.val())){
		alert('手机号码不正确');
		mobile_phone.focus();
		return false;
	}else if(email.val()==""){
		alert('邮箱不能为空!');
		email.focus();
		return false;
	}else if(!CheckMail(email.val())){
		alert('邮箱格式错误！正确格式为：xxx@xxx.com');
		email.focus();
		return false;
	}else{				
		return true;
	}
}
</script> -->
</head>
<body>
<link href="/share/simple-line-icons.css" rel="stylesheet" type="text/css" />
<link href="/sysTools/View/css/comm/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/share/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/share/systemStyle.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='/js/jquery.js'></script>
<script type='text/javascript' src='/js/geo.js'></script>
<link href="/js/css/tipsBox.css" rel="stylesheet" type="text/css" />
<script src="/js/tipsBox.js"></script>
<script type="application/javascript" src="/js/ubox.js"></script>
<style>	
input[type="submit"],input[type="reset"],input[type="button"],button {-webkit-appearance: none;}

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
                                    <li class=" "><a href="/u_income.php">我的收入</a><i class="icon-angle-right"></i></li>
                                    <li class=" "><a href="/u_qrcode">我的分享二维码</a><i class="icon-angle-right"></i></li>
																													</ul>
						<ul class="pcIco2">
		<li class="menuTit yahei">账户管理</li>
				<li class="menuOther  "><a href="/u_address.php">收货地址管理</a><i class="icon-angle-right"></i></li>
						<li class="current"><a href="/u_info.php">个人信息</a></li>
			</ul>
	</div>
<div id="Umian"><!--新写的页面结束-->


<!-- <script>
$(function(){
	$(".UlHide_icon").click(function(){
		$(this).siblings(".li_more").toggle();
	})
})
</script> -->

<script src="/js/ubox.js"></script>
<style>
@media screen and (max-width:640px){
	body{background:#fff !important; padding-bottom: 100px !important;}
	.rightMenuBar .leftBar{display: block;}
	#userTables *{box-sizing: border-box;}
	#userTables .v6Input{width: 94%;/*在手机有个星星所以不用100%*/ max-width: 360px; border-color: #fff; padding-right: 0; text-overflow: ellipsis; }
	#userTables .v6Input[name='pwd']{width:calc(94% - 77px);}
	input.mPass{right:6%;}
	#userTables .v6Input.mb{/*width: calc(94% - 74px);*/}
	#userTables td{position: relative;}
	#userTables .td-Last{padding-top: 0; bottom: 0px;}
	
	.mPass{position: absolute; z-index: 2; right: 22px; top: 7px;}
	.mbpos{position: absolute; z-index: 2; right: 22px; top: 0;}
	#userTables tr:first-child td{border-top: 1px solid #eee;}
	#userTables tr td{border-bottom: 1px solid #eee;}
	#userTables td.lTd{width: 100px; white-space: nowrap;}
}
</style>
<script>
$(function(){
	if($(".bottomMenu,.menuFooter")){
		var h = $(".bottomMenu,.menuFooter").height();
		$("#userTables .td-Last").css("bottom",h);
	}
});

function show_bind(action){
	if(is_mobile()){
		location.href = "http://s143js.zgnmzymyw.com/u_bindME.php?user_id=88272&idweb=9707&action="+action;
	}else{
	if(action=="bindMobile")document.getElementById("boxName").innerHTML="绑定手机"; 
	else if(action=="bindEmail")document.getElementById("boxName").innerHTML="绑定邮箱"; 
	else if(action=="bindWeixin")document.getElementById("boxName").innerHTML="绑定微信";
	else document.getElementById("boxName").innerHTML="绑定";
	if(document.getElementById("boxClose")) document.getElementById("boxClose").innerHTML="×"; 
	document.getElementById("showiframe").src="http://s143js.zgnmzymyw.com/u_bindME.php?user_id=88272&idweb=9707&action="+action;
	box.Show({"width":"650px","height":"250px"});
	}
}

function is_mobile(){
	return window.screen.width<767 || ($('body').width() > 0 && $('body').width() < 767);
}
$(function(){
	s = ["RecProvince", "RecCity", "RecArea"];
<%if country<>"" then
if ubound(split(country,"||"))=2 then%>opt0 = ["<%=split(country,"||")(0)%>", "<%=split(country,"||")(1)%>", "<%=split(country,"||")(2)%>"];<%end if
else%>opt0 = ["", "", ""];<%end if%>
	setup();
	});
</script>
<div class="rightMenuBar">
	<div class="leftBar">
		<h5 class="yahei">个人信息</h5>
	</div>
</div>

<div style="background:#fff;">
	<form method="POST" action="/u_info" onsubmit="return CheckForm(this)" >
	<table width="100%" cellpadding="" cellspacing="" id="userTables" border="0">
	<input class="v6Input" type="hidden" name="is_set_option" value="1">
	<tr>
	<td width="110" align="right" class="lTd">会员类型:</td>
	<td class="lTd"><%if cj="0" then%>普通会员<%end if%><%if cj="1" then%>共享会员<%end if%><%if cj="2" then%>VIP会员<%end if%><%if cj="3" then%>社区运营中心<%end if%><%if cj="4" then%>县区运营中心<%end if%><%if cj="5" then%>市运营中心<%end if%><%if cj="6" then%>省运营中心<%end if%> &nbsp;<%if iscom="1" then%>+  &nbsp;入驻商家<%else%><%end if%></td>
	</tr>
	<tr>
	<td width="110" align="right" class="lTd">会员名:</td>
	<td><input class="v6Input" type="uname" name="userno" value="<%=userno%>"<%if userno<>"" then%> readonly style="background:#f8f8f8"<%end if%>></td>
	</tr>
	<tr>
	<td align="right" class="lTd">密　码:</td>
	<td>
	<input class="v6Input" type="password" name="pwd" placeholder="如不修改密码请留空">
	<input class="v6Input" type="hidden" name="changePWD" id="changePWD" value="0">
	<input type="button" value='修改密码' onclick="$('#pwdconfirm').show();$('#changePWD').val(1);" class='mPass' style="width:70px">
	</td>
	</tr>
	<tr id="pwdconfirm" class="hide">
	<td align="right" class="lTd">确认密码:</td>
	<td><input class="v6Input" type="password" name="pwd2"></td>
	</tr>
	<tr>
	<td align="right" class="lTd">电子邮件:</td>
	<td>
		<input class="v6Input" type="text" name="email" value="<%=email%>" check="^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,3}$" warning="邮箱格式不正确"> <span class="redfont"></span>
			</td>
	</tr>
			<tr>
	<td align="right" class="lTd">手机号:</td>
	<td>
		<input class="v6Input" type="text" name="telephone" id="telephone" value="<%=telephone%>" check="^(13[0-9]|15[012356789]|16[0-9]|17[0-9]|18[0-9]|14[57])[0-9]{8}$" warning="请正确填写手机号码"> <span class="redfont"></span>	
		</td>
	</tr>
				<tr>
	<td align="right" class="lTd">真实姓名:</td>
	<td><input class="v6Input" type="text" name="firstname" value="<%=firstname%>"> <span class="redfont"></span></td>
	</tr>
			<tr>
				<td align="right" class="lTd">省/直辖市:</td>
				<td>
						<select class="v6Input" id="RecProvince" name="RecProvince">
						</select>
						<span class="redfont"> </span>
			</td>
			</tr>
			<tr>
				<td align="right" class="lTd">市:</td>
				<td>
						<select class="v6Input" id="RecCity" name="RecCity">
						</select>
						<span class="redfont"> </span>
			</td>
			</tr>
			<tr>
				<td align="right" class="lTd">区/县:</td>
				<td>
						<select class="v6Input" id="RecArea" name="RecArea">
						</select>
						<span class="redfont"> </span>
			</td>
			</tr>
			<tr>
	<td align="right" class="lTd">详细地址:</td>
	<td><input class="v6Input" type="text" name="address" size="40" value="<%=address%>"> <span class="redfont"></span></td>
	</tr>
			<tr>
	<td align="right" class="lTd">邮政编码:</td>
	<td><input class="v6Input" type="text" name="Postcode" size="10" value="<%=Postcode%>"> <span class="redfont"></span></td>
	</tr>
			<tr>
	<td align="right" class="lTd">单位:</td>
	<td><input class="v6Input" type="text" name="company" value="<%=company%>"><span class="redfont"> </span></td>
	</tr>
			<tr>
	<td align="right" class="lTd">联系人:</td>
	<td><input class="v6Input" type="text" name="linkman" value="<%=linkman%>"> <span class="redfont"></span></td>
	  
	</tr>
			<tr>
		<tr>
	<td height="50" colspan="2" class="td-Last"><input  type="reset" value="重置" class="v8Btn3">
	<input type="submit" value="保存" class="v8Btn2 v8BgColor">
	</td>
	</tr>
	</table>
	</form>
</div>

<!--  验证窗口 star   -->

<!--  end   -->
<script src="/js/jquery-1.3.2.min.js"></script>
<script>
	$(".currentPage").text("个人信息");
	function CheckForm(oForm){
	var els = oForm.elements;
	var str = '';
    for(var i=0;i<els.length;i++){
    	str += els[i].value;
        if(els[i].getAttribute("check"))
        {
            var sReg = els[i].getAttribute("check");
            var sName = els[i].getAttribute("name");
            var sVal = els[i].value;    
            var reg = new RegExp(sReg,"i");
            if(!reg.test(sVal)){
            	if($('#mess2').length == 0){
            		$('#userTables').before('<div id="mess2"></div>');
            	}	
				$('#mess2').html(els[i].getAttribute("warning")).show();
				return false;
            }
			// if(sName=="confirmPwd"){
			// 	if(els[i].value!=els[i-1].value){
			// 		$(oForm).find('.showTips').html("两次输入的密码不一致！").show();
			// 		return false;
			// 	}
			// }
        }
    }
}
<%if len(msg)>0 then%>alert('<%=msg%>');<%end if%>
</script>
<link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script><link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script>
</div>
<div id="bottom" style="">CopyRight &copy zgnmzymyw.com 2018</div>
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
</style></body>