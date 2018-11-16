$(document).ready(function () {
    $("#dialo").click(function (event) {
        $("#dialog").dialog("open");
        event.preventDefault();
    });

    $("#dialog").dialog({

        autoOpen: false,

        width: 600, //宽度  

        //                buttons: {

        //                    "取消": function () {

        //                        $(this).dialog("close")

        //                    }

        //                },       
        bgiframe: false,

        closeOnEscape: false, //按esc退出默认的true  

        draggable: true, //拖拽默认是true  

        hide: "toggle", //关闭窗口的效果  

        modal: true, //遮罩效果默认是false不遮住 

        //                position: [220, 580], //对话框弹出的位置，top,left,right,center,默认是center  

        show: "swing", //打开窗口的效果  

        title: "添加渠道"//设置对话框的标题  

    });

});
function initailselect() {
    var postwayname = $("#postwayname").val();
    var sortid = $("#txtorderid").val();
    var posttype = $('input[name="posttype"]:checked').val();
    if (postwayname.length == 0) {
        alert('请填写渠道名称！');
        return false;
    }   
    if (sortid.length == 0) {
        alert('填写排序号！');
        return false;
    }   
    $.ajax({
        type: "post",
        url: "../../Tools/addpostway.ashx",
        data: { "postwayname": postwayname, "sortid": sortid, "posttype": posttype },
        beforeSend: function () { },
        error: function () { alert('出错啦！'); },
        success: function (msg) {
            if (msg == '0') {
                alert('已经存在此渠道！');
                return false;
            }
            else if (msg == '1') {
                alert('恭喜添加成功！');
                document.location.href = 'List.aspx';
            }
            else {
                alert('数据异常！');
                return false;
            }

        }
    })
}