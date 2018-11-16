<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
IDRec=int(Request("IDRec"))
action=trim(Request("action"))
IDShopCart=trim(Request("IDShopCart"))
i_CurIDRec=int(Request("i_CurIDRec"))%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="添加新地址">
<title>添加新地址</title>
<META Http-Equiv="Pragma" Content="no-cache">
<link href="/share/systemStyle.css" rel="stylesheet" type="text/css">
<script type='text/javascript' src='/js/jquery.js'></script>
<script type='text/javascript' src='/js/geo.js'></script>
<script type="text/javascript">
function ShopCartAddRecSave(){
	var reZipcode = /^[1-9][0-9]{5}$/;
	var reMobile = /^(1[3|5|8])[\d]{9}$/;
	var RecName		=	$("#RecName").val();
	var RecProvince	=	$("#RecProvince").val();
	var RecCity		=	$("#RecCity").val();
	var RecArea		=	$("#RecArea").val();
	var RecAddress	=	$("#RecAddress").val();
	var RecMobile	=	$("#RecMobile").val();
	var RecTel		=	$("#RecTel").val();
	var RecCode		=	$("#RecCode").val();
	var IDRec		=	"<%=IDRec%>";

	if(!RecName){
		alert("请填写收货人名称");
		$("#RecName").focus();return false;
	}
	if($("#RecName").val().length > 50){
		alert("收货人名称不能超过50个字符，请重新填写");
		$("#RecName").focus();return false;
	}
	/*if(!RecProvince){
		alert("请选择所在省份");
		$("#RecProvince").focus();return false;
	}
	if(!RecCity){
		alert("请选择所在城市");
		$("#RecCity").focus();return false;
	}
	if(!RecArea){
		alert("请选择所在地区");
		$("#RecArea").focus();return false;
	}*/
	if(RecProvince=='省份' || !RecProvince){
		alert("请选择所在省份");
		$("#RecProvince").focus();return false;
	}
	if(RecCity=='地级市' || !RecCity){
		alert("请选择所在城市");
		$("#RecCity").focus();return false;
	}
	if(RecArea=='市、县级市、县' ){
		alert("请选择所在地区");
		$("#RecArea").focus();return false;
	}
	if(!RecAddress){
		alert("请填写详情地址");
		$("#RecAddress").focus();return false;
	}
	if(!RecMobile){
		alert("请填写手机号码");
		$("#RecMobile").focus();return false;
	}
	/* 	if(!reMobile.test(RecMobile)){
		alert("请填写正确的手机号码");
		$("#RecMobile").focus();return false;
	}
	 */
	
	var postUrl = '/api.asp?a=addaddress';
	var postData = {'RecName':RecName,'RecProvince':RecProvince,'RecCity':RecCity,'RecArea':RecArea,'RecAddress':RecAddress,'RecMobile':RecMobile,'RecTel':RecTel,'RecCode':RecCode,'IDRec':IDRec};
	$.post(postUrl,postData,function(result){
		var i_AddFlag = parseInt(result);
		if(i_AddFlag>0){
			$("#shadowDiv").hide();
			if((typeof ShopCartRecList)!=='function'){
				$('#idBox', window.parent.document).css('display','none');
				$('#idBox', window.parent.document).prev().css('display','none');				
				parent.ShopCartRecList();
				parent.ShowDeliveryPrice();//xx2016-01-09
			}else{
				ShopCartRecList();
				parent.ShowDeliveryPrice();//xx2016-01-09
			}
		}else{
			alert("保存失败:"+i_AddFlag);
			parent.ShowDeliveryPrice();//xx2016-01-09
		}
	});
	parent.ShowDeliveryPrice();//xx2016-01-09
	
}

function ShopCartAddRecCancel(){
	$("#shadowDiv").hide();
	if($('#idBox', window.parent.document)){
		$('#idBox', window.parent.document).css('display','none');
		$('#idBox', window.parent.document).prev().css('display','none');
	}
}

$(function(){
	s = ["RecProvince", "RecCity", "RecArea"];
<%if IDRec<>"" and int(IDRec)>0 then
set rs=server.createobject("adodb.recordset")
exec="select * from [user_address] where siteid="&siteid&" and id="&int(IDRec)
rs.open exec,conn,1,1
if not (rs.bof and rs.eof) then
RecName=rs("txtusername")
RecMobile=rs("txtcellphone")
RecTel=rs("txttelphone")
country=rs("country")
RecAddress=rs("txtAddress")
RecCode=rs("txtPostcode")
if ubound(split(country,"||"))=2 then%>opt0 = ["<%=split(country,"||")(0)%>", "<%=split(country,"||")(1)%>", "<%=split(country,"||")(2)%>"];<%end if
end if
rs.close
set rs=nothing
end if%>
	setup();
	});
