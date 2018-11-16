<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
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
if atype=1 then
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('没有订单查看权限。');history.go(-1);</Script></body></html>"
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
set rs=nothing%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	系统参数设置
</title><link rel="stylesheet" href="/admin/css/style.css" type="text/css" />
<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/messages_cn.js"></script>
<script type="text/javascript" src="/js/focus.js"></script>
</head>
<body style="padding:10px;">
<form name="form1" method="post" action="Admin_config.aspx" id="form1">

<div class="navigation"><b>您当前的位置：首页 &gt; 系统管理 &gt; 系统参数设置</b></div>
<div style="padding-bottom:10px;"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
<tbody>
  <tr>
    <th colspan="2" align="left">系统基本设置（注意：如果你不是专业人员请勿改动，只有开放文件的读写权限才能修改）</th>
  </tr>
  <tr>
    <td width="25%" align="right">网站标题：</td>
    <td width="75%">
        <input name="txtWebName" type="text" value="<%=txtWebName%>" maxlength="500" id="txtWebName" class="input required" size="48" HintTitle="系统的名称" HintInfo="给你的系统起个有意义的名字哦，长度不能超过500个字符。" />
    </td>
  </tr>
  <tr>
    <td align="right">网站域名：</td>
    <td>
	<input name="txtWebUrl" type="text" value="<%=txtWebUrl%>" maxlength="100" id="txtWebUrl" class="input required" size="48" HintTitle="网站的域名" HintInfo="请以http://为开头填写，长度不能超过100个字符。" />
    </td>
  </tr>
  <tr>
    <td align="right">自营产品佣金比例：</td>
    <td>
	<input name="txtFanli" type="text" value="<%=txtFanli%>" maxlength="100" id="txtFanli" class="input required number" size="48" HintTitle="各级佣金" HintInfo="用|号分隔" />
    </td>
  </tr>
  <tr>
    <td align="right">入驻产品佣金比例：</td>
    <td>
	<input name="txtFanli2" type="text" value="<%=txtFanli2%>" maxlength="100" id="txtFanli2" class="input required number" size="48" HintTitle="各级佣金" HintInfo="用|号分隔" />
    </td>
  </tr>
<!--
  <tr>
    <td align="right">当天汇率：</td>
    <td>
	<input name="txtHuilv" type="text" value="<%=txtHuilv%>" maxlength="20" id="txtHuilv" class="input required number" size="25" HintTitle="当天马币兑换人民币的汇率" HintInfo="如1.83" />
    </td>
  </tr>
<!--
   <tr>
    <td align="right">是否开启公告：</td>
    <td>
        <span id="rbnotice"><input id="rbnotice_0" type="radio" name="rbnotice" value="0"<%if rbnotice=0 then%> checked="checked"<%end if%> /><label for="rbnotice_0"> 是</label><input id="rbnotice_1" type="radio" name="rbnotice" value="1"<%if rbnotice=1 then%> checked="checked"<%end if%> /><label for="rbnotice_1"> 否</label></span>
    </td>
  </tr>
  
  
  <tr>
    <td align="right">公告标题：</td>
    <td>	
        <input name="txtnoticetile" type="text" value="<%=txtnoticetile%>" maxlength="50" id="txtnoticetile" class="input" size="48" HintTitle="系统公告标题" HintInfo="填写的字数尽量不要超过范围" />
      </td>
  </tr>
  
  
  <tr>
    <td align="right">公告内容：<br />
      </td>
    <td>
