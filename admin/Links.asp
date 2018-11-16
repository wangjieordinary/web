


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	友情链接管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(16, {
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
    </script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="List.aspx" id="form1">
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
    <div class="navigation"><span class="add"><a href="Add.aspx">增加链接</a></span><b>您当前的位置：首页 &gt; 链接管理 &gt; 链接列表</b></div>
    <div class="spClear"></div>
    
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th width="6%">编号</th>
        <th align="left">网站标题</th>
        <th width="16%">是否图片</th>
        <th width="90">优先级别</th>
        <th width="16%">添加时间</th>
        <th width="90">属性</th>
        <th width="8%">操作</th>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl01_lb_id">21</span></td>
        <td> <a href="Edit.aspx?id=21">亚马逊</a></td>
        <td align="center"><img src="/links/amazon.jpg" width="50" height="20" /></td>
        <td align="center">0</td>
        <td>2015-6-28 14:46</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=21">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl02_cb_id" type="checkbox" name="rptList$ctl02$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl02_lb_id">20</span></td>
        <td> <a href="Edit.aspx?id=20">ARAMEX</a></td>
        <td align="center"><img src="/links/aramex.jpg" width="50" height="20" /></td>
        <td align="center">0</td>
        <td>2015-6-28 14:23</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=20">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl03_cb_id" type="checkbox" name="rptList$ctl03$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl03_lb_id">19</span></td>
        <td> <a href="Edit.aspx?id=19">TOLL</a></td>
        <td align="center"><img src="/links/tollgroup.jpg" width="50" height="20" /></td>
        <td align="center">0</td>
        <td>2015-6-28 14:22</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=19">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl04_cb_id" type="checkbox" name="rptList$ctl04$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl04_lb_id">17</span></td>
        <td> <a href="Edit.aspx?id=17">AIRPAK EXPRESS</a></td>
        <td align="center"><img src="/links/airpak-express.jpg" width="50" height="20" /></td>
        <td align="center">0</td>
        <td>2015-6-26 16:18</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=17">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl05_cb_id" type="checkbox" name="rptList$ctl05$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl05_lb_id">16</span></td>
        <td> <a href="Edit.aspx?id=16">POSLAJU</a></td>
        <td align="center"><img src="/links/poslaju.jpg" width="50" height="20" /></td>
        <td align="center">0</td>
        <td>2015-6-26 16:12</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=16">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl06_cb_id" type="checkbox" name="rptList$ctl06$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl06_lb_id">13</span></td>
        <td> <a href="Edit.aspx?id=13">阿里巴巴</a></td>
        <td align="center"><img src="/links/1688.jpg" width="50" height="20" /></td>
        <td align="center">0</td>
        <td>2015-6-26 15:46</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=13">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl07_cb_id" type="checkbox" name="rptList$ctl07$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl07_lb_id">1</span></td>
        <td> <a href="Edit.aspx?id=1">abx</a></td>
        <td align="center"><img src="/links/abxexpress.jpg" width="50" height="20" /></td>
        <td align="center">-1</td>
        <td>2011-3-3 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=1">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl08_cb_id" type="checkbox" name="rptList$ctl08$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl08_lb_id">12</span></td>
        <td> <a href="Edit.aspx?id=12">快递100</a></td>
        <td align="center"><img src="/links/kuaidi100.jpg" width="50" height="20" /></td>
        <td align="center">2</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=12">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl09_cb_id" type="checkbox" name="rptList$ctl09$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl09_lb_id">11</span></td>
        <td> <a href="Edit.aspx?id=11">京东网</a></td>
        <td align="center"><img src="/links/jd.jpg" width="50" height="20" /></td>
        <td align="center">3</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=11">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl10_cb_id" type="checkbox" name="rptList$ctl10$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl10_lb_id">10</span></td>
        <td> <a href="Edit.aspx?id=10">天猫商城</a></td>
        <td align="center"><img src="/links/tmall.jpg" width="50" height="20" /></td>
        <td align="center">-2</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=10">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl11_cb_id" type="checkbox" name="rptList$ctl11$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl11_lb_id">9</span></td>
        <td> <a href="Edit.aspx?id=9">淘宝网</a></td>
        <td align="center"><img src="/links/taobao.jpg" width="50" height="20" /></td>
        <td align="center">-2</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=9">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl12_cb_id" type="checkbox" name="rptList$ctl12$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl12_lb_id">8</span></td>
        <td> <a href="Edit.aspx?id=8">UPS</a></td>
        <td align="center"><img src="/links/ups.jpg" width="50" height="20" /></td>
        <td align="center">3</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=8">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl13_cb_id" type="checkbox" name="rptList$ctl13$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl13_lb_id">7</span></td>
        <td> <a href="Edit.aspx?id=7">fedex</a></td>
        <td align="center"><img src="/links/fedex.jpg" width="50" height="20" /></td>
        <td align="center">1</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=7">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl14_cb_id" type="checkbox" name="rptList$ctl14$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl14_lb_id">6</span></td>
        <td> <a href="Edit.aspx?id=6">DHL</a></td>
        <td align="center"><img src="/links/dhl.jpg" width="50" height="20" /></td>
        <td align="center">1</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=6">修改</a></span></td>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl15_cb_id" type="checkbox" name="rptList$ctl15$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl15_lb_id">4</span></td>
        <td> <a href="Edit.aspx?id=4">dragonlink</a></td>
        <td align="center"><img src="/links/dragonlink.jpg" width="50" height="20" /></td>
        <td align="center">3</td>
        <td>2001-1-1 0:00</td>
        <td align="center">
          <img src="../Images/ico-2.png" title="推荐" /> 
        </td>
        <td align="center"><span><a href="edit.aspx?id=4">修改</a></span></td>
      </tr>
      
      </table>
      

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
            <div id="Pagination" class="right flickr"></div>
            <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">删 除</a>
                </span>
            </div>
	</div>
    </form>
</body>
</html>
