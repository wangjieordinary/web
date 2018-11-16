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
end if%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	佣金明细<%=catlist%>
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
    <script type="text/javascript" src="/admin/js/function.js"></script>
    <script type="text/javascript" src="/admin/js/date.js"></script>
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
<%
t=request("t")
add=request("add")
p=request("p")
if add="yes" then '查询并生成结算记录
if t<>"" then
'获取结算条件总金额
uuid=p
t=Cdate(t)
if Second(t)=0 then t=cdate(t&" 23:59:59")
if uuid="" or isnull(uuid) then
Set rs = Server.CreateObject("ADODB.Recordset")
usql="Select distinct shrlb from [gouwuche] where yjzt=5 and datediff(s,stime,'"&t&"')>0 and siteid="&siteid
rs.open usql,conn,1,1
ct = rs.Recordcount
if not rs.eof then
i=0
do while not rs.eof
if i=0 and rs("shrlb")<>"" then
uuid=rs("shrlb")
elseif rs("shrlb")<>"" then
uuid=uuid&rs("shrlb")
end if
uuid=Replace(uuid,"||","|")
uuid=Replace(uuid,"|0|0|0|0|0|","|")
uuid=Replace(uuid,"|0|0|0|0|","|")
uuid=Replace(uuid,"|0|0|0|","|")
uuid=Replace(uuid,"|0|0|","|")
uuid=Replace(uuid,"|0|0|","|")
i=i+1
rs.movenext
loop
end if
rs.close
set rs=nothing
end if

if instr(uuid,"|")>0 then
uuidlist=","
for u=1 to Ubound(SPLIT(uuid,"|"))-1
if SPLIT(uuid,"|")(u)<>"" and Ubound(SPLIT(uuidlist,","&SPLIT(uuid,"|")(u)&","))=0 then uuidlist=uuidlist&SPLIT(uuid,"|")(u)&","
next
uuid=uuidlist
uuid=right(uuid,len(uuid)-1)
uuid=left(uuid,len(uuid)-1)
end if

if uuid<>"" and instr(uuid,",")>0 then '多用户结算

for j=0 to Ubound(SPLIT(uuid,","))
yue=getyue(SPLIT(uuid,",")(j))
wjjine=getwjyj(SPLIT(uuid,",")(j),5,t)
if wjjine>0 and SPLIT(uuid,",")(j)<>"" then
jsdh=Left("J"&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(6,"NUMB"),13)
conn.execute("insert into [yonjin] (uid,jsdh,fyue,jine,byue,czr,zt,etime,siteid) values("&SPLIT(uuid,",")(j)&",'"&jsdh&"',"&yue&","&wjjine&","&yue+wjjine&",'"&admin&"',1,getdate(),"&siteid&")")
conn.execute "update [member] set UserMoney=UserMoney+"&wjjine&" where id="&SPLIT(uuid,",")(j)
end if
next
for j=0 to Ubound(SPLIT(uuid,","))
if SPLIT(uuid,",")(j)<>"" then
conn.execute "update [gouwuche] set yjzt=9,etime=getdate() where yjzt=5 and shrlb like '%|"&SPLIT(uuid,",")(j)&"|%' and datediff(s,stime,'"&cdate(t)&"')>0"
end if 
next

elseif uuid<>"" then '单用户结算

yue=getyue(uuid)
wjjine=getwjyj(uuid,5,t)
if wjjine>0 then
jsdh=Left("Y"&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(6,"NUMB"),13)
conn.execute("insert into [yonjin] (uid,jsdh,fyue,jine,byue,czr,zt,etime,siteid) values("&uuid&",'"&jsdh&"',"&yue&","&wjjine&","&yue+wjjine&",'"&admin&"',1,getdate(),"&siteid&")")
conn.execute "update [gouwuche] set yjzt=9,etime=getdate() where yjzt=5 and shrlb like '%|"&uuid&"|%' and datediff(s,stime,'"&cdate(t)&"')>0"
conn.execute "update [member] set UserMoney=UserMoney+"&wjjine&" where id="&uuid
end if

