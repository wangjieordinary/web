function editpackage() {  
    var positionname = $("#positionname").val();
    var packagelist = $("#packagelist").val();
    var packagetype = $("#packagetype").val();
    var msg = '';   
    if (positionname.length == 0) {
        msg += '位置信息错误！\n';
    }
    if (packagelist.length == 0) {
        msg += '无待处理包裹！\n';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
    $.ajax({
        url: "/admin/packagejhapi",
        type: "post",
        data: { "positionname": positionname, "packagelist": packagelist, "packagetype": packagetype },
        beforeSend: function () { },
        error: function () { alert('出错啦！'); },
        success: function (sb) {
            if (sb != '0') {
                if (sb != '1') {
                    if (sb != '2') {
                        alert('数据异常!');
                        return;
                    }
                    else {
                        alert('数据不能为空!');
                        return;
                    }
                }
                else {
                    jsAutoMsg("操作成功！", "");
                    window.parent.CloseEditPage();
                }
            }
            else {
                alert('操作失败！无待处理包裹！');
                return;
            }
        }
    })
}