

function checkexpressno(orderid) {
    
    if (expresspro_check() == true && check_expressno() == true) {
        var strckeck = document.getElementById("txtcheck").value;        
        $.ajax({
            url: "/admin/HCheckpackageapi",
            type: "post",
            data: {"strckeck": strckeck, "orderid": orderid},
            beforeSend: function () { },
            error: function () { alert('出错啦！');},
            success: function (sb) {
                if (sb != '0') {
                    document.getElementById("txresult").value = sb;
                   }
                else {
                    document.getElementById("txresult").value = '对不起！您找的订单系统出错无法检测！';                  
                }

            }
        })
    }
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









