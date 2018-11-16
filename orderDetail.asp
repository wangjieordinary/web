<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
end if
teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
end if
resend=request("resend")
if resend="" or isnull(resend) then resend=0
resend=int(resend)
if (admin="" or isnull(admin)) and telephone="" then Response.Redirect("/login")%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="中国农民自由贸易网">
<title>我的订单</title>
<META Http-Equiv="Pragma" Content="no-cache">

<script type="text/javascript">
function closeOrder(id){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("确认要作废订单吗？<%if zt=2 or zt=3 then%>款项将退回余额<%end if%>","作废订单",function Backreturn(isFlag){
		if(isFlag){
		$.post('/closeOrderapi',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					showAlert(rdata.msg);
				}
				location.reload();
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					showAlert(rdata.msg);
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
</script>
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
<style>	@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}}
    .v8TxtColor,.on a{color:#79C950 !important;}
	.v8BgColor{background:#79C950;}
    .v8BorderColor,
    .on,
    .v8BorderColor,
    #UleftMenu ul li:hover,
    #UleftMenu ul li.current,
    .listTabMenu ul li.current{border-color:#79C950;}
	#UleftMenu ul li.menuTit:hover{border-color:#79C950}
	.newIco{display:inline-block;background:#f30;margin-left:12px;width:25px;height:11px;}
	.newIco img{margin:1px 0 0 1px;}
#fuyan{width:284px;height:58px;padding:5px 0px;border:0;font-size:14px;font-family:"Microsoft Yahei","verdana";color:#666;font-weight:normal;text-indent:0p}
.moInput{padding:5px 0px;line-height:200%;border:0px;font-size:14px;font-family:"Microsoft Yahei","verdana";color:#666;font-weight:normal;text-indent:0px}
	</style>
<!--新写的页面开始-->
<%order_id=int(Request("order_id"))
if order_id=0 then orderno=trim(Request("orderno"))
Set rs = Server.CreateObject( "ADODB.Recordset" )
if (admin="" or isnull(admin)) and order_id>0 and instr(cwadmin,"|"&uid&"|")=0 then usql=" and uid="&int(uid)
if orderno<>"" then
sql="Select * from [dingdan] where ddh='"&orderno&"'"&usql
else
sql="Select * from [dingdan] where id="&order_id&usql
end if
rs.open sql,conn,1,2
if not (rs.bof and rs.eof) then
userid=rs("uid")
order_id=rs("id")
ddh=rs("ddh")
atime=rs("atime")
ptime=rs("ptime")
stime=rs("stime")
etime=rs("etime")
sname=rs("sname")
ssj=rs("ssj")
sadd=rs("sadd")
besttime=rs("besttime")
OrderMessage=rs("OrderMessage")
jine=rs("jine")
jine2=rs("jine2")
pslx=rs("pslx")
PayType=rs("zflx")
zt=rs("zt")
ly=rs("ly")
if ly=0 then lytxt="移动端"
if ly=1 then lytxt="PC端"
wlmc=rs("wlmc")
kddh=rs("kddh")
fuyan=rs("fuyan")
else
response.write "<script LANGUAGE='javascript'>alert('订单不存在或已删除！');</script>"
end if
rs.close
set rs=nothing%>
<div id="Uv8Top" class="v8BgColor">
	<div class="gobackHome">
		<a href="/" target="_blank"><i class="icon-home s-fontFamily"></i>返回网站首页</a>
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
									<li class="current"><a href="/u_orders.php?order_type=0">我的订单</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_message.php">会员消息</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_liuyan.php">留言板</a><i class="icon-angle-right"></i></li>
                                    <li class=" "><a href="/u_payrecord.php">我的现金账户</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_cart.php?idweb=9707&isCenter=1">我的购物车</a><i class="icon-angle-right"></i></li>
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
<div id="Umian"><!--新写的页面结束--


<!-- <script>
$(function(){
	$(".UlHide_icon").click(function(){
		$(this).siblings(".li_more").toggle();
	})
})
</script> -->
<!--新写的页面开始-->
<form action="/u_pay_finish" method="post">
<div class="rightMenuBar">
	<div class="leftBar detailBar">
		<h5 class="yahei">订单号：<font class="orderNo"><%=ddh%></font></h5>
	</div>
<%if zt<2 or (instr(cwadmin,"|"&uid&"|")>0 and zt<5) then%>	<div class="rightBar">
		<div class="selectUl floatR">
			<input class="v8Btn3" type="button" onclick='closeOrder(<%=order_id%>);' value="作废订单"/>
		</div>
	</div><%end if%>
	</div>
<!--新增内容-->
<style>
.orderDetail-list .hot-li .rightArr{border-left-color:#288ADD}
.orderDetail-list .hot-li .li-span{background:#288ADD;z-index:18;}
.orderDetail-list .hot-li .li-txt {color:#288ADD}
.orderDetail-list .first-li .leftArr{border-left-color:#288ADD ;}
.orderDetail-info .oInfoRight .oImg{width:40px;height:40px;background:#288ADD;margin:30px auto 0}
.orderDetail-info .oInfoRight .ob a.olinks{padding-left:10px;color:#288ADD}

@media screen and (max-width:641px){
	body{background:none !important;}
    #UleftMenu{display:none;}
	#Umian{background:none;}
	#Uv8Top .userS{display:none;}
	.mobileMune{display:inline-block; }
}
</style>

<div class="orderDetail-list">
	<table cellpadding="0" cellspacing="0" width="100%" class="orderDTtable" border="0">

		<tr class="processTd">
			<td>
				<div class="oDiv first-li hot-li">
					<a href="javascript:void(0);">
						<font class="leftArr"></font>
						<span class="li-span"><i class="icon-check3 li-i"></i></span>
						<font class="rightArr"></font>
						<span class="li-txt">拍下商品</span>
					</a>
				</div>
			</td>
			<td>
				<div class="oDiv second-li<%if zt>1 then%> hot-li<%end if%>">
					<a href="javascript:void(0);">
						<font class="leftArr"></font>
						<i class="statusLine"></i>
						<span class="li-span"> 2</span>
						<font class="rightArr"></font>
						<span class="li-txt">付款给卖家</span>
					</a>
				</div>
			</td>
			<td>
				<div class="oDiv thrid-li<%if zt>2 then%> hot-li<%end if%>" >
					<a href="javascript:void(0);">
						<font class="leftArr"></font>
						<i class="statusLine"></i>
						<span class="li-span">3</span>
						<font class="rightArr"></font>
						<span class="li-txt">卖家发货</span>
					</a>
				</div>
			</td>
			<td>
				<div class="oDiv last-li<%if zt=5 or zt=7 then%> hot-li<%end if%>">
					<a href="javascript:void(0);">
						<font class="leftArr"></font>
						<span class="li-span">4</span>
						<font class="rightArr"></font>
						<span class="li-txt"><%if zt=7 then%>取消订单<%else%>确认收货<%end if%></span>
					</a>
				</div>
			</td>
		</tr>
		<tr class="cTime">
			<td><p class="d"><%=atime%></p></td>
			<td><p class="d"><%=ptime%></p></td>
			<td><p class="d"><%=stime%></p></td>
			<td><p class="d"><%=etime%></p></td>
		</tr>
	</table>
</div>
<div class="orderDetail-info">
	<div class="oInfoRight">
		<div class="oTitle">订单状态</div>
        		<!--第1种状态 拍下产品-->
		<div class="oMain">
			<div class="oImg"><img src="img/noS.png" border="0" /></div>
			<div class="oS" id=pc>
				<p class="ot">订单状态: <%if zt<2 then%>待支付<%elseif zt=2 then%>已付款<%elseif zt=3 then%>已发货<%elseif zt=4 then%>已退款<%elseif zt=5 then%>已完成<%elseif zt=7 then%>已取消<%end if%><span id="pc">，订单总额:  ￥<%=gshjg(jine)%><!-- 或 <%=jine2%>积分--></span></b></p>
				<%if zt<2 then%><div class="ob">
					<span class="otxt">您可以</span><input type="button" name="payBtn" value="马上付款" class="v8Btn2 v8BgColor" onclick="window.location='orderDetail?act=show&order_id=<%=order_id%>#paymentTable'" />
								</div><%end if%>
			</div>
<%if (zt=2 or zt=3 or zt=5) and instr(cwadmin,"|"&uid&"|")=0 and jine>=100 then%><div class="oS">
					<span style="font-size:23px; color:#F00; font-weight:bold; line-height:38px;">您可以扫码参与抽奖</span><br><img src="/img/20181015HD.png">
								</div><%end if%>
				<%if zt=2 and instr(cwadmin,"|"&uid&"|")>0 then%>
								<div class="oS" style="padding-top:10px;">
					<span class="otxt">您可以</span><input type="button" name="payBtn" value="马上发货" class="v8Btn2 v8BgColor" onclick="window.location='orderDetail?act=show&order_id=<%=order_id%>#paymentTable'" />
								</div><%end if%>
		</div>
			</div>
	<div class="oInfoLeft">
		<div class="oTitle">订单信息</div>
		<div class="oMain">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
<%if instr(cwadmin,"|"&uid&"|")>0 then%><tr><td class="leftTd"><span class="ljySpan">下单用户:</span></td><td><font><%=getuserno(userid)%>&nbsp; <%=getusersj(userid)%></font></td></tr>
<tr><td class="leftTd"><span class="ljySpan">订单来源:</span></td><td><font><%=lytxt%></font></td></tr><%end if%>
				<tr id="m">
					<td class="leftTd"><span class="ljySpan"><%if zt<2 then%>下单时间<%elseif zt<3 then%>付款时间<%elseif zt<4 then%>发货时间<%elseif zt=5 then%>完成时间<%elseif zt=7 then%>取消时间<%end if%>:</span></td>
					<td><font><%if zt<2 then%><%=atime%><%elseif zt<3 then%><%=ptime%><%elseif zt<4 then%><%=stime%><%elseif zt=5 then%><%=etime%><%elseif zt=7 then%><%=etime%><%end if%></font></td>
				</tr>
<%if zt>2 then%><tr>
					<td class="leftTd"><span class="ljySpan">物流信息:</span></td>
					<td><%if instr(kddh,",")=0 then%><font><%=getwlmc(wlmc)%> <a href="https://www.kuaidi100.com/all/yt.shtml?mscomnu=<%=kddh%>" target="_blank"><%=kddh%></a></font><%else%>
<%for i=0 to ubound(split(wlmc,","))%>
<font><%=getwlmc(split(wlmc,",")(i))%> <a href="https://www.kuaidi100.com/all/yt.shtml?mscomnu=<%=split(kddh,",")(i)%>" target="_blank"><%=split(kddh,",")(i)%></a></font><br>
<%next%><%end if%></td>
				</tr><%end if%>
				<tr>
					<td class="leftTd"><span class="ljySpan">订单编号:</span></td>
					<td><font><%=ddh%></font></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ljySpan">收货人姓名:</span></td>
					<td><font><%=sname%></font></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ljySpan">手机号码:</span></td>
					<td><font><%=ssj%></font></td>
				</tr>
				<tr>
					<td class="leftTd">
						<span class="ljySpan">收货地址:</span>
					</td>
					<td><font><%=sadd%></font></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ljySpan">送货时间:</span></td>
					<td><font><%=besttime%></font></td>
				</tr>
				<tr>
					<td class="leftTd"><span class="ljySpan">留言信息:</span></td>
					<td><font><%=OrderMessage%></font></td>
				</tr>
			</table>
		</div>
	</div>
	
</div>

<div class="orderBox orderEach">
	<div class="orderList payOrder myOrderList orderDetailList">
		<h5 class="orderT detailTit">订单详情</h5>
<%set prs=server.createobject("adodb.recordset")
pexec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&ddh&"' and uid="&int(userid)&" order by id desc"		
if instr(cwadmin,"|"&uid&"|")>0 then pexec="select * from [gouwuche] where siteid="&siteid&" and ddh='"&ddh&"' order by id desc"	
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
%>
				<ul class="showOrder detailOther">
			<li>
				<span class="orderProImg orderImgShow" onclick="godetail(<%=prs("pid")%>)">
				  <img style="width:90px;height:75px" src="<%=pimg%>" onerror="this.src='img/defimg.png'"/>
					<font class="prodName"><%=pname%></font></span>
				<span class="otSpan wailPay detailInfo01">x<font class=""><%=prs("sl")%></font></span>
				<span class="otSpan wailPay detailInfo02">￥<font class=''><%=FormatNumber(prs("zj"),2,-1,-1,0)%></font></span>
				<span class="otSpan wailPay detailInfo04"><font class=""><%=prs("sku_sm")%></font></span>				 
			</li>
		</ul><%prs.movenext
if prs.eof then exit for
next
prs.close
set prs=nothing
end if%>
			</div>
</div>
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="cssTable detailTable">
	<tr>
		<th colspan="2">结算信息</th>
	</tr>
	<tr>
		<td colspan="2">
			<font>
			商品金额: ￥<%=gshjg(jine)%><!-- 或 <%=jine2%>积分--> - 优惠金额: ￥0.00 + 运费: ￥0.00 + 包装费用:  ￥0.00 + 支付费用: ￥0.00 + 发票税额: ￥0.00 = 订单总金额: &nbsp;<em class="price">￥<%=gshjg(jine)%></em><!--&nbsp; 或 &nbsp;<em class="price"><%=jine2%></em>&nbsp;积分-->
			</font>
		</td>
	</tr>
</table>

<div class="mobileAccounts">
	<span>合计金额：</span><span>￥<%=jine%><!-- 或 <%=jine2%>积分--></span>
</div>
<%if zt<2 then%>
  <table width="100%" cellspacing="0" cellpadding="5" border="0" class="cssTable" style="margin-top:0px;" id="paymentTable">
  	<tr class="thTitle">
	<td colspan="3">选择支付方式</td>
	</tr>	
	<tr align="center" id="s">
	  <td >名称</td>
	  <td width="60%" class="describe" id="pc">描述</td>
	  <td class="serviceFee">手续费</td>
	</tr>
		<tr id="c">
	  <td style="padding: 15px 0 0 16px"><input type="radio" name="pay_id" id="pay_id" value="3"<%if PayType=3 or PayType="" then%> checked<%end if%>/> &nbsp; &nbsp; <label for="3"><img src="img/weixin.gif" width="128" height="48" border="0" alt=""></label>
	  </td>
	  <td id="pc">微信支付</td>
	  <td align="center">0</td>
	</tr>
		<tr id="c">
	  <td style="padding: 15px 0 0 16px"><input type="radio" name="pay_id" id="pay_id" value="2"<%if PayType=2 then%> checked<%end if%> /> &nbsp; &nbsp; <label for="2"><img src="img/balance.gif" width="128" height="48" border="0" alt=""></label>
	  </td>
	  <td id="pc">余额支付</td>
	  <td align="center">0</td>
	</tr>
		<tr id="c">
	  <td style="padding: 15px 0 0 16px"><input type="radio" name="pay_id" id="pay_id" value="1"<%if PayType=1 then%> checked<%end if%> disabled/> &nbsp; &nbsp; <label for="1"><img src="img/cod.gif" width="128" height="48" border="0" alt=""></label>
	  </td>
	  <td id="pc">三农积分（暂未开放，敬请期待！）</td>
	  <td align="center">0</td>
	</tr>
	  </tbody></table>
<script>
function payin(){
var pay_id = $("input[name='pay_id']:checked").val();
window.location='u_pay_finish?idweb=9707&pay_id='+pay_id+'&orderno=<%=ddh%>&action=payment'
}
</script><%czsub="<input onclick=""javascript:payin()"" class=""v8BgColor v8Btn2"" type=""button"" value=""付款""/>"
end if%>
<%if instr(cwadmin,"|"&uid&"|")>0 and (zt<3 or resend=1) then%>
  <table width="100%" cellspacing="0" cellpadding="5" border="0" class="cssTable" style="margin-top:0px;" id="paymentTable">
  	<tr class="thTitle">
	<td colspan="3">物流信息</td>
	</tr>	
	<tr>
	  <td>快递名称</td>
	  <td>快递单号 <a onClick="addwl()">添加多一个单号</a></td>
	</tr>
	<tr>
	  <td>
        <select name="wlmc" id="wlmc" class="moInput">
<option value="">选择快递公司</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [express] where siteid="&siteid&" order by txtsortid asc"
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>"<%if int(pslx)=rs("id") then%> selected="selected"<%end if%>><%=rs("txtexpressname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%><option value="0"<%if pslx="0" then%> selected<%end if%> disabled>上门取货</option><option value="99999"<%if pslx="99999" then%> selected<%end if%> disabled>运费到付</option></select></td>
	  <td><input type="text" name="kddh" id="kddh" class="moInput" placeholder="6-20位字母和数字组合" check="^[a-zA-Z0-9_]{6,20}$" warning="6-20位字母和数字组合" maxlength="20"></td>
	</tr>
	  </tbody></table>
 <table width="100%" cellspacing="0" cellpadding="5" border="0" class="cssTable" style="margin-top:0px;">
	<tr>
	  <td colspan="2"><textarea id="fuyan" name="fuyan" placeholder="发货备注（选填）"></textarea></td>
	</tr>
	  </tbody></table>
<script>function addwl(){
$("#paymentTable").append('<tr><td><select name="wlmc" id="wlmc" class="moInput"><option value="">选择快递公司</option><%set rs=server.createobject("adodb.recordset")
exec="select * from [express] where siteid="&siteid&" order by txtsortid asc"
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
%><option value="<%=rs("id")%>"<%if int(pslx)=rs("id") then%> selected="selected"<%end if%>><%=rs("txtexpressname")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%><option value="0"<%if pslx="0" then%> selected<%end if%> disabled>上门取货</option><option value="99999"<%if pslx="99999" then%> selected<%end if%> disabled>运费到付</option></select></td><td><input type="text" name="kddh" id="kddh" class="moInput" placeholder="6-20位字母和数字组合" check="^[a-zA-Z0-9_]{6,20}$" warning="6-20位字母和数字组合" maxlength="20"></td></tr>')
}</script> 
<script>
function fahuo(id){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("确认发货？","确认发货",function Backreturn(isFlag){
		if(isFlag){
var wlmc = [];
$('select[name="wlmc"]').each(function(){
    wlmc.push($(this).val());//添加至数组
});
var kddh = [];
$('input[name="kddh"]').each(function(){
    kddh.push($(this).val());//添加至数组
});
var fuyan = $("#fuyan").val();
if(!wlmc){jAlert('请选择物流公司');return false;}
if(!kddh){jAlert('请输入快递单号');return false;}
if(wlmc&&kddh){
		$.post('/trade/SendOrderFinish',{'id':id,'wlmc':wlmc,'kddh':kddh,'fuyan':fuyan},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					showAlert(rdata.msg);
				}
				location.reload();
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					showAlert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});
		}
	}
	});
}
</script>
<%end if
if (zt<3 or resend=1) and instr(cwadmin,"|"&uid&"|")>0 then czsub="<input onclick=""javascript:fahuo("&order_id&")"" class=""v8BgColor v8Btn2"" type=""button"" value=""发货""/>"
if zt=3 and instr(cwadmin,"|"&uid&"|")>0 and resend=0 then czsub="<a href=""?act=show&order_id="&order_id&"&resend=1"">重新发货</a>"%>
<div class="formBottom">
    <%if zt<2 or (instr(cwadmin,"|"&uid&"|")>0 and zt<4) then%><input class="v8Btn3 candleOrder" type="button" onclick='closeOrder(<%=order_id%>);' value="作废订单"/><%end if%>	<input onclick="javascript:history.go(-1)" class="v8Btn3 detailBack" type="button" value="返回"/>
			<%=czsub%>
		</div>
</form>
<script>
function godetail(pid){//v9才有这个功能
	var url = '/trade/goods-';
		if(url.indexOf('goods')>=0) url = url+pid;
	top.window.location.href=url;
}
</script>
<!--新写的页面结束--->
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
</style>
<script>
$(".currentPage").text("订单详情")

$(document).ready(function(){
	changeStu();
	$(window).resize(function() {
		changeStu();
	});

	function changeStu(){
		if($(window).width()<641){
			$(".li-txt:eq(0)").text("拍下");
			$(".li-txt:eq(1)").text("付款");
			$(".li-txt:eq(2)").text("发货");
			$(".li-txt:eq(3)").text("<%if zt=7 then%>取消<%else%>完成<%end if%>");
			$(".detailTit").text("购买商品");
		}
		else{
			$(".li-txt:eq(0)").text("拍下商品");
			$(".li-txt:eq(1)").text("付款给卖家");
			$(".li-txt:eq(2)").text("卖家发货");
			$(".li-txt:eq(3)").text("<%if zt=7 then%>取消订单<%else%>确认收货<%end if%>");
			$(".detailTit").text("订单详情");
		}
	}
});
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
