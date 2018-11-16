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
end if%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow:auto;overflow-x:hidden">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>我的现金账户</title>
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
@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}}
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
                                    <li class="current"><a href="/u_payrecord.php">我的现金账户</a><i class="icon-angle-right"></i></li>
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


<form method="post">
	<div class="rightMenuBar">
		<div class="leftBar">
			<h5 class="yahei">我的现金账户</h5>
		</div>
	</div>
	<div width="100%" class="myaccountTable">
		<ul>
			<li class="grayTd">
				<div class="show_myAccount myUserAccount">
					<div class="d">可用的金额</div>
					<div class="t">￥<%=gshjg(UserMoney)%></div>
				</div>
				<div class="show_myAccount g_myAccount">
					<div class="d">总消费金额</div>
					<div class="t">￥<%=gshjg(getxfjine(uid))%></div>
				</div>
			</li>
			<li class="bottomBtns">
							<input type="button" value="立即充值" name="paynow" class="v8Btn2 v8BgColor" onclick="location.href='u_payin.php'">
							 <!--<input type="button" value="马上购物" name="goshop" class="v8Btn3" onclick="top.location.href='http://www.zgnmzymyw.com/'"> -->
				<input type="button" value="马上购物" name="goshop" class="v8Btn3" onclick="window.open('http://www.zgnmzymyw.com//','_blank');"><!-- 在新窗口打开 2016/9/1 -->
			</li>
		</ul>
	</div>

	<!-- <table width="100%" cellspacing="0" cellpadding="0" border="0" class="myaccountTable">
		<tr>
			<td class="grayTd">
				<div class="show_myAccount myUserAccount">
					<div class="d">可用的金额</div>
					<div class="t">0.00<font class='u'>￥</font></div>
				</div>
			</td>
			<td class="grayTd">
				<div class="show_myAccount g_myAccount">
					<div class="d">历史累计金额</div>
					<div class="t">0.00<font class='u'>￥</font></div>
				</div>
			</td>
			<td align="center" class="bottomBtns">
							<input type="button" value="立即充值" name="paynow" class="v8Btn2 v8BgColor" onclick="location.href='u_payin.php'">&nbsp;&nbsp;&nbsp;
							<input type="button" value="马上购物" name="goshop" class="v8Btn3" onclick="top.location.href='http://www.zgnmzymyw.com/'">
				<input type="button" value="马上购物" name="goshop" class="v8Btn3" onclick="top.window.open('http://www.zgnmzymyw.com/','_blank');">在新窗口打开 2016/9/1
			</td>
		</tr>
	</table> -->
<div class="rightMenuBar payercordBar">
	<div class="leftBar pointBar">
		<h5 class="yahei">交易记录</h5>
	</div>
</div>

<%page=int(Request("page"))
if page=0 then page=1
key=request("key")
if key="" then key=request("txtKeywords")
if request("skey")="yes" then
key=Session("key")
else
Session("key")=key
end if
PageNo=page
if PageNo="" then PageNo=1
if isnumeric(PageNo) or PageNo="" then
PageNo=abs(PageNo)
 if PageNo=0 then PageNo=1
else
 PageNo=1
end if
TblName = "[yonjin]"
FldName = "etime" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,uid,atime,etime,jsdh,jine,fyue,byue,lx,czdh,pay_id,czr,zt"
PageSizeX=20
OrderType=0 '0-为降序 1-升序
StrWhere=sql '注意: 一个条件就用()双括号括起来 第一个不用and

TopField=(PageNo-1)*PageSizeX 'TOP多少条

if OrderType=0 then
 StrTmp = "<(Select min"
 StrOrder = " Order BY case when ["&FldName&"] is null then 0 else 1 end,["&FldName&"] desc"
else
 StrTmp = ">(Select max"
 StrOrder = " Order BY case when ["&FldName&"] is null then 1 else 0 end,["&FldName&"] asc"
end if

'定义sql语句
StrWhere=" zt=1 and uid="&uid
StrSql="Select Top "&Clng(PageSizeX)&" "& FieldName &" From "&TblName&" "
if key<>"" then StrWhere=StrWhere&" and (jsdh like '%"&key&"%' or czdh like '%"&key&"%')"
if key<>"" then skey="&skey=yes"
StrWhere=StrWhere&osql
if PageNo=1 then '如果是第一页时，执行如下代码查库速度快
if StrWhere<>"" then
 StrSql=StrSql&" Where siteid="&siteid&" and "&StrWhere & StrOrder&""
 else
 StrSql=StrSql & StrOrder
 end if
