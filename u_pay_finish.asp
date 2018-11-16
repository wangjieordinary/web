<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
end if
fkzt=0
pay_id=0
act=trim(Request("act"))
pay_id=Request("pay_id")
if pay_id<>"" and isnumeric(pay_id) then
pay_id=int(pay_id)
else
pay_id=0
end if
lx=0
id=0
orderno=trim(Request("orderno"))
if request("jine")<>"" then jine=CCur(request("jine"))
if request("user_note")<>"" then user_note=trim(request("user_note"))
PNO=randStr(8,"NUMB")
if orderno<>"" then conn.Execute("update [gouwuche] set pay_id="&pay_id&" where ddh='"&orderno&"'")
if pay_id=3 and orderno<>"" then
if Left(orderno,1)="W" then '充值订单
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.Open "select * from yonjin where uid="&int(uid)&" and lx=1 and zt=0 and jsdh='"&orderno&"'",conn,1,2
if not(rs.bof and rs.eof) then
id=rs("id")
lx=1 '充值
rs("jine")=jine
rs("pay_id")=3
rs("user_note")=user_note
rs("atime")=now()
rs.update
else
rs.addnew
rs("uid")=int(uid)
rs("jsdh")=orderno
rs("jine")=jine
lx=1 '充值
rs("lx")=1
rs("user_note")=user_note
rs("pay_id")=3
rs("atime")=now()
rs("siteid")=siteid
rs.update
rs.movelast 'SQL数据库特殊处理才能获得ID
id=rs("id")
end if
rs.close
set rs=nothing
else '订单消费
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [dingdan] where ddh='"&orderno&"' and uid="&int(uid)&" and siteid="&siteid
if instr(cwadmin,"|"&uid&"|")>0 then sql="Select * from [dingdan] where ddh='"&orderno&"' and siteid="&siteid
rs.open sql,conn,1,2
if not (rs.bof and rs.eof) then
id=rs("id")
lx=0 '消费
jine=rs("jine")
ptime=rs("ptime")
zt=rs("zt")
end if
rs.close
set rs=nothing
end if
end if
if pay_id=2 and orderno<>"" then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [dingdan] where ddh='"&orderno&"' and uid="&int(uid)&" and siteid="&siteid
if instr(cwadmin,"|"&uid&"|")>0 then sql="Select * from [dingdan] where ddh='"&orderno&"' and siteid="&siteid
rs.open sql,conn,1,2
if not (rs.bof and rs.eof) then
id=rs("id")
jine=rs("jine")
ptime=rs("ptime")
zt=rs("zt")
yue=getyue(uid)
if yue>=jine then
if zt<2 then
conn.Execute("update [member] set UserMoney = UserMoney-"&jine&" where id="&uid&" and siteid="&siteid)
if int(jine)>0 then conn.execute "update [yonjin] set zt=1,pay_id=2,etime=getdate() where jsdh='"&orderno&"'" '更新消费记录生效
rs("zt")=2
rs("zflx")=2
rs("ptime")=now()
ptime=now()
rs.update
end if
fkzt=1
else
if zt<2 then
fkzt=0
else
fkzt=1
end if
end if
end if
rs.close
set rs=nothing
end if
if pay_id=1 and orderno<>"" then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [dingdan] where ddh='"&orderno&"' and uid="&int(uid)&" and siteid="&siteid
if instr(cwadmin,"|"&uid&"|")>0 then sql="Select * from [dingdan] where ddh='"&orderno&"' and siteid="&siteid
rs.open sql,conn,1,2
if not (rs.bof and rs.eof) then
id=rs("id")
jine2=rs("jine2")
ptime=rs("ptime")
zt=rs("zt")
if getjfye(uid)>=jine2 then
if zt<2 then
conn.Execute("update [member] set GiftPrice = GiftPrice-"&jine2&" where id="&uid&" and siteid="&siteid)
rs("zt")=2
rs("zflx")=1
rs("ptime")=now()
rs.update
end if
fkzt=1
else
if zt<2 then
fkzt=0
else
fkzt=1
end if
end if
end if
rs.close
set rs=nothing
end if
if pay_id=3 and orderno<>"" then conn.Execute("update [dingdan] set zflx = 3 where ddh='"&orderno&"' and siteid="&siteid)
qrsrc="/pay_qrcode.php?data="&orderno&"U"&uid&"J"&FormatNumber(jine,2,-1,-1,0)&"P"&PNO
payurl="/WXPAY"&orderno&"U"&uid&"J"&FormatNumber(jine,2,-1,-1,0)&"P"&PNO%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow:auto;overflow-x:hidden">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>购物车</title>
<META Http-Equiv="Pragma" Content="no-cache">
<link href="/share/style.css" rel="stylesheet" type="text/css">
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
									<li class=" "><a href="/u_cart.php?idweb=9707&isCenter=1">我的购物车</a><i class="icon-angle-right"></i></li>
									<!--<li class=" "><a href="/u_red.php">我的卡券</a><i class="icon-angle-right"></i></li>-->
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

