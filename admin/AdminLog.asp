


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	运单管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
     <script type="text/javascript" src="/admin/js/date.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(264923, {
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
<body>
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
    <div class="navigation"><b>您当前的位置：首页 &gt; 日志管理 &gt; 日志列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr style="height:28px;">
         <td width="50" align="center"></td>
        <td>
         <select name="ddlProperty" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ddlProperty\&#39;,\&#39;\&#39;)&#39;, 0)" id="ddlProperty" class="select">
	<option selected="selected" value="-1">所有日志</option>
	<option value="0">运单日志</option>
	<option value="1">包裹日志</option>

</select>
            &nbsp;</td>        
            <td width="12%" align="right">开始时间:</td>
        <td width="12%"><input name="txtstarttime" type="text" maxlength="50" id="txtstarttime" class="input required" size="25" onclick="javascript:calendar.setHook(this)" /></td>
        <td width="12%" align="right">结束时间:</td>
        <td width="12%"> <input name="txtEndtime" type="text" maxlength="50" id="txtEndtime" class="input required" size="25" onclick="javascript:calendar.setHook(this)" /></td>
        <td width="12%" align="right">管理员关键词:</td>
        <td width="12%"><input name="txtKeywords" type="text" id="txtKeywords" class="input" /></td>
         <td width="12%" align="right">包裹或运单编号:</td>
        <td width="10%"><input name="txtorderid" type="text" id="txtorderid" class="input" /></td>
        <td width="8%" align="center">
            <input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="10%">选择</th> 
        <th width="10%">编号</th>  
        <th width="10%">日志类型</th>       
        <th width="15%">操作编号</th>
        <th width="10%">操作人</th>
        <th width="15%">操作日期</th>           
        <th width="30%">操作内容</th>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl01_lb_id">264923</span></td>
         <td align="center">运单日志</td>
        <td align="center">30893</td>
        <td align="center">LYY</td>
        <td align="center">2018-1-20 9:49:00</td>       
        <td align="center">更改运单30893状态到存档中</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl02_cb_id" type="checkbox" name="rptList$ctl02$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl02_lb_id">264922</span></td>
         <td align="center">运单日志</td>
        <td align="center">30875</td>
        <td align="center">JYP</td>
        <td align="center">2018-1-19 19:14:00</td>       
        <td align="center">更改运单30875状态到已发货</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl03_cb_id" type="checkbox" name="rptList$ctl03$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl03_lb_id">264921</span></td>
         <td align="center">运单日志</td>
        <td align="center">30875</td>
        <td align="center">LYS</td>
        <td align="center">2018-1-19 19:13:00</td>       
        <td align="center">更改运单30875状态到待付款</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl04_cb_id" type="checkbox" name="rptList$ctl04$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl04_lb_id">264920</span></td>
         <td align="center">运单日志</td>
        <td align="center">30733</td>
        <td align="center">JYP</td>
        <td align="center">2018-1-19 19:11:00</td>       
        <td align="center">更改运单30733状态到已发货</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl05_cb_id" type="checkbox" name="rptList$ctl05$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl05_lb_id">264919</span></td>
         <td align="center">运单日志</td>
        <td align="center">30733</td>
        <td align="center">LYS</td>
        <td align="center">2018-1-19 19:10:00</td>       
        <td align="center">更改运单30733状态到待付款</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl06_cb_id" type="checkbox" name="rptList$ctl06$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl06_lb_id">264918</span></td>
         <td align="center">运单日志</td>
        <td align="center">30773</td>
        <td align="center">FJH</td>
        <td align="center">2018-1-19 19:07:00</td>       
        <td align="center">更改运单30773状态到订单处理中</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl07_cb_id" type="checkbox" name="rptList$ctl07$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl07_lb_id">264917</span></td>
         <td align="center">运单日志</td>
        <td align="center">30624</td>
        <td align="center">JYP</td>
        <td align="center">2018-1-19 19:01:00</td>       
        <td align="center">更改运单30624状态到已发货</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl08_cb_id" type="checkbox" name="rptList$ctl08$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl08_lb_id">264916</span></td>
         <td align="center">运单日志</td>
        <td align="center">30889</td>
        <td align="center">admin</td>
        <td align="center">2018-1-19 19:00:00</td>       
        <td align="center">更改运单30889状态到存档中</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl09_cb_id" type="checkbox" name="rptList$ctl09$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl09_lb_id">264915</span></td>
         <td align="center">运单日志</td>
        <td align="center">30624</td>
        <td align="center">LYS</td>
        <td align="center">2018-1-19 18:59:00</td>       
        <td align="center">更改运单30624状态到待付款</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl10_cb_id" type="checkbox" name="rptList$ctl10$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl10_lb_id">264914</span></td>
         <td align="center">运单日志</td>
        <td align="center">30851</td>
        <td align="center">JYP</td>
        <td align="center">2018-1-19 18:58:00</td>       
        <td align="center">更改运单30851状态到已发货</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl11_cb_id" type="checkbox" name="rptList$ctl11$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl11_lb_id">264913</span></td>
         <td align="center">运单日志</td>
        <td align="center">30851</td>
        <td align="center">LYS</td>
        <td align="center">2018-1-19 18:57:00</td>       
        <td align="center">更改运单30851状态到待付款</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl12_cb_id" type="checkbox" name="rptList$ctl12$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl12_lb_id">264912</span></td>
         <td align="center">运单日志</td>
        <td align="center">30440</td>
        <td align="center">JYP</td>
        <td align="center">2018-1-19 18:55:00</td>       
        <td align="center">更改运单30440状态到已发货</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl13_cb_id" type="checkbox" name="rptList$ctl13$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl13_lb_id">264911</span></td>
         <td align="center">运单日志</td>
        <td align="center">30440</td>
        <td align="center">LYS</td>
        <td align="center">2018-1-19 18:53:00</td>       
        <td align="center">更改运单30440状态到待付款</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl14_cb_id" type="checkbox" name="rptList$ctl14$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl14_lb_id">264910</span></td>
         <td align="center">运单日志</td>
        <td align="center">30852</td>
        <td align="center">JYP</td>
        <td align="center">2018-1-19 18:53:00</td>       
        <td align="center">更改运单30852状态到已发货</td>       
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl15_cb_id" type="checkbox" name="rptList$ctl15$cb_id" /></span></td>
        <td align="center"><span id="rptList_ctl15_lb_id">264909</span></td>
         <td align="center">运单日志</td>
        <td align="center">30852</td>
        <td align="center">LYS</td>
        <td align="center">2018-1-19 18:51:00</td>       
        <td align="center">更改运单30852状态到待付款</td>       
      </tr>
      
      </table>
      

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
        <div>
            <div style="float:right;padding-left:30px;padding-right:30px;">
                输入页码：<input name="txtpagego" type="text" id="txtpagego" size="3" class="input" /><input type="submit" name="Button1" value="跳转" id="Button1" /></div><div id="Pagination" class="right flickr"></div>
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




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	订单报表管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
     <script type="text/javascript" src="../js/date.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(10, {
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
        