<textarea name="txtnoticecontent" rows="2" cols="20" id="txtnoticecontent" class="textarea" HintTitle="公告的内容" HintInfo="该信息将会显示在网站的首页公告处。" style="width:300px;height:80px;"><%=txtnoticecontent%></textarea>
    </td>
  </tr>
  
  
  <tr>
    <td align="right">网站授权号码：</td>
    <td>	
        <input name="txtSysCopyright" type="text" value="<%=txtSysCopyright%>" maxlength="50" id="txtSysCopyright" class="input required" size="48" HintTitle="系统使用版权" HintInfo="去掉所有关于生物云信息科技相关版权http://www.ruid.cc" />
      </td>
  </tr>
 
  
  <tr>
    <td align="right">多语言：</td>
    <td>	
        <span id="lbl_WebEnglish"><%=Multilingual%></span>
    </td>
  </tr>
  <tr>
    <td align="right">英文标题：</td>
    <td>	
        <input name="txtWebEnglishName" type="text" value="<%=txtWebEnglishName%>" maxlength="50" id="txtWebEnglishName" class="input required" size="48" HintTitle="系统的英文名称" HintInfo="给你的系统起个有意义的英文名字哦，长度不能超过50个字符。" />
    </td>
  </tr>-->
  <tr>
    <td align="right">办公电话：</td>
    <td>
	<input name="txtWebTel" type="text" value="<%=txtWebTel%>" maxlength="50" id="txtWebTel" class="input required" size="25" HintTitle="办公电话号码" HintInfo="格式如：020-11112222。" />
    </td>
  </tr>
  <tr style="display:none;">
    <td align="right">Cookie打印样式：</td>
    <td></td>
  </tr>
  <tr style="display:none;">
    <td align="right">dpe打印样式：</td>
    <td></td>
  </tr>
  <tr style="display:none;">
    <td align="right">dexi打印样式：</td>
    <td><input name="txtprintstyledexi" type="text" value="position: relative; top: -39px; left: 1418px|position: relative; top: 131px; left: -158px|position: relative; top: 60px; left: 1123px|position: relative; top: 69px; left: -25px|position: relative; top: -139px; left: 233px|position: relative; top: -344px; left: -960px|position: relative; top: -231px; left: 52px|position: relative; top: -235px; left: -646px|position: relative; top: -509px; left: -553px|position: relative; top: -423px; left: -83px|position: relative; top: -530px; left: -390px|" id="txtprintstyledexi" class="input" size="35" HintTitle="QQ客服号码" HintInfo="" /></td>
  </tr>
  <tr style="display:none;">
    <td align="right">com1打印样式：</td>
    <td><input name="txtprintstylecom1" type="text" value="position: relative; top: 345px; left: 1224px|position: relative; top: 142px; left: -9px|position: relative; top: 233px; left: 932px|position: relative; top: 110px; left: 120px|position: relative; top: -97px; left: 368px|position: relative; top: -226px; left: 774px|position: relative; top: -351px; left: 2179px|position: relative; top: -250px; left: -648px|position: relative; top: -490px; left: 1494px|position: relative; top: -339px; left: -59px|position: relative; top: -445px; left: 1094px|" id="txtprintstylecom1" class="input" size="35" HintTitle="QQ客服号码" HintInfo="" /></td>
  </tr>
  <tr>
    <td align="right">客服QQ：</td>
    <td><input name="txtKfQQ" type="text" value="<%=txtKfQQ%>" maxlength="50" id="txtKfQQ" class="input" size="25" HintTitle="客服QQ" HintInfo="方便客户需要QQ咨询" /></td>
  </tr>
  <tr>
    <td align="right">传真号码：</td>
    <td><input name="txtWebFax" type="text" value="<%=txtWebFax%>" maxlength="50" id="txtWebFax" class="input" size="25" HintTitle="传真号码" HintInfo="格式如：020-11112222。" /></td>
  </tr>
 

  <tr>
    <td align="right">管理员信箱：<br /></td>
    <td><input name="txtWebEmail" type="text" value="<%=txtWebEmail%>" maxlength="50" id="txtWebEmail" class="input" size="25" HintTitle="网站管理员信箱" HintInfo="方便客户需要咨询时发送邮件。" /></td>
  </tr>
  <tr>
    <td align="right">网站备案号：</td>
    <td><input name="txtWebCrod" type="text" value="<%=txtWebCrod%>" maxlength="50" id="txtWebCrod" class="input" size="25" HintTitle="网站备案号码" HintInfo="信息产业部申请的合法TCP/IP备案号。" /></td>
  </tr>
  <tr>
    <td align="right">系统版权信息：<br />
      （支持HTML）</td>
    <td>
      <textarea name="txtWebCopyright" rows="2" cols="20" id="txtWebCopyright" class="textarea" HintTitle="网站版权信息" HintInfo="该信息将会显示在网站的底部，支持HTML标志填写，所以请认真填写。" style="width:300px;height:80px;"><%=txtWebCopyright%></textarea>
    </td>
  </tr>
