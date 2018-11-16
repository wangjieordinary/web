<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
end if
IDShopCart=trim(Request("IDShopCart[]"))
zje=Request("zje")
zje2=Request("zje2")
besttime=trim(Request("besttime"))
IDRec=int(Request("IDRec"))
shinfo=getshxx(uid,IDRec)
if shinfo<>"" then
sname=SPLIT(shinfo&"||","|")(0)
ssj=SPLIT(shinfo&"||","|")(1)
sadd=SPLIT(shinfo&"||","|")(2)
end if
'PayType=int(Request("PayType"))
OrderMessage=trim(Request("OrderMessage"))
DeliveryType=trim(Request("DeliveryType"))
ghsid="," '供应商量列表待处理
if IDShopCart<>"" and zje<>"" and IDRec>0 and DeliveryType<>"" and sname<>"" and ssj<>"" and sadd<>"" and isgwcid(IDShopCart,0,uid) then 'and PayType>0
orderno=Left(tdno&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(8,"NUMB"),15)
if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
ly=0
else
ly=1
end if
conn.Execute("update [gouwuche] set ddh='"&orderno&"' where ddh is null and uid="&int(uid)&" and id in ("&IDShopCart&")")
conn.execute("insert into [dingdan] (ddh,pslx,besttime,OrderMessage,ghsid,jine,jine2,uid,sname,sadd,ssj,ly,siteid) values('"&orderno&"','"&DeliveryType&"','"&besttime&"','"&OrderMessage&"','"&ghsid&"',"&zje&","&zje2&","&uid&",'"&sname&"','"&sadd&"','"&ssj&"',"&ly&","&siteid&")") 
yue=getyue(uuid)
if int(zje)>0 then
conn.execute("insert into [yonjin] (uid,jsdh,fyue,jine,byue,czr,lx,zt,siteid) values("&int(uid)&",'"&orderno&"',"&yue&","&zje&","&yue&",'下单系统',2,0,"&siteid&")") '写入消费记录
conn.execute("insert into [jifen] (ddh,jifen,uid,zt,siteid) values('"&orderno&"',"&int(zje)&","&uid&",0,"&siteid&")") 
end if

set rs=server.createobject("adodb.recordset")
exec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&orderno&"' order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
for i=1 to rssum
conn.Execute("update [product] set kucun=kucun-"&rs("sl")&",ordercount=ordercount+"&rs("sl")&" where siteid="&siteid&" and id="&rs("pid"))
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if

else
orderno=""
end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta name="keywords" content="购物车">
<title>购物车</title>
<META Http-Equiv="Pragma" Content="no-cache">
</head>
<link href="/share/users-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/share/style.css">
<link href="/share/systemStyle.css" rel="stylesheet" type="text/css">

<script src="/js/backscript.js?20170110" content="text/html; charset=UTF-8"></script>
<script>function BackJS(runJs){run_backjs("/js/backjs.html", runJs);}</script>
<script src="/js/jquery.js"></script>
<script src="/js/qrcode.js"></script>
<script type="text/javascript">

function ShowCartClose(){
	var runJs = "box.Close();";
	BackJS(runJs);
}

function Pay(form){
	form.submit();
	return;
	}