//        $(function() {
//            $(".msgtable tr:nth-child(odd)").addClass("tr_bg"); //隔行变色
//            $(".msgtable tr").hover(
//			    function() {
//			        $(this).addClass("tr_hover_col");
//			    },
//			    function() {
//			        $(this).removeClass("tr_hover_col");
//			    }
//		    );
        });
    </script>
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
    </style>
</head>
<body>

<div id="doing" style="Z-INDEX:12000;LEFT:0px;WIDTH:100%;CURSOR:wait;POSITION:absolute;TOP:0px;HEIGHT:100%;visibility:hidden;"> 
<table width="100%" height="100%"> 
<tr align="center" valign="middle"> 
<td> 
<table width="169" height="62" bgcolor="#99cccc" style="FILTER: Alpha(Opacity=75); WIDTH: 169px; HEIGHT: 62px"> 
<tr align="center" valign="middle"> 
<td>系统生成中请耐心等待.<br> 
<img src="../Images/loading.gif" /></td> 
</tr> 
</table> 
</td> 
</tr> 
</table> 
</div>


    <form name="form1" method="post" action="Download.aspx" id="form1">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTgzMzMzMjg0Mw9kFgQCAw8WAh4Fc3R5bGUFZlotSU5ERVg6MTIwMDA7TEVGVDowcHg7V0lEVEg6MTAwJTtDVVJTT1I6d2FpdDtQT1NJVElPTjphYnNvbHV0ZTtUT1A6MHB4O0hFSUdIVDoxMDAlO3Zpc2liaWxpdHk6aGlkZGVuO2QCBQ9kFgYCAw8QZBAVCwblhajpg6gM5pyx5oC757uP55CGCeWRqOaZk+aCpgnmnLHnu4/lsKcV5Yav5p2w6LGq5Lia5Yqh57uP55CGFemSn+W7uumbhOS4muWKoee7j+eQhgnliJjlhYPmnIgJ6JKL6Imz5bmzBuacseaAuwnlhazlhbHlj7cJ5YiY5rC455SfFQsBMAExAjI5AjMxAjMyAjMzAjM0AjM2AjQwAjQxAjQzFCsDC2dnZ2dnZ2dnZ2dnZGQCCQ8PZBYCHgdvbmNsaWNrBUdqYXZhc2NyaXB0OmRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdkb2luZycpLnN0eWxlLnZpc2liaWxpdHk9J3Zpc2libGUnO2QCCw8WAh4LXyFJdGVtQ291bnQCChYUAgEPZBYEAgIPDxYCHgRUZXh0BRMyMDE4MDExMjA3MDUzOF8ueGxzZGQCAw8VBRMyMDE4MDExMjA3MDUzOF8ueGxzEzIwMTgwMTEyMDcwNTM4Xy54bHMGMTU1M0tCEjIwMTgtMS0xMiAxOTowNTozOBMyMDE4MDExMjA3MDUzOF8ueGxzZAICD2QWBAICDw8WAh8DBR8yMDE2MTAyNTA4MjM0NV/ov5DljZXml6Xlv5cueGxzZGQCAw8VBR8yMDE2MTAyNTA4MjM0NV/ov5DljZXml6Xlv5cueGxzHzIwMTYxMDI1MDgyMzQ1X+i/kOWNleaXpeW/ly54bHMEMTBLQhMyMDE2LTEwLTI1IDIwOjIzOjQ1HzIwMTYxMDI1MDgyMzQ1X+i/kOWNleaXpeW/ly54bHNkAgMPZBYEAgIPDxYCHwMFEzIwMTYxMDE3MDQzNDU2Xy54bHNkZAIDDxUFEzIwMTYxMDE3MDQzNDU2Xy54bHMTMjAxNjEwMTcwNDM0NTZfLnhscwUyMzBLQhMyMDE2LTEwLTE3IDE2OjM0OjU2EzIwMTYxMDE3MDQzNDU2Xy54bHNkAgQPZBYEAgIPDxYCHwMFEzIwMTYxMDEzMDk0MjE0Xy54bHNkZAIDDxUFEzIwMTYxMDEzMDk0MjE0Xy54bHMTMjAxNjEwMTMwOTQyMTRfLnhscwUxODdLQhMyMDE2LTEwLTEzIDIxOjQyOjE0EzIwMTYxMDEzMDk0MjE0Xy54bHNkAgUPZBYEAgIPDxYCHwMFEzIwMTYwOTEzMDgyNTI2Xy54bHNkZAIDDxUFEzIwMTYwOTEzMDgyNTI2Xy54bHMTMjAxNjA5MTMwODI1MjZfLnhscwQ0M0tCEjIwMTYtMTAtNCAyMzoxNzo0MhMyMDE2MDkxMzA4MjUyNl8ueGxzZAIGD2QWBAICDw8WAh8DBRMyMDE2MDkxMzA5NDIwM18ueGxzZGQCAw8VBRMyMDE2MDkxMzA5NDIwM18ueGxzEzIwMTYwOTEzMDk0MjAzXy54bHMEMjFLQhIyMDE2LTEwLTQgMjM6MTc6NDITMjAxNjA5MTMwOTQyMDNfLnhsc2QCBw9kFgQCAg8PFgIfAwUTMjAxNjA5MjAwNjQ5MjFfLnhsc2RkAgMPFQUTMjAxNjA5MjAwNjQ5MjFfLnhscxMyMDE2MDkyMDA2NDkyMV8ueGxzBTExM0tCEjIwMTYtMTAtNCAyMzoxNzo0MhMyMDE2MDkyMDA2NDkyMV8ueGxzZAIID2QWBAICDw8WAh8DBRMyMDE2MDkyMTAxNTY0OV8ueGxzZGQCAw8VBRMyMDE2MDkyMTAxNTY0OV8ueGxzEzIwMTYwOTIxMDE1NjQ5Xy54bHMEMjRLQhIyMDE2LTEwLTQgMjM6MTc6NDITMjAxNjA5MjEwMTU2NDlfLnhsc2QCCQ9kFgQCAg8PFgIfAwUTMjAxNjA5MjEwOTAzMTFfLnhsc2RkAgMPFQUTMjAxNjA5MjEwOTAzMTFfLnhscxMyMDE2MDkyMTA5MDMxMV8ueGxzBDM2S0ISMjAxNi0xMC00IDIzOjE3OjQyEzIwMTYwOTIxMDkwMzExXy54bHNkAgoPZBYEAgIPDxYCHwMFEzIwMTYwOTI3MDIyNDU1Xy54bHNkZAIDDxUFEzIwMTYwOTI3MDIyNDU1Xy54bHMTMjAxNjA5MjcwMjI0NTVfLnhscwQ0N0tCEjIwMTYtMTAtNCAyMzoxNzo0MhMyMDE2MDkyNzAyMjQ1NV8ueGxzZBgBBR5fX0NvbnRyb2xzUmVxdWlyZVBvc3RCYWNrS2V5X18WCgUTcnB0TGlzdCRjdGwwMSRjYl9pZAUTcnB0TGlzdCRjdGwwMiRjYl9pZAUTcnB0TGlzdCRjdGwwMyRjYl9pZAUTcnB0TGlzdCRjdGwwNCRjYl9pZAUTcnB0TGlzdCRjdGwwNSRjYl9pZAUTcnB0TGlzdCRjdGwwNiRjYl9pZAUTcnB0TGlzdCRjdGwwNyRjYl9pZAUTcnB0TGlzdCRjdGwwOCRjYl9pZAUTcnB0TGlzdCRjdGwwOSRjYl9pZAUTcnB0TGlzdCRjdGwxMCRjYl9pZMIr2vHu40xq6D4UuXCHzm7NFr0o0sjdykOe4LLtwsMR" />
