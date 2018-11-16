$(document).ready(function () {
    $("#dialo").click(function (event) {
      $("#dialog").dialog("open"); 
    });

    $("#dialog").dialog({

        autoOpen: false,

        width: 400, //宽度   

        bgiframe: false,

        closeOnEscape: false, //按esc退出默认的true  

        draggable: true, //拖拽默认是true  

        hide: "toggle", //关闭窗口的效果  

        modal: true, //遮罩效果默认是false不遮住 

        //                position: [220, 580], //对话框弹出的位置，top,left,right,center,默认是center  

        show: "swing", //打开窗口的效果  

        title: "添加包裹", //设置对话框的标题  
        open:function(event,ui){
				$(".ui-dialog-titlebar-close", $(this).parent()).hide();
			},
        close: cancel
    });

});
function cancel() {   
    $("#dialog").dialog("close");
    document.location.href = '/admin/Package_List'; 
}
function initailselect() {    
    var position = $("#txtposition").val();
    var expressno = $("#txtexpressno").val();
    var expressid = $("#ddexpress").val();
    var weight = $("#txtweight").val();
    var volume_weight = $("#txtvolume_weight").val();
    var msg = '';
    if (position.length == 0) {
        msg += '请填写存放位置！\n';
    }
    if (expressid == 0) {
        msg += '请选择快递！\n';
    }
    if (expressno.length == 0) {
        msg += '请写快递单号！\n';
    }
    if (weight.length == 0) {
        msg += '请填写重量！\n';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
	if(expressno&&expressid&&weight&&position&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/packageinitalapi",
        data: { "expressid": expressid, "expressno": expressno, "weight": weight,"volume_weight":volume_weight, "position": position },
        beforeSend: function () { },
        error: function () {$("#txtexpressno").focus();$("#txtweight").val("");play_click(this,'http://www.tongyihong.com/admin/js/err.wav');alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                play_click(this,'http://www.tongyihong.com/admin/js/ok.wav');
                show_msg('已到包裹更新位置成功！','#');
                $("#txtexpressno").val("");
                $("#txtweight").val("");
                $("#txtexpressno").focus();
            }
            else if (data == '2') {
                $("#txtposition").focus();
                play_click(this,'http://www.tongyihong.com/admin/js/err.wav');
                alert('位置不存在，请先添加！');
				return false;
             }
            else if (data == '1') {
                //$("#txtposition").val("");
                show_msg('恭喜添加成功！','#');
                play_click(this,'http://www.tongyihong.com/admin/js/ok.wav');
                $("#txtexpressno").val("");
                //$("#ddexpress").val("");
                $("#txtweight").val("");
                //$("#txtvolume_weight").val("");
                $("#txtexpressno").focus();
            }
            else {
                play_click(this,'http://www.tongyihong.com/admin/js/err.wav');
                alert('数据异常！');
                $("#txtexpressno").focus();
                $("#txtweight").val("");
                return false;
            }

        }
    })
	}
}
function play_click(sef,url){
var div = document.getElementById('div1');
div.innerHTML = '<embed src="'+url+'" loop="0" autostart="true" hidden="true"></embed>';
var emb = document.getElementsByTagName('EMBED')[0];
if (emb) {sef.disabled = true;
setTimeout(function(){div.innerHTML='';},1000);
}
}