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

Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [webconfig] where siteid="&siteid
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
txtWebName=rs("txtWebName")
txtWebUrl=rs("txtWebUrl")
txtFanli=rs("txtFanli")
txtFanli2=rs("txtFanli2")
txtHuilv=rs("txtHuilv")
rbnotice=rs("rbnotice")
txtnoticetile=rs("txtnoticetile")
txtnoticecontent=rs("txtnoticecontent")
txtSysCopyright=rs("txtSysCopyright")
Multilingual=rs("Multilingual")
txtWebEnglishName=rs("txtWebEnglishName")
txtWebTel=rs("txtWebTel")
txtKfQQ=rs("txtKfQQ")
txtWebFax=rs("txtWebFax")
txtWebEmail=rs("txtWebEmail")
txtWebCrod=rs("txtWebCrod")
txtWebCopyright=rs("txtWebCopyright")
txtWebProSize=rs("txtWebProSize")
txtWebNewsSize=rs("txtWebNewsSize")
txtWebKeywords=rs("txtWebKeywords")
txtWebDescription=rs("txtWebDescription")
rblWebLogStatus=rs("rblWebLogStatus")
txtWebKillKeywords=rs("txtWebKillKeywords")
txtWebFilePath=rs("txtWebFilePath")
txtWebFileType=rs("txtWebFileType")
txtWebFileSize=rs("txtWebFileSize")
rblIsThumbnail=rs("rblIsThumbnail")
txtProWidth=rs("txtProWidth")
txtProHight=rs("txtProHight")
rblIsWatermark=rs("rblIsWatermark")
rblWatermarkStatus=rs("rblWatermarkStatus")
txtImgQuality=rs("txtImgQuality")
txtImgWaterPath=rs("txtImgWaterPath")
txtImgWaterTransparency=rs("txtImgWaterTransparency")
txtWaterText=rs("txtWaterText")
ddlWaterFont=rs("ddlWaterFont")
txtFontSize=rs("txtFontSize")
else
Response.Write "<Script Language=JavaScript>alert('信息有误！');history.go(-1);</Script>"
Response.end
end if
rs.close
set rs=nothing

if instr(a,"_Add")>0 or instr(a,"_Edit")>0 then '发布商品
if ubound(split(a,"_"))=2 then id=int(split(a,"_")(2))
if id>0 and instr(a,"_Edit")>0 then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [product] where siteid="&siteid&" and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
catid=rs("catid")
catidlist=rs("catidlist")
brandid=rs("brandid")
Title=rs("name")
ontime=rs("ontime")
price1=rs("price1")
price2=rs("price2")
price3=rs("price3")
qpsl=rs("qpsl")
weight=rs("weight")
Package_weight=rs("Package_weight")
volume_weight=rs("volume_weight")
pic1=rs("pic1")
pic2=rs("pic2")
pic3=rs("pic3")
pic4=rs("pic4")
pic5=rs("pic5")
pic6=rs("pic6")
pic7=rs("pic7")
pic8=rs("pic8")
huohao=rs("huohao")
colors=rs("colors")
sizes=rs("sizes")
guige=rs("guige")
zuhe=rs("zuhe")
homepic=rs("homepic")
Keywords=rs("Keywords")
Descriptions=rs("Descriptions")
jifen1=rs("jifen1")
jifen2=rs("jifen2")
jifen3=rs("jifen3")
content=rs("content")
onsale=rs("onsale")
recommend=rs("recommend")
kucun=rs("kucun")
viewnum=rs("viewnum")
danwei=rs("danwei")
ordercount=rs("ordercount")
xslx=rs("xslx")
ghsid=rs("ghsid")
Fanli=rs("Fanli")
else
Response.Write "<Script Language=JavaScript>alert('信息有误！');history.go(-1);</Script>"
Response.end
end if
rs.close
set rs=nothing
end if
dim ii
ii=0
sub sort(selec)
sql="select * from category where ParentID = "&selec&" and hide=0 and category<>'' and category is not null order by categoryorder"
Server.ScriptTimeOut=18000 
set rs1 = server.createobject("adodb.recordset")
rs1.open sql,conn,1,1 
if not rs1.eof then 
do while not rs1.eof
if selec=0 then
%>
<option value="<%=int(rs1("id"))%>" <%if int(rs1("id"))=int(catid) Then Response.write(" Selected") %>><%=rs1("category")%></option>
<%
else
%>
<option value="<%=int(rs1("id"))%>" <%if int(rs1("id"))=int(catid) Then Response.write(" Selected") %>><%=string(ii*2,"　")%><%=rs1("category")%></option>
<%
end if
ii=ii+1
sort rs1("id")
ii=ii-1
rs1.movenext
loop
rs1.close
Set Rs1 = Nothing
end if 
end sub%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	<%if instr(a,"_Add")>0 then%>发布<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>商品
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
    <script type="text/javascript" src="/admin/js/singleupload.js"></script>
    <script type="text/javascript" charset="utf-8" src="/admin/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/admin/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="/admin/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="/js/tooltips.js"></script>
    <script type="text/javascript">
        $(function() {
            //显示关闭高级选项
            $("#upordown").toggle(function() {
                $(this).text("关闭高级选项");
                $(this).removeClass();
                $(this).addClass("up-01");
                $(".upordown").show();
            }, function() {
                $(this).text("显示高级选项");
                $(this).removeClass();
                $(this).addClass("up-02");
                $(".upordown").hide();
            });
        });
    </script>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