</tbody>
</table><!--
<div class="spClear"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
<tbody>
  <tr>
    <th colspan="2" align="left"><strong>系统参数设置</strong></th>
  </tr>
    <tr>
    <td width="25%" align="right">产品分页数量：</td>
    <td width="75%">
        <input name="txtWebProSize" type="text" value="<%=txtWebProSize%>" maxlength="9" id="txtWebProSize" class="input required digits" HintTitle="产品每页显示数量" HintInfo="纯数字，网站前台产品每页显示的数量。" size="3" />
&nbsp;条</td>
  </tr>
  <tr>
    <td align="right">新闻分页数量：</td>
    <td>
        <input name="txtWebNewsSize" type="text" value="<%=txtWebNewsSize%>" maxlength="9" id="txtWebNewsSize" class="input required digits" HintTitle="新闻每页显示数量" HintInfo="纯数字，网站前台新闻每页显示的数量。" size="3" />
&nbsp;条</td>
  </tr>
  <tr>
    <td align="right">网站关健字：</td>
    <td>
      <input name="txtWebKeywords" type="text" value="<%=txtWebKeywords%>" maxlength="250" id="txtWebKeywords" class="input" HintTitle="网站关健字" HintInfo="搜索引擎可根据网站设置的关健字，以“,”号分隔开。" style="width:300px;" />
    </td>
  </tr>
  <tr>
    <td align="right">网站描述：</td>
    <td>
      <textarea name="txtWebDescription" rows="2" cols="20" id="txtWebDescription" class="textarea" HintTitle="网站描述" HintInfo="搜索引擎可根据网站设置的描述信息，字符小于等于250位字符。" style="width:300px;height:45px;"><%=txtWebDescription%></textarea>
        &nbsp;</td>
  </tr>
  <tr>
    <td align="right">管理日志：</td>
    <td>
        <span id="rblWebLogStatus"><input id="rblWebLogStatus_0" type="radio" name="rblWebLogStatus" value="0"<%if rblWebLogStatus=0 then%> checked="checked"<%end if%> /><label for="rblWebLogStatus_0">开启</label><input id="rblWebLogStatus_1" type="radio" name="rblWebLogStatus" value="1"<%if rblWebLogStatus=1 then%> checked="checked"<%end if%> /><label for="rblWebLogStatus_1">关闭</label></span>
        </td>
  </tr>
    <tr>
    <td align="right">脏话过滤：</td>
    <td>
      <textarea name="txtWebKillKeywords" rows="2" cols="20" id="txtWebKillKeywords" class="textarea" HintTitle="脏话过滤" HintInfo="以“|”号分开，如：我操|我日|妈比，设置后对网站内容进行过滤。" style="width:300px;height:45px;"><%=txtWebKillKeywords%></textarea>
        </td>
  </tr>
