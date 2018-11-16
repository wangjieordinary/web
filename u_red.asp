<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>我的卡券</title>
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
									<li class="current"><a href="/u_red.php">我的卡券</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_pointrecord.php">我的积分</a><i class="icon-angle-right"></i></li>
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


<!--新写的页面开始--->
<div class="tabMenu rightMenuBar">
	<ul>
		<li class="on"><a href="###">我的卡券</a></li>
		<li><a href="###">我的会员卡</a></li>
		<!-- <li><a href="###">我的红包</a></li> -->
	</ul>
</div>
<div class="tabBox">
	<div class="couponTab">
		<div class="uiTab">
			<div class="leftBar"></div>
			<div class="rightBar">
				<ul class="selectUl floatR UlHide">
				<span class="UlHide_icon"><span>更多状态</span><i class="icon-menu"></i></span>
				<div class="li_more">
					<li><a href="?conpons=0" class="current">可使用</a><i>|</i></li>
					<li><a href="?conpons=1" class="">已使用</a><i>|</i></li>
					<li><a href="?conpons=3" class="">已过期</a></li>
				</div>
				</ul>
			</div>
		</div>
		<div class="cupBox">
			<!-------根据客户网站自定义的卡券样式显示,
			官网券设置是什么样的这里的显示就是什么样的---------->
			 			
						<div id="nolist_tips" style="clear:both;"><i class="icon-info s-icon-info s-fontFamily" style="vertical-align:0;"></i> 您的账户没有优惠券数据，请您更换查询时间或优惠券状态查询。</div>
					</div>
	</div>
	<div class="userCardTab">
				<div id="nolist_tips" style="clear:both;"><i class="icon-info s-icon-info s-fontFamily" style="vertical-align:0;"></i> 您的账户没有会员卡数据。</div>
			</div>
	<!--
	<div class="redTab">
		<div class="uiTab">
			<div class="leftBar"></div>
			<div class="rightBar">
				<ul class="selectUl floatR">
					<li><a href="?" class="current">可使用</a>|</li>
					<li><a href="?conpons=1" class="">已使用</a>|</li>
					<li><a href="?conpons=3" class="">已过期</a></li>
				</ul>
			</div>
		</div>
		<div class="cupBox"></div>
	</div> 
	-->
</div>
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
</style><script>
	$(function(){
		$('.tabMenu ul li').click(function(){
			var index = $('.tabMenu ul li').index(this);
			$('.tabBox>div').hide().eq(index).show();
			$('.tabMenu ul li').removeClass('on');
			$(this).addClass('on');
		});
		});

		$(".currentPage").text("我的卡券")
		$(".UlHide").click(function(){
		$(".UlHide li").fadeToggle();
		$(".UlHide a").removeClass("current");
});
</script>
</body>
</html>