</div>

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


<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWHQLi1vylCwKL1ZBsApjV3G8Ch9XcbwL1tJM6Auq0kzoC67S/OgLotN85Aui02zkC6LTnOQLotOM5Aui06zkC6bTTOQLptN85Aum05zkCs6CdrAYCiZrxwA0Ci7eovQ4CxsLNowUC5cLNowUChMTNowUCq8LNowUCysHNowUC6cHNowUCiMPNowUCn8XNowUCvsTNowUCp8Ph3gQCnuPM9wFz5qs15+noGnnQsc1ecQdnRHkL4kVpfQe64/nljMsiYg==" />
</div>
    <div class="navigation"><b>您当前的位置：首页 &gt; 日志管理 &gt; 日志导出</b></div>
    <div class="spClear"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">订单详情</th>
        </tr>
        <tr>
            <td width="15%" align="right">请选择日志类型：</td>
            <td width="85%">
                <select name="ddlProperty" id="ddlProperty" class="select">
	<option value="-1">全部</option>
	<option value="0">运单日志</option>
	<option value="1">包裹日志</option>

</select></td>
        </tr>
        <tr>
            <td width="15%" align="right">请选择用户：</td>
            <td width="85%">
                 <select name="ddladmin" id="ddladmin" class="select">
	<option value="0">全部</option>
	<option value="1">朱总经理</option>
	<option value="29">周晓悦</option>
	<option value="31">朱经尧</option>
	<option value="32">冯杰豪业务经理</option>
	<option value="33">钟建雄业务经理</option>
	<option value="34">刘元月</option>
	<option value="36">蒋艳平</option>
	<option value="40">朱总</option>
	<option value="41">公共号</option>
	<option value="43">刘永生</option>

