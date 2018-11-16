$(function() {
    $("#FileUpload").bind("change", function() {
        //开始提交
        $("#form1").ajaxSubmit({
            beforeSubmit: function(formData, jqForm, options){
                //隐藏上传按钮
                $(".files").hide();
                //显示LOADING图片
                $(".uploading").show();
            },
            success: function(data, textStatus) {
                if (data.msg == 1) {
                    $("#txtImgUrl").val(data.msbox);
                } else {
                    alert(data.msbox);
                }
                $(".files").show();
                $(".uploading").hide();
            },
            error: function(data, status, e) {
               alert("上传失败，错误信息：" + e);
               $(".files").show();
               $(".uploading").hide();
            },
            url: "/MultipleUpload",
            type: "post",
            dataType: "json",
            timeout: 600000
        });
    });
});
$(function () {
            jQuery.extend({
                handleError: function (s, xhr, status, e) {
                    if (s.error) {
                        s.error.call(s.context || s, xhr, status, e);
                    }
                    if (s.global) {
                        (s.context ? jQuery(s.context) : jQuery.event).trigger("ajaxError", [xhr, s, e]);
                    }
                },
                httpData: function (xhr, type, s) {
                    var ct = xhr.getResponseHeader("content-type"),
            xml = type == "xml" || !type && ct && ct.indexOf("xml") >= 0,
            data = xml ? xhr.responseXML : xhr.responseText;
             var start = data.indexOf(">"); 
             if(start != -1) { 
               var end = data.indexOf("<", start + 1); 
               if(end != -1) { 
                 data = data.substring(start + 1, end); 
                } 
             } 
                    if (xml && data.documentElement.tagName == "parsererror")
                        throw "parsererror";
                    if (s && s.dataFilter)
                        data = s.dataFilter(data, type);
                    if (typeof data === "string") {
                        if (type == "script")
                            jQuery.globalEval(data);
                        if (type == "json")
                            data = window["eval"]("(" + data + ")");
                    }
                    return data;
                }
})
});