</script>

</head>
<body style="padding:10px;">
    <form name="form1" method="post" action="/admin/Product_Add" id="form1">
    <div class="navigation">
      <span class="back"><a href="/admin/Product_List">返回列表</a></span><b>您当前的位置：首页 &gt; 商品管理 &gt; <%if instr(a,"_Add")>0 then%>发布<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>商品</b>
    </div>
    <div style="padding-bottom:10px;"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
            <tr>
            <th colspan="2" align="left"><%if instr(a,"_Add")>0 then%>发布<%end if%><%if instr(a,"_Edit")>0 then%>编辑<%end if%>商品</th>
        </tr>
        <tr>
            <td width="15%" align="right">选择分类：</td>
            <td width="85%"><select name="catid" class="inputcc" id="catid" onChange="selectbrand(this.value);selectcatid2(this.value)" > 
	<option value="">请选择所属分类...</option>
<%cat1=0
set rs=server.createobject("adodb.recordset")
exec="select * from [category] where (ParentID=1 or ParentID=2 or ParentID=972) and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if a=rs("id") then category=rs("category")
if instr(catidlist,"|"&rs("id")&"|")>0 then cat1=rs("id")
%><option value='<%=rs("id")%>'<%if catid=rs("id") or instr(catidlist,"|"&rs("id")&"|")>0 then%> selected<%end if%>><%=rs("category")&rs("id")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</select>
<select name="catid2" class="inputcc" id="catid2" onChange="selectbrand(this.value);selectcatid3(this.value)" > 
	<option value="">请选择子分类...</option>
</select>
<select name="catid3" class="inputcc" id="catid3" > 
	<option value="">请选择子分类...</option>
</select>　<%if int(catid)>0 then%><%=getcatname(catid)%><%end if%></td>
        </tr>
        <tr>
            <td align="right">关联分类：</td>
            <td><input name="catidlist" type="text" id="catidlist" value="<%if instr(catidlist,"$")>0 then%><%=split(catidlist,"$")(1)%><%end if%>" class="input w380 required" HintTitle="输入分类ID，多分类用|分隔" HintInfo="输入分类ID，多分类用|分隔" /> 选填项</td>
        </tr>
        <tr>
            <td align="right">选择品牌：</td>
            <td><select class="inputcc" name="brandid" id="brandid"> 
			<option value="0">请选择品牌</option> 
<%if brandid<>"" then%><option value='<%=brandid%>' selected><%=getbrandname(brandid)%></option><%end if%>
<%'sort0(0)%></select></td>
        </tr>
        <tr>
            <td align="right">商品标题：</td>
            <td>
            <input name="name" type="text" maxlength="250" id="name" value="<%=Title%>" class="input w380 required" minlength="3" HintTitle="发布的商品标题" HintInfo="控制在100个字数内，标题文本尽量不要太长。" />
            </td>
        </tr>
        <tr>
            <td align="right">上架时间：</td>
            <td>
                <input name="ontime" type="text" value="<%if ontime="" then%><%=now()%><%else%><%=ontime%><%end if%>" maxlength="50" id="ontime" class="必填" HintTitle="商品上架时间" HintInfo="请输入标准的时间格式”。" /></td>
        </tr>
	  <tr >
         <td align="right">商品价格：</th>
        <td><div class="p_relative"  style="z-index:3;">  
            <div id="toContainer">市场价：<input name="price1" type="text" id="price1" size="4" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" VALUE="<%=price1%>">
              元，会员价： 
              <input name="price2" type="text" id="price2" value="<%=price2%>" size="4" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')">
              元；批发价： 
              <input name="price3" type="text" id="price3" value="<%=price3%>" size="4" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')">
              元，起批数量：<input name="qpsl" type="text" id="qpsl" value="<%if qpsl="" then%>100<%else%><%=qpsl%><%end if%>" size="4" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></div></div></td>
      </tr>  
        <tr>
            <td align="right">商品单位：</td>
            <td>
            <input name="danwei" type="text" id="danwei" value="<%=danwei%>" class="input required" size="4" HintTitle="发布的商品单位" HintInfo="输入商品单位" />
            </td>
        </tr>
        <tr>
            <td align="right">商品款色：</td>
            <td>
            <input name="colors" type="text" id="colors" value="<%=colors%>" class="input w380 required" HintTitle="发布的商品款色，多款色用|分隔" HintInfo="输入商品款色" /> 选填项
            </td>
        </tr>
        <tr>
            <td align="right">商品尺寸：</td>
            <td>
            <input name="sizes" type="text" id="sizes" value="<%=sizes%>" class="input w380 required" HintTitle="发布的商品尺寸，多尺寸用|分隔" HintInfo="输入商品尺寸" /> 选填项
            </td>
        </tr>
        <!--<tr>
            <td align="right">商品规格：</td>
            <td>
            <input name="guige" type="text" id="guige" value="<%=guige%>" class="input w380 required" HintTitle="发布的商品规格，多规格用|分隔" HintInfo="输入商品规格" /> 选填项
            </td>
        </tr>
       <tr>
            <td align="right">商品组合：</td>
            <td>
            <input name="zuhe" type="text" id="zuhe" value="<%=zuhe%>" class="input w380 required" size="4" HintTitle="发布的商品组合，多组合用|分隔" HintInfo="输入商品组合" /> 选填项
            </td>
        </tr>-->
        <tr>
            <td align="right">商品重量：</td>
            <td>
