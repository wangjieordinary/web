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
if atype=5 or atype=1 or instr(cwadmin,"|"&adminid&"|")>0 then
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
TblName = "[jifen]"
FldName = "atime" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,ddh,zt,uid,jifen,czr,atime,ctime,bz"
PageSizeX=20
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
if key<>"" then StrWhere=" (ddh like '%"&key&"%' or uid like '%"&key&"%' or czr like '%"&key&"%' or bz like '%"&key&"%')"
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
	积分明细
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
    <form name="form1" method="post" action="/admin/jifen_List" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 积分管理 &gt; 积分明细</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right">关健字：<input name="txtKeywords" type="text" id="txtKeywords" class="keyword" value="<%=key%>" /> <input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th>ID</th>
        <th>订单号</th>
        <th>积分</th>
        <th>获赠用户</th>
        <th>创建时间</th>
        <th>状态</th>
        <th>发放时间</th>
        <th>操作人</th>
        <th nowrap>备注</th>
      </tr>
<%if FieldCount>0 then
do while not rs.eof%>
      <tr>
        <td align="center" height="23"><%=rs("id")%></td>
        <td align="center"><a href="/orderDetail?act=show&orderno=<%=rs("ddh")%>" target="_blank"><%=rs("ddh")%></a></td>
        <td align="center"><%=gshjg(rs("jifen"))%></td>
        <td align="center"><%=rs("uid")%></td>
        <td align="center"><%=rs("atime")%></td>
        <td align="center"><%if rs("zt")=0 then%>已创建<%elseif rs("zt")=1 then%>已生效<%elseif rs("zt")=2 then%>已发放<%elseif rs("zt")=3 then%>已失效<%end if%></td>
        <td align="center"><%=rs("ctime")%></td>
        <td align="center"><%=rs("czr")%></td>
        <td align="center"><%=rs("bz")%></td>
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