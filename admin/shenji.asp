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

page=Request("page")
if page="" or isnull(page) then page=0
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
TblName = "[shenji]"
FldName = "atime" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,uid,atime,cj,ocj,sjsm,czr"
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
if key<>"" then StrWhere=" (ddh like '%"&key&"%' or sname like '%"&key&"%' or khh like '%"&key&"%' or khzh like '%"&key&"%')"
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
	升级管理
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" /><link href="/css/pagination.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type='text/javascript' src='/js/jquery.js'></script>
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
    <form name="form1" method="post" action="/admin/payout_List" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 升级管理 &gt; 升级明细</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right">关健字：<input name="txtKeywords" type="text" id="txtKeywords" class="keyword" value="<%=key%>" /> <input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th width="5%">ID</th>
        <th width="8%">升级用户</th>
        <th>升级前级别</th>
        <th>升级后级别</th>
        <th>升级说明</th>
        <th>操作人</th>
        <th>创建时间</th>
      </tr>
<%if FieldCount>0 then
do while not rs.eof
i=1%>
      <tr>
        <td align="center" height="23"><%=rs("id")%></td>
        <td align="center"><%=getusersj(rs("uid"))%></td>
        <td align="center"><%=SPLIT("普通会员,共享会员,VIP会员,社区运营中心,县区运营中心,市运营中心,省运营中心",",")(rs("ocj"))%></td>
        <td align="center"><%=SPLIT("普通会员,共享会员,VIP会员,社区运营中心,县区运营中心,市运营中心,省运营中心",",")(rs("cj"))%></td>
        <td align="center"><%=rs("sjsm")%></td>
        <td align="center"><%=rs("czr")%></td>
        <td align="center"><%=rs("atime")%></td>
      </tr>
<%rs.movenext
i=i+1
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
    </form>
<%if instr(cwadmin,"|"&adminid&"|")>0 then%>
<script type="text/javascript">
function oCopy(obj){
obj.select();
tag=document.execCommand("Copy"); //执行浏览器复制命令  
if(tag){  
 alert('复制内容成功');  
}}
function fkcl(id,shid){  
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("您确认处理此笔提现申请吗？","处理提现",function Backreturn(isFlag){
		if(isFlag){
		$.post('/fkclapi',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}
shid.innerHTML="<input type=button name=Submit value=付款完成 class=submit onClick='yfk("+id+",sh"+id+");' > <input type=button class=submit name=Submit value=拒绝提现 onClick='wfk("+id+",sh"+id+");' >";
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});

		}
	});
	}
function yfk(id,shid){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("已支付此笔提现申请吗？操作后不可逆。","付款完成",function Backreturn(isFlag){
		if(isFlag){
		$.post('/yfkapi',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}
shid.innerHTML="<font color=blue>付款完成</font>";
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});

		}
	});
	}
function wfk(id,shid){
	$.alerts.okButton = "确认";
	$.alerts.cancelButton = "取消";
	jAlert("拒绝提现？操作后提现金额会退回余额。","拒绝提现",function Backreturn(isFlag){
		if(isFlag){
		$.post('/wfkapi',{'id':id},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}
shid.innerHTML="<font color=blue>已拒绝</font>";
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json').error(function(){
			alert('网络连接失败！请重试');
		});

		}
	});
	}
</script><link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script><%end if%>
</body>
</html><%end if%>