<div class="p_relative"  style="z-index:3;">  
            <div id="toContainer">净重：<input name="weight" type="text" id="weight" size="4" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')" VALUE="<%=weight%>">
              KG，毛重： 
              <input name="Package_weight" type="text" id="Package_weight" value="<%=Package_weight%>" size="5" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')">
              KG，体积重： 
              <input name="volume_weight" type="text" id="volume_weight" value="<%=volume_weight%>" size="5" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')">
              KG</div></div>            </td>
        </tr>
      <tr  width="70%">
        <td align="right" valign="top">商品图片：</th>
        <td valign="top"><div class="p_relative"  style="z-index:3;">  
            <div id="toContainer"><table><tr><td align="center"  valign="top">
		   
		  <input name="pic1" type="hidden" id="pic1" size="48" VALUE="<%=pic1%>"> 
		  <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic1&set2=pics1','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic1="" then%><img src="images/ditu0.jpg" width="80" id="pics1" ></a><%else%><img src="<%=pic1%>" width="80" id="pics1" ></a><span id="dpic1"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic1%>','pic1',pics1,dpic1)" value="删除" class="submit"></span><%end if%>
		   </td><td align="center"  valign="top">
		  <input name="pic2" type="hidden" id="pic2" size="48" VALUE="<%=pic2%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic2&set2=pics2','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic2="" then%><img src="images/ditu.gif" width="80" id="pics2" ></a><%else%><img src="<%=pic2%>" width="80" id="pics2" ></a><span id="dpic2"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic2%>','pic2',pics2,dpic2)" value="删除" class="submit"></span><%end if%>
		   </td><td align="center"  valign="top">
		  <input name="pic3" type="hidden" id="pic3" size="48" VALUE="<%=pic3%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic3&set2=pics3','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic3="" then%><img src="images/ditu.gif" width="80" id="pics3" ></a><%else%><img src="<%=pic3%>" width="80" id="pics3" ></a><span id="dpic3"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic3%>','pic3',pics3,dpic3)" value="删除" class="submit"></span><%end if%>
		   </td><td align="center"  valign="top">
		  <input name="pic4" type="hidden" id="pic4" size="48" VALUE="<%=pic4%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic4&set2=pics4&set3=dpic4','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic4="" then%><img src="images/ditu.gif" width="80" id="pics4" ></a><%else%><img src="<%=pic4%>" width="80" id="pics4" ></a><span id="dpic4"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic4%>','pic4',pics4,dpic4)" value="删除" class="submit"></span><%end if%>
		  </td><td align="center"  valign="top">
		  <input name="pic5" type="hidden" id="pic5" size="48" VALUE="<%=pic5%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic5&set2=pics5','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic5="" then%><img src="images/ditu.gif" width="80" id="pics5" ></a><%else%><img src="<%=pic5%>" width="80" id="pics5" ></a><span id="dpic5"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic5%>','pic5',pics5,dpic5)" value="删除" class="submit"></span><%end if%>
		   </td><td align="center"  valign="top">
		  <input name="pic6" type="hidden" id="pic6" size="48" VALUE="<%=pic6%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic6&set2=pics6','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic6="" then%><img src="images/ditu.gif" width="80" id="pics6" ></a><%else%><img src="<%=pic6%>" width="80" id="pics6" ></a><span id="dpic6"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic6%>','pic6',pics6,dpic6)" value="删除" class="submit"></span><%end if%>
		  </td><td align="center"  valign="top">
		  <input name="pic7" type="hidden" id="pic7" size="48" VALUE="<%=pic7%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic7&set2=pics7','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic7="" then%><img src="images/ditu.gif" width="80" id="pics7" ></a><%else%><img src="<%=pic7%>" width="80" id="pics7" ></a><span id="dpic7"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic7%>','pic7',pics7,dpic7)" value="删除" class="submit"></span><%end if%>
		  </td><td align="center"  valign="top">
		  <input name="pic8" type="hidden" id="pic8" size="48" VALUE="<%=pic8%>"> 
		   <a href="javascript:void(0)"  onClick="javascript:window.open('upfile1.asp?formname=form1&editname=pic8&set2=pics8','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')">
		  <%if pic8="" then%><img src="images/ditu.gif" width="80" id="pics8" ></a><%else%><img src="<%=pic8%>" width="80" id="pics8" ></a><span id="dpic8"><br><input type="button" onClick="delpic(<%=id%>,'<%=pic8%>','pic8',pics8,dpic8)" value="删除" class="submit"></span><%end if%>
		   </td></tr></table></div></div></td>
      </tr>
        <tr>
            <td align="right">首页推荐：</td>
            <td><%if homepic<>"" then%><img src="<%=homepic%>" width="80" /><br /><%end if%>
                <input name="txtImgUrl" type="text" id="txtImgUrl" class="input w250 left"<%if homepic<>"" then%> value="<%=homepic%>"<%end if%> />
                <a href="javascript:void(0);" class="files"><input type="file" id="FileUpload" name="FileUpload" /></a>
                <span class="uploading">正在上传，请稍候...</span>
            最合适大小为400*400 <font color="#FF0000">非首页推荐产品请留空</font></td>
        </tr>
        <tr>
            <td align="right">商品货号：</td>
            <td>
            <input name="huohao" type="text" maxlength="250" id="huohao" value="<%=huohao%>" class="input w380 required" minlength="3" HintTitle="发布的商品货号" HintInfo="控制在20个字数内，商品货号尽量不要太长。" />
            <span id="upordown" class="up-02">显示高级选项</span></td>
        </tr>
        <tr class="upordown hide">
            <td align="right">Meta关键字：</td>
            <td>
            <input name="Keywords" value="<%=Keywords%>" type="text" maxlength="100" id="Keywords" class="input w250" HintTitle="Meta关键字" HintInfo="用于搜索引擎，如有多个关健字请用英文的,号分隔，不填写将自动提取标题。" />
            </td>
        </tr>
        <tr class="upordown hide">
            <td align="right">Meta描述：</td>
            <td>
            <textarea name="Descriptions" rows="2" cols="20" id="Descriptions" class="textarea wh380" HintTitle="Meta描述" HintInfo="用于搜索引擎，控制在250个字数内，不填写将自动提取。"><%=Descriptions%>