<style>
	@media screen and (max-width:641px){
		#UleftMenu{display:none;}
		#Umian{background:none;}
		#Uv8Top .userS{display:none;}
		.mobileMune{display:inline-block;}
		.fx_nav{display:none;}
	}
</style>

<div class="rightMenuBar">
	<div class="leftBar">
		<h5 class="yahei"><%if pay_id=1 then%>三农积分<%end if%><%if pay_id=2 then%>帐户余额<%end if%><%if pay_id=3 then%>微信扫码<%end if%>支付</h5>
	</div>
</div>



<style>
.payinMain{padding:20px 0;border:1px solid #DBDBDB;background:#fafafa;text-align:center;}
.payinMain .payinImg{width:70px;height:70px;border:3px solid #288ADD ;border-radius:100%;background:#288ADD;margin:30px 0;float:left;margin-left:12%;margin-right:50px}
.payinMain .payinImg img{border-radius:100%; width:70px}
.payinMain .ot{overflow:hidden;zoom:1;font-weight:bold;margin:25px 0px 10px;text-align:left;font-size:14px;line-height:30px;}
.payinMain .od{color:#999;font-weight:normal;font-size:12px;}
.payinBtn{margin:20px 0px}
.oInfo{font-size:24px;margin-bottom:20px;font-weight:normal;line-height:130%}
.payinMain .gfont{color:#888}
.payinMain .ot .gfont{font-size:12px;}
 @media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}#delbag{display:none;}#sexpressno{width:54%;}}
</style>
<div style="height:416px;overflow-y:auto;">
		<div class="payinMain">
	 <%if pay_id=3 then%> <div class="oInfo yahei"><!--<input id="pc" type="button" value="已完成支付（电脑版扫码支付后请点这里）" name="paynow" class="v8Btn2 v8BgColor" onclick="location.href='/orderDetail?act=show&orderno=<%=orderno%>'"/>--><input id="m" type="button" value="立即支付" name="paynow" class="v8Btn2 v8BgColor" onclick="location.href='<%=payurl%>'"/><span id=m><br><br></span><img src="<%=qrsrc%>" width="300"></div><%else%><div class="payinImg"><img src="/img/<%if fkzt=1 then%>okS.png<%else%>noS.png<%end if%>" border="0" style="width:25px;border-radius: 0px;padding-top: 25px;"/></div>
	 <div class="ot">
	 <div class="oInfo yahei"><%if fkzt=0 then%><%if pay_id=2 then%>帐户余额<%end if%><%if pay_id=1 then%>三农积分<%end if%>不足，交费失败<%end if%><%if fkzt=1 then%>交费成功，订单已生效！<%end if%><br/>
     <font class=gfont><%if fkzt=1 then%>支付时间:<%=ptime%><br><%end if%><br>订单编号:<%=orderno%><br>订单总额:<%if pay_id=2 then%><%=jine%>元<%end if%><%if pay_id=1 then%><%=jine2%>积分<%end if%><br>请牢记订单编号, 以便以后查询</font>
 <input type="button" style="position:absolute;right:80px;" value="进入会员控制中心" name="paynow" class="v8Btn2 v8BgColor" onclick="location.href='/userpanel.php'"/>
	 </div><%end if%>
	 </div>
	 </div>
	</div>
<style>
#failDiv{font-size:12px;color:#666;text-align:center;margin-top:30px;}
</style>
<link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script>
</div>
<div id="bottom" style="">CopyRight &copy nicebox.cn 2018</div>
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
<script type="text/javascript">
function chkpay(){
		var getUrl = "/payfinishchkapi";
		$.post(getUrl,{id:"<%=id%>",lx:<%=lx%>},function(rdata){
			if(rdata==null||rdata==''){
			}else if(rdata.fail==''){
				window.location.href=rdata.gourl;
			}
		},'json')
}
$(function(){setInterval(chkpay,2000);});
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
$(".currentPage").text("购物车")
</script><style type='text/css'>
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
					<a href="/userpanel" class="" style=""><div class="menuItem"><div class="menuIco"><img src="/m/images/my.jpg" alt=""></div><input type="hidden" class="menuIcon" value="" ><input type="hidden" class="menuColor" value="" ><div class="menuName" style="color:#666666;">我的</div></div></a>
					<div class="submenuItems" style="display:none;"></div>
				</li></ul></div>
</body>
</html>