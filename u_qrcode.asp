<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"-->
<%nmw=chknmw()
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
cj=rs("cj")
else
cj=0
end if
rs.close
set rs=nothing
end if
uname=telephone
qrimg="qrimg/"&uname&".png"
qrimgpath=server.MapPath(qrimg)
Set fs=Server.CreateObject("Scripting.FileSystemObject")
If fs.FileExists(qrimgpath) Then   '判断文件是否存在
qrsrc="http://"&cdnurl&"/"&qrimg
else
qrsrc="/vip_qrcode.php?data="&uname
end if%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow:auto;overflow-x:hidden">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>我的分享二维码</title>
<META Http-Equiv="Pragma" Content="no-cache">
<style>
@media screen and (max-width: 640px){
	.pointTable .tradeTable .trade01 .tFont{
	    text-overflow: ellipsis;
	    width: 80%;
	    overflow: hidden;
	    white-space: nowrap;
	}
	.v8cssTable .tradeTable .grayfont {
	    white-space: nowrap;
	    width: 80%;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
}
@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}}
</style>
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
                                    <li class=" "><a href="/u_income.php">我的收入</a><i class="icon-angle-right"></i></li>
                                    <li class="current"><a href="/u_qrcode">我的分享二维码</a><i class="icon-angle-right"></i></li>
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
<form method="post">

<div class="rightMenuBar">
	<div class="leftBar">
		<h5 class="yahei">我的分享二维码</h5>
	</div>
</div>

<div width="100%" class="myaccountTable pointTopTable">
    <ul>
	<li class="grayTd">
	   <div class="show_myAccount show_myPoint"><img src="<%=qrsrc%>"><br><a href="http://www.zgnmzymyw.com/VIP<%=uname%>">http://www.zgnmzymyw.com/VIP<%=uname%></a>
		 <div class="d" style="font-size:16px; line-height:38px;"><%=telephone%>&nbsp;<%if cj=0 then%>普通会员<%elseif cj=1 then%>共享会员<%elseif cj=2 then%>VIP会员<%elseif cj=3 then%>合伙人（社区服务中心）<%elseif cj=4 then%>县级运营中心<%elseif cj=5 then%>市级运营中心<%elseif cj=6 then%>省级运营中心<%end if%></div>
	   </div>
	</li>
	<li align="center" class="bottomBtns" style="font-size:16px; color:#666; line-height:30px;">通过分享二维码注册的新用户，<span id=m><br></span>您<%if cj=0 then%>升级后将获得分润奖励<%else%>将获得其订单分润奖励<%end if%>！
	<!--<input type="button" value="服务升级" name="paynow" class="v8Btn2 v8BgColor" style="width:250px;" onclick="top.location.href='http://www.zgnmzymyw.com/CN/trade/'">-->
	</li>
	</ul>
  </div>


<!--  <table width="100%" cellspacing="0" cellpadding="0" border="0" class="myaccountTable">
    <tr>
 	<td class="grayTd">
 	   <div class="show_myAccount show_myPoint">
 	     <div class="d">可用的积分</div>
 		 <div class="t">0</div>
 	   </div>
 	</td>
 	<td align="center" class="bottomBtns">
 		<input type="button" value="兑换超值商品与优惠劵" name="paynow" class="v8Btn2 v8BgColor" style="width:250px;" onclick="top.location.href='http://www.zgnmzymyw.com/'">&nbsp;&nbsp;&nbsp;
 		
 	</td>
 	</tr>
  </table> -->
<!---
<div class="rightMenuBar payercordBar">
	<div class="leftBar pointBar">
		<h5 class="yahei">分享记录</h5>
	</div>
</div>-->

<!---V8新版表格如下-->
<style>

</style>
<!---<div class="cssTable v8cssTable pointTable">
   <ul class="thTitle">
      <li class="Title01">注册手机号</li>
      <li class="Title02">积分变化</li>
	  <li class="Title03">日期</li>
      <li class="lastTd">备注</li>
   </ul>
   </div>-->



<!-- 
<table class="cssTable v8cssTable " width="100%" cellpadding="0" cellspacing="0" border="0">
   <tr class="thTitle">
      <td>来源/用途/用途</td>
      <td>积分变化</td>
	  <td>日期</td>
      <td class="lastTd">备注</td>
   </tr>
   <table> -->


</form>

   <div class="controlPages">
      <div class="pmains">
		</div>
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
</style>
<script>
$(".currentPage").text("我的积分")
</script>
</body>
</html>