</tbody>
</table>
<div class="spClear"></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
<tbody>
  <tr>
    <th colspan="2" align="left"><strong>附件参数设置</strong></th>
  </tr>
  <tr>
    <td width="25%" align="right">文件上传目录：</td>
    <td width="75%">
        <input name="txtWebFilePath" type="text" value="<%=txtWebFilePath%>" maxlength="255" id="txtWebFilePath" class="input required" size="50" HintTitle="文件上传目录" HintInfo="上传图片或附件的目录，该目录将会自动创建在网站根目录下，如：“UploadFiles”。" />
    </td>
  </tr>
  <tr>
    <td align="right">允许文件上传类型：</td>
    <td>
        <input name="txtWebFileType" type="text" value="<%=txtWebFileType%>" maxlength="255" id="txtWebFileType" class="input required" size="50" HintTitle="允许上传文件扩展名" HintInfo="上传图片或附件时用于检测，以英文的|号分隔开，如：“jpg|gif|rar”。" />
                </td>
  </tr>
  <tr>
    <td align="right">允许文件上传大小：</td>
    <td>
        <input name="txtWebFileSize" type="text" value="<%=txtWebFileSize%>" maxlength="9" id="txtWebFileSize" class="input required digits" size="5" HintTitle="允许上传文件大小" HintInfo="整数，如果超过设置的大小将不给予上传。" />