</select></td>
        </tr>
        <tr id="trdate">
	<td width="15%" align="right">开始时间：</td>
	<td width="85%">
                <input name="txtstarttime" type="text" maxlength="50" id="txtstarttime" class="input required" size="25" onclick="javascript:calendar.setHook(this)" /></td>
</tr>

        <tr>
            <td align="right" class="style1">结束时间：</td>
            <td class="style1">             
               <input name="txtEndtime" type="text" maxlength="50" id="txtEndtime" class="input required" size="25" onclick="javascript:calendar.setHook(this)" /></td>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">操作：</td>
            <td class="style1">
                <input type="submit" name="btnorder" value="生成报表" onclick="javascript:document.getElementById(&#39;doing&#39;).style.visibility=&#39;visible&#39;;" id="btnorder" class="submit" />               
             
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">报表预览：</td>
            <td>
      
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="6%">选择</th>   
        <th width="40%" align=left>报表名称</th>  
         <th width="20%" align=left>报表大小</th>      
         <th width="20%" align=left>创建时间</th>
         <th width="20%" align=left>操作</th>
      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl01_cb_id" type="checkbox" name="rptList$ctl01$cb_id" /></span></td>        
        <td><a href="../xls/20180112070538_.xls" target="_blank">20180112070538_.xls</a></td>
         <td>1553KB</td> 
         <td>2018-1-12 19:05:38</td> 
         <td><a href="../xlslog/20180112070538_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl02_cb_id" type="checkbox" name="rptList$ctl02$cb_id" /></span></td>        
        <td><a href="../xls/20161025082345_运单日志.xls" target="_blank">20161025082345_运单日志.xls</a></td>
         <td>10KB</td> 
         <td>2016-10-25 20:23:45</td> 
         <td><a href="../xlslog/20161025082345_运单日志.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl03_cb_id" type="checkbox" name="rptList$ctl03$cb_id" /></span></td>        
        <td><a href="../xls/20161017043456_.xls" target="_blank">20161017043456_.xls</a></td>
         <td>230KB</td> 
         <td>2016-10-17 16:34:56</td> 
         <td><a href="../xlslog/20161017043456_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl04_cb_id" type="checkbox" name="rptList$ctl04$cb_id" /></span></td>        
        <td><a href="../xls/20161013094214_.xls" target="_blank">20161013094214_.xls</a></td>
         <td>187KB</td> 
         <td>2016-10-13 21:42:14</td> 
         <td><a href="../xlslog/20161013094214_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl05_cb_id" type="checkbox" name="rptList$ctl05$cb_id" /></span></td>        
        <td><a href="../xls/20160913082526_.xls" target="_blank">20160913082526_.xls</a></td>
         <td>43KB</td> 
         <td>2016-10-4 23:17:42</td> 
         <td><a href="../xlslog/20160913082526_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl06_cb_id" type="checkbox" name="rptList$ctl06$cb_id" /></span></td>        
        <td><a href="../xls/20160913094203_.xls" target="_blank">20160913094203_.xls</a></td>
         <td>21KB</td> 
         <td>2016-10-4 23:17:42</td> 
         <td><a href="../xlslog/20160913094203_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl07_cb_id" type="checkbox" name="rptList$ctl07$cb_id" /></span></td>        
        <td><a href="../xls/20160920064921_.xls" target="_blank">20160920064921_.xls</a></td>
         <td>113KB</td> 
         <td>2016-10-4 23:17:42</td> 
         <td><a href="../xlslog/20160920064921_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl08_cb_id" type="checkbox" name="rptList$ctl08$cb_id" /></span></td>        
        <td><a href="../xls/20160921015649_.xls" target="_blank">20160921015649_.xls</a></td>
         <td>24KB</td> 
         <td>2016-10-4 23:17:42</td> 
         <td><a href="../xlslog/20160921015649_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl09_cb_id" type="checkbox" name="rptList$ctl09$cb_id" /></span></td>        
        <td><a href="../xls/20160921090311_.xls" target="_blank">20160921090311_.xls</a></td>
         <td>36KB</td> 
         <td>2016-10-4 23:17:42</td> 

         <td><a href="../xlslog/20160921090311_.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><span class="checkall"><input id="rptList_ctl10_cb_id" type="checkbox" name="rptList$ctl10$cb_id" /></span></td>        
        <td><a href="../xls/20160927022455_.xls" target="_blank">20160927022455_.xls</a></td>
         <td>47KB</td> 
         <td>2016-10-4 23:17:42</td> 
         <td><a href="../xlslog/20160927022455_.xls" target="_blank">下载</a></td>

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
        </tr>
     
        </table>
 

    </form>
</body>
</html>