else
 if StrWhere<>"" then
 StrSql=StrSql&" Where "& FldName & StrTmp&"("&FldName&") From (Select top "& Clng(TopField)&" "&FldName &" From "&TblName&" Where "& StrWhere & StrOrder &") as tblTmp) and "& StrWhere & StrOrder&""
 else
 StrSql=StrSql&" Where "& FldName & StrTmp&"("&FldName&") From (Select top "& Clng(TopField)&" "&FldName &" From "&TblName & StrOrder &") as tblTmp) "&StrOrder&""
 end if 
end if
'response.Write StrSql

Set rs=Conn.exeCute(StrSql) '执行查询

if StrWhere<>"" then '求总记录数
FieldCount=Conn.exeCute("Select Count("&FldName&") From "&TblName&" Where "&StrWhere&"")(0)
else
FieldCount=Conn.exeCute("Select Count("&FldName&") From "&TblName&"")(0)
end if

if (FieldCount mod PageSizeX)>0 then '求总页数 PageCountX
 PageCountX=((FieldCount - (FieldCount mod PageSizeX))/ PageSizeX)+1
else
 PageCountX= (FieldCount / PageSizeX)
end if

if page>1 then pagelist="<a class=""prev_btn"" href=""/u_payrecord.php?act=m&zt="&zt&"&page="&page-1&"""><</a>"
for p=1 to PageCountX
if page=p then
pagelist=pagelist&"<a href="""" class=""current"">"&p&"</a>"
else
pagelist=pagelist&"<a class=""paging"" href=""/u_payrecord.php?act=m&zt="&zt&"&page="&p&""">"&p&"</a>"
end if
next
if PageCountX>page then pagelist=pagelist&"<a class=""next_btn"" href=""/u_payrecord.php?act=m&zt="&zt&"&page="&page+1&""">></a>"%>
<div class="cssTable v8cssTable pointTable">
   <ul class="thTitle">
      <li class="Title01">交易说明</li>
      <li class="Title02">交易金额</li>
	  <li class="Title03">交易日期</li>
      <li class="lastTd">类型</li>
   </ul>
<%if FieldCount>0 then
do while not rs.eof%>
   <ul>
      <li><span id=pc><%=rs("jsdh")%>　<%if rs("lx")=0 then%>佣金收入<%elseif rs("lx")=1 then%><%if rs("pay_id")=3 then%>微信<%end if%>充值<%elseif rs("lx")=2 then%>订单消费<%elseif rs("lx")=3 then%><%txzt=gettxzt(rs("jsdh"))%>提现<%if txzt=0 then%>审核中<%elseif txzt=1 then%>处理中<%elseif txzt=2 then%>完成<%elseif txzt=3 then%>取消<%end if%><%end if%></span></li>
      <li>￥<%=gshjg(rs("jine"))%></li>
	  <li><%=rs("etime")%></li>
      <li><span id=pc><%if rs("lx")=0 or rs("lx")=1 then%>收入<%else%>支出<%end if%></span><span id=m>　<%if rs("lx")=0 then%> 佣金收入<%elseif rs("lx")=1 then%> <%if rs("pay_id")=3 then%>微信<%end if%>充值<%elseif rs("lx")=2 then%> 订单消费<%elseif rs("lx")=3 then%>提现<%if txzt=0 then%>待审<%elseif txzt=1 then%>处理<%elseif txzt=2 then%>完成<%elseif txzt=3 then%>取消<%end if%><%end if%></span></li>
   </ul>
<%rs.movenext
loop
rs.close
set rs=nothing
end if%>
   </div>
	<div class="RconBot">
	<div class="pages">
<%=pagelist%>
					</div>
</div>
<!-- 
	<div class="cssTable v8cssTable " width="100%" cellpadding="0" cellspacing="0" border="0">
		<ul class="thTitle">
			<li class="Title01">创建时间</li>
			<li class="Title02">名称</li>
			<li class="Title03">金额<font class="grayfont"> | </font>明细</li>
			<li class="lastTd">状态</li>
		</ul>
			</div>

	<table class="cssTable v8cssTable " width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr class="thTitle">
			<td>创建时间</td>
			<td>名称</td>
			<td>金额<font class="grayfont"> | </font>明细</td>
			<td class="lastTd">状态</td>
		</tr>
			<table> -->
</form>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
	<tr>
		<td align="center" height="30" class='gray'>
					</td>
	</tr>
</table>
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
$(".currentPage").text("我的现金账户")
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