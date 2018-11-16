//管理操作所需的所有函数
//全选取消按钮函数，调用样式如：
function checkAll(chkobj){
	if($(chkobj).text()=="全选")
	{
		$(chkobj).text("取消");
		$(".checkall input").attr("checked", true);
	}else{
		$(chkobj).text("全选");
		$(".checkall input").attr("checked", false);
	}
}
function editorderDetail() {
    var orderno = $("#orderno").val();
    var consignee = $("#consignee").val();
    var tel = $("#tel").val();
    var telephone = $("#telephone").val();
    var email = $("#email").val();
    var address = $("#address").val();
	var postcode = $("#postcode").val();
	var country = $("#country").val();
	var ordertype = $("#ordertype").val();
	var oldordertype = $("#oldordertype").val();
	var goodtype = $("#goodtype").val();
	var postway = $("#postway").val();
	var backurl = $("#backurl").val();
    var fw2 = $("input[name='fw2']").is(':checked')
	var fw3 = $("input[name='fw3']").is(':checked')
	var fw4 = $("input[name='fw4']").is(':checked')
	var fw6 = $("input[name='fw6']").is(':checked')
	var fw7 = $("input[name='fw7']").is(':checked')
    var msg = '';
    if (consignee.length == 0) {
        msg += '收件人不能为空！\n';
    }
    if (tel.length == 0) {
        msg += '联系人手机号码不能为空\n';
    }
    if (telephone.length == 0) {
        msg += '联系人话不能为空！\n';
    }
    if (address.length == 0) {
        msg += '地址不能为空！\n';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
	if(consignee&&tel&&telephone&&address&&postcode&&country&&ordertype&&goodtype&&postway&&oldordertype&&msg.length==0){
		var getUrl = "/admin/editorderDetailapi";
		$.post(getUrl,{orderno:orderno,consignee:consignee,tel:tel,telephone:telephone,email:email,address:address,postcode:postcode,country:country,ordertype:ordertype,goodtype:goodtype,postway:postway,fw2:fw2,fw3:fw3,fw4:fw4,fw6:fw6,fw7:fw7,oldordertype:oldordertype,backurl:backurl},function(result){
			//show_err_msg(result);
			var data = eval("("+result+")");
			if(data.fail){
				jsAutoMsg(data.Word,data.gourl);
				return false;
			}else{
				jsAutoMsg(data.Word,data.gourl);
				return;
			}
		});
	}
}
function selectpostway(ordertype) {
    if (ordertype == -1) {
        return false;
        }
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/postwayapi",
                data: { "ordertype": ordertype },
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#postway").empty();
                        $("#postway").append("<option value='0'>请选择运输方式</option>");
                        for (var i = 0; i < msg.length; i++) {
                            $("#postway").append("<option value='" + msg[i].CityID + "|" + msg[i].CityName +"'>" + msg[i].CityName + "</option>");
                        }
                    }
                    else {                        
                        $("#spostway").empty();
                        $("#postway").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
};
function checkadddelively() {
    var txtweight = $("#txtweight").val();
    var txtdeliverysize = $("#txtdeliverysize").val();
    var txtvolume_weight = $("#txtvolume_weight").val();
    var ddldelively_name = $("#ddldelively_name").val();
    var txtexpressno = $("#txtexpressno").val();
    var rblUserType =  $("input[name='rblUserType']").val();
    var countway = $("input[name='countway']").val();
    var txtservice_fee = $("#txtservice_fee").val();
    var txtdelive_fee = $("#txtdelive_fee").val();
    var txtcostmoney = $("#txtcostmoney").val();
    var DropDownList1 = $("#DropDownList1").val();
    var DropDownList2 = $("#DropDownList2").val();
    var txtmoto= $("#txtmoto").val();
    var userid= $("#userid").val();
    var orderno= $("#orderno").val();
    var backurl = $("#backurl").val();
    var msg = '';
    if ((txtweight.length == 0 || txtweight==0) && DropDownList1!=0 && DropDownList1!=1 && DropDownList1!=2 && DropDownList1!=7 && DropDownList1!=9) {
        msg += '打包重量不能为空或零！\n';
    }
    if (ddldelively_name.length == 0) {
        msg += '请选择运输方式\n';
    }
    if (txtexpressno.length == 0 && DropDownList1!=0 && DropDownList1!=1 && DropDownList1!=2 && DropDownList1!=7 && DropDownList1!=9) {
        msg += '国际运单不能为空！\n';
    }
    if (rblUserType.length == 0) {
        msg += '请选择物品类型！\n';
    }
    if (countway.length == 0) {
        msg += '请选择计算运费方式！\n';
    }
    if (txtservice_fee.length == 0) {
        msg += '服务费不能为空！\n';
    }
    if (txtdelive_fee.length == 0) {
        msg += '运输费用不能为空！\n';
    }
    if (txtcostmoney.length == 0) {
        msg += '运输成本不能为空！\n';
    }
    if (DropDownList2 == 0 && DropDownList1!=7) {
        msg += '暂存订单不能修改状态！\n';
    }
//    if (DropDownList2!=DropDownList1 && parseInt(DropDownList2)+1!=DropDownList1 && DropDownList1<7 && DropDownList2>0) {
//        msg +=  '不能跨步骤修改状态！\n';
//    }
    if (userid.length == 0 || orderno.length == 0 ) {
        msg += '必要参数丢失！\n';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
	if(txtweight&&ddldelively_name&&rblUserType&&countway&&txtservice_fee&&txtdelive_fee&&txtcostmoney&&userid&&orderno&&msg.length==0){
		var getUrl = "/admin/adddelivelyapi";
		$.post(getUrl,{txtweight:txtweight,txtdeliverysize:txtdeliverysize,txtvolume_weight:txtvolume_weight,ddldelively_name:ddldelively_name,txtexpressno:txtexpressno,rblUserType:rblUserType,countway:countway,txtservice_fee:txtservice_fee,txtdelive_fee:txtdelive_fee,txtcostmoney:txtcostmoney,DropDownList1:DropDownList1,txtmoto:txtmoto,DropDownList2:DropDownList2,userid:userid,orderno:orderno,backurl:backurl},function(result){
			//show_err_msg(result);
			var data = eval("("+result+")");
			if(data.fail){
				jsAutoMsg(data.Word,data.gourl);
				return false;
			}else{
parent.jsprint(data.Word,"/admin/Order_List","Success");
				return;
			}
		});
	}
}