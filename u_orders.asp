<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
end if
if telephone="" or isnull(telephone) then
Response.Redirect("/login")
Response.end
end if
zt=Request("zt")
if zt<>"" and isnumeric(zt) then
zt=int(zt)
else
zt=0
end if
page=int(Request("page"))
if page=0 then page=1%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>我的订单</title>
<META Http-Equiv="Pragma" Content="no-cache">
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
			<a href="/userpanel?a=act&act=logout" id="logout" title="退出登录">退出登录</a>
		</span>
			</div>
</div>
<div id="UleftMenu">
			<ul class="pcIco">
			<li class="menuTit yahei">个人中心</li>
						<li class=" "><a href="/userpanel.php">我的个人中心</a><i class="icon-angle-right"></i></li>
									<li class="current"><a href="/u_orders.php?order_type=0">我的订单</a><i class="icon-angle-right"></i></li>
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

<!--新写的页面开始-->
<div class="rightMenuBar">
	<div class="leftBar">
				<h5 class="yahei">我的订单</h5>
			</div>
	<div class="rightBar">
		<ul class="selectUl floatR UlHide">
			<span class="UlHide_icon"><span>更多状态</span><i class="icon-menu"></i></span>
			<div class="li_more">
				<li><%if zt=2 then%><a href="?act=m&zt=1" >未支付订单</a><%else%><a href="?act=m&zt=2" >已支付订单</a><%end if%><i>|</i></li>
				<li><%if zt=7 then%><a href="?act=m&zt=1" >未支付订单</a><%else%><a href="?act=m&zt=7" >已关闭订单</a><%end if%><i>|</i></li>
				<li><%if zt=3 then%><a href="?act=m&zt=1" >未支付订单</a><%else%><a href="?act=m&zt=3" >待收货</a><%end if%></li>
				<!--<li> <i>|</i> <a href="" >拼团订单</a></li>-->
							 </div>
		</ul>
		<ul class="selectUl floatR">
			<li><a href="?act=m&zt=0" >全部订单</a><i>|</i></li>
			<li><%if zt=1 or zt=0 then%><a href="?act=m&zt=1" >未支付订单</a><%elseif zt=2 then%><a href="?act=m&zt=2" >已支付订单</a><%elseif zt=3 then%><a href="?act=m&zt=3" >待收货</a><%elseif zt=7 then%><a href="?act=m&zt=3" >已关闭订单</a><%end if%><i>|</i></li>
		</ul>
	</div>
