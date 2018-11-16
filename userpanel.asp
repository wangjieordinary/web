<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%act=trim(Request("act"))
if act="logout" then
Response.Cookies("nmw")("token")=""
Session("errn")=0
Session("uid")=""
Session("userno")=""
Session("telephone")=""
Response.Redirect("/login")
Response.end
end if
nmw=chknmw()
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
cj=rs("cj")
if GiftPrice="" or isnull(GiftPrice) then GiftPrice=0
cj=rs("cj")
else
cj=0
end if
rs.close
set rs=nothing
end if
'会员自动升级
xfjine=getxfjine(uid)
if cj=0 then
chktj=chktjsl(uid,7,0,3)
if xfjine>=100 or chktj then
conn.execute "update [member] set cj=cj+1,uid"&cj+1&"="&int(uid)&" where cj=0 and id="&int(uid)
if xfjine>=100 then sjsm="消费满100元"
if chktj then sjsm="消费满100元"
if xfjine>=100 and chktj then sjsm="消费满100元，7天内已推荐3个普通会员"
conn.execute("insert into [shenji] (uid,cj,ocj,sjsm,czr,siteid) values("&uid&","&cj+1&","&cj&",'"&sjsm&"','自动升级',"&siteid&")")
end if
elseif cj=1 then
chktj=chktjsl(uid,45,1,7)
if xfjine>=1000 or chktj then
if xfjine>=1000 then sjsm="消费满1000元"
if chktj then sjsm="45天内已推荐7个共享会员"
if xfjine>=1000 and chktj then sjsm="消费满1000元，45天内已推荐7个共享会员"
conn.execute "update [member] set cj=cj+1,uid"&cj+1&"="&int(uid)&",uid"&cj&"=0 where cj=1 and id="&int(uid)
conn.execute("insert into [shenji] (uid,cj,ocj,sjsm,czr,siteid) values("&uid&","&cj+1&","&cj&",'"&sjsm&"','自动升级',"&siteid&")")
end if
elseif cj=2 then
chktj=chktjsl(uid,90,2,7)
if xfjine>=5000 or chktj then
if xfjine>=5000 then sjsm="消费满5000元"
if chktj then sjsm="90天内已推荐7个VIP会员"
if xfjine>=5000 and chktj then sjsm="消费满5000元，90天内已推荐7个VIP会员"
conn.execute "update [member] set cj=cj+1,uid"&cj+1&"="&int(uid)&",uid"&cj&"=0 where cj=2 and id="&uid
conn.execute("insert into [shenji] (uid,cj,ocj,sjsm,czr,siteid) values("&uid&","&cj+1&","&cj&",'"&sjsm&"','自动升级',"&siteid&")")
end if
end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit"><!-- 避免IE使用兼容模式 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 针对手持设备优化，主要是针对一些老的不识别viewport的浏览器，比如黑莓 -->
<meta name="keywords" content="建站">
<title>会员控制中心</title>
<META Http-Equiv="Pragma" Content="no-cache">
<script type='text/javascript' src='/js/jquery.js'></script>
<!-- <script type="text/javascript" src='/js/nicebox.js'></script> -->
<script src="/js/ubox.js"></script>
<script type="text/javascript">
function is_mobile(){
	return window.screen.width<767 || ($('body').width() > 0 && $('body').width() < 767);
}
function select_head(){
	document.getElementById("boxName").innerHTML="选择头像"; 
	if(document.getElementById("boxClose")) document.getElementById("boxClose").innerHTML="×"; 
	document.getElementById("showiframe").src="http://s143js.zgnmzymyw.com/userhead_get.php?user_id=88272"; 
	box.Show({"width":"450px","height":"250px"});
}
function show_bind(action){	
	if(is_mobile()){
		location.href = "http://s143js.zgnmzymyw.com/u_bindME.php?user_id=88272&idweb=9707&action="+action;
	}else{
		document.getElementById("boxName").innerHTML="绑定"; 
		if(document.getElementById("boxClose")) document.getElementById("boxClose").innerHTML="×"; 
		document.getElementById("showiframe").src="http://s143js.zgnmzymyw.com/u_bindME.php?user_id=88272&idweb=9707&action="+action; 
		box.Show({"width":"450px","height":"250px"});
	}
}
function score_sign(){
	$.get("ajax_user_score_sign.php", function(data){
		var result = eval("("+data+")");
		alert(result['msg']);
		$("#userPoint").html(result['point']);
	});
}

