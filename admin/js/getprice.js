
function getprice(orderid, ddlid) {
    var weight = document.getElementById("txtweight").value;
    var voluemweight = document.getElementById("txtvolume_weight").value;
    if(weight==0&&voluemweight==0) {
//        alert('请输入体积重或者重量中的其中一个！');
        return false;
    }
   var countway = $("input[name='countway']:checked").val();
   var issensive = $("#rblUserType").find("[checked]").val();
  
   var strpostway = ddlid;
 if (strpostway == 1000) {

     document.getElementById("priceresult").innerHTML= '该渠道下无法计算价格！';
     return false;
 }
 $.ajax({
     url: "../../Tools/getprice.ashx",
     type: "post",
     data: { "orderid": orderid, "weight": weight, "voluemweight": voluemweight, "countway": countway, "strpostway": strpostway, "issensive": issensive },
     beforeSend: function () { document.getElementById("priceresult").innerHTML = ''; },
     error: function () { alert('出错啦！'); },
     success: function (sb) {
         var result = sb.substring(0, 1);
         if (result == 1) {
             var strresult = sb.substring(1, sb.length);
             document.getElementById("txtdelive_fee").value = strresult.split(',')[0];
             document.getElementById("txtcostmoney").value = strresult.split(',')[1]
         }
         else if (result == 0) {
             document.getElementById("priceresult").innerHTML = '数据异常！';
             return false;
         }
         else if (result == 2) {
             document.getElementById("priceresult").innerHTML = '该用户未有报价！';
             return false;
         }
         else {
             document.getElementById("txtdelive_fee").value = '0';
             document.getElementById("txtcostmoney").value = '0';
             document.getElementById("priceresult").innerHTML = '系统未有该区域的报价！';
             return false;
         }

     }
 })
}


function expresspro_check() {
    var shopname_check = document.getElementById("txtcheck").value;
    if (shopname_check == "") {
        alert("请输入订单号");
        return false;
    } else {
        return true;


    }
}
/**手机验证**/
function check_expressno(orderid) {

    if (orderid == "") {
        alert("没有快递单号！");
        return false;

    } else {
        return true;
    }
}









