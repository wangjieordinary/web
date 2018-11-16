<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"-->
<%act=trim(Request("act"))
pid=Request("pid")
sku_id=Request("sku_id")
if sku_id="" or isnull(sku_id) then sku_id="0"
'sku_id=int(getnumb(sku_id))
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
end if
if act="add" and pid<>"" and num<>"" then
sku_id=Request("idpackage")
scolors=Request("scolors")
ssizes=Request("ssizes")
set rs=server.createobject("adodb.recordset")
exec="select * from [product] where siteid="&siteid&" and id="&pid	
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
colors=rs("colors")
sizes=rs("sizes")
sklist=colors&"|"&sizes
if instr(sku_id,",")>0 then
sku_sm=split(sklist,"|")(int(split(sku_id,",")(0)))
sku_sm=sku_sm&"|"&split(sklist,"|")(int(split(sku_id,",")(1)))
else
sku_sm=split(sklist,"|")(int(sku_id))
end if
pname=rs("name")
price2=rs("price2")
jifen1=rs("jifen1")
jifen3=rs("jifen3")
ghsid=rs("ghsid")
kucun=rs("kucun")
end if
rs.close
set rs=nothing
if uid="" then
'uid=Left(tdno&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(6,"NUMB"),9) '生成临时用户ID
'Session("uid")=uid
'Session("telephone")=0
'Session("userno")=0
'Response.Cookies("xfa").Expires=DateAdd("m",60,now()) 
'Response.Cookies("xfa")("token")=base64Encode(uid&"&0&0&"&siteid)
Response.Redirect("/mall/login.asp")
Response.end
end if
if kucun>0 then
if isgwc(pid,num,uid,sku_id) then
if num>0 then
conn.Execute("update [gouwuche] set sl = "&num&",dj="&price2&",dj2="&jifen3&",yh=0,yh2="&jifen1&",zj="&price2&"*("&num&"),zj2="&jifen3&"*("&num&"+sl),atime=getdate(),ghsid="&int(ghsid)&",sku_sm='"&sku_sm&"' where ("&num&"+sl)>0 and pid="&pid&" and ddh is null and uid="&uid&" and sku_id='"&sku_id&"' and siteid="&siteid)
elseif num=0 then
conn.Execute("update [gouwuche] set sl = sl+1,dj="&price2&",dj2="&jifen3&",yh=0,yh2="&jifen1&",zj="&price2&"*(sl+1),zj2="&jifen3&"*("&num&"+sl),atime=getdate(),ghsid="&int(ghsid)&",sku_sm='"&sku_sm&"' where ("&num&"+sl)>0 and pid="&pid&" and ddh is null and uid="&uid&" and sku_id='"&sku_id&"' and siteid="&siteid)
else
conn.Execute("update [gouwuche] set sl = sl+"&num&",dj="&price2&",dj2="&jifen3&",yh=0,yh2="&jifen1&",zj="&price2&"*("&num&"+sl),zj2="&jifen3&"*("&num&"+sl),atime=getdate(),ghsid="&int(ghsid)&",sku_sm='"&sku_sm&"' where ("&num&"+sl)>0 and pid="&pid&" and ddh is null and uid="&uid&" and sku_id='"&sku_id&"' and siteid="&siteid)
end if
else
conn.execute("insert into [gouwuche] (pid,uid,sl,dj,dj2,yh,yh2,zj,zj2,ghsid,sku_sm,sku_id,siteid) values("&pid&","&uid&","&num&","&price2&","&jifen3&",0,"&jifen1&","&price2*num&","&jifen3*num&","&int(ghsid)&",'"&sku_sm&"',"&sku_id&","&siteid&")") 
end if
end if
end if
if act="del" and pid<>"" then
sku_id=Request("idpackage")
conn.execute "delete from [gouwuche] where ddh is null and pid="&pid&" and uid="&uid&" and sku_id='"&sku_id&"' and siteid="&siteid
end if
if act="dellist" then
itemkey=Request("itemkey[]")
conn.execute "delete from [gouwuche] where ddh is null and uid="&uid&" and id in ("&itemkey&") and siteid="&siteid
end if%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<meta name="keywords" content="购物车">
<title>购物车</title>
<META Http-Equiv="Pragma" Content="no-cache">
<script src='/js/jquery.js' type='text/javascript'></script>
<script type="text/javascript">
window.onload = function(){
$.getScript('/js/jquery.base64.js');
}
	$(function(){
		var bheight=$(".bottomMenu").height();
		bheight=bheight+"px";
		$(".cartBottom").css("bottom",bheight);
	})

function godetail(pid){//v9才有这个功能
	var url = '/trade/goods-';
		if(url.indexOf('goods')>=0) url = url+pid;
	top.window.location.href=url;
}
</script>
<script src="/js/shopcart.js"></script>

