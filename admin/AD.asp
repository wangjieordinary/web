<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../adminconfig.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
sname=SPLIT(teh,"&")(1)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
adminid=SPLIT(teh,"&")(5)
if adminid="" or isnull(adminid) then adminid=0
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="仓库管理员"
if atype=3 then ttype="业务员"
if atype=5 then ttype="财务"
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then Response.Redirect("/admin/login")
if atype=1 or instr(power,"viewArticle")>0 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('越权了！已停止。');history.go(-1);</Script></body></html>"
Response.end
end if

if instr(a,"_List")>0 then '订单列表
catid=request("catid")
if catid="" or isnull(catid) then catid=0
catid2=request("catid2")
if catid2="" or isnull(catid2) then catid2=0
if int(catid2)>0 then catid=int(catid2)
catid3=request("catid3")
if catid3="" or isnull(catid3) then catid3=0
if int(catid3)>0 then catid=int(catid3)
'catid=int(getnumb(catid))
page=Request("page")
if page="" or isnull(page) then page=0
brandid=Request("brandid")
if brandid<>"" then
brandid=int(brandid)
if brandid>0 then osql=" and brandid="&brandid
else
brandid=0
end if
recommend=Request("recommend")
if recommend<>"" then
if recommend="0" or recommend="1" or recommend="2" or recommend="3" then osql=" and recommend="&recommend
end if
key=request("key")
if key="" then key=request("txtKeywords")
if request("skey")="yes" then
key=Session("key")
else
Session("key")=key
end if
PageNo=page+1
if PageNo="" then PageNo=1
if isnumeric(PageNo) or PageNo="" then
PageNo=abs(PageNo)
 if PageNo=0 then PageNo=1
else
 PageNo=1
end if
TblName = "[dingdan]"
FldName = "atime" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,ddh,zt,jine,youhui,zflx,besttime,atime,ptime,stime,etime,uid,OrderMessage,pslx,payddh,ghsid,sname,sadd,ssj,wlmc,kddh,fuyan"
PageSizeX=12
OrderType=0 '0-为降序 1-升序
StrWhere=sql '注意: 一个条件就用()双括号括起来 第一个不用and

TopField=(PageNo-1)*PageSizeX 'TOP多少条

if OrderType=0 then
 StrTmp = "<(Select min"
 StrOrder = " Order BY case when ["&FldName&"] is null then 0 else 1 end,["&FldName&"] desc"
else
 StrTmp = ">(Select max"
 StrOrder = " Order BY case when ["&FldName&"] is null then 1 else 0 end,["&FldName&"] asc"
end if

'定义sql语句
StrSql="Select Top "&Clng(PageSizeX)&" "& FieldName &" From "&TblName&" "
if search<>"" then
if key<>"" and search="complete" then StrWhere=" ddh='"&key&"'"
if key<>"" and (search="blur" or search="") then StrWhere=" (ddh like '%"&key&"%' or sname like '%"&key&"%' or sadd like '%"&key&"%' or ssj like '%"&key&"%')"
else
if key<>"" then StrWhere=" (ddh like '%"&key&"%' or sname like '%"&key&"%' or sadd like '%"&key&"%' or ssj like '%"&key&"%')"
end if
if key<>"" then skey="&skey=yes"
StrWhere=StrWhere&osql
if PageNo=1 then '如果是第一页时，执行如下代码查库速度快
if StrWhere<>"" then
 StrSql=StrSql&" Where siteid="&siteid&" and "&StrWhere & StrOrder&""
 else
 StrSql=StrSql & StrOrder
 end if
else
 if StrWhere<>"" then
 StrSql=StrSql&" Where "& FldName & StrTmp&"("&FldName&") From (Select top "& Clng(TopField)&" "&FldName &" From "&TblName&" Where "& StrWhere & StrOrder &") as tblTmp) and "& StrWhere & StrOrder&""
 else
 StrSql=StrSql&" Where "& FldName & StrTmp&"("&FldName&") From (Select top "& Clng(TopField)&" "&FldName &" From "&TblName & StrOrder &") as tblTmp) "&StrOrder&""
 end if 
end if
'response.Write StrSql

Set rs=Conn.exeCute(StrSql) '执行查询

if StrWhere<>"" then '求总记录数
FieldCount=Conn.exeCute("Select Count("&FldName&") From "&TblName&" Where "&StrWhere&"")(0)
else
FieldCount=Conn.exeCute("Select Count("&FldName&") From "&TblName&"")(0)
end if