</textarea>
            </td>
        </tr>
        <tr class="upordown hide">
            <td align="right">积分规则：</td>
            <td>
<div class="p_relative"  style="z-index:3;">  
            <div id="toContainer">现金+积分购买 最大可用积分：<input name="jifen1" type="text" id="jifen1" size="4" VALUE="<%if jifen1="" then%>0<%else%><%=jifen1%><%end if%>" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
              分【10积分(币)=1元(现金)】，购买商品赠送积分： 
              <input name="jifen2" type="text" id="jifen2" value="<%if jifen2="" then%>0<%else%><%=jifen2%><%end if%>" size="4" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
              分；仅使用积分购买 所需积分： 
              <input name="jifen3" type="text" id="jifen3" value="<%if jifen3="" then%>0<%else%><%=jifen3%><%end if%>" size="4" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
              分</div></div>            </td>
        </tr>
        <tr>
            <td align="right" valign="top">商品细节：</td>
            <td>
            <textarea name="editor" rows="2" cols="20" id="editor" style="height:400px; width:1024px"><%=content%></textarea>
            </td>
        </tr>
        <tr>
            <td align="right">是否上架：</td>
            <td><select name="onsale" id="onsale">
			  <option value="0" >上架</option>
			  <option value="1" <%if int(onsale)=1 Then Response.write(" Selected") %>>下架</option>
			</select>            </td>
        </tr>
        <tr>
            <td align="right">商品类别：</td>
            <td><select name="recommend" id="recommend" >
                <option value="0" >普通商品</option>
                <option VALUE="1" <%if int(recommend)=1 Then Response.write(" Selected") %>>精品推荐</option>
              <option value="2" <%if int(recommend)=2 Then Response.write(" Selected") %>>新品上市</option>
				<option value="3" <%if int(recommend)=3 Then Response.write(" Selected") %>>热卖商品</option>
                <option value="4" <%if int(recommend)=4 Then Response.write(" Selected") %>>首页推荐</option>
                <option value="5" <%if int(recommend)=5 Then Response.write(" Selected") %>>特惠专区</option>
              </select></td>
        </tr>
        <tr>
            <td align="right">销售类别：</td>
            <td><select name="xslx" id="xslx" onChange="chkfanli()" >
                <option value="0" <%if xslx="0" Then Response.write(" Selected") %>>自营产品</option>
                <option VALUE="1" <%if xslx="1" Then Response.write(" Selected") %>>入驻产品</option>
              </select></td>
        </tr>
        <tr>
            <td align="right">供货商选择：</td>
            <td><select name="ghsid" id="ghsid" >
                <option value="1" <%if ghsid="1" Then Response.write(" Selected") %>>三农联盟</option>
                <option VALUE="2" <%if ghsid="2" Then Response.write(" Selected") %>>香港优势</option>
              </select></td>
        </tr>
        <tr>
            <td align="right">商品库存：</td>
            <td>
            <input name="kucun" type="text" value="<%if kucun="" then%>100<%else%><%=kucun%><%end if%>" maxlength="10" id="kucun" class="input required number" size="10" HintTitle="商品库存数量" HintInfo="纯数字，本商品库存数量。" />
            </td>
        </tr>
        <tr>
            <td align="right">浏览次数：</td>
            <td>
            <input name="viewnum" type="text" value="<%if viewnum="" then%>0<%else%><%=viewnum%><%end if%>" maxlength="10" id="viewnum" class="input required number" size="10" HintTitle="商品的浏览次数" HintInfo="纯数字，本商品被浏览的次数。" />
            </td>
        </tr>
        <tr>
            <td align="right">销量：</td>
            <td>
            <input name="ordercount" type="text" value="<%if ordercount="" then%>0<%else%><%=ordercount%><%end if%>" maxlength="10" id="ordercount" class="input required number" size="10" HintTitle="商品的销量" HintInfo="纯数字，本商品被订购的次数。" />
            </td>
        </tr>
        <tr>
            <td align="right">各级佣金比例：</td>
            <td>
            <input name="Fanli" type="text" value="<%=Fanli%>" maxlength="100" id="Fanli" class="input required number" size="48" HintTitle="各级佣金" HintInfo="用|号分隔, 共享会员|VIP会员|社区|县区|市|省运营中心" /> 不单独设置请留空
            </td>
        </tr>
    </table>
    <div style="margin-top:10px;text-align:center;">
  <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onClick="chkProduct()" /><input type="hidden" name="id" id="id" value="<%=id%>" /><input type="hidden" name="backurl" id="backurl" value="/admin/Product_List" />
  &nbsp;
  <input name="重置" type="reset" class="submit" value="重置" />