end if
if uuid="" then
response.write "<script LANGUAGE='javascript'>alert('未找到符合条件的佣金记录，无需结算！');history.go(-1);</script>"
else
response.write "<script LANGUAGE='javascript'>alert('已结算完成！');</script>"
end if
else
response.write "<script LANGUAGE='javascript'>alert('请正确输入结算条件！');history.go(-1);</script>"
end if
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
TblName = "[gouwuche]"
FldName = "atime" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,pid,uid,ulx,sl,dj,dj2,yh,yh2,zj,zj2,cb,zcb,atime,stime,etime,ddh,ghsid,sku_sm,sku_id,Fanli,xslx,shrlb,yjzt,yonjin"
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
if search<>"" then
if key<>"" and search="complete" then StrWhere=" ddh='"&key&"'"
if key<>"" and (search="blur" or search="") then StrWhere=" (ddh like '%"&key&"%' or shrlb like '%"&key&"%')"
else
if key<>"" then StrWhere=" (ddh like '%"&key&"%' or shrlb like '%"&key&"%')"
if gsjc(key,4) then
suid=getuserid(key)
StrWhere=" (uid="&suid&" or shrlb like '%|"&key&"%|')"
end if
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
    <form name="form1" method="post" action="/admin/shouhuo_List" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 佣金管理 &gt; 佣金明细</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td hidden>结算用户ID：<input name="p" type="text" id="p" size="10" class="keyword"  value="<%=request("p")%>">(会对关联用户进行结算，留空对所有用户结算)</td><td>结算截止日期：<input name="t" type="text" id="t" size="13" class="keyword" value="<%=t%>" onclick="javascript:calendar.setHook(this)"> <input type="button" class="submit" name="search" value="结 算" onClick="location='?act=js&add=yes&t='+document.form1.t.value+'&p='+document.form1.p.value" /> 总已结算佣金：<%=getzyjsyj()%> 总未结算佣金：<%=getzwjsyj()%></td>
        <td align="right">关健字：<input name="txtKeywords" type="text" id="txtKeywords" class="keyword" value="<%=key%>" /> <input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th>ID</th>
        <th>销售产品</th>
        <th>销售金额</th>
        <th>所属用户</th>
        <th>订单号</th>
        <th>销售类型</th>
        <th>产品佣金比例</th>
        <th>佣金收获人列表</th>
        <th>总佣金</th>
        <th>创建时间</th>
        <th>生效时间</th>
        <th>结算时间</th>
        <th>状态</th>
      </tr>
<%if FieldCount>0 then
do while not rs.eof
yonjin=0
proinfo=getproinfo(rs("pid"))
if proinfo<>"" then
pname=SPLIT(proinfo&"||||||||","||")(0)
pimg=SPLIT(proinfo&"||||||||","||")(1)
price2=SPLIT(proinfo&"||||||||","||")(2)
jifen3=SPLIT(proinfo&"||||||||","||")(3)
jifen1=SPLIT(proinfo&"||||||||","||")(4)
end if
if rs("xslx")=0 then xstxt="自营产品"
if rs("xslx")=1 then xstxt="入驻产品"
if isnull(rs("ddh")) then
zt="添加到购物车"
elseif rs("yjzt")=0 then
zt="已生成待生效"
elseif rs("yjzt")=5 then
zt="已生成待结算"
elseif rs("yjzt")=9 then
zt="已生成已结算"
elseif rs("yjzt")=4 then
zt="已退款已失效"
elseif rs("yjzt")=7 then
zt="已取消已失效"
else
zt="未知状态"
end if%>
      <tr>
        <td align="center" height="23"><%=rs("id")%></td>
        <td align="center"><a href="/trade/goods-<%=rs("pid")%>.html" target="_blank"><%=pname%></a></td>
        <td align="center"><%=gshjg(rs("zj"))%></td>
        <td><%=rs("uid")%></a></td>
        <td><a href="/orderDetail?act=show&orderno=<%=rs("ddh")%>" target="_blank"><%=rs("ddh")%></a></td>
        <td align="center"><%=xstxt%></td>
        <td align="center"><%=rs("Fanli")%></td>
        <td align="center"><%=rs("shrlb")%></td>
        <td align="center"><%if (isnull(rs("yonjin")) or rs("yonjin")=0) and rs("dj2")=0 then%>
<%yonjin=(rs("zj")-rs("zcb"))*(Ccur(split(rs("Fanli"),"|")(1))+Ccur(split(rs("Fanli"),"|")(2))+Ccur(split(rs("Fanli"),"|")(3))+Ccur(split(rs("Fanli"),"|")(4))+Ccur(split(rs("Fanli"),"|")(5))+Ccur(split(rs("Fanli"),"|")(6)))
if yonjin>0 then conn.execute "update [gouwuche] set yonjin="&yonjin&" where id="&rs("id")
%><%=yonjin%><%elseif rs("dj2")=0 then%><%=rs("yonjin")%><%else%>0<%end if%></td> 
        <td align="center"><%=rs("atime")%></td>
        <td align="center"><%=rs("stime")%></td>
        <td align="center"><%=rs("etime")%></td>
        <td align="center"><%=zt%></td>
      </tr>
<%rs.movenext
zt=""
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