if (FieldCount mod PageSizeX)>0 then '求总页数 PageCountX
 PageCountX=((FieldCount - (FieldCount mod PageSizeX))/ PageSizeX)+1
else
 PageCountX= (FieldCount / PageSizeX)
end if%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	订单管理<%=catlist%>
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
    <script type="text/javascript">
        $(function() {
            //分页参数设置
            $("#Pagination").pagination(<%=FieldCount%>, {
            callback: pageselectCallback,
            prev_text: "« 上一页",
            next_text: "下一页 »",
            items_per_page:<%=PageSizeX%>,
		    num_display_entries:<%=FieldCount%>,
		    current_page:<%=page%>,
		    num_edge_entries:2,
		    link_to:"?act=s<%=skey%>&catid=<%=catid%>&brandid=<%=brandid%>&recommend=<%=recommend%>&page=__id__"
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
<SCRIPT language="javascript">
function showsubmenu(sid)
{

whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}

}


<!--
function DrawImage(ImgD,W,H){ 
  var flag=false; 
  var image=new Image(); 
  image.src=ImgD.src; 
  if(image.width>0 && image.height>0){ 
    flag=true; 
    if(image.width>W  && image.height>H){
 
	  var ht=image.width/image.height;
	  var nt=W/H;
	  //if(image.width>image.height){
	  if(nt<ht){
	     ImgD.width=W;
		 ImgD.height=(W*image.height)/image.width;
	  }
	  else{
	    ImgD.height=H;
		ImgD.width=(H*image.width)/image.height;
	  }
	}
	
	if(image.width>=W && image.height<H){
	   var ht1=image.width/image.height;
	   var nt1=W/H;
	  if(ht1>nt1){
	     ImgD.width=W;
		 ImgD.height=(image.height*W)/image.width;
	  }
	  else{
	    ImgD.height=H;
		ImgD.width=(image.width*H)/image.height;
	  }
	
 
	}
	
	if(image.width<W && image.height>=H){
	   var ht1=image.width/image.height;
	   var nt1=W/H;
	  if(ht1>nt1){
	     ImgD.width=W;
		 ImgD.height=(image.height*W)/image.width;
	  }
	  else{
	    ImgD.height=H;
		ImgD.width=(image.width*H)/image.height;
	  }
	
 
	}
	if(image.width<=W && image.height<=H){
 
	
	
	
	  ImgD.width=image.width;
      ImgD.height=image.height; 
	}
      ImgD.alt= ""; 
  }

}


//-->
</SCRIPT>
<script language="JavaScript">

<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/dingdan_List" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 订单管理 &gt; 订单列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" class="keyword" value="<%=key%>" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="5%">ID</th>
        <th width="8%">订单号</th>
        <th width="6%">金额</th>
        <th align="left">收货人地址</th>
        <th width="8%">收货人</th>
        <th width="8%">收货人手机</th>
        <th width="8%">下单用户</th>
        <th width="9%">创建时间</th>
        <th width="9%">付款时间</th>
        <th width="9%">发货时间</th>
        <th width="8%">操作</th>
        <th nowrap>其它</th>
      </tr>
<%if FieldCount>0 then
do while not rs.eof%>
      <tr>
        <td align="center"><%=rs("id")%></td>
        <td align="center"><%=rs("ddh")%></td>
        <td align="center"><%=gshjg(rs("jine"))%></td>
        <td><%=rs("sadd")%></a></td>
        <td align="center"><%=rs("sname")%></td>
        <td align="center"><%=rs("ssj")%></td>
        <td align="center"><%=rs("uid")%></td>
        <td align="center"><%=rs("atime")%></td>
        <td align="center"><%=rs("ptime")%></td>
        <td align="center"><%=rs("stime")%></td>
        <td align="center"><span><a href="/orderDetail?act=show&order_id=<%=rs("id")%>" target="_blank">查看</a></span></td><td align="center"><%=rs("fuyan")%></td>
      </tr>
<%rs.movenext
loop
rs.close
set rs=nothing
end if%>
 
      </table>
      

    <div class="spClear"></div>
        <div style="line-height:30px;height:30px;">
            <div id="Pagination" class="right flickr"></div>
            <div class="left">
                <span class="btn_all" onClick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onClick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">删 除</a>
                </span>
            </div>
	</div>
    </form><script type="text/javascript">
function selectcatid2(catid) {
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
                        }
                    }
                    else {                        
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
function selectcatid3(catid) {
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
                        }
                    }
                    else {                        
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
</script>
</body>
</html><%end if%>