function godetail(pid){//v9才有这个功能
	var url = 'http://shop.e95.cn//pro_details.html?pid=';
		if(url.indexOf('pid')>=0) url = url+pid;
	top.window.location.href=url;
}

$('#useriframe',parent.document).context.title = '会员控制中心';
$(function(){
});
</script>
<style>
/*弹出层dialog*/
#dialogBg {display:none;width:100%;height:100%;background:#808080;position:absolute;top:0;left:0;z-index:10000000}/*遮罩*/

.dialog {padding:0px;position:absolute;top:250px;z-index:10000001;border-radius:5px;box-shadow:0px 0px 15px #000;}
.dialog .title{height:20px;background:#fff;overflow:hidden;border-radius:6px 6px 0px 0px ;border-bottom:1px solid #ccc;height:40px;cursor:default;}
.dialog .title h4{float:left;font-size:14px;padding:12px 12px 0px 12px;line-height:14px;display:block;height:34px;margin-top:0px!important;}
.dialog .title span {float:right;cursor:pointer;color:#c00; font:600 18px/20px verdana,arial;border-left:1px solid #ccc;padding:10px 10px 10px 10px;}/*X*/
.dialog .title span:hover{background:#eee;}
.dialog .content{padding:0px;background:#fff !important;overflow:hidden;zoom:1;border-radius:0px 0px 5px 5px;}
.wFont{font-family:"Microsoft YaHei","verdana"}
.orderNumber,.orderProImg{cursor: pointer;}
@media screen and (max-width:640px){
	#idBox #boxTopTitle>a{display: block !important;right: 5px !important;top: 5px !important;}
	#idBox #boxTopTitle>a #boxClose{line-height: 24px !important;}
}
</style>
</head>
<body onload="window.resizeTo(800, 500);" >
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
		<a href="/CN/trade" target="_blank"><i class="icon-home s-fontFamily"></i>返回网站首页</a>
	</div>
    <div class="gobackHome_m"><a href="javascript:history.go(-1);"><i class="icon-angle-left"></i><span>返回</span></a></div>
	<div class="setUser">	   
		<span class="userS">
			<span class="userTxt">您好，<font class="nickName"><%=telephone%></font></span>
			<a href="?a=act&act=logout" id="logout" title="退出登录">退出登录</a>
		</span>
			</div>
</div>
<div id="UleftMenu">
			<ul class="pcIco">
			<li class="menuTit yahei">个人中心</li>
						<li class="current"><a href="/userpanel.php">我的个人中心</a><i class="icon-angle-right"></i></li>
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
						<li class=" "><a href="/u_info.php">个人信息</a></li><li class=""></li>
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
<style>
@media screen and (max-width:640px){
	.gobackHome{display: block;}
	.gobackHome a{border:0;}
	.gobackHome a:hover{color:#fff;}
	.gobackHome_m{display: none;}
	.currentPage{display:none;}
	#Uv8Top .gobackHome, #Uv8Top .setUser{width:50%;}
	#UleftMenu{display:block;}
	#Umian{/*background:#288add !important;*/ padding: 0;}
	#Uv8Top .userS{display:block;}
	.mobileMune{display:none !important;}
}
</style>


<script>
/*控制UleftMenu层的位置*/
weizhi();//替换层的位置
windowWith();//屏幕改变时还原手机user_fx>div的初始状态
function windowWith(){
	$(window).resize(function(){
		weizhi();
		//会员和分销切换
		if($(window).width()>640){
			$(".user_fx>div").eq(0).addClass("current").siblings().removeClass("current");
			$(".menuTab>ul").eq(0).show().siblings().hide();
			cont(0);
		}
	})
}

function weizhi() {
	if ($(window).width()<641) {
		var UleftMenu = $("#UleftMenu").html();
		$("#UleftMenu").remove();
		$("#Umian").after("<div id='UleftMenu'>"+UleftMenu+"</div>");
		//设置小屏幕左侧的高度
				var UleftMenuH=$(window).height()-350; //减去头部底部固定的高度
		$("#UleftMenu").css("height",UleftMenuH);
			}
}

//这个不知道是控制什么
$(".menuIcn").click(function(){
	$(".menuContent").fadeToggle();
	$(".menuContent li").click(function(){
		$(".menuContent").css("display","none");
	});
});
//会员和分销切换	
$(function(){
	var len = $(".user_fx>div").length;
	$(".user_fx>div").css("width",100/len+"%");
	$(".user_fx>div").click(function(){
		var index = $(this).index();
		//alert(index);
		$(this).addClass("current").siblings().removeClass("current");
		$(".menuTab>ul").eq(index).show().siblings().hide();
		$("#UleftMenu .fxMenu li>div").hide();
		cont(index);//判断会员分销下显示的内容
		if($(".user_fx>div").eq(0).hasClass("current")){
			$(".menuTab").siblings("ul.yahei.set").show();
		}else{
			$(".menuTab").siblings("ul.yahei.set").hide();
		}
	})
})
//判断会员分销下显示的内容
function cont(index){
	if(index == 0){
		$(".uInfoDiv_mobi .hy").show().siblings(".fx,.dl").hide();
	}else if(index == 1){
		$(".uInfoDiv_mobi .fx").show().siblings(".hy,.dl").hide();
	}
	// else{
	// 	$(".uInfoDiv_mobi .dl").show().siblings(".hy,.fx").hide();
	// }
}

</script>

<!--新写的页面开始-->
<div class="uInfoDiv">
	<div class="uleftD">
		<dl>
			<dd><a href="#javascript:select_head();"><i class="icon-user"></i></a>
			<div class="mobiTx"></div><!-- onclick="window.location.href='/u_setting.php'"-->
						</dd>
			<dt>
				<p class="userNameP yahei">
					<a href="#"><%=telephone%></a><font class="wFont">你好！</font>
				</p>
								<p class="setU">
					<a href="#"><%if cj=0 then%>普通会员<%elseif cj=1 then%>共享会员<%elseif cj=2 then%>VIP会员<%elseif cj=3 then%>合伙人（社区服务中心）<%elseif cj=4 then%>县级运营中心<%elseif cj=5 then%>市级运营中心<%elseif cj=6 then%>省级运营中心<%end if%></a>|
																								</p>
				<p class="setU">
					
				</p>
			</dt>
		</dl>
	</div>
		<div class="urightD" style="">
		<ul class="urtxtD">
			<li  class="uNumInfo">
				<div>
					<dl>
						<dd><a href="u_message.php"><i class="icon-envelope-letter s-fontFamily"></i></a></dd>
						<dt><a href="u_message.php"><span class="gnamefont">未读消息</span>  <i class="showNum">0</i></a></dt>
					</dl>
										<dl>
						<dd><a href="u_orders.php?act=m&zt=3"><i class="icon-truck2"></i></a></dd>
						<dt><a href="u_orders.php?act=m&zt=3"><span class="gnamefont">待收货</span>  <i class="showNum"><%Set dfrs = Server.CreateObject("ADODB.RecordSet")
dfrs.Open "select * from [dingdan] where uid="&uid&" and (zt=2 or zt=3) and siteid="&siteid,conn,1,1
response.write dfrs.recordcount
dfrs.Close
set dfrs=nothing%></i></a></dt>
					</dl>
									</div>
								<div>
					<dl>
						<dd><a href="u_orders.php?act=m&zt=1"><i class="icon-banknote"></i></a></dd>
						<dt><a href="u_orders.php?act=m&zt=1"><span class="gnamefont">待付款</span>  <i class="showNum"><%Set dfrs = Server.CreateObject("ADODB.RecordSet")
dfrs.Open "select * from [dingdan] where uid="&uid&" and zt<2 and siteid="&siteid,conn,1,1
response.write dfrs.recordcount
dfrs.Close
set dfrs=nothing%></i></a></dt>
					</dl>
					<dl>
						<dd><a href="u_cart.php?idweb=9707&isCenter=1"><i class="icon-basket-loaded s-fontFamily"></i></a></dd>
						<dt><a href="u_cart.php?idweb=9707&isCenter=1"><span class="gnamefont">购物车</span>  <i class="showNum"><%Set dfrs = Server.CreateObject("ADODB.RecordSet")
dfrs.Open "select * from [gouwuche] where uid="&uid&" and (ddh is null or ddh='') and siteid="&siteid,conn,1,1
response.write dfrs.recordcount
dfrs.Close
set dfrs=nothing%></i></a></dt>
					</dl>
				</div>
							</li>
			<li class="moneyCupon">
											<p><a href="u_payrecord.php" class="gnamefont">会员余额：<font><%=UserMoney%>元</font></a> <a href="/u_payin.php">在线充值</a></p>
																			<p><a href="u_pointrecord.php" class="gnamefont">积分：<font id="userPoint"><%=GiftPrice%></font></a></p>
								<!--<p><a href="u_red.php" class="gnamefont">优惠券：<font>0</font></a></p>-->
																						</li>
		</ul>
	</div>
</div>
<script>
$(function(){
	$(".listTabMenu li").click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		$(".listTab>div").eq($(this).index()).show().siblings().hide();
	})
})
</script>
<div class="orderBox" style="">
		<div class="listTab">
		<div class="orderList payOrder">
			<h5 class="orderT">未支付的订单<a href="u_orders.php?pay_status=0&order_status=3">更多 <i class="icon-angle-right"></i></a></h5>
<ul class="showOrder"><%set rs=server.createobject("adodb.recordset")
exec="select * from [dingdan] where siteid="&siteid&" and uid="&int(uid)&" and zt<2 order by id desc"	
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
do while not rs.eof%>
<li><span class="orderNumber">订单号：<%=rs("ddh")%>　 </span><%
set prs=server.createobject("adodb.recordset")
pexec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&rs("ddh")&"' and uid="&int(uid)&" order by id desc"	
prs.open pexec,conn,1,1
prssum=prs.recordcount
if prssum>0 then
for pi=1 to prssum
pname=""
pimg=""
price2=""
jifen3=""
jifen1=""
proinfo=getproinfo(prs("pid"))
if proinfo<>"" then
pname=SPLIT(proinfo&"||||||||","||")(0)
pimg=SPLIT(proinfo&"||||||||","||")(1)
price2=SPLIT(proinfo&"||||||||","||")(2)
jifen3=SPLIT(proinfo&"||||||||","||")(3)
jifen1=SPLIT(proinfo&"||||||||","||")(4)
end if
%><span class="orderProImg" onclick="url_product('/trade/goods-<%=prs("pid")%>.html','/orderDetail?act=show&order_id=<%=prs("id")%>')"><img src="<%=pimg%>" style="width:60px;height:60px" /></span>
<%prs.movenext
if prs.eof then exit for
next
prs.close
set prs=nothing
end if%>
<span class="otSpan payNow"><%if rs("zt")<2 then%><a class="payNowA v8Btn2  v8BgColor" href="/orderDetail?act=show&order_id=<%=rs("id")%>#paymentTable">立即付款</a><!--待支付--><%elseif rs("zt")=2 then%>已付款<%elseif rs("zt")=3 then%>已发货<%elseif rs("zt")=5 then%>已完成<%elseif rs("zt")=7 then%>已取消<%end if%></span>
<span class="otSpan otDetails"><a href="/orderDetail?act=show&order_id=<%=rs("id")%>">订单详情</a></span>
<span class="otSpan otPayMon"><font class="yahei"><%=gshjg(rs("jine"))%></font><br/><em><%if rs("zflx")=1 then%>三农积分<%elseif rs("zflx")=2 then%>余额支付<%else%>微信支付<%end if%></em></span>
</li><%
rs.movenext
loop
rs.close
set rs=nothing
else%>
<li>
					<p class="noneOrder">
						您暂时没有未支付订单。<a href="/CN/trade" target="_blank">挑挑喜欢的商品</a>
					</p>
				</li>
<%end if%></ul>
		</div>
		<!---未收货订单的html和上面的一样-->
		<div class="orderList deliveryOrder">
			<h5 class="orderT">未收货的订单<a href="u_orders.php?act=m&zt=3">更多 <i class="icon-angle-right"></i></a></h5>
<ul class="showOrder"><%set rs=server.createobject("adodb.recordset")
exec="select * from [dingdan] where siteid="&siteid&" and uid="&int(uid)&" and (zt=3 or zt=2) order by id desc"	
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
do while not rs.eof%>
<li><span class="orderNumber">订单号：<%=rs("ddh")%>　 </span><%
set prs=server.createobject("adodb.recordset")
pexec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&rs("ddh")&"' and uid="&int(uid)&" order by id desc"	
prs.open pexec,conn,1,1
prssum=prs.recordcount
if prssum>0 then
for pi=1 to prssum
pname=""
pimg=""
price2=""
jifen3=""
jifen1=""
proinfo=getproinfo(prs("pid"))
if proinfo<>"" then
pname=SPLIT(proinfo&"||||||||","||")(0)
pimg=SPLIT(proinfo&"||||||||","||")(1)
price2=SPLIT(proinfo&"||||||||","||")(2)
jifen3=SPLIT(proinfo&"||||||||","||")(3)
jifen1=SPLIT(proinfo&"||||||||","||")(4)
end if
%><span class="orderProImg" onclick="url_product('/trade/goods-<%=prs("pid")%>.html','/orderDetail?act=show&order_id=<%=prs("id")%>')"><img src="<%=pimg%>" style="width:60px;height:60px" /></span>
<%prs.movenext
if prs.eof then exit for
next
prs.close
set prs=nothing
end if%>
<span class="otSpan payNow"><%if rs("zt")<2 then%>待支付<%elseif rs("zt")=2 then%>已付款<%elseif rs("zt")=3 then%><a class="payNowA v8Btn2  v8BgColor" href="/orderDetail?act=show&order_id=<%=rs("id")%>#paymentTable">确认收货</a><%elseif rs("zt")=5 then%>已完成<%elseif rs("zt")=7 then%>已取消<%end if%></span>
<span class="otSpan otDetails"><a href="/orderDetail?act=show&order_id=<%=rs("id")%>">订单详情</a></span>
<span class="otSpan otPayMon"><font class="yahei"><%=gshjg(rs("jine"))%></font><br/><em><%if rs("zflx")=1 then%>三农积分<%elseif rs("zflx")=2 then%>余额支付<%else%>微信支付<%end if%></em></span>
</li><%
rs.movenext
loop
rs.close
set rs=nothing
else%>
<li>
					<p class="noneOrder">
						您暂时没有未收货订单。<a href="/CN/trade" target="_blank">挑挑喜欢的商品</a>
					</p>
				</li>
<%end if%></ul>
		</div>
		<div class="orderCar">
			<h5 class="orderT">我的购物车<a href="u_cart.php?idweb=9707&isCenter=1">更多 <i class="icon-angle-right"></i></a></h5>
<%
set prs=server.createobject("adodb.recordset")
pexec="select * from [gouwuche] where siteid="&siteid&" and ddh is null and uid="&int(uid)&" order by id desc"	
prs.open pexec,conn,1,1
prssum=prs.recordcount
if prssum>0 then%><ul class="carList"><%
for pi=1 to prssum
proinfo=getproinfo(prs("pid"))
if proinfo<>"" then
pname=SPLIT(proinfo&"||||||||","||")(0)
pimg=SPLIT(proinfo&"||||||||","||")(1)
price2=SPLIT(proinfo&"||||||||","||")(2)
jifen3=SPLIT(proinfo&"||||||||","||")(3)
jifen1=SPLIT(proinfo&"||||||||","||")(4)
end if%><li><a href="/u_cart.php?idweb=9707&isCenter=1"><img src="<%=pimg%>"/></a></li>
<%prs.movenext
if prs.eof then exit for
next
prs.close
set prs=nothing%></ul><%else%><div class="mesDiv" style="text-align:center">目前还没有添加商品到购物车</div>
<%end if%>							
					</div>
	</div>
</div>
<!-- 底部导航 -->
<!--新写的页面结束-->
<link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script>
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
</style>
<style type='text/css'>
				.bottomMenu{width: 100%; box-sizing:border-box; display: none;position:fixed;bottom:0;z-index:999999}
				.bottomMenu ul{width:100%; height: 40px; padding:6px 0; background-color: #fff; border-top: 1px solid #ddd; box-shadow: 0 0px 6px rgba(0,0,0,.1); display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;}
				.bottomMenu ul li{position:relative; box-sizing: border-box; -webkit-box-flex:1;-webkit-flex:1;-ms-flex:1;flex:1;}
				.bottomMenu ul li .menuItem{position: relative;}
				.bottomMenu ul li .menuIco{width: 26px; height: 26px; overflow: hidden; margin: auto;}
				.bottomMenu ul li .menuIco img{width: 100%;}
				.bottomMenu ul li .menuName{font-size: 12px; white-space: nowrap; margin: auto; text-align: center; color: #333; line-height: 18px;}
				.bottomMenu ul li .submenuItems{position: absolute; bottom: 48px; z-index:999999; width: 100%; text-align: center; border: 1px solid #ddd; background-color: #fff; box-shadow: 0 0px 6px rgba(0,0,0,.1);}
				.bottomMenu ul li .submenuItems a{display: block; height: 36px; line-height: 36px; font-size: 12px; color: #333; border-bottom: 1px solid #ddd;}
				@media screen and (max-width:767px) {
					.bottomMenu{display: block;}
					body{padding-bottom:55px;}
				}
				</style><div class="bottomMenu"><ul><li>
					<a href="/" class="" style=""><div class="menuItem"><div class="menuIco"><img src="/m/images/home.jpg" alt=""></div><input type="hidden" class="menuIcon" value="" ><input type="hidden" class="menuColor" value="" ><div class="menuName" style="color:#666666;">首页</div></div></a>
					<div class="submenuItems" style="display:none;"></div>
				</li><li>
					<a href="/mcategory" class="" style=""><div class="menuItem"><div class="menuIco"><img src="/m/images/category.jpg" alt=""></div><input type="hidden" class="menuIcon" value="" ><input type="hidden" class="menuColor" value="" ><div class="menuName" style="color:#666666;">农贸分类</div></div></a>
					<div class="submenuItems" style="display:none;"></div>
				</li><li>
					<a href="/mcategory1" class="" style=""><div class="menuItem"><div class="menuIco"><img src="/m/images/category.jpg" alt=""></div><input type="hidden" class="menuIcon" value="" ><input type="hidden" class="menuColor" value="" ><div class="menuName" style="color:#666666;">自贸分类</div></div></a>
					<div class="submenuItems" style="display:none;"></div>
				</li><li>
					<a href="/u_cart" class="" style=""><div class="menuItem"><div class="menuIco"><img src="/m/images/cart.jpg" alt=""></div><input type="hidden" class="menuIcon" value="" ><input type="hidden" class="menuColor" value="" ><div class="menuName" style="color:#666666;">购物车</div></div></a>
					<div class="submenuItems" style="display:none;"></div>
				</li><li>
					<a href="/userpanel" class="" style=""><div class="menuItem"><div class="menuIco"><img src="/m/images/my-.jpg" alt=""></div><input type="hidden" class="menuIcon" value="" ><input type="hidden" class="menuColor" value="" ><div class="menuName" style="color:#666666;">我的</div></div></a>
					<div class="submenuItems" style="display:none;"></div>
				</li></ul></div>
<script>
	$(".showNum").each(function(){
		if(parseInt($(this).text())<1){
			$(this).css("display","none");
		}
		if(parseInt($(this).text())>99){
			$(this).text("99+");
		}
	});

if(typeof(is_weixin)=="undefined"){
	function is_weixin(){  
		var ua = navigator.userAgent.toLowerCase();  
		if(ua.match(/MicroMessenger/i)=="micromessenger") {  
			return true;  
		} else {  
			return false;  
		}  
	}
}
</script>

</body>
</html>