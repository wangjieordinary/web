


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	会员管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
<script type="text/javascript">
    $(function() {
        
        //分页参数设置
        $("#Pagination").pagination(126, {
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
<script type="text/javascript">
    function p_del() {
        var msg = "您真的确定要该记录删除吗？\n\n请确认！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
</script> 
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="MoneyList.aspx" id="form1">
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
        <div class="navigation"><b>您当前的位置：首页 &gt; 用户管理 &gt; 用户列表</b></div>
        <div style="padding-bottom:10px;"></div>
        <div>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td width="40%" colspan="2"></td>
         <td width="50" align="right">状态：</td>
        <td width="150">
         <select name="ddlProperty" id="ddlProperty" class="select">
	<option selected="selected" value="-1">全部</option>
	<option value="0">未审核</option>
	<option value="1">审核通过</option>

</select>
            </td>
         <td width="50" align="right">编号：</td>
        <td width="150"><input name="txtpayorderid" type="text" id="txtpayorderid" class="keyword" /></td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" class="keyword" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td></tr>
    </table>
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">

              <tr>
                <th width="7%">选择</th>
                 <th width="7%">编号</th>
                <th width="10%">用户帐号</th>
                <th width="10%">输入金额</th>
                <th width="6%">币种</th>
                <th width="6%">当前汇率</th>
                <th width="10%">充值金额</th>                
                <th width="6%">汇款银行</th>
                <th width="6%">汇款方式</th>
                <th width="10%">汇款时间</th>
                <th width="6%">当前余额</th>
                <th width="6%">状态</th>
                <th width="13%">操作</th>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl01_lb_id">140</span></td>
                <td align="center">TK30</td>
                <td align="center">300.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">300.00</td>                       
                 <td align="center">中国银行</td>
                 <td align="center">网银转账</td>
                 <td align="center">2018-1-11 22:26:33</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=140">【审核】</a></span><span><a href="MoneyBack.aspx?payid=140" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl02_cb_id" type="checkbox" name="rptList$ctl02$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl02_lb_id">139</span></td>
                <td align="center">T33D</td>
                <td align="center">397.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">397.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2018-1-10 14:06:22</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=139">【审核】</a></span><span><a href="MoneyBack.aspx?payid=139" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl03_cb_id" type="checkbox" name="rptList$ctl03$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl03_lb_id">138</span></td>
                <td align="center">KA88</td>
                <td align="center">66.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">0.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-12-23 17:57:03</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=138">【审核】</a></span><span><a href="MoneyBack.aspx?payid=138" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl04_cb_id" type="checkbox" name="rptList$ctl04$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl04_lb_id">137</span></td>
                <td align="center">TF49</td>
                <td align="center">46.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">46.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-12-19 19:16:57</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=137">【审核】</a></span><span><a href="MoneyBack.aspx?payid=137" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl05_cb_id" type="checkbox" name="rptList$ctl05$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl05_lb_id">136</span></td>
                <td align="center">TF43</td>
                <td align="center">192.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">192.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-12-18 17:29:19</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=136">【审核】</a></span><span><a href="MoneyBack.aspx?payid=136" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl06_cb_id" type="checkbox" name="rptList$ctl06$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl06_lb_id">135</span></td>
                <td align="center">KA88</td>
                <td align="center">60.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">60.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-12-12 15:31:17</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=135">【审核】</a></span><span><a href="MoneyBack.aspx?payid=135" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl07_cb_id" type="checkbox" name="rptList$ctl07$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl07_lb_id">132</span></td>
                <td align="center">TJ45</td>
                <td align="center">87.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">87.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-11-27 10:41:05</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=132">【审核】</a></span><span><a href="MoneyBack.aspx?payid=132" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl08_cb_id" type="checkbox" name="rptList$ctl08$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl08_lb_id">131</span></td>
                <td align="center">S7118</td>
                <td align="center">412.10</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">412.10</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-11-24 14:23:28</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=131">【审核】</a></span><span><a href="MoneyBack.aspx?payid=131" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl09_cb_id" type="checkbox" name="rptList$ctl09$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl09_lb_id">130</span></td>
                <td align="center">S8339</td>
                <td align="center">100.50</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">100.50</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-10-31 18:04:36</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=130">【审核】</a></span><span><a href="MoneyBack.aspx?payid=130" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl10_cb_id" type="checkbox" name="rptList$ctl10$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl10_lb_id">129</span></td>
                <td align="center">TU33</td>
                <td align="center">155.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">155.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-10-10 13:25:49</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=129">【审核】</a></span><span><a href="MoneyBack.aspx?payid=129" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl11_cb_id" type="checkbox" name="rptList$ctl11$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl11_lb_id">128</span></td>
                <td align="center">TX59</td>
                <td align="center">50.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">50.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-9-26 16:17:01</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=128">【审核】</a></span><span><a href="MoneyBack.aspx?payid=128" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl12_cb_id" type="checkbox" name="rptList$ctl12$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl12_lb_id">127</span></td>
                <td align="center">S7442</td>
                <td align="center">28.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">28.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-9-18 14:21:47</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=127">【审核】</a></span><span><a href="MoneyBack.aspx?payid=127" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl13_cb_id" type="checkbox" name="rptList$ctl13$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl13_lb_id">126</span></td>
                <td align="center">S8490</td>
                <td align="center">200.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">0.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-9-17 13:58:59</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=126">【审核】</a></span><span><a href="MoneyBack.aspx?payid=126" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl14_cb_id" type="checkbox" name="rptList$ctl14$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl14_lb_id">124</span></td>
                <td align="center">TX39</td>
                <td align="center">768.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">768.00</td>                       
                 <td align="center">工商银行</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-8-10 17:33:24</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=124">【审核】</a></span><span><a href="MoneyBack.aspx?payid=124" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
              <tr>
                <td align="center">
                    <span class="checkall"><input id="rptList_ctl15_cb_id" type="checkbox" name="rptList$ctl15$cb_id" /></span>
           
                </td>
                <td align="center"><span id="rptList_ctl15_lb_id">123</span></td>
                <td align="center">S8478</td>
                <td align="center">171.00</td>
                <td align="center">人民币</td>
                <td align="center">无</td>
                <td align="center">171.00</td>                       
                 <td align="center">支付宝</td>
                 <td align="center">网银转账</td>
                 <td align="center">2017-8-7 21:10:48</td>
                 <td align="center">0.00</td>
                <td align="center">
                  未审核                </td>
               
              
                <td align="center"><span><a href="MoneyPayCheck.aspx?payid=123">【审核】</a></span><span><a href="MoneyBack.aspx?payid=123" onclick="javascript:return p_del()">【取消】</a></span></td>
              </tr>
            
            </table>
                        
            <div class="spClear"></div>
            <div style="line-height:30px;height:30px;">
              <div id="Pagination" class="right flickr"></div>
              <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">批量删除</a>
                  </span>
           </div>
	  </div>
    </div>
    </form>
</body>
</html>
