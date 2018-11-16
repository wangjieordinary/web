


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	消费日志
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(782, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:14,
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
<body>
    <form name="form1" method="post" action="Paylog.aspx" id="form1">
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
    <div class="navigation"><b>您当前的位置：首页 &gt; 会员管理 &gt; 消费日志</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="center">&nbsp;</td>
        <td>
            &nbsp;
            &nbsp;
            </td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" class="keyword" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>
        <th width="6%">编号</th>
        <th width="13%">用户帐号</th>
        <th width="8%">货币类型</th>
        <th width="8%">类型</th>
         <th width="10%">操作前金额</th>      
        <th width="10%">发生金额</th>       
        <th width="13%">余额</th>
        <th width="15%">添加时间</th>
        <th width="21%">备注</th>         
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl01_lb_id">782</span></td>
        <td align="center">T40M</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-19 15:04:00</td>   
        <td align="center">付款海运订单361320180118142755金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl02_cb_id" type="checkbox" name="rptList$ctl02$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl02_lb_id">781</span></td>
        <td align="center">T06M</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-18 16:34:00</td>   
        <td align="center">付款海运订单356720180117232806金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl03_cb_id" type="checkbox" name="rptList$ctl03$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl03_lb_id">780</span></td>
        <td align="center">S7150</td>
        <td align="center">RMB</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-18 16:28:00</td>   
        <td align="center">扣除订单编号30769款项</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl04_cb_id" type="checkbox" name="rptList$ctl04$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl04_lb_id">779</span></td>
        <td align="center">T16M</td>
        <td align="center">RMB</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-18 13:38:00</td>   
        <td align="center">扣除订单编号30753款项</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl05_cb_id" type="checkbox" name="rptList$ctl05$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl05_lb_id">778</span></td>
        <td align="center">TT96</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-18 12:03:00</td>   
        <td align="center">付款海运订单256920180109005036金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl06_cb_id" type="checkbox" name="rptList$ctl06$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl06_lb_id">777</span></td>
        <td align="center">T30M</td>
        <td align="center">RMB</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 23:13:00</td>   
        <td align="center">扣除订单编号30687款项</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl07_cb_id" type="checkbox" name="rptList$ctl07$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl07_lb_id">776</span></td>
        <td align="center">KB42</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 22:21:00</td>   
        <td align="center">付款海运订单356220180111230441金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl08_cb_id" type="checkbox" name="rptList$ctl08$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl08_lb_id">775</span></td>
        <td align="center">KB46</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 20:55:00</td>   
        <td align="center">付款海运订单357620180115150710金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl09_cb_id" type="checkbox" name="rptList$ctl09$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl09_lb_id">774</span></td>
        <td align="center">T33M</td>
        <td align="center">RMB</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 20:00:00</td>   
        <td align="center">扣除订单编号30606款项</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl10_cb_id" type="checkbox" name="rptList$ctl10$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl10_lb_id">773</span></td>
        <td align="center">S7141</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 17:55:00</td>   
        <td align="center">付款海运订单56220180115111049金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl11_cb_id" type="checkbox" name="rptList$ctl11$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl11_lb_id">772</span></td>
        <td align="center">TS99</td>
        <td align="center">RMB</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 16:31:00</td>   
        <td align="center">扣除订单编号30684款项</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl12_cb_id" type="checkbox" name="rptList$ctl12$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl12_lb_id">771</span></td>
        <td align="center">TC47</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-17 09:35:00</td>   
        <td align="center">付款海运订单126720171226035158金额：0</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl13_cb_id" type="checkbox" name="rptList$ctl13$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl13_lb_id">770</span></td>
        <td align="center">X1298</td>
        <td align="center">RMB</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-16 16:56:00</td>   
        <td align="center">扣除订单编号30376款项</td> 
      </tr>
      
      <tr style="background-color: #FFB762">
        <td align="center"><span class="checkall"><input id="rptList_ctl14_cb_id" type="checkbox" name="rptList$ctl14$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl14_lb_id">769</span></td>
        <td align="center">TU23</td>
        <td align="center">RM</td>      
        <td align="center">运单付款</td>         
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">0.00</td>
        <td align="center">2018-01-16 15:53:00</td>   
        <td align="center">付款海运订单268420180115101517金额：0</td> 
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
