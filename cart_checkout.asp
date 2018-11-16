<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"-->
<%act=trim(Request("act"))
pid=Request("pid")
num=Request("num")
if pid<>"" then pid=int(pid)
if num<>"" then num=Cint(num)
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
if GiftPrice="" or isnull(GiftPrice) then GiftPrice=0
ddusergroup=rs("ddusergroup")
else
ddusergroup=0
end if
rs.close
set rs=nothing
end if%>
<%page=0
IDShopCart=Request("IDShopCart[]")
set rs=server.createobject("adodb.recordset")
exec="select * from [gouwuche] where siteid="&siteid&" and ddh is null and uid="&int(uid)&" and id in ("&IDShopCart&") order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
for i=1 to rssum
'if i=1 then
'IDShopCart=rs("id")
'else
'IDShopCart=IDShopCart&","&rs("id")
'end if
pname=""
pimg=""
price2=""
jifen3=""
jifen1=""
proinfo=getproinfo(rs("pid"))
if proinfo<>"" then
pname=SPLIT(proinfo&"||||||||","||")(0)
pimg=SPLIT(proinfo&"||||||||","||")(1)
price2=SPLIT(proinfo&"||||||||","||")(2)
jifen3=SPLIT(proinfo&"||||||||","||")(3)
jifen1=SPLIT(proinfo&"||||||||","||")(4)
end if
cartTitle=cartTitle&"<tr><td class=""pDetail"" onclick=""godetail("&rs("pid")&")""><table cellpadding=""0"" cellspacing=""0"" border=""0""><tr><td class=""itd""><img src="""&pimg&""" border=""0"" /></td><td class=""ntd"">"&pname&"<br>"&rs("sku_sm")&"</td></tr></table></td><td class=""qdPrice""><div class=""cartPrice"">"&FormatNumber(price2,2,-1,-1,0)&"</div></td><td class=""qdNum""><div class=""cartNum"">"&rs("sl")&"</div></td><td class=""totle""><div class=""cartAccount"">"&FormatNumber(price2*rs("sl"),2,-1,-1,0)&"</div></td></tr>"%>
<%znum=znum+rs("sl")
zje=zje+(rs("sl")*rs("dj"))
zje2=zje2+(rs("sl")*rs("dj2"))
sku_id=rs("sku_id")
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta name="keywords" content="购物车">
<title>购物车</title>
<META Http-Equiv="Pragma" Content="no-cache">
<link href="/share/users-style.css" rel="stylesheet" type="text/css">
<link href="/share/systemStyle.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='/js/jquery.js'></script>
<script type="text/javascript" src='/js/nicebox.js'></script>
<script language="javascript" src="/js/showuform.js"></script>
</head>
<body>
<script type="text/javascript">
var f_JsSumPrice	=	<%=FormatNumber(zje,2,-1,-1,0)%>;
var f_CouponsPrice	=	0;
var f_DeliveryPrice =	0;
var f_PackCost		=	0.00;
var f_PackFreeCost	=	0.00;
var curBuyIDShopCartList = [<%=uid%>];
var i_DefaultIDRec = <%if isnull(Session("IDRec")) or Session("IDRec")="" or Session("IDRec")="NaN" then%>0<%else%><%=Session("IDRec")%><%end if%>;

function RecSelect(clickObj){
	$('.cAddr').each(function(){
		$(this).removeClass('hotAddr');
	});
	$("#IDRec").val($(clickObj).data('idrec'));
	i_DefaultIDRec = $(clickObj).data('idrec');
	$(clickObj).addClass('hotAddr');

	ShowDeliveryPrice();
}

function ShopCartRecList(){
	var postUrl = '/ShopCartRecListapi';
	var postData = {'Action':'RecList'};
	$.post(postUrl,postData,function(result){
		var html = "";

		var b_Add  = true;

		//此处不能直接return 为了避免没有收货地址的用户，也需要有RecAddHTML
		if(result){
			var resultList = eval(result);
			if(resultList.length>0){
				//if(resultList.length>0){
					html+= ShopCartRecListHTML(resultList);
					b_Add = false;
				/*}else{
					for(var i=0;i<resultList.length;i++){
						resultList[i]['RecDetail'] = eval("("+resultList[i]["RecDetail"]+")");
						if(resultList[i]['IsDefault'] && i_DefaultIDRec==0){
							i_DefaultIDRec = resultList[i]['IDRec'];
						}
						html+= ShopCartRecInfoHTML(resultList[i]);
					}
					if(!i_DefaultIDRec) i_DefaultIDRec = resultList[i]['IDRec'];
					html+= '<input type="hidden" id="IDRec" name="IDRec" value="'+i_DefaultIDRec+'" '+(isDefault?'checked':'')+'/>';
				}*/
			}
		}
		if(b_Add){
			html+= ShopCartRecAddHTML();
		}		
		$("#showAddr").html(html);
		ShowDeliveryPrice();
	});
}

function ShopCartRecListHTML(RecList){
	var html = '';
	html+= '<ul class="addrList">';
	for(var i=0;i<RecList.length;i++){
		var isDefault = RecList[i]['IsDefault']>0?true:false;
		RecList[i]['RecDetail'] = eval("("+RecList[i]['RecDetail']+")");
		html+=	'<li class="'+(isDefault?'defaultAddr':'')+'" onmouseover="$(this).addClass(\'hoverAddr\');" onmouseout="$(this).removeClass(\'hoverAddr\');" onclick="ShowDeliveryPrice();">';//鼠标经过 hoverAddr
		html+=		'<input type="radio" name="IDRec" id="IDRec_'+RecList[i]['IDRec']+'" value="'+RecList[i]['IDRec']+'" '+(isDefault?'checked':'')+' style="width:23px; height:23px;"/>';
		html+=		'<label for="IDRec_'+RecList[i]['IDRec']+'">';
		html+=			RecList[i]['RecDetail']['RecName'];
		html+=			'<span id="pc">&nbsp;&nbsp;&nbsp;&nbsp;<font class="d">'+RecList[i]['RecDetail']['RecAddress']+'&nbsp;&nbsp;</font></span>';
		html+=			'&nbsp;&nbsp;<font class="m">'+RecList[i]['RecDetail']['RecMobile']+'&nbsp;&nbsp;</font>';
		if(RecList[i]['IsDefault']>0){
			html+=		'<span class="r" id="pc">默认地址</span>';
		}else{
			html+=		'<span class="r" id="pc"><a href="javascript:ShopCartRecSetDef('+RecList[i]["IDRec"]+',0)" class="setDefault">设为默认地址</a></span>';
		}
		html+=		'</label>';
		html+=		'<span class="r"><a href="javascript:ShopCartRecEditShow('+RecList[i]["IDRec"]+')" class="editAddr">编辑</a>';
		html+=		'<a href="javascript:ShopCartRecDel('+RecList[i]["IDRec"]+')" class="delAddr">删除</a></span>';
		html+=	'</li>';
	}
	html+=	'</ul>';
	//html+=	'<a href="javascript:ShopCartRecAddShow();">使用新地址</a>';
	return html;
}

function ShopCartRecInfoHTML(RecInfo){
	var html =	"";
	html+=	'<div class="cAddr '+(RecInfo['IsDefault']==1?'hotAddr':'')+'" data-idrec="'+RecInfo['IDRec']+'" onclick="RecSelect(this)">';
	html+=		'<div class="cName">';
	html+=			RecInfo['RecDetail']['RecName'];
	html+=			'<span class="simpleAdd">'+RecInfo['RecDetail']['RecMobile']+'</span>';
	html+=		'</div>';
	html+=		'<div class="cContent">'+RecInfo['RecDetail']['RecProvince']+' '+RecInfo['RecDetail']['RecCity']+' '+RecInfo['RecDetail']['RecArea']+'<br/>'+RecInfo['RecDetail']['RecAddress']+'</div>';
	html+=		'<div class="addrBtn">';
	html+=			'<input type="button" name="edit" class="cBtn whiteBtn" onclick="ShopCartRecEditShow('+RecInfo["IDRec"]+')" value="编辑" />';
	html+=			'<input type="button" name="del" class="cBtn" onclick="ShopCartRecDel('+RecInfo["IDRec"]+')" value="删除" />';
	html+=		'</div>';
	html+=	'</div>';
	return html;
}

function ShopCartRecAddHTML(){
	var html = '';
	html+=	'<div class="cAddr cAddrLast">';
	html+=		'<div class="createAddr" onclick="javascript:ShopCartRecAddShow();">';
	html+=			'<p class="plus">＋</p>';
	html+=			'<p class="note">使用新地址</p>';
	html+=		'</div>';
	html+=	'</div>';
	return html;
}

function ShopCartRecAddShow(){
	var getUrl = '/add_address';
			document.getElementById("boxName").innerHTML="添加新地址"; 
		if(document.getElementById("boxClose")) document.getElementById("boxClose").innerHTML="×"; 
		document.getElementById("showiframe").src=getUrl; 
		box.Show({'width':'780px','height':'505px'});
	}

function ShopCartRecEditShow(IDRec){
	var getUrl = '/add_address?act=edit&IDRec='+IDRec;
	i_DefaultIDRec = IDRec;
			document.getElementById("boxName").innerHTML="修改地址"; 
		if(document.getElementById("boxClose")) document.getElementById("boxClose").innerHTML="×"; 
		document.getElementById("showiframe").src=getUrl; 
		box.Show({'width':'780px','height':'505px'});
	}

function ShopCartRecDel(IDRec){
	if(confirm("确认要删除？")){
	var getUrl = '/deladdress';
	$.post(getUrl,{action:'delRec',IDRec:IDRec},function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
			alert("删除成功");
			ShopCartRecList();
		}else{
			alert("删除失败:"+i_AddFlag);
		}
	});
	}
}

function ShopCartRecSetDef(IDRec,isDefual){
	i_DefaultIDRec = IDRec;
	if(isDefual==0){
	if (confirm("确认修改默认地址？")){
		var getUrl = '/setDefaultaddress';
		$.post(getUrl,{action:'setDefault',IDRec:IDRec},function(result){
			var i_AddFlag = parseInt(result);
			if(i_AddFlag>0){
				alert("设置成功");
				ShopCartRecList();
			}else{
				alert("设置失败:"+i_AddFlag);
			}
		});
		}
	}else{
		alert('该收货信息已经是默认地址！');
	}
}

function ShopCartRecAddSave(){
}

function ShowCouponsPrice(){
	var curCouponsPrice = $("#IDCoupons").find("option:selected").data('price');
	f_CouponsPrice = curCouponsPrice;
	if(f_CouponsPrice>0){
		$("#CouponsPrice").html(curCouponsPrice);
	}else{
		$("#CouponsPrice").html(curCouponsPrice);
	}
	ReShowSumPrice();
}

var s_CountDeliveryPriceUrl = "/kuaidipriceapi";

function ShowDeliveryPrice(){
		var curSelectIDDelivery = $("#DeliveryType option:selected").val();

	//var curSelectIDRec = $("#IDRec").val();
	var curSelectIDRec = getCurSelectRecID();
	var arr_CountDeliveryPriceParam = {};
	arr_CountDeliveryPriceParam['IDShopCart'] = curBuyIDShopCartList;
	arr_CountDeliveryPriceParam['IDRec'] = curSelectIDRec;
	arr_CountDeliveryPriceParam['IDDelivery'] =curSelectIDDelivery;
	var DeliveryTypeText = $("#DeliveryType").find("option:selected").text();//获取配送方式是不是’上门取货‘
	var checkshow = (DeliveryTypeText.indexOf("上门取货")>0)?true:false;//’上门取货‘跳过这个判断
	$.post(s_CountDeliveryPriceUrl,arr_CountDeliveryPriceParam,function(s_Data){
		//console.log(arr_CountDeliveryPriceParam);
		var arr_Result = eval(s_Data);
		if(arr_Result['Flag']<0 && !checkshow){
			if(arr_Result['Flag']==-1){
				alert("请选择快递配送");
			}else if(arr_Result['Flag']==-2){
				alert("请选择要购买的产品");
			}else if(arr_Result['Flag']==-3){
				alert("请选择收货地址!");
			}else if(arr_Result['Flag']==-4){
				alert("配送方式异常");
			}else if(arr_Result['Flag']==-5){
				alert("请填写收货信息");
			}else if(arr_Result['Flag']==-6){
				alert("购物车里没有商品");
			}
			return false;
		}else if(arr_Result['Flag']<0 && checkshow){
			if(arr_Result['Flag']==-1){
				alert("请选择快递配送");
			}else if(arr_Result['Flag']==-2){
				alert("请选择要购买的产品");
			}else if(arr_Result['Flag']==-4){
				alert("配送方式异常");
			}else if(arr_Result['Flag']==-5){
				alert("请填写收货信息");
			}else if(arr_Result['Flag']==-6){
				alert("购物车里没有商品");
			}
			return false;
		}else{
			f_DeliveryPrice = arr_Result['Data']['DeliveryPrice'];
			if(f_DeliveryPrice=='' || typeof(f_DeliveryPrice)=='undefined') f_DeliveryPrice = 0;//预防没有设置运费
			$("#DeliveryPrice").html(f_DeliveryPrice);
			ReShowSumPrice();
		}
	});
	return false;

	/* console.log("~~~");
	console.log("curSelectIDDelivery:"+curSelectIDDelivery);
	console.log(curBuyIDShopCartList);
	console.log("curSelectIDRec:"+curSelectIDRec);
	console.log("~~~"); */
	var curDeliveryPrice = $("#DeliveryType option:selected").data('val');
	f_DeliveryPrice = curDeliveryPrice;
	$("#DeliveryPrice").html(curDeliveryPrice);
	ReShowSumPrice();
}

function ShowPackPrice(){
	var curPackObj = $("#IDPack option:selected");
	f_PackCost = curPackObj.data('cost');
	f_PackFreeCost = curPackObj.data('freecost');
	
	ReShowSumPrice();
	//alert("f_PackCost:["+f_PackCost+"]f_PackFreeCost:["+f_PackFreeCost+"]");
	//f_PackPrice
}

function ReShowSumPrice(){
	var needPackCost = false;

	f_JsSumPrice = parseFloat(f_JsSumPrice);
	f_CouponsPrice = parseFloat(f_CouponsPrice);
	f_DeliveryPrice = parseFloat(f_DeliveryPrice);

	var curSumPrice = f_JsSumPrice-f_CouponsPrice+f_DeliveryPrice;
	if(f_PackCost>0){
		if(f_PackFreeCost>0){
			if(curSumPrice<f_PackFreeCost){
				needPackCost = true;
				curSumPrice+= f_PackCost;
			}
		}else{
			needPackCost = true;
			curSumPrice+= f_PackCost;
		}
	}
	if(needPackCost){
		$("#PackPrice").html(f_PackCost);
	}
	if(curSumPrice<0)curSumPrice = 0.00;
	$("#SumPrice").html(curSumPrice);
}

function BackShopCart(){
	window.location = "/u_cart.php?idweb=9707&lang=0&isCenter=1";
	//history.back(-1);
}

$(function(){
	//setInterval("ShowDeliveryPrice()",1000)//xx2016-01-11
	ShopCartRecList();
	$(".delivery ul li").click(function(){
		$(".delivery ul li").removeClass('current');
		$(this).addClass('current');
		$("input[name='besttime']").val($(this).attr('avalue'));
	});
			var winH = $(window).height()-200;    
		//$(".addCartBox").css('height',winH);
		$("#Umian").css({padding:'50px 0px 0px 250px'});
		$(".cartBottom").css({'padding-top':'0px','position':'static'});
	
	$("#customDelivery").keyup(function(){
		$("input[name='besttime']").val($("#customDelivery").val());
	});

});

function getCurSelectRecID(){
	if($("#IDRec").length>0){
		var curIDRec = parseInt($("#IDRec").val());
	}else{
		var curIDRec = parseInt($("input[name='IDRec']:checked").val());
	}
	return curIDRec;
}

function checkCheckOut(){
	var DeliveryTypeText = $("#DeliveryType").find("option:selected").text();
	var checkshow = (DeliveryTypeText.indexOf("上门取货")>0)?true:false;
	if(!checkshow) {//’上门取货‘跳过这个判断
		if($("#IDRec").length>0){
			var curIDRec = parseInt($("#IDRec").val());
		}else{
			var curIDRec = parseInt($("input[name='IDRec']:checked").val());
		}

		if(isNaN(curIDRec) || curIDRec<1){
			alert("请选择收货地址!");
			return false;
		}
		return true;
	}
}
</script>

<link rel="stylesheet" type="text/css" href="/share/style.css">
<link href="/share/simple-line-icons.css" rel="stylesheet" type="text/css" />
<link href="/sysTools/View/css/comm/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/share/iconfont.css" rel="stylesheet" type="text/css" />
<link href="/js/css/tipsBox.css" rel="stylesheet" type="text/css" />
<script src="/js/tipsBox.js"></script>
<script type="application/javascript" src="/js/ubox.js"></script>
<style>@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}}
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
									<li class="current"><a href="/u_cart.php?idweb=9707&isCenter=1">我的购物车</a><i class="icon-angle-right"></i></li>
									<!--<li class=" "><a href="/u_red.php">我的卡券</a><i class="icon-angle-right"></i></li>
									<li class=" "><a href="/u_pointrecord.php">我的积分</a><i class="icon-angle-right"></i></li>-->
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
<div id="Umian"><!--新写的页面结束-->


<!-- <script>
$(function(){
	$(".UlHide_icon").click(function(){
		$(this).siblings(".li_more").toggle();
	})
})
</script> -->
<script language="javascript" src="/js/ajax.js"></script>
<script language="javascript" src="/js/table.js"></script>
<script language="javascript" src="/js/showuform.js"></script>
<style>
.v6SRadioYes img{background-color:#1C76F5 !important;}
.v6SRadioYes input{background-color:#1C76F5 !important;}
#boxV6MainSButton_back{color:#1C76F5 !important;;}
</style>
<div id="messinfo" style="display:none"></div><script>showmsg("");showTip("");</script>
<form action="cart_finish.php?isCenter=1" id="mainForm" name="mainForm" method="post" onsubmit="return checkCheckOut()">
<div id="boxV6MainBorder">
</div>
<!--加入购物车-->
<div class="addCartBox cart-boxs">
	<div class="cartTitle addr">收货地址</div>
	<div id="showAddr"><!---默认风格展示 --></div>
	<a href="javascript:ShopCartRecAddShow();">使用新地址</a>
	<!--支付方式-->
	<!--
	<div class="cartTitle">支付方式</div>
	<div class="setbox">
				<span class="selectstyle" style="width:auto"><input type="button" value="余额支付" avalue="11681" class="boxV6Button boxV6SButton boxV6ScheckButton boxV6ScheckButton_left boxV6ScheckButton_checked" onclick="select_click(this)"><input type="button" value="货到付款" avalue="11682" class="boxV6Button boxV6SButton boxV6ScheckButton boxV6ScheckButton_right" onclick="select_click(this)"><input type="hidden" id="PayType" name="PayType" value="11681"  /></span>&nbsp;	</div>
	-->
	<input type="hidden" name="PayType" id="PayType" value="1" />
	<!--送货时间-->
	<input type="hidden" name="besttime" value="">
	<div class="cartTitle">送货时间</div>
	<div class="setbox delivery">
		<ul class="setUI">
			<li class="current" avalue="">
				<div class="b">不限送货时间</div>
				<div class="g">周一至周日</div>
			</li>
			<li avalue="工作日送货">
				<div class="b">工作日送货</div>
				<div class="g">周一至周五</div>
			</li>
			<li avalue="双休日/假日送货">
				<div class="b">双休日/假日送货</div>
				<div class="g">周六、周日</div>
			</li>
			<li>
				<textarea id="customDelivery" style="width: 182px;height: 50px;" placeholder="为确保商品及时准确的配送，请您指定送货时间"></textarea>
                <!--为确保商品及时准确的配送，请您指定送货时间-->
			</li>
		</ul>   
	</div>
	<!--购物清单-->
	<div class="cartTitle" >购物清单</div>
		<div class="proList" >
			<table width="100%" cellspacing="0" cellpadding="0" border="0" class="proListTable">
				<tr class="tr-title">
					<td class="pDetail">商品</td>
					<td align="center" width="120">单价()</td>
					<td width="80" align="center">购买数量</td>
					<td width="80" align="center">小计()</td>
				</tr>
<%=cartTitle%><input type="hidden" name="IDShopCart[]" value="<%=IDShopCart%>" /><input type="hidden" name="zje" value="<%=FormatNumber(zje,2,-1,-1,0)%>" /><input type="hidden" name="sku_id" value="<%=sku_id%>" /><input type="hidden" name="zje2" value="<%=zje2%>" />
												</table>
			<div class="cart_moreDetail">
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td class="mTd" rowspan="4">
							<div class="cartMessage">
								<div class="n">给商家留言</div>
								<div class="b">
									<textarea name="OrderMessage" rows="4" cols="20" placeholder="选填，可告诉卖家您的特殊需求"></textarea>
									<!--<div class="tWords">您还可以输入200个字</div>-->
								</div>
							</div>
						</td>
						<td class="rTd">
							<span class="l">己购商品:</span><span class="r">1件</span> 
						</td>
					</tr>
					<tr>
						<td class="rTd">
							<span class="l">商品优惠:</span>
							<select id="IDCoupons" name="IDCoupons" class="selectInput" onchange="ShowCouponsPrice();">
								<option value="0" data-price="0.00">不使用优惠</option>
															</select>
							<span class='r'>￥<span id='CouponsPrice'>0.00</span></span>						</td>
					</tr>
					<tr>
						<td class="rTd">
							<span class="l">配送方式:</span>
							<select id="DeliveryType" name="DeliveryType" class="selectInput" onchange="ShowDeliveryPrice();">
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
end if%>
																<option data-val="0"  value="0" disabled>
																	上门取货																</option>
																<option data-val="99999"  value="99999" disabled>
																	运费到付																</option>
																							</select>
							<span class='r'>￥<font id='DeliveryPrice'>0.00</font></span>						</td>
					</tr>
									</table>
			</div>
			<div class="total">
								<div class="paid">
					<span class="item">实付金额: </span>
					<span class='Rvalue redfont'>￥<font id='SumPrice'><%=FormatNumber(zje,2,-1,-1,0)%></font></span>				</div>
				<!--
				<div class="point">
					<span class="item">可获得积分:</span>
					<span class="Rvalue rNum">217分</span>
				</div>
				-->
			</div>
		</div>
	</div>
	<!--底部操作--->
	<div class="cartBottom cartBottom_order">
		<div class="BContent" >
			<div class="cartBtn">
            					<input type="button" class="cBtn whiteBtn" value="返回购物车" onclick="BackShopCart();" />
				<input type="submit" class="cBtn" value="立即下单" />
             				</div>
		</div>
	</div>
</div>
<!--底部操作 end--->
<!--遮罩层div-->
</form>
<div class="shadowDiv" id="shadowDiv" style="display:none;"></div>
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
		body{padding-bottom:0px;}
	}
</style><link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script>
<script>
$(".currentPage").text("确认订单")
 showiframeH();
$(window).resize(function(){
	showiframeH();
});
function showiframeH(){
	if($(window).width()<641){
		var showiframeH=$(window).height()-46;
		$("#showiframe").css("height",showiframeH);
	}
	else{$("#showiframe").css("height",'505px');}
}

function godetail(pid){//v9才有这个功能
	var url = '/trade/goods-';
		if(url.indexOf('goods')>=0) url = url+pid;
	top.window.location.href=url;
}
$('.idBoxBg').remove();
</script>
</body>
</html>