</div>
</form>
<script type="text/javascript">
function chkfanli(){
        var fanli = $('#xslx option:selected').val();
        if (fanli == 0) {$("#Fanli").val('<%=txtFanli%>');}
        else {$("#Fanli").val('<%=txtFanli2%>');}
    }
function selectbrand(catid) {
	var brandid = '<%=brandid%>'
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/brandcatidapi",
                data: { "catid":catid,"brandid":brandid},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#brandid").empty();
                        $("#brandid").append("<option value='0'>请选择品牌</option>");
                        for (var i = 0; i < msg.length; i++) {
//$("#brandid").append("<option value='" + msg[i].brandID + "'>" + msg[i].brandName + "</option>");
<%if int(brandid)>0 then%>
if (msg[i].brandID=='<%=brandid%>'){$("#brandid").append("<option value='" + msg[i].brandID + "' Selected >" + msg[i].brandName + "</option>");}else{$("#brandid").append("<option value='" + msg[i].brandID + "'>" + msg[i].brandName + "</option>");}<%else%>
$("#brandid").append("<option value='" + msg[i].brandID + "'>" + msg[i].brandName + "</option>");<%end if%>
                        }
                    }
                    else {                        
                        $("#brandid").empty();
                        $("#brandid").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
function selectcatid2(catid) {
	var catidlist = $("#catidlist").val();
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid,"catidlist":catidlist},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid2").empty();
                        $("#catid2").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
//$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
<%if split(catidlist&"||||","|")(2)<>"" then%>
if (msg[i].CatID=='<%=split(catidlist&"||||","|")(2)%>'){$("#catid2").append("<option value='" + msg[i].CatID + "' Selected>" + msg[i].CatName + "</option>");}else{$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");}<%else%>
$("#catid2").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");<%end if%>
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
	var catidlist = $("#catidlist").val();
        $.ajax(
            {
                type: "post",
                dataType: "json", //返回json格式的数据
                url: "/selectcatidapi",
                data: { "catid":catid,"catidlist":catidlist},
                beforeSend: function () { },
                error: function () { alert('出错啦！'); },
                success: function (msg) {
                    if (msg != '0') {
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择子类</option>");
                        for (var i = 0; i < msg.length; i++) {
//$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");
<%if split(catidlist&"||||","|")(3)<>"" then%>
if (msg[i].CatID=='<%=split(catidlist&"||||","|")(3)%>'){$("#catid3").append("<option value='" + msg[i].CatID + "' Selected>" + msg[i].CatName + "</option>");}else{$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");}<%else%>
$("#catid3").append("<option value='" + msg[i].CatID + "'>" + msg[i].CatName + "</option>");<%end if%>
                        }
                    }
                    else {                        
                        $("#catid3").empty();
                        $("#catid3").append("<option value='0'>请选择订单类型</option>");
                    }
                }
            })
 
}
<%if int(catid)>0 then%>$(document).ready(function(){  
window.onload=<%if split(catidlist&"||||","|")(2)<>"" then%>selectbrand('<%=split(catidlist,"|")(2)%>');<%else%>selectbrand(document.all.catid.value);<%end if%> 
}); <%end if%> 
<%if split(catidlist&"||||","|")(1)<>"" then%>$(document).ready(function(){  
window.onload=selectcatid2('<%=split(catidlist,"|")(1)%>');<%if split(catidlist&"||||","|")(2)<>"" then%>selectcatid3('<%=split(catidlist,"|")(2)%>');<%end if%>
}); <%end if%> 
<%if isnull(Fanli) then%>window.onload=chkfanli();<%end if%>
</script>

<script type="text/javascript">
function chkProduct() {    
    var catid = $("#catid").val();
    var catidlist = $("#catidlist").val();
    var catid2 = $("#catid2").val();
    var catid3 = $("#catid3").val();
    var brandid = $("#brandid").val();
    var name = $("#name").val();
    var danwei = $("#danwei").val();
    var ontime = $("#ontime").val();
    var price1 = $("#price1").val();
    var price2 = $("#price2").val();
    var price3 = $("#price3").val();
    var qpsl = $("#qpsl").val();
    var weight = $("#weight").val();
    var colors = $("#colors").val();
    var sizes = $("#sizes").val();
    var guige = $("#guige").val();
    var zuhe = $("#zuhe").val();
    var Package_weight = $("#Package_weight").val();
    var volume_weight = $("#volume_weight").val();
    var pic1 = $("#pic1").val();
    var pic2 = $("#pic2").val();
    var pic3 = $("#pic3").val();
    var pic4 = $("#pic4").val();
    var pic5 = $("#pic5").val();
    var pic6 = $("#pic6").val();
    var pic7 = $("#pic7").val();
    var pic8 = $("#pic8").val();
    var homepic = $("#txtImgUrl").val();
    var huohao = $("#huohao").val();
    var Keywords = $("#Keywords").val();
    var Descriptions = $("#Descriptions").val();
    var jifen1 = $("#jifen1").val();
    var jifen2 = $("#jifen2").val();
    var jifen3 = $("#jifen3").val();
    var content = UE.getEditor('editor').getContent();
    var onsale = $("#onsale").val();
    var recommend = $("#recommend").val();
    var id = $("#id").val();
    var kucun = $("#kucun").val();
    var viewnum = $("#viewnum").val();
    var ordercount = $("#ordercount").val();
    var xslx = $("#xslx").val();
    var ghsid = $("#ghsid").val();
    var Fanli = $("#Fanli").val();
    var backurl = ''; //$("#backurl").val();
    var msg = '';
    if (catid.length == 0) {
        msg += '请选择所属分类！\n';
    }
   // if (catid2) { catid=catid2;}
   // if (catid3) { catid=catid3;}
    if (brandid.length == 0) {
        msg += '请选择品牌！\n';
    }
    if (name.length == 0) {
        msg += '请填写商品名称！\n';
    }
    if (price1.length == 0) {
        msg += '请填写商品市场价！\n';
    }
    if (price2.length == 0) {
        msg += '请填写商品会员价！\n';
    }
    if (price3.length == 0) {
        msg += '请填写商品批发价！\n';
    }
    if (pic1.length == 0) {
        msg += '至少需要一张商品图片！\n';
    }
    if (content.length == 0) {
        msg += '请填写商品细节！\n';
    }
    if (backurl.length == 0) {
        backurl='/admin/Product_List';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(name&&content&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/addProductapi",
data: {"catid": catid,"catid2": catid2,"catid3": catid3,"catidlist": catidlist,"Fanli":Fanli, "brandid": brandid, "name": name, "danwei": danwei, "colors": colors, "sizes": sizes, "guige": guige, "zuhe": zuhe, "homepic": homepic, "ontime": ontime, "price1": price1, "price2": price2, "price3": price3,"qpsl":qpsl,"weight":weight,"Package_weight":Package_weight,"volume_weight":volume_weight,"pic1":pic1,"pic2":pic2,"pic3":pic3,"pic4":pic4,"pic5":pic5,"pic6":pic6,"pic7":pic7,"pic8":pic8,"id":id, "Keywords": Keywords, "Descriptions": Descriptions,"jifen1":jifen1,"jifen2":jifen2,"jifen3":jifen3, "content": content,"huohao": huohao,"onsale": onsale, "recommend": recommend, "kucun": kucun, "viewnum": viewnum,"ordercount":ordercount,"xslx":xslx,"ghsid":ghsid, "backurl": backurl },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '1') {
                alert('<%if id="" then%>添加成功<%else%>修改成功<%end if%>！');
                location.href = backurl;
            }
            else {
                alert('数据异常！');
            }

        }
    })
	}
}
</script>
<script type="text/javascript">
function delpic(id,pic,pname,pics,hpic){
if(id&&pic){
    $.ajax({
        type: "post",
        url: "/admin/delpropicapi",
        data: {"id":id,"pic":pic,"pname":pname,"backurl":backurl},
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (result) {
			if (result){
			var fdata = eval("("+result+")");
			if(fdata.fail){
				show_err_msg(fdata.Word);
			}else{
				//show_msg(fdata.Word,"");
				if (pics=='dpic'){pics.src="images/ditu0.jpg";}else{pics.src="images/ditu.gif";}
				hpic.innerHTML='';
				$("#"+pname).val("");
			}
			}else{alert('反馈数据错误！');}
        }
    })
}
}
</script>
</body>
</html><%elseif instr(a,"_List")>0 then '新闻列表
onsale=request("onsale")
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
if recommend="0" or recommend="1" or recommend="2" or recommend="3" or recommend="4" then osql=" and recommend="&recommend
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
TblName = "[product]"
FldName = "addtime" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,name,pic1,Descriptions,price1,price2,price3,catid,brandid,kucun,ordercount,recommend,addtime,ontime,onsale,ord,czy"
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
if onsale="1" then
ssql="onsale=1"
else
ssql="onsale=0"
end if
StrSql="Select Top "&Clng(PageSizeX)&" "& FieldName &" From "&TblName&" "
if catid=0 then
StrWhere=ssql
else
catlist=getzcat(catid)
if catlist<>"" and isnull(catlist)=false then
zcatlist=SPLIT(catlist,",")
for z=1 to Ubound(zcatlist)
if IsNumeric(SPLIT(catlist,",")(z)) then zcatsql=zcatsql&" or catid="&SPLIT(catlist,",")(z)
next
end if
StrWhere=ssql&" and (catidlist like '%|"&catid&"|%' or catid="&catid&")"
if zcatsql<>"" then StrWhere=ssql&" and (catidlist like '%|"&catid&"|%' or catid="&catid&zcatsql&")"
end if
if search<>"" then
if key<>"" and search="complete" then StrWhere=StrWhere&" and name='"&key&"'"
if key<>"" and (search="blur" or search="") then StrWhere=StrWhere&" and name like '%"&key&"%'"
else
if key<>"" then StrWhere=StrWhere&" and name like '%"&key&"%'"
end if
if key<>"" then skey="&skey=yes"
StrWhere=StrWhere&osql
if PageNo=1 then '如果是第一页时，执行如下代码查库速度快
if StrWhere<>"" then
 StrSql=StrSql&" Where "&StrWhere & StrOrder&""
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
	商品管理<%=catlist%>
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
		    link_to:"?act=s<%=skey%>&onsale=<%=onsale%>&catid=<%=catid%>&brandid=<%=brandid%>&recommend=<%=recommend%>&page=__id__"
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
    <form name="form1" method="post" action="/admin/Product_List" id="form1">
    <div class="navigation"><b>您当前的位置：首页 &gt; 商品管理 &gt; 商品列表</b></div>
    <div class="spClear"></div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="50" align="center">请选择：</td>
        <td><select name="catid" class="inputcc" id="catid" onChange="selectcatid2(this.value)" > 
	<option value="">请选择所属分类...</option>
