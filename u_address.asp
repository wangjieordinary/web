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
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1"> 

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="建站">
<title>收货地址</title>
<META Http-Equiv="Pragma" Content="no-cache">

<script type='text/javascript' src='/js/jquery.js'></script>
<script type="text/javascript" src='/js/nicebox.js'></script>
<script language="javascript" src="/js/showuform.js"></script>
<script type="text/javascript" src="/js/ubox.js"></script>
<script type="text/javascript">
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
					var i_DefaultIDRec = 0;
					for(var i=0;i<resultList.length;i++){
						resultList[i]['RecDetail'] = eval("("+resultList[i]["RecDetail"]+")");
						if(resultList[i]['IsDefault']){
							i_DefaultIDRec = resultList[i]['IDRec'];
						}
						html+= ShopCartRecInfoHTML(resultList[i],i+1);
					}
					if(!i_DefaultIDRec)i_DefaultIDRec = resultList[i]['IDRec'];
					html+= '<input type="hidden" name="IDRec" value="'+i_DefaultIDRec+'" />';
				}
		}
		if(b_Add){
			html+= ShopCartRecAddHTML();
		}

		$("#userAddr").html(html);
		//var sww =($("#userAddr").width()-152)/3;
		//$("#userAddr .cAddr ").css("width",sww);
	});
}

function ShopCartRecInfoHTML(RecInfo,i){
	var html =	"";
	html+=	'<div  class="cAddr '+(RecInfo['IsDefault']==1?'hotAddr':'')+' '+(i%3==0?'cAddrLast':'')+'">';
	html+=		'<div class="cName">';
	html+=			RecInfo['RecDetail']['RecName'];
	html+=			'<span class="'+(RecInfo['IsDefault']==1?'defaultAddv':'setDefaultAdd')+' dAdd"  onclick="ShopCartRecSetDef('+RecInfo["IDRec"]+','+RecInfo['IsDefault']+')">'+(RecInfo['IsDefault']==1?'默认地址':'设为默认')+'</span>';
	html+=		'</div>';
	html+=		'<div class="cContent">'+RecInfo['RecDetail']['RecProvince']+' '+RecInfo['RecDetail']['RecCity']+' '+RecInfo['RecDetail']['RecArea']+''+RecInfo['RecDetail']['RecAddress']+(RecInfo['RecDetail']['RecCode']?"("+RecInfo['RecDetail']['RecCode']+")":'')+'<span>'+RecInfo['RecDetail']['RecMobile']+'</span></div>';
	html+=		'<div class="addrBtn">';
	html+=			'<i class="addrBtnIcn icon-edit"></i><input type="button" name="edit" class="cBtn whiteBtn" onclick="ShopCartRecEditShow('+RecInfo["IDRec"]+')" value="编辑" />';
	html+=			'<i class="addrBtnIcn icon-trash"></i><input type="button" name="del" class="cBtn" onclick="ShopCartRecDel('+RecInfo["IDRec"]+')" value="删除" />';
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
	var getUrl = 'add_address.php';
	/* $.get(getUrl,function(result){
		$("#addCartBox").html(result).show();
	}); */
	/* dialog2('iframe:'+getUrl, {title:'添加新地址','width':'780px','height':'505px'},function(){
		ShopCartRecList();
	}); */
	document.getElementById("boxName").innerHTML="添加新地址"; 
	if(document.getElementById("boxClose")) document.getElementById("boxClose").innerHTML="×"; 
	document.getElementById("showiframe").src=getUrl; 
	box.Show({'width':'780px','height':'505px'});
}

function ShopCartRecEditShow(IDRec){
	var getUrl = '/add_address?act=edit&IDRec='+IDRec;
	/* $.get(getUrl,{IDRec:IDRec},function(result){
		$("#addCartBox").html(result).show();
	}); */
	/* dialog2('iframe:'+getUrl, {title:'修改地址','width':'780px','height':'505px'},function(){
		ShopCartRecList();
	}); */
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
		alert('该收货已经是默认地址！');
	}
}

$(function(){
	ShopCartRecList();
});



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
                                    <li class=" "><a href="/u_qrcode">我的分享二维码</a><i class="icon-angle-right"></i></li>
																													</ul>
						<ul class="pcIco2">
		<li class="menuTit yahei">账户管理</li>
				<li class="menuOther current"><a href="/u_address.php">收货地址管理</a><i class="icon-angle-right"></i></li>
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


<div class="rightMenuBar address_top">
	<div class="leftBar">
		<h5 class="yahei">收货地址管理</h5>
	</div>
</div>

<style type="text/css">
/*弹出层dialog*/
#dialogBg {display:none;width:100%;height:100%;background:#808080;position:absolute;top:0;left:0;z-index:10000000}/*遮罩*/

.dialog {padding:0px;position:absolute;top:250px;z-index:10000001;border-radius:5px;box-shadow:0px 0px 15px #000;}
.dialog .title{height:20px;background:#fff;overflow:hidden;border-radius:6px 6px 0px 0px ;border-bottom:1px solid #ccc;height:40px;cursor:default;}
.dialog .title h4{float:left;font-size:14px;padding:12px 12px 0px 12px;line-height:14px;display:block;height:34px;margin-top:0px!important;}
.dialog .title span {float:right;cursor:pointer;color:#c00; font:600 18px/20px verdana,arial;border-left:1px solid #ccc;padding:10px 10px 10px 10px;}/*X*/
.dialog .title span:hover{background:#eee;}
.dialog .content{padding:0px;background:#fff !important;overflow:hidden;zoom:1;border-radius:0px 0px 5px 5px;}


</style>

<div class="userCartBox">

  <div id="userAddr"></div>
   </div>


</div>
<!--以下就是弹窗内容-->
<link href="/share/users-style.css" rel="stylesheet" type="text/css">
<script>
$('.idBoxBg').remove();
$(".currentPage").text("收货地址")

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
	
</script>
</body>
<link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script></html>