</script>
<style>
#shadowDiv{width:100%; height: 100%; background: #fff;}
/*.addCartBox2{height:405px;}*/
.setTable{padding: 10px;}
</style>
</head>
<link href="/share/users-style.css" rel="stylesheet" type="text/css">
<body>
<!--加入购物车-->
	<div class="addCartBox addCartBox2" style="padding-top:0px;">
		<table cellpadding="0" cellspacing="0" border="0" class="setTable">
			<tr>
				<td class="lTd">收货人:</td>
				<td><input type="text" id="RecName" name="RecName" value="<%=RecName%>" class="cartInput"><span class="redfont">*</span></td>
			</tr>
			<tr>
				<td class="lTd">所在地区:</td>
				<td>
										<div id="showarea">
						<select class="v6Input" id="RecProvince" name="RecProvince">
						</select>
						<select class="v6Input" id="RecCity" name="RecCity">
						</select>
						<select class="v6Input" id="RecArea" name="RecArea">
						</select>
						<span class="redfont">*</span>
					</div>
									</td>
			</tr>
			<tr>
				<td class="lTd">详情地址</td>
				<td><input type="text" id="RecAddress" name="RecAddress" value="<%=RecAddress%>" class="cartInput" placeholder="详情地址"><span class="redfont">*</span></td>
			</tr>
			<tr>
				<td class="lTd">手机号码:</td>
				<td>
					<input type="text" id="RecMobile" name="RecMobile" value="<%=RecMobile%>" class="cartInput" lengthcheck="11" maxlength="" placeholder="手机号码" onBlur="return phonelengthCheck();" /><span class="redfont">*</span>
				</td>
			</tr>
			<tr>
				<td class="lTd">电话:</td>
				<td><input type="text" id="RecTel" lengthcheck="11" maxlength="" name="RecTel" value="<%=RecTel%>" class="cartInput" placeholder="电话" onblur="return telengthCheck();"/></td>
			</tr>
			<tr>
				<td class="lTd" valign="top">邮政编号:</td>
				<td class="m">
					<input type="text" id="RecCode" name="RecCode" value="<%=RecCode%>" class="cartInput" placeholder="邮政编号" /><!--<span class="redfont">*</span>-->
				</td>
			</tr>
		</table>
	</div>
<script>
function phonelengthCheck(){
	var plength=$("#RecMobile").val().length;
	if(plength>0){
		var pstr=$("#RecMobile").attr("lengthcheck");
		var parr = pstr.split(",");

		for (var i=0 ; i< parr.length ; i++)
		{
			if(plength==parr[i])return true;
		}
		alert("请正确填写手机号码");		
		$("#RecMobile").val(null);	
		$("#RecMobile").focus();
		return false;
	}
}
function telengthCheck(){
	var plength=$("#RecTel").val().length;
	if(plength>0){
		var pstr=$("#RecTel").attr("lengthcheck");
		var parr = pstr.split(",");

		for (var i=0 ; i< parr.length ; i++)
		{
			if(plength==parr[i])return true;
		}
		alert("请填写正确的电话号码");		
		$("#RecTel").val(null);	
		$("#RecTel").focus();
		return false;
	}
}
$(document).ready(function(e) {
	//手机可输入最大位数限制
	var pstr=$("#RecMobile").attr("lengthcheck");
	var parr = pstr.split(",");
	var maxInNumbers = Math.max.apply(Math, parr);
	$("#RecMobile").attr("maxlength",maxInNumbers)
    //手机输入验证
	$('input#RecMobile').keyup(function(){  
            var c=$(this);  
            if(/[^\d]/.test(c.val())){//替换非数字字符  
              var temp_amount=c.val().replace(/[^\d]/g,'');  
              $(this).val(temp_amount);  
            }  
         })   
});
</script>
	<!--底部操作--->
	<div class="cartBottom cartBottom_order AddressBottom">
		<div class="BContent">
			<div class="cartBtn">
				<input type="button" name="backBtn" class="cBtn whiteBtn" value="取消返回" onclick="ShopCartAddRecCancel();" />
				<input type="button" name="pay" class="cBtn" value="保存地址" onclick="ShopCartAddRecSave();" />
			</div>
		</div>
	</div>
</div>
<link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script></body>
</html>