$(function(){
			var winH = $(window).height()-200;    
		$(".addCartBox").css('height',winH);
		$("#Umian").css({padding:'50px 0px 0px 250px'});
		$(".cartBottom").css({'padding-top':'0px','position':'static'});
		$("input[name='pay_id']").click(function(){
		if($(this).attr('fee')>0) $("#payfeeshow").html("，需要收取手续费"+$(this).attr('fee')+"元");
		else $("#payfeeshow").html('');
	});
});
</script>
<style>
.orderError .lBox{text-align:center;}
</style>
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
			<a href="/userpanel.php?a=act&act=logout" id="logout" title="退出登录">退出登录</a>
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
									<li class="current"><a href="/u_cart.php?idweb=9707&isCenter=1">我的购物车</a><i class="icon-angle-right"></i></li>
									<!--<li class=" "><a href="/u_red.php">我的卡券</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_pointrecord.php">我的积分</a><i class="icon-angle-right"></i></li>-->
									<li class=" "><a href="/u_pointrecord.php">我的积分</a><i class="icon-angle-right"></i></li>
                                    <li class=" "><a href="/u_income.php">我的收入</a><i class="icon-angle-right"></i></li>
                                    <li class=" "><a href="/u_qrcode">我的分享二维码</a><i class="icon-angle-right"></i></li>
																													</ul>
						<ul class="pcIco2">
		<li class="menuTit yahei">账户管理</li>
				<li class="menuOther  "><a href="/u_address.php">收货地址管理</a><i class="icon-angle-right"></i></li>
						<li class=" "><a href="/u_info.php">个人信息</a></li>
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
<!--加入购物车-->
	<div class="addCartBox oFCartBox">
				<div class="orderDetail">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="lBox" valign="middle" ><img src="/img/tipsRight.png" border="0" /></td>
					<td class="rBox">
												<div class="orderTips">
														<div class="title">您的订单已提交成功！</div>
														<div class="n">下单成功后我们会尽快为您发货！</div>
						</div>
						<div class="orderlist">
							<ul>
								<li>金额: ￥<%=FormatNumber(zje,2,-1,-1,0)%></li>
								<li>订单: <%=orderno%></li>
																<li>配送地址: <%=sname%> / <%=ssj%> / <%=sadd%> / <%if besttime="" then%>不限送货时间<%else%><%=besttime%><%end if%></li>
																							</ul>
						</div>
						<div class="orderlist">
							<a href='javascript:top.location.href="http://www.zgnmzymyw.com/userpanel.html?id=9707&lang=0"'>进入会员中心</a>
						</div>
											</td>
				</tr>
			</table>
		</div>
		<form action="u_pay_finish" method="post">
		<div class="cartTitle addr">选择支付方式<span id="payfeeshow"></span></div>
			<div id="payList">
				<table width="100%" cellpadding="0" cellspacing="0" border="0" class="payTable">
					<tr>
						<td class="lTd">
							<div class="t">支付平台<div>
							<div class="d">推荐使用微信支付<div>
						</td>
						<td>
							<ul class="selectUI"><li paycode="balance">	
									<input type="radio" isonline="0" name="pay_id" value="3" fee="0" id="pay_id" checked>
									<label for="11682"><img src="/img/weixin.gif" width="100px" height="60px" border="0" title=""></label>
								</li>
																<li paycode="balance">									
									<input type="radio" isonline="0" name="pay_id" value="2" fee="0" id="pay_id" >
									<label for="11681"><img src="/img/balance.gif" width="100px" height="60px" border="0" title=""></label>
								</li>
																<li paycode="cod">									
									<input type="radio" isonline="0" name="pay_id" value="1" fee="0" id="pay_id" disabled >
									<label for="11682"><img src="/img/cod.gif" width="100px" height="60px" border="0" title=""></label> （暂未开放，敬请期待！）
								</li>
																								
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
				<!--底部操作--->
		<div class="cartBottom cartBottom_order">
			<div class="BContent">
				<div class="cartBtn">
					<input type="hidden" value="25900" name="order_id"/>
                    <input type="hidden" value="<%=orderno%>" name="orderno"/>
					<!-- <input type="button" name="backBtn" class="cBtn whiteBtn" value="返回" onclick='history.go(-1)'/> -->
					<input type="button" name="backBtn" class="cBtn whiteBtn" value="关闭" onclick='ShowCartClose();' />
					<input type="button" class="cBtn whiteBtn" value="查看订单详情" onclick="window.open('/orderDetail?act=show&orderno=<%=orderno%>');ShowCartClose();" />
					<input type="submit" name="pay" class="cBtn" value="立即支付" onclick='ShowCartClose();'/>
				</div>
			</div>
		</div>
		</form>
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
</style><style>
.shadowdiv{background:#000;opacity:0.3;filter:alpha(opacity=30);width:100%;height:100%;position:fixed;top:0;left:0;z-index:99;display:none;}
#payshow{position:fixed;top:50%;left:50%;margin:-137px 0 0 -165px;background:#fff;z-index:120;width:330px;height:275px;text-align:center;display:none;}
#payshow .sucback{color:#c00;}
#payshow img{margin-top:40px;}
.closeqcore{text-decoration:none;  position: absolute;display: inline-block;width: 25px;height: 25px;text-align: center; -webkit-transition:0.3s linear;transition:0.3s ease-in;line-height: 25px;top:5px;right: 5px;font-size:22px;color:#c00;cursor:pointer;}
.closeqcore:hover{-webkit-transform:rotate(360deg);transform:rotate(360deg);-webkit-transition:0.3s linear;transition:0.3s ease-in;color:#c00;}
</style>
<div class="shadowdiv">&nbsp;</div><div align="center" id="payshow"><a onclick="$('#payshow').hide();$('.shadowdiv').hide();" href='javascript:;' class='closeqcore'>×</a><div id="payresult"></div></div>

<script>
$(".currentPage").text("支付页面");
//wxpaywap 手机微信
//wxpay  电脑微信
$(function(){
	if(screen.width<960){
		$(".selectUI li[paycode='wxpaywap']").css("display","block");
		$(".selectUI li[paycode='alipaywap']").css("display","block");
		$(".selectUI li[paycode='wxpay']").css("display","none");
		$(".selectUI li[paycode='alipay']").css("display","none");
	}else{
		$(".selectUI li[paycode='wxpaywap']").css("display","none");
		$(".selectUI li[paycode='alipaywap']").css("display","none");
		$(".selectUI li[paycode='wxpay']").css("display","block");
		$(".selectUI li[paycode='alipay']").css("display","block");
	}
})
</script>
</body>
</html>