&nbsp;KB </td>
  </tr>
  <tr>
    <td align="right">是否生成产品缩略图：</td>
    <td>
        <span id="rblIsThumbnail"><input id="rblIsThumbnail_0" type="radio" name="rblIsThumbnail" value="0"<%if rblIsThumbnail=0 then%> checked="checked"<%end if%> /><label for="rblIsThumbnail_0"> 是</label><input id="rblIsThumbnail_1" type="radio" name="rblIsThumbnail" value="1"<%if rblIsThumbnail=1 then%> checked="checked"<%end if%> /><label for="rblIsThumbnail_1"> 否</label></span>
    </td>
  </tr>
  <tr>
    <td align="right">产品缩略图大小：</td>
    <td>
        宽：<input name="txtProWidth" type="text" value="<%=txtProWidth%>" maxlength="9" id="txtProWidth" class="input required digits" size="2" />
        &nbsp;高：<input name="txtProHight" type="text" value="<%=txtProHight%>" maxlength="9" id="txtProHight" class="input required digits" size="2" /> &nbsp;（单位：像素）
    </td>
  </tr>
  <tr>
    <td align="right">是否开启水印：</td>
    <td>
        <span id="rblIsWatermark"><input id="rblIsWatermark_0" type="radio" name="rblIsWatermark" value="0"<%if rblIsWatermark=0 then%> checked="checked"<%end if%> /><label for="rblIsWatermark_0">关闭水印 </label><input id="rblIsWatermark_1" type="radio" name="rblIsWatermark" value="1"<%if rblIsWatermark=1 then%> checked="checked"<%end if%> /><label for="rblIsWatermark_1">文字水印 </label><input id="rblIsWatermark_2" type="radio" name="rblIsWatermark" value="2"<%if rblIsWatermark=2 then%> checked="checked"<%end if%> /><label for="rblIsWatermark_2">图片水印 </label></span>
    </td>
  </tr>
  <tr>
    <td align="right">图片水印位置：</td>
    <td>
        <span id="rblWatermarkStatus"><input id="rblWatermarkStatus_0" type="radio" name="rblWatermarkStatus" value="1"<%if rblWatermarkStatus=0 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_0">左上 </label><input id="rblWatermarkStatus_1" type="radio" name="rblWatermarkStatus" value="2"<%if rblWatermarkStatus=1 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_1">中上 </label><input id="rblWatermarkStatus_2" type="radio" name="rblWatermarkStatus" value="3"<%if rblWatermarkStatus=2 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_2">右上 </label><input id="rblWatermarkStatus_3" type="radio" name="rblWatermarkStatus" value="4"<%if rblWatermarkStatus=3 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_3">左中 </label><input id="rblWatermarkStatus_4" type="radio" name="rblWatermarkStatus" value="5"<%if rblWatermarkStatus=4 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_4">居中 </label><input id="rblWatermarkStatus_5" type="radio" name="rblWatermarkStatus" value="6"<%if rblWatermarkStatus=5 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_5">右中 </label><input id="rblWatermarkStatus_6" type="radio" name="rblWatermarkStatus" value="7"<%if rblWatermarkStatus=6 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_6">左下 </label><input id="rblWatermarkStatus_7" type="radio" name="rblWatermarkStatus" value="8"<%if rblWatermarkStatus=7 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_7">中下 </label><input id="rblWatermarkStatus_8" type="radio" name="rblWatermarkStatus" value="9"<%if rblWatermarkStatus=8 then%> checked="checked"<%end if%> /><label for="rblWatermarkStatus_8">右下 </label></span>
    </td>
  </tr>
  <tr>
    <td align="right">图片生成质量：</td>
    <td><input name="txtImgQuality" type="text" value="<%=txtImgQuality%>" maxlength="9" id="txtImgQuality" class="input required digits" size="2" HintTitle="上传图片生成的质量" HintInfo="整数，取值范围 0-100，0质量最低，100质量最高，默认80" /></td>
  </tr>
  <tr>
    <td align="right">图片型水印文件：</td>
    <td><input name="txtImgWaterPath" type="text" value="<%=txtImgWaterPath%>" maxlength="255" id="txtImgWaterPath" class="input required" size="50" HintTitle="图片型水印文件路径" HintInfo="必须为网站根目录下的PNG图片文件，默认为：watermark.png" /></td>
  </tr>
  <tr>
    <td align="right">图片水印透明度：</td>
    <td><input name="txtImgWaterTransparency" type="text" value="<%=txtImgWaterTransparency%>" maxlength="9" id="txtImgWaterTransparency" class="input required digits" size="2" HintTitle="图片水印的透明度" HintInfo="整数，取值范围1--10 (10为不透明)" /></td>
  </tr>
  <tr>
    <td align="right">文字水印内容：</td>
    <td><input name="txtWaterText" type="text" value="<%=txtWaterText%>" maxlength="250" id="txtWaterText" class="input" size="50" HintTitle="文字水印内容" HintInfo="可输入中英文，字符长度250以内，如“本图片出自xxx”。" /></td>
  </tr>
  <tr>
    <td align="right">文字水印设置：</td>
    <td>字体：<select name="ddlWaterFont" id="ddlWaterFont">
	<option selected="selected" value="Arial">Arial</option>
	<option value="Arial Black">Arial Black</option>
	<option value="Batang">Batang</option>
	<option value="BatangChe">BatangChe</option>
	<option value="Comic Sans MS">Comic Sans MS</option>
	<option value="Courier New">Courier New</option>
	<option value="Dotum">Dotum</option>
	<option value="DotumChe">DotumChe</option>
	<option value="Estrangelo Edessa">Estrangelo Edessa</option>
	<option value="Franklin Gothic Medium">Franklin Gothic Medium</option>
	<option value="Gautami">Gautami</option>
	<option value="Georgia">Georgia</option>
	<option value="Gulim">Gulim</option>
	<option value="GulimChe">GulimChe</option>
	<option value="Gungsuh">Gungsuh</option>
	<option value="GungsuhChe">GungsuhChe</option>
	<option value="Impact">Impact</option>
	<option value="Latha">Latha</option>
	<option value="Lucida Console">Lucida Console</option>
	<option value="Lucida Sans Unicode">Lucida Sans Unicode</option>
	<option value="Mangal">Mangal</option>
	<option value="Marlett">Marlett</option>
	<option value="Microsoft Sans Serif">Microsoft Sans Serif</option>
	<option value="MingLiU">MingLiU</option>
	<option value="MS Gothic">MS Gothic</option>
	<option value="MS Mincho">MS Mincho</option>
	<option value="MS PGothic">MS PGothic</option>
	<option value="MS PMincho">MS PMincho</option>
	<option value="MS UI Gothic">MS UI Gothic</option>
	<option value="MV Boli">MV Boli</option>
	<option value="Palatino Linotype">Palatino Linotype</option>
	<option value="PMingLiU">PMingLiU</option>
	<option value="Raavi">Raavi</option>
	<option value="Shruti">Shruti</option>
	<option value="Sylfaen">Sylfaen</option>
	<option value="Symbol">Symbol</option>
	<option value="Tahoma">Tahoma</option>
	<option value="Times New Roman">Times New Roman</option>
	<option value="Trebuchet MS">Trebuchet MS</option>
	<option value="Tunga">Tunga</option>
	<option value="Verdana">Verdana</option>
	<option value="Webdings">Webdings</option>
	<option value="Wingdings">Wingdings</option>
	<option value="仿宋_GB2312">仿宋_GB2312</option>
	<option value="宋体">宋体</option>
	<option value="新宋体">新宋体</option>
	<option value="楷体_GB2312">楷体_GB2312</option>
	<option value="黑体">黑体</option>