<%if catid>0 then%><option value='<%=catid%>' selected><%=getcatname(catid)%></option><%end if%>
<%set rs2=server.createobject("adodb.recordset")
exec="select * from [category] where (ParentID=1 or ParentID=2 or ParentID=972) and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs2.open exec,conn,1,1
if rs2.recordcount>0 then
do while not rs2.eof
if a=rs2("id") then category=rs2("category")
%><option value='<%=rs2("id")%>'<%if catid=rs2("id") then%> selected<%end if%>><%=rs2("category")%></option><%		
rs2.movenext
Loop
rs2.close
set rs2=nothing
end if%>
</select> 
<select name="catid2" class="inputcc" id="catid2" onChange="selectcatid3(this.value)" > 
	<option value="">请选择子分类...</option>
</select>
<select name="catid3" class="inputcc" id="catid3"> 
	<option value="">请选择子分类...</option>
</select>&nbsp;<select class="inputcc" name="brandid" id="brandid"> 
			<option value="" selected="selected">请选择品牌</option> 
<%sort0(0)
dim ss
ss=0
sub sort0(selec)
	sql="select * from brand where ParentID = "&selec&" order by brandorder"
	Set Rs1=Conn.Execute(sql)
	do while not rs1.eof
if selec=0 then
%>
<option value="<%=int(rs1("id"))%>" <%if int(rs1("id"))=brandid Then Response.write(" Selected") %>><%=rs1("brand")%></option>
<%
else
%>
<option value="<%=int(rs1("id"))%>" <%if int(rs1("id"))=brandid Then Response.write(" Selected") %>><%=string(ss*2,"　")%><%=rs1("brand")%></option>
<%
end if
ss=ss+1
	sort0 rs1("id")
