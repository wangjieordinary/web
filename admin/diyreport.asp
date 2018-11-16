


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
            $("#Pagination").pagination(0, {
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
//        });
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


    <form name="form1" method="post" action="Download1.aspx" id="form1">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE2MzA5Mjc5NTUPZBYEAgMPFgIeBXN0eWxlBWZaLUlOREVYOjEyMDAwO0xFRlQ6MHB4O1dJRFRIOjEwMCU7Q1VSU09SOndhaXQ7UE9TSVRJT046YWJzb2x1dGU7VE9QOjBweDtIRUlHSFQ6MTAwJTt2aXNpYmlsaXR5OmhpZGRlbjtkAgUPZBYGAgMPD2QWAh4Hb25jbGljawVHamF2YXNjcmlwdDpkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnZG9pbmcnKS5zdHlsZS52aXNpYmlsaXR5PSd2aXNpYmxlJztkAgkPFgIeC18hSXRlbUNvdW50ZmQCCw8PFgIeB0VuYWJsZWRoZGRkM7mwawXRcND4ymbrCyu3ZNfnPLFFKU21y3PJAn2F8jQ=" />
</div>

<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBQKP9pqiDgLs0bLrBgKLt6i9DgKM54rGBgK7q7GGCNN/p/pqmUXGWYNtUygXdbCc0IjUD04rx4JxNecT5ofR" />
</div>
    <div class="navigation"><b>您当前的位置：首页 &gt; 报表管理 &gt; 报表列表</b></div>
    <div class="spClear"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
        <tr>
            <th colspan="2" align="left">订单详情</th>
        </tr>
        <tr>
            <td width="15%" align="right">请输入要导出的订单：</td>
            <td width="85%">
                <textarea name="TextBox1" rows="2" cols="20" id="TextBox1" style="height:269px;width:303px;">
</textarea>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">操作：</td>
            <td class="style1">
                <input type="submit" name="btnorder" value="导出报表" onclick="javascript:document.getElementById(&#39;doing&#39;).style.visibility=&#39;visible&#39;;" id="btnorder" class="submit" />               
             
            &nbsp;&nbsp;               
              <input type="submit" name="Button1" value="更改状态到已出货" id="Button1" class="submit" />               
            
            &nbsp;&nbsp;               
             <input type="submit" name="Button2" value="更改状态到已扣货" id="Button2" class="submit" />
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
      
      </table>
      

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
            <div id="Pagination" class="right flickr"></div>
            <div class="left">
                <span class="btn_all" onclick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onclick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" disabled="disabled">删 除</a>
                </span>
            </div>
	</div>
        </tr>
     
        </table>
 

    </form>
</body>
</html>