</select>
        &nbsp;大小：<input name="txtFontSize" type="text" value="<%=txtFontSize%>" maxlength="9" id="txtFontSize" class="input required digits" size="2" />（单位：像素）</td>
  </tr>
  </tbody>
</table>-->

<div style="margin-top:10px;text-align:center;">
  <input type="button" name="btnSave" value="确认保存" id="btnSave" class="submit" onclick="chksysconfig()" />
  &nbsp;
  <input name="重置" type="reset" class="submit" value="重置" />
</div>
<script type="text/javascript">
function chksysconfig() {    
    var backurl = '';//$("#backurl").val();
    var msg = '';
    var txtWebName = $("#txtWebName").val();
    var txtWebUrl = $("#txtWebUrl").val();
    var txtFanli = $("#txtFanli").val();
    var txtFanli2 = $("#txtFanli2").val();
    var txtHuilv = $("#txtHuilv").val();
    var rbnotice_0 = $("#rbnotice_0").is(':checked')
    var rbnotice_1 = $("#rbnotice_1").is(':checked')
    var txtnoticetile = $("#txtnoticetile").val();
    var txtnoticecontent = $("#txtnoticecontent").val();
    var txtSysCopyright = $("#txtSysCopyright").val();
    var txtWebEnglishName = $("#txtWebEnglishName").val();
    var txtWebTel = $("#txtWebTel").val();
    var txtKfQQ = $("#txtKfQQ").val();
    var txtWebFax = $("#txtWebFax").val();
    var txtWebEmail = $("#txtWebEmail").val();
    var txtWebCrod = $("#txtWebCrod").val();
    var txtWebCopyright = $("#txtWebCopyright").val();
    var txtWebProSize = $("#txtWebProSize").val();
    var txtWebNewsSize = $("#txtWebNewsSize").val();
    var txtWebKeywords = $("#txtWebKeywords").val();
    var txtWebDescription = $("#txtWebDescription").val();
    var rblWebLogStatus_0 = $("#rblWebLogStatus_0").is(':checked')
    var rblWebLogStatus_1 = $("#rblWebLogStatus_1").is(':checked')
    var txtWebKillKeywords = $("#txtWebKillKeywords").val();
    var txtWebFilePath = $("#txtWebFilePath").val();
    var txtWebFileType = $("#txtWebFileType").val();
    var txtWebFileSize = $("#txtWebFileSize").val();
    var rblIsThumbnail_0 = $("#rblIsThumbnail_0").is(':checked')
    var rblIsThumbnail_1 = $("#rblIsThumbnail_1").is(':checked')
    var txtProWidth = $("#txtProWidth").val();
    var txtProHight = $("#txtProHight").val();
    var rblIsWatermark_0 = $("#rblIsWatermark_0").is(':checked')
    var rblIsWatermark_1 = $("#rblIsWatermark_1").is(':checked')
    var rblIsWatermark_2 = $("#rblIsWatermark_2").is(':checked')
    var rblWatermarkStatus_0 = $("#rblWatermarkStatus_0").is(':checked')
    var rblWatermarkStatus_1 = $("#rblWatermarkStatus_1").is(':checked')
    var rblWatermarkStatus_2 = $("#rblWatermarkStatus_2").is(':checked')
    var rblWatermarkStatus_3 = $("#rblWatermarkStatus_3").is(':checked')
    var rblWatermarkStatus_4 = $("#rblWatermarkStatus_4").is(':checked')
    var rblWatermarkStatus_5 = $("#rblWatermarkStatus_5").is(':checked')
    var rblWatermarkStatus_6 = $("#rblWatermarkStatus_6").is(':checked')
    var rblWatermarkStatus_7 = $("#rblWatermarkStatus_7").is(':checked')
    var rblWatermarkStatus_8 = $("#rblWatermarkStatus_8").is(':checked')
    var txtImgQuality = $("#txtImgQuality").val();
    var txtImgWaterPath = $("#txtImgWaterPath").val();
    var txtImgWaterTransparency = $("#txtImgWaterTransparency").val();
    var txtWaterText = $("#txtWaterText").val();
    var ddlWaterFont = $("#ddlWaterFont").val();
    var txtFontSize = $("#txtFontSize").val();
    if (txtWebName.length == 0) {
        msg += '请填写网站标题！\n';
    }
    if (txtWebUrl.length == 0) {
        msg += '请填写网站域名！\n';
    }
//    if (rbnotice_0) {
//       rbnotice=0;
//    }
//    if (rbnotice_1) {
//       rbnotice=1;
//    }
//    if (rblWebLogStatus_0) {
//       rblWebLogStatus=0;
//    }
//    if (rblWebLogStatus_1) {
//       rblWebLogStatus=1;
//    }
//    if (rblIsThumbnail_0) {
//       rblIsThumbnail=0;
//    }
//    if (rblIsThumbnail_1) {
//      rblIsThumbnail=1;
//    }
//    if (rblIsWatermark_0) {
//       rblIsWatermark=0;
 //   }
//    if (rblIsWatermark_1) {
//       rblIsWatermark=1;
//    }
 //   if (rblIsWatermark_2) {
 //      rblIsWatermark=2;
 //   }
 //   if (rblWatermarkStatus_0) {
 //      rblWatermarkStatus=0;
 //   }
 //   if (rblWatermarkStatus_1) {
 //      rblWatermarkStatus=1;
 //   }
 //   if (rblWatermarkStatus_2) {
 //      rblWatermarkStatus=2;
 //   }
 //   if (rblWatermarkStatus_3) {
//       rblWatermarkStatus=3;
 //   }
 //   if (rblWatermarkStatus_4) {
 //      rblWatermarkStatus=4;
 //   }
 //   if (rblWatermarkStatus_5) {
 //      rblWatermarkStatus=5;
 //   }
 //   if (rblWatermarkStatus_6) {
 //      rblWatermarkStatus=6;
 //   }
 //   if (rblWatermarkStatus_7) {
 //      rblWatermarkStatus=7;
 //   }
 //   if (rblWatermarkStatus_8) {
 //      rblWatermarkStatus=8;
 //   }
    if (backurl.length == 0) {
        backurl='/admin/sysconfig';
    }
    if (msg.length > 0) {
        alert(msg);
        return false;
    }
if(txtWebName&&txtWebUrl&&msg.length==0){
    $.ajax({
        type: "post",
        url: "/admin/editsysconfigapi",
data: { "txtWebName": txtWebName, "txtWebUrl": txtWebUrl, "txtFanli": txtFanli, "txtFanli2": txtFanli2, "txtSysCopyright":txtSysCopyright,"txtWebEnglishName":txtWebEnglishName,"txtWebTel":txtWebTel,"txtKfQQ":txtKfQQ,"txtWebFax":txtWebFax,"txtWebEmail":txtWebEmail,"txtWebCrod":txtWebCrod,"txtWebCopyright":txtWebCopyright,"txtWebProSize":txtWebProSize,"txtWebNewsSize":txtWebNewsSize,"txtWebKeywords":txtWebKeywords,"txtWebDescription":txtWebDescription, "backurl": backurl },
        beforeSend: function () { },
        error: function () { alert('出错啦！');},
        success: function (data) {
            if (data == '0') {
                alert('必填资料有误，请重新提交。');
            }
            else if (data == '1') {
                alert('配置成功！');
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
</form>
</body>
</html>
