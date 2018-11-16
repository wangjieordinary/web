


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	广告位管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(2, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:15,
		    num_display_entries:3,
		    current_page:0,
		    num_edge_entries:2,
		    link_to:"?page=__id__"
           });
        });
        
        function pageselectCallback(page_id, jq) {
                //alert(page_id); 回调函数，进一步使用请参阅说明文档
        }
        
        $(function() {
            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
            $(".msgtable tr").hover(
			    function() {
			        $(this).addClass("tr_hover_col");
			    },
			    function() {
			        $(this).removeClass("tr_hover_col");
			    }
		    );
        });
    </script>
</head>
<body style="padding:10px;">
<form name="form1" method="post" action="AdvList.aspx" id="form1">
<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>
    <div class="navigation"><span class="add"><a href="AdvAdd.aspx">增加广告位</a></span><b>您当前的位置：管理中心 &gt; 系统管理 &gt; 广告位列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="center">筛选：</td>
        <td  width="100">
           <select name="ddlProperty" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ddlProperty\&#39;,\&#39;\&#39;)&#39;, 0)" id="ddlProperty" class="select">
	<option selected="selected" value="">所有类别</option>
	<option value="1">文字</option>
	<option value="2">图片</option>
	<option value="3">幻灯片(1) </option>
	<option value="7">幻灯片(2) </option>
	<option value="8">幻灯片(3) </option>
	<option value="4">动画</option>
	<option value="5">视频</option>
	<option value="6">代码</option>

</select>
        </td>
        <td></td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" class="keyword" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th width="25%">广告位名称</th>
        <th width="8%">类型</th>
        <th width="8%">数量</th>
        <th width="15%">价格</th>
        <th width="10%">尺寸</th>
        <th width="10%">链接目标</th>
        <th width="18%">管理操作</th>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span></td>
        <td><a title="管理该广告位下的广告列表" href="BarList.aspx?Pid=1">首页焦点图1</a></td>
        <td align="center">
        图片
        </td>
        <td align="center">7</td>
        <td align="center"> 元/月</td>
        <td align="center">998×328</td>
        <td align="center">_self</td>
        <td align="center"><span><a href="BarList.aspx?Pid=1">内容管理</a>&nbsp;<a href="AdvView.aspx?id=1">调用</a>&nbsp;<a href="AdvEdit.aspx?id=1">编辑</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl02_cb_id" type="checkbox" name="rptList$ctl02$cb_id" /></span></td>
        <td><a title="管理该广告位下的广告列表" href="BarList.aspx?Pid=2">其他页面</a></td>
        <td align="center">
        图片
        </td>
        <td align="center">1</td>
        <td align="center"> 元/月</td>
        <td align="center">1383×88</td>
        <td align="center">_blank</td>
        <td align="center"><span><a href="BarList.aspx?Pid=2">内容管理</a>&nbsp;<a href="AdvView.aspx?id=2">调用</a>&nbsp;<a href="AdvEdit.aspx?id=2">编辑</a></span></td>
      </tr>
      
      </table>
      

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
            <div id="Pagination" class="right flickr"></div>
            <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                    <a onclick="return confirm( &#39;此操作将会删除这些广告位及以下的所有广告，确定要删除吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">删 除</a>
                </span>
            </div>
	</div>
</form>
</body>
</html>