ss=ss-1
	rs1.movenext
	loop
rs1.close
Set Rs1 = Nothing
end sub
%></select>&nbsp;
            <select name="recommend" id="recommend" class="select">
	<option selected="selected" value="">所有类性</option>
	<option value="0"<%if recommend="0" then%> selected<%end if%>>普通商品</option>
	<option value="1"<%if recommend="1" then%> selected<%end if%>>精品推荐</option>
	<option value="2"<%if recommend="2" then%> selected<%end if%>>新品上市</option>
	<option value="3"<%if recommend="3" then%> selected<%end if%>>热卖产品</option>
    <option value="4"<%if recommend="4" then%> selected<%end if%>>首页推荐</option>
    <option value="5"<%if recommend="5" then%> selected<%end if%>>特惠专区</option>
</select>
        <span class="add"><a href="/admin/Product_Add">发布商品</a></span> &nbsp; <span class="add"><%if onsale="1" then%><a href="/admin/Product_List?act=s&onsale=0">显示上架</a><%else%><a href="/admin/Product_List?act=s&onsale=1">显示下架</a><%end if%></span></td>
        <td width="50" align="right">关健字：</td>
        <td width="150"><input name="txtKeywords" type="text" id="txtKeywords" class="keyword" value="<%=key%>" /><input type="hidden" name="onsale" id="onsale" value="<%=onsale%>" /></td>
        <td width="60" align="center"><input type="submit" name="btnSelect" value="查询" id="btnSelect" class="submit" /></td>
        </tr>
    </table>
    <div class="spClear"></div>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <!--<th>选择</th>-->
        <th>编号|排序</th>
        <th>图片</th>
        <th align="left">商品名称</th>
        <th>分类</th>
        <th>品牌</th>
        <th>库存</th>
        <th>发布时间/上架时间</th>
        <th>价格</th>
        <th>类型/上架</th>
        <th>操作</th>
        <th nowrap>添加人</th>
      </tr>