<script src="/js/backscript.js?20170110" content="text/html; charset=UTF-8"></script>
<script>function BackJS(runJs){run_backjs("/share/backjs.html", runJs);}</script>
<script>function autoHeight(){BackJS("box.Show({width:'900px',height:'610px'});$('#boxName').html('购物车');");}$(window).load(function(){autoHeight();});</script><script type="text/javascript">
var baseUrl = "/u_cart.php?idweb=9707&lang=0";

function ShopCartFreeProcess(sumPrice,oldPrice,curSelectNum){
	var postUrl = '/cart_havepromotion';
	var postData = {'itemkeylist':[]};
	$("input[name='IDShopCart[]']").each(function(){
		if($(this).attr('checked')){
			postData['itemkeylist'].push($(this).data('itemkey'));
		}
	});

	$.post(postUrl,postData,function(result){
		var resultInfo = eval(result);
		if(resultInfo['Price']){
			sumPrice-= resultInfo['Price'];
		}
		SelectNum=resultInfo['SelectNum'];
	//var oldPrice = $("#oldPrice").val();
		diffPrice = resultInfo['Price']; //$("#oldPrice").val()-
		//$("#CurSelectNum").html(curSelectNum);
		//$("#CurSelectPrice").html(diffPrice);
		if(diffPrice){
			$("#CurSelectNum").html(SelectNum);
			$("#CurSelectPrice").html(diffPrice);
			//diffPrice = price_format(diffPrice);
			//$("#DiffPrice").html(diffPrice);
		}else{
			//$("#DiffPrice").html("0");
			$("#CurSelectNum").html("0");
			$("#CurSelectPrice").html("0");
		}

		var FreeResultBHTML = "<span class='grayfont'>"+sumPrice+'</span>';
		if(resultInfo['Price'] && resultInfo['Price']['IDFree']){
			FreeResultBHTML+= "<span class='redfont'>减:"+resultInfo['Price']['FreeVal']+"</span>";
		}
		$("#FreeResultB").html(FreeResultBHTML);

		var FreeResultAHTML = "";
		if(resultInfo['Price'] && resultInfo['Price']['IDFree']){
			FreeResultAHTML+= "<input type='hidden' name='IDFree' value='"+resultInfo['Price']['IDFree']+"' />";
			FreeResultAHTML+= "<a href='#' class='specialImg'>满减</a>活动商品已经购满";
			if(intval(resultInfo['Price']['WherePrice'])){
				FreeResultAHTML+= resultInfo['Price']['WherePrice']+'元';
			}else{
				FreeResultAHTML+= resultInfo['Price']['WhereNums']+'件';
			}
			FreeResultAHTML+= "<span class='redfont'>(已减"+resultInfo['Price']['FreeVal']+")</span>";
		}else if(resultInfo['Coupon'] && resultInfo['Coupon']['IDFree']){
			FreeResultAHTML+= "<input type='hidden' name='IDFree' value='"+resultInfo['Price']['IDFree']+"' />";
			FreeResultAHTML+= "<a href='#' class='specialImg'>满赠</a>活动商品已经购满";
			if(intval(resultInfo['Price']['WherePrice'])){
				FreeResultAHTML+= resultInfo['Coupon']['WherePrice']+'元';
			}else{
				FreeResultAHTML+= resultInfo['Coupon']['WhereNums']+'件';
			}
			FreeResultAHTML+= "<span class='redfont'>(可获赠"+resultInfo['Coupon']['CouponsDetail']['CouponsPrice']+")优惠券</span>";
		}

		$("#FreeResultA").html(FreeResultAHTML);
	});	
}

function ShowCartClose(){
		   top.location.href ='/trade/product-1.html';
	}

/*function ShowCartClose(){
		top.location.href = 'http://www.zgnmzymyw.com/';
	}*/

function ShopCartSpecModifyShow(itemMap){
	$("#modifyContent_"+itemMap).removeClass('hide');
}

function ShopCartSpecCancelPackage(itemKey){
	var postUrl = baseUrl+"&act=cancelpackage";
	var postData = {"ItemKey":itemKey};
	$.post(postUrl,postData,function(result){
		var resultInfo = eval("("+result+")");
		if(resultInfo['CancelFlag']==1){
			window.location = baseUrl;
		}else{
			if(resultInfo['CancelFlag']==-3){
				alert("购物车已存在该商品，不允许修改");
			}else{
				alert("修改失败:["+resultInfo['CancelFlag']+"]");
			}
		}
	});
}

