<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1"><title>
	管理中心首页
</title><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <script type="text/javascript" src="/admin/js/cursorfocus.js"></script>
    
 


</head>


<body style="padding:10px;">

<div id="doing" style="Z-INDEX:12000;LEFT:0px;WIDTH:100%;CURSOR:wait;POSITION:absolute;TOP:0px;HEIGHT:100%;visibility:hidden;"> 
<table width="100%" height="100%"> 
<tr align="center" valign="middle"> 
<td> 
<table width="169" height="62" bgcolor="#99cccc" style="FILTER: Alpha(Opacity=75); WIDTH: 169px; HEIGHT: 62px"> 
<tr align="center" valign="middle"> 
<td>页面生页面成中请耐心等待.<br> 
<img src="../Images/loading.gif" /></td> 
</tr> 
</table> 
</td> 
</tr> 
</table> 
</div>

    <form name="form1" method="post" action="/admin/center" id="form1">
    <div class="navigation"><span class="add"><a href="Config/admin_config.aspx">修改配置信息</a></span><b>您当前的位置：首页 &gt; 管理中心 &gt; 管理中心首页</b></div>
   
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="msgtable">
      <tr>
        <th colspan="2" align="left">系统基本信息</th>
      </tr>
      <tr>
        <td width="25%" align="right">更新系统缓存：</td>
        <td width="75%">
            <input type="submit" name="bntcache" value="更  新" onclick="javascript:document.getElementById(&#39;doing&#39;).style.visibility=&#39;visible&#39;;" id="bntcache" />
        </td>
      </tr>
      <tr  style=" display:none;">
        <td width="25%" align="right">生成所有产品静态页面：</td>
        <td width="75%" >
            <input type="submit" name="bnthtml" value="生成产品页面" onclick="javascript:document.getElementById(&#39;doing&#39;).style.visibility=&#39;visible&#39;;" id="bnthtml" />
        &nbsp;&nbsp;&nbsp;&nbsp; 
            <input type="submit" name="bnthtmlindex" value="生成首页" onclick="javascript:document.getElementById(&#39;doing&#39;).style.visibility=&#39;visible&#39;;" id="bnthtmlindex" />
        </td>
      </tr>
      <tr>
        <td width="25%" align="right">网站名称：</td>
        <td width="75%">
          <%=sitename%>
        </td>
      </tr>
         <tr>
        <td width="25%" align="right">版权：</td>
        <td width="75%">
          Copyright © 2010-2018
        </td>
      </tr>

      <tr>
        <td align="right">网站域名：</td>
        <td>
          http://www.<%=zurl%>
        </td>
      </tr>

        <tr>
        <td width="25%" align="right">语言版本：</td>
        <td width="75%">
        中文版
          
        </td>
      </tr>

        <tr>
        <td align="right">是否生成静态：</td>
        <td>动态</td>
      </tr>
      <tr>
        <td align="right">安装目录：</td>
        <td>/</td>
      </tr>
      <tr>
        <td align="right">日志目录：</td>
        <td>
          LogFile
        </td>
      </tr>
      <tr>
        <td align="right">联系电话：</td>
        <td>
           010-86469678
        </td>
      </tr>
      <tr>
        <td align="right">传真号码：</td>
        <td>
          
        </td>
      </tr>
      <tr>
        <td align="right">电子邮箱：</td>
        <td>
          admin@zgnmzymyw.org
        </td>
      </tr>
      <tr>
        <th colspan="2" align="left">服务器信息</th>
      </tr>
      <tr>
        <td align="right">服务器名称：</td>
        <td>
          SERVER
        </td>
      </tr>
      <tr>
        <td align="right">服务器IP：</td>
        <td>
          47.89.43.34
        </td>
      </tr>
      <tr>
        <td align="right">NET框架版本：</td>
        <td>
          4.0.30319.1
        </td>
      </tr>
      <tr>
        <td align="right">操作系统：</td>
        <td>
          Microsoft Windows NT 5.2.3790 Service Pack 2
        </td>
      </tr>
      <tr>
        <td align="right">IIS环境：</td>
        <td>
          Microsoft-IIS/7.5
        </td>
      </tr>
      <tr>
        <td align="right">服务器端口：</td>
        <td>
          139.129.208.106
        </td>
      </tr>
      <tr>
        <td align="right">虚拟目录绝对路径：</td>
        <td>
          d:\site\zmw\
        </td>
      </tr>
      <tr>
        <td align="right">HTTPS支持：</td>
        <td>
          off
        </td>
      </tr>
      <tr>
        <td align="right">seesion总数：</td>
        <td>
          0
        </td>
      </tr>
    </table>
    </form>
</body>
</html>