<%if FieldCount>0 then
do while not rs.eof%>
      <tr>
        <!--<td align="center"><span class="checkall"><input id="rptList<%=rs("id")%>" type="checkbox" name="rptList[]" /></span></td>-->
        <td align="center"><%=rs("id")%> | <input type="text" name="p5<%=rs("id")%>" style="line-height:10px;width:25px;height:20px;border:1px solid #ccc"  onKeyUp="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" onKeyPress="this.value=this.value.replace(/\D/g,'')" value='<%=replace(rs("ord"),"99999","")%>'></td>
        <td align="center"><%if rs("Pic1")<>"" then %><a href="/trade/goods_<%=rs("id")%>" target="_blank"><img src="<%=rs("pic1")%>" border="0" width="50" height="50" onload="javascript:DrawImage(this,50,50);"/></a><%else%>没有图片<%end if%></td>
        <td><a href="/admin/Product_Edit_<%=rs("id")%>"><%=rs("name")%></a></td>
        <td align="center"><%=getcatname(rs("catid"))%></td>
        <td align="center"><%=getbrandname(rs("brandid"))%></td>
        <td align="center"><%=rs("kucun")%></td>
        <td align="center"><%=rs("addtime")%><br /><%=rs("ontime")%></td>
        <td align="left">市场价 <%=gshjg(rs("price1"))%><br />销售价 <%=gshjg(rs("price2"))%><br />批发价 <%=gshjg(rs("price3"))%></td>
        <td align="center"><%if rs("recommend")=0 then%>普通商品<%end if%><%if rs("recommend")=1 then%>精品推荐<%end if%><%if rs("recommend")=2 then%>新品上市<%end if%><%if rs("recommend")=3 then%>热卖商品<%end if%><%if rs("recommend")=4 then%>首页推荐<%end if%>/<%if rs("onsale")=0 then%>上架中<%else%>已下架<%end if%></td>
        <td align="center"><span><a href="/admin/Product_Edit_<%=rs("id")%>" target="_blank">修改</a></span> <span id="sh<%=rs("id")%>"><a href="#" onClick="sxj(<%=rs("id")%>,sh<%=rs("id")%>,<%=rs("onsale")%>);" ><%if rs("onsale")=0 then%>下架<%else%>上架<%end if%></a></span></td><td align="center"><%=rs("czy")%></td>
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
                <!--<span class="btn_all" onClick="checkAll(this);">全选</span>
                <span class="btn_bg">
                  <a onClick="return confirm( &#39;确定要删除这些记录吗？ &#39;);" id="lbtnDel" href="javascript:__doPostBack(&#39;lbtnDel&#39;,&#39;&#39;)">删 除</a>
                </span>-->
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
function sxj(id,shid,zt){
	if(zt=='1'){var cztxt = '上架';}else{var cztxt = '下架';}
	$.alerts.okButton = cztxt;
	$.alerts.cancelButton = "取消";
	jAlert("操作确认？",cztxt,function Backreturn(isFlag){
		if(isFlag){
		$.post('/sxjapi',{'id':id,'onsale':zt},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.flag=='1'){
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}
shid.innerHTML="<font color=blue>已"+cztxt+"</font>";
			}else{
				if(rdata.msg!=null&&rdata.msg!=''){
					alert(rdata.msg);
				}else{
					alert('网络连接失败！请重试');
				}
			}
		},'json')

		}
	});
	}
</script><link href="/js/css/alert.css" rel="stylesheet" type="text/css" /><script src="/js/alert.js"></script>
</body>
</html><%end if%>