


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"><title>
	订单报表管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
     <script type="text/javascript" src="/admin/js/date.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(2, {
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
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE4MTU5NDgyMzMPZBYEAgMPFgIeBXN0eWxlBWZaLUlOREVYOjEyMDAwO0xFRlQ6MHB4O1dJRFRIOjEwMCU7Q1VSU09SOndhaXQ7UE9TSVRJT046YWJzb2x1dGU7VE9QOjBweDtIRUlHSFQ6MTAwJTt2aXNpYmlsaXR5OmhpZGRlbjtkAgUPZBYGAgMPEGQPFgRmAgECAgIDFgQQBRLor7fpgInmi6nkuJrliqHlkZgFATBnEAUDRkpIBQIzMmcQBQNaSlgFAjMzZxAFA1NBTQUCNDBnZGQCCQ8PZBYCHgdvbmNsaWNrBUdqYXZhc2NyaXB0OmRvY3VtZW50LmdldEVsZW1lbnRCeUlkKCdkb2luZycpLnN0eWxlLnZpc2liaWxpdHk9J3Zpc2libGUnO2QCCw8WAh4LXyFJdGVtQ291bnQCAhYEAgEPZBYGAgEPFgIeBXZhbHVlBRkyMDE2MTEzMDA1MTkzN1/lhajpg6gueGxzZAICDw8WAh4EVGV4dAUZMjAxNjExMzAwNTE5Mzdf5YWo6YOoLnhsc2RkAgMPFQUZMjAxNjExMzAwNTE5Mzdf5YWo6YOoLnhscxkyMDE2MTEzMDA1MTkzN1/lhajpg6gueGxzBTk2NEtCEzIwMTYtMTEtMzAgMTc6MTk6MzcZMjAxNjExMzAwNTE5Mzdf5YWo6YOoLnhsc2QCAg9kFgYCAQ8WAh8DBRkyMDE2MTExNTAzMTMyN1/lhajpg6gueGxzZAICDw8WAh8EBRkyMDE2MTExNTAzMTMyN1/lhajpg6gueGxzZGQCAw8VBRkyMDE2MTExNTAzMTMyN1/lhajpg6gueGxzGTIwMTYxMTE1MDMxMzI3X+WFqOmDqC54bHMENTRLQhMyMDE2LTExLTE1IDE1OjEzOjI3GTIwMTYxMTE1MDMxMzI3X+WFqOmDqC54bHNkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYCBRNycHRMaXN0JGN0bDAxJGNiX2lkBRNycHRMaXN0JGN0bDAyJGNiX2lkyyeabNAoq9NmOC8m2Ylte1ciH4fxpMygSbbJFUYLo5g=" />
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

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWFAKbiM7xCwKL1ZBsApjV3G8Ch9XcbwKG1dxvAoXV3G8ChNXcbwKD1dxvAoLV3G8CgdXcbwKo8NKCAQK18JqBAQK18KaBAQK08JKBAQKzoJ2sBgKJmvHADQKLt6i9DgLGws2jBQLlws2jBQKe48z3AQF+HjkpcK8DGiu4nbLV0MrlgK0vbDwIbh4dKkV37Pbp" />
</div>
    <div class="navigation"><b>您当前的位置：首页 &gt; 报表管理 &gt; 报表列表</b></div>
    <div class="spClear"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">订单详情</th>
        </tr>
        <tr>
            <td width="15%" align="right">请选择订单的分类：</td>
            <td width="85%">
                <select name="ddlProperty" id="ddlProperty" class="select">
	<option value="-1" style="background-color: #68A8DD">全部</option>
	<option value="0" style="background-color: #8EFFFF">无效运单</option>
	<option value="1" style="background-color: #86FF86">待付款</option>
	<option value="2" style="background-color: white">已付款</option>
	<option value="3" style="background-color: yellow">已发货</option>
	<option value="4" style="background-color: #B0B0B0">交易成功</option>
	<option value="5" style="background-color: #0F0">订单处理中</option>
	<option value="6" style="background-color: #F99">扣货</option>
	<option value="7">未处理</option>

</select></td>
        </tr>
        <tr>
            <td width="15%" align="right">业务员：</td>
            <td width="85%">
                 <select name="ddlsaleman" id="ddlsaleman" class="select">
	<option value="0">请选择业务员</option>
	<option value="32">FJH</option>
	<option value="33">ZJX</option>
	<option value="40">SAM</option>

</select></td>
        </tr>
        <tr id="trdate">
	<td width="15%" align="right" class="style1">开始时间：</td>
	<td width="85%" class="style1">
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
        <td align="center"><input name="rptList$ctl01$cb_id" type="checkbox" id="rptList_ctl01_cb_id" class="checkall" value="20161130051937_全部.xls" /><span id="rptList_ctl01_lb_id" style="display:none;">20161130051937_全部.xls</span></td>        
        <td><a href="../xls/20161130051937_全部.xls" target="_blank">20161130051937_全部.xls</a></td>
         <td>964KB</td> 
         <td>2016-11-30 17:19:37</td> 
         <td><a href="../xls/20161130051937_全部.xls" target="_blank">下载</a></td>

      </tr>
      
      <tr>
        <td align="center"><input name="rptList$ctl02$cb_id" type="checkbox" id="rptList_ctl02_cb_id" class="checkall" value="20161115031327_全部.xls" /><span id="rptList_ctl02_lb_id" style="display:none;">20161115031327_全部.xls</span></td>        
        <td><a href="../xls/20161115031327_全部.xls" target="_blank">20161115031327_全部.xls</a></td>
         <td>54KB</td> 
         <td>2016-11-15 15:13:27</td> 
         <td><a href="../xls/20161115031327_全部.xls" target="_blank">下载</a></td>

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