function ShopCartSpecModifySave(itemMap,itemKey,i_IDProduct){
	var IDSpecPrice = $("#IDSpecPrice_"+itemMap).val();
	var postUrl = baseUrl+"&act=modifyspec";
	var postData = {"ItemKey":itemKey,"IDSpecPrice":IDSpecPrice,"IDProduct":i_IDProduct};
	$.post(postUrl,postData,function(result){
		//console.log(result);
		var resultInfo = eval("("+result+")");
		if(resultInfo['ModifyFlag']==1){
			window.location = baseUrl;
		}else{
			/*
			*		-1	参数异常
	  *		-2	购物车为空
	  *		-3	购物记录异常
	  *		-8	该套餐没有这个产品规格参与活动，不能修改
	  *		-9	该搭配已存在购物车里
			*/
			if(resultInfo['ModifyFlag']==-8){
				alert("该套餐不存在此规格");
			}else if(resultInfo['ModifyFlag']==-9){
				alert("该搭配已存在购物车");
			}else{
				alert("修改失败：["+resultInfo['ModifyFlag']+"]");
			}
		}
		$("#modifyContent_"+itemMap).addClass('hide');
	});
}

function ShopCartSpecModifyCancel(itemMap){
	$("#modifyContent_"+itemMap).addClass('hide');
}
$(function(){
	var winH = $(window).height()-200;    
	$(".cartProList").css('height',winH);
	$("#Umian").css({padding:'50px 0px 0px 250px'});
});
</script>
</head>
<link rel="stylesheet" type="text/css" href="/share/users-style.css" />
<link rel="stylesheet" type="text/css" href="/share/simple-line-icons.css" />
<link rel="stylesheet" type="text/css" href="/share/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/share/spectools.css" />
<link rel="stylesheet" type="text/css" href="/share/style.css">
<link href="/share/cart.css" rel="stylesheet" type="text/css">
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
									<li class="current"><a href="/u_cart.php?idweb=9707&isCenter=1">我的购物车</a><i class="icon-angle-right"></i></li>
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
@media screen and (max-width:641px) {
	body{background:#fff !important;}
	input[type="checkbox"]{margin-left: 10px;margin-right: 10px;}
}
.proImg img{max-height: 68px !important;}
.addCartBox .tr-showlist .proName{margin-bottom: 10px;cursor: pointer;}
@media screen and (max-width: 641px){
	.addCartBox .tr-showlist .proName{
		display: block !important;
		  white-space: nowrap;
    	text-overflow: ellipsis;
	}
}
body{overflow-y:overlay;}
body::-webkit-scrollbar {width: 6px; height: 6px; background: rgba(0,0,0,.05);}
body::-webkit-scrollbar-button{background: #f7f7f7; height: 0;}
body::-webkit-scrollbar-corner{background: rgba(0,0,0,.05);}
body::-webkit-scrollbar-thumb{background: rgba(0,0,0,.3);  border-radius: 3px;}


/**/
@media screen and (max-width:320px) {
	.moOrderDetail li.bigLi{font-size: 12px;}
}

</style>

<%if telephone<>"" and uid<>"" then
page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [gouwuche] where siteid="&siteid&" and (ddh is null or ddh='') and uid="&int(uid)&" order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then%>

<form method="post" action="cart_checkout.php?isCenter=1" onsubmit="return ShopCartFormCheck();">
<input type='hidden' name='dispatching' value=>

<div class="addCartBox">
		<div class="cartProList">
		<div width="100%" class="cTable">
			<ul class="tr-title">
				<li class="checkall firstTd"><input type="checkbox" onclick="ShopCartAll(this)" data-type="checkall" checked></li>
				<li class="shop_info">商品</li>
				<li align="center">单价(￥)</li>
				<li align="center">数量</li>
				<li class="accountTd">小计(￥)</li>
				<li class="lastTd actionTd">操作</li>
			</ul>
			<ul class="tr-space">
				<li></li>
			</ul>
			<!-- 空白间距 -->
<%for i=1 to rssum
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
end if%>
<div class="cartProListContent"><ul class='tr-showlist'><li class='firstTd checkall'><input type='checkbox' name='IDShopCart[]' value='<%=rs("id")%>' data-itemkey='<%=rs("id")%>' data-pricekey='<%=rs("id")%>' onclick='ShopCartOne(this);' checked /></li><li class='proImg' onclick='godetail(<%=rs("pid")%>)'><img src='<%=pimg%>' /></li><li class='proName' onclick='godetail(<%=rs("pid")%>)' valign='top'><%=pname%><br><%=rs("sku_sm")%></li><li class='proDetail'>
<div class='v8ModifyPro'><div class='mContent hide' id='modifyContent_<%=rs("pid")%>'><i class='icon-chevron-thin-up downArrow'></i><div class='modifyConent'><div class='iteminfo_buying' id='spec_<%=rs("pid")%>'><div class='sys_item_spec'><input type='hidden' id='IDSpecPrice_<%=rs("pid")%>' value='0' /><input type='hidden' id='sku_id_<%=rs("pid")%>' value='<%=rs("sku_id")%>' /></div></div></div><div class='modifyBtn'><input type='button' value='确认' class='confirmBtn' onclick='ShopCartSpecModifySave("<%=rs("pid")%>","<%=rs("pid")%>_0_eyIzMTcwODIiOjMzODIyN30=",<%=rs("pid")%>);' /><a href='javascript:ShopCartSpecModifyCancel("<%=rs("pid")%>");' class='qlink'>取消返回</a></div></div></div></li><li class='proPrice 1'><input type='hidden' id='OldPrice_<%=rs("pid")%>' value='<%=FormatNumber(price2,2,-1,-1,0)%>' /><input type='hidden' id='NewPrice_<%=rs("pid")%>' value='<%=FormatNumber(price2,2,-1,-1,0)%>' /><b><%=FormatNumber(price2,2,-1,-1,0)%></b></li><li class='addNum'><ul class='NumList'><li class='s'><a href='javascript:ShopCartCutNum(<%=rs("pid")%>,"<%=rs("sku_id")%>","eyIzMjM3NTQiOjB9",-1,"W10=");'><i class='icon-minus2'></i></a></li><li class='n'><input type='text' name='sNun' value='<%=rs("sl")%>' onkeyup='ShopCartWaitNum(<%=rs("pid")%>,"<%=rs("sku_id")%>","eyIzMTcwODIiOjMzODIyN30=",this.value,"W10=");' /></li><li class='p'><a href='javascript:ShopCartAddNum(<%=rs("pid")%>,"<%=rs("sku_id")%>","eyIzMTcwODIiOjMzODIyN30=",0,"W10=");'><i class='icon-plus2'></i></a></li></ul></li><li class='accountTd'><div class='price redfont' id='ProductPrice_<%=rs("pid")%>'><%=FormatNumber(rs("zj"),2,-1,-1,0)%></div></li><li align='center' class='actionTd'><a href='javascript:ShopCartDelRecord(<%=rs("pid")%>,"<%=rs("sku_id")%>","<%=rs("sku_sm")%>");' class='delLink'>删除</a></li></ul></div>
<%znum=znum+rs("sl")
zje=zje+(rs("sl")*rs("dj"))
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing%>
		</div>
	</div>
</div> 
<script type="text/javascript">
	function ShopCartFormCheck(){
	var ChooseList = ShopCartChooseIDList();
	if(ChooseList.length<1){
		alert("请选择");return false;
	}
	return true;
}

</script>

<!--底部操作--->
<div class="cartBottom">
	<div class="BContent">
		<div class="bottomTable" width="100%">
			<ul>
				<li class="bottom_info">
					<span class="allselect">
						<input type="checkbox" onclick="ShopCartAll(this)" data-type="checkall" class="bottomInput" checked /> 全选					</span>
					<a href="javascript:ShopCartDelList();">删除</a>
					<a href="javascript:ShopCartCleanInvalid();">清除失效商品</a>
					<span class="allNum">已选商品 <b id="CurSelectNum"><%=znum%></b> 件</span>
					<span class="allAccount">
						合计(不含运费): ￥<span class='p' id='CurSelectPrice'><%=FormatNumber(zje,2,-1,-1,0)%></span>	<input type='hidden' id='oldPrice' value='<%=FormatNumber(zje,2,-1,-1,0)%>' />				</span>
				</li>
				<li class="cartBtn">
					<input type="button" name="goshop" class="cBtn whiteBtn" value="继续购物" onclick="ShowCartClose();" /><!--window.history.back();-->
										<input type="submit" name="pay" class="cBtn" value="去结账" />
									</li>
			</ul>
			<ul class="totalSave">
				<li>
								</li>
			</ul>
		</div>
	</div>
</div>

</form>

<%else%>


<script>
 $(".currentPage").text("购物车")
</script>
<div class='emptyCart'>
	<div class="eImg"><img src="/images/tips-empty.png" border="0"/></div>
	<div class="eMain">
		<p class="b">您的购物车空空如也</p>
		<p class="s">赶紧行动吧!</p>
		<div class="eBtn">
			<input type="button" name="e-goshop" class="e-goshop" value="马上去购物" onclick="ShowCartClose();"/>
		</div>
	</div>
</div>
<%end if%><%end if%>

<script type="text/javascript">

	var zIndex=999;

   $(".selectSpecial").mouseover(function(){
       $(this).addClass("selectSpecialHover");  
   }).mouseout(function(){
       $(this).removeClass("selectSpecialHover");  
   });

   	$(function(){
	    $(".addCartBox .tr-showlist").each(function () {
			$(this).css("z-index",zIndex);
			zIndex=zIndex-1;
		})
	})
</script>
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
</style><link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script></body>
</html>