</div>
<style>
@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}}
.ptImg{display:block; position:absolute; top:0px; left:0px; width:100px; padding:0px; margin:0px; }
.ptContent{display:block; float:left; overflow:hidden; position:absolute; left:100px; top:0px; padding:0px; margin:0px; }
.nbtn a {display: inline-block; width: 40%; padding: 0; margin: 0; height: 35px; vertical-align: middle; line-height: 35px; }
.ptImg{padding:0 15px;}
@media screen and (max-width: 640px){
	.delStatus{top:15px !important;}
	.wailPay{display: block !important;width: 40% !important;}
	.opricefont {display: none !important;}
	.myOrderList .showOrder li span.otSpan{padding:0;}
	.myOrderList .showOrder li .wailPay{width: 100px !important;text-align: left;padding-left: 10px !important;}
	.myOrderList .showOrder li span.otPayMon{width: calc(100% - 190px) !important;}
	.myOrderList .showOrder li span.payAction{width: 90px !important;padding-right: 10px !important;}
	.myOrderList .showOrder .otPayMon font{margin-top: 1px;display: block;text-align: center;}
	.myOrderList .showOrder .otPayMon em{display: block;text-align: center;}
	#orderPDiv a.orderproName{width: 40% !important;position: absolute;right: 110px;top: 50%;padding-left:0;}
	#orderPDiv{height: auto;position: relative;padding-bottom:0;width:100%;}
	.showOrder .orderImgShow img:first-child{margin:15px 0;}
	.orderImgShow{padding-bottom:0;}
	.myOrderList .showOrder li span .ptImg{position:static;width:auto;}
	.myOrderList .showOrder li span .ptImg img{width:100%;}
	.ptContent{width:calc(60% - 70px);right:15px;top:50%;transform: translateY(-50%);padding-top: 0 !important;}
	.ptContent .ptTitle,.ptContent .ptPrice{width:100%;}
	.myOrderList .showOrder li span.groups_span_1,.myOrderList .showOrder li span.groups_span_2,.myOrderList .showOrder li span.groups_span_3{height:auto !important;}
	.myOrderList .showOrder li span.groups_span_1{position:absolute;width: 70px !important;right: 15px !important;padding-left:0 !important;}
	.myOrderList .showOrder li span.groups_span_2,.myOrderList .showOrder li span.groups_span_3{width:50% !important;line-height:22px !important;padding:15px;}
	.ptContent .ptTitle{display:block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
	.orderBox .payOrder .orderT .group_font{padding-left:15px;}
	.li_more a{padding:0 !important;}
}
.SmallHeight{padding-top:30px;font-size:12px !important}
.SmallHeight span{line-height:160%;height:auto !important;min-height:auto;}
span.opricefont{color:#999 !important;font-size:12px !important;}
.fCenter{text-align:center !important;float:none !important;font-size:12px !important}
.tTxts{color:#666 !important;text-align:left}
.zorder{font-size:12px;}
</style>
<form  id="order_list">
<%PageNo=page
if PageNo="" then PageNo=1
if isnumeric(PageNo) or PageNo="" then
PageNo=abs(PageNo)
 if PageNo=0 then PageNo=1
else
 PageNo=1
end if
TblName = "[dingdan]"
FldName = "id" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,ddh,ddlx,zflx,pslx,besttime,ghsid,OrderMessage,jine,jine2,youhui,atime,zt,zt2,payddh,payjine,ptime,stime,etime,uid,sname,sadd,ssj,wlmc,kddh,fuyan"
PageSizeX=6
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
StrSql="Select Top "&Clng(PageSizeX)&" "& FieldName &" From "&TblName&" "
StrWhere="uid="&int(uid)&" and siteid="&siteid
if instr(cwadmin,"|"&uid&"|")>0 then StrWhere="siteid="&siteid
if zt=1 then StrWhere=StrWhere&" and zt<2"
if zt=2 then StrWhere=StrWhere&" and zt=2"
if zt=3 then StrWhere=StrWhere&" and (zt=3 or zt=2)"
if zt=7 then StrWhere=StrWhere&" and zt=7"
if PageNo=1 then '如果是第一页时，执行如下代码查库速度快
if StrWhere<>"" then
 StrSql=StrSql&" Where "&StrWhere & StrOrder&""
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

if page>1 then pagelist="<a class=""prev_btn"" href=""/u_orders.php?act=m&zt="&zt&"&page="&page-1&"""><</a>"
for p=1 to PageCountX
if page=p then
pagelist=pagelist&"<a href="""" class=""current"">"&p&"</a>"
else
pagelist=pagelist&"<a class=""paging"" href=""/u_orders.php?act=m&zt="&zt&"&page="&p&""">"&p&"</a>"
end if
next
if PageCountX>page then pagelist=pagelist&"<a class=""next_btn"" href=""/u_orders.php?act=m&zt="&zt&"&page="&page+1&""">></a>"

if FieldCount>0 then
do while not rs.eof%>
		<div class="orderBox orderEach">
		<div class="orderList payOrder myOrderList">
			<h5 class="orderT">
				<span id="m">　</span><!--<input id="o_l_<%=rs("id")%>" class="" type="checkbox" />-->
				<font class="otfFont">订单号：<em><%=rs("ddh")%></em></font><i>|</i>
				<font><%=rs("sname")%></font><i>|</i>
				<font><%=rs("atime")%></font>
							</h5>
			<ul class="showOrder">
				<li>
					<span class="orderProImg orderImgShow">
<%set prs=server.createobject("adodb.recordset")
pexec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&rs("ddh")&"' and uid="&int(uid)&" order by id desc"	
if instr(cwadmin,"|"&uid&"|")>0 then pexec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&rs("ddh")&"' order by id desc"	
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
%><div id="orderPDiv">
<img src="<%=pimg%>" border="0"  class="orderPImg" onclick="url_product('/trade/goods-<%=prs("pid")%>','/trade/goods-<%=prs("pid")%>')"/>
<a href="javascript:;" onclick="url_product('/trade/goods-<%=prs("pid")%>','/trade/goods-<%=prs("pid")%>')" class="orderproName"><%=pname%></a> <%=prs("sku_sm")%><span style="padding-top:63px; padding-left:8px;"> × <%=prs("sl")%></span>
</div><%prs.movenext
if prs.eof then exit for
next
prs.close
set prs=nothing
end if%></span>
					<!-- <span class="otSpan Spec">
						1/2&nbsp;					</span> -->
					<span class="otSpan wailPay" style="height:115px;line-height:115px;">
						<font color='#f00'><%if rs("zt")<2 then%>待支付<%elseif rs("zt")=2 then%>已付款<%elseif rs("zt")=3 then%>已发货<%elseif rs("zt")=4 then%>已退款<%elseif rs("zt")=5 then%>已完成<%elseif rs("zt")=7 then%>已取消<%end if%></font></span>
					<span class="otSpan otPayMon" style="height:115px;line-height:115px;">
						<font class="yahei">￥<%=FormatNumber(rs("jine"),2,-1,-1,0)%></font>
						<em><%if rs("zflx")=1 then%>三农积分<%elseif rs("zflx")=2 then%>余额支付<%else%>微信支付<%end if%></em>
					</span>
					<span class="otSpan otPayMon paySpan payAction" style="height:115px;">
					<%if rs("zt")<2 then%><a href="orderDetail?act=show&order_id=<%=rs("id")%>" class="otDet">订单详情</a><i class="icon-angle-right"></i>
					<div class="nbtn"><%if int(uid)=rs("uid") then%><a href="orderDetail?act=show&order_id=<%=rs("id")%>#paymentTable" class="payNowA v8Btn2  v8BgColor payStatus">立即支付</a><%end if%><%if instr(cwadmin,"|"&uid&"|")>0 or int(uid)=rs("uid") then%> <a href="javascript:;" onclick="cheackOrderDel(<%=rs("id")%>)" class="payNowA v8Btn2  v8BgColor delStatus">删除订单</a><%end if%></div>
					<%else%><a href="orderDetail?act=show&order_id=<%=rs("id")%>" class="otDet">订单详情</a><i class="icon-angle-right"></i>
					<%if rs("zt")=2 or rs("zt")=3 then%><div class="nbtn"><%if rs("zt")=3 and int(uid)=rs("uid") then%><a href="javascript:;" onclick="cheackOrderFinish(<%=rs("id")%>)" class="payNowA v8Btn2  v8BgColor payStatus">确认收货</a><%end if%><%if instr(cwadmin,"|"&uid&"|")>0 and rs("zt")=2 then%> <a href="orderDetail?act=show&order_id=<%=rs("id")%>#paymentTable" class="payNowA v8Btn2  v8BgColor payStatus">立即发货</a><%end if%><%if rs("zt")=2 and int(uid)=rs("uid") then%> <a href="javascript:;" onclick="cheackOrderCancel(<%=rs("id")%>)" class="payNowA v8Btn2  v8BgColor payStatus">申请退款</a><%end if%></div>
					<%end if%><%end if%>
					</span>
				</li>
			</ul><%if instr(cwadmin,"|"&uid&"|")>0 then%><h5 class="orderT" style="color:#333"><span id="m">　</span>下单用户：<%=getuserno(rs("uid"))%>&nbsp; <%=getusersj(rs("uid"))%></h5><%end if%>
		</div>
	</div><%rs.movenext
loop
rs.close
set rs=nothing%>
	<div class="RconBot">
	<div class="pages">
<%=pagelist%>
					</div>
</div><%else%><div class="noProlist" style="clear: both;">尚未有订单列表</div>
<%end if%>
</form>
<!--新写的页面结束-->
<link href="css/alert.css" rel="stylesheet" type="text/css" /><script src="js/alert.js"></script>
</div>
<div id="bottom" style=""></div>
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
</style><style type='text/css'>
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
				</li></ul></div></body>
<script>
function is_mobile(){
	return window.screen.width<767 || ($('body').width() > 0 && $('body').width() < 767);
}
function godetail(pid){//v9才有这个功能
	var url = '/trade/goods-';
		if(url.indexOf('goods')>=0) url = url+pid;
	top.window.location.href=url;
}

function url_product(url,murl){
	if(is_mobile()){
		top.window.location.href=murl;
	}
	else{
		top.window.location.href=url;
	}
}

function cheackOrderFinish(id){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("确认收货？","确认收货",function Backreturn(isFlag){
		if(isFlag){

		$.post('/api.asp?a=cheackOrderFinish',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}
				window.location.href=window.location.href;
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});

		}
	});
}

function cheackOrderCancel(id){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("申请退款？款项将退回账户余额。","申请退款",function Backreturn(isFlag){
		if(isFlag){

		$.post('/api.asp?a=cheackOrderCancel',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}
				window.location.href=window.location.href;
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});

		}
	});
}

function cheackOrderDel(id){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("确认删除订单？","删除订单",function Backreturn(isFlag){
		if(isFlag){

		$.post('/cheackOrderDelapi',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					showAlert(rdata.msg);
				}
				location.reload();
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});

		}
	});
}

$(".currentPage").text("我的订单")
$(".UlHide").click(function(){
	$(".UlHide li").fadeToggle();
	$(".UlHide a").removeClass("current");
});

/*
$(".menuIcn").click(function(){
	$(".menuContent").fadeToggle();
});
*/
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
</html>
