<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%a=Replace(Request("a"),"?","")%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="format-detection" content="telephone=no" /><title>农贸资讯-农贸官网</title><meta name="keywords" content=""><meta name="description" content=""><link type="text/css" rel="stylesheet" href="css/layout.css"><meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"><link type="text/css" rel="stylesheet" href="css/news_list.css"></head><body><!--<img src="/images/group45.png" class="img-lba">--><div class="container"><div class="header-c"><div class="header"><div class="l-r-container"><div class="m-re-lo not-login"><a href="http://www.zgnmzymyw.com/login" class="m-login">登录</a><span>/</span><a href="http://www.zgnmzymyw.com/reg" class="m-register">注册</a></div><div class="m-re-lo has-login"><a href="/logout" class="mn-logout">退出</a><a href="/personal/profile" class="mn-personal">个人中心</a><a href="/personal/profile" class="mn-phone-nuber">13522902423</a></div><a href="/join" class="ask-join">申请入驻</a><a href="#" class="m-stage-login">人员查询</a></div><div class="clear"></div></div></div><div class="top main-top"><a href="/"><img src="/images/logo.jpg" class="logo hide"><img src="/images/logo.png" class="logo"></a><div class="menu"><a href="http://www.zgnmzymyw.org/" class="nav-home">官网</a><a href="/detail_aboutus_183" class="nav-hezuo">三农联盟</a><a href="/CN/trade" class="nav-quality">农贸平台</a><a href="/detail_aboutus_182" class="nav-demand">三农银行</a><a href="/list_aboutus" class="nav-aboutus">关于我们</a></div><div class="clear"></div></div>
<div class="content-body"><!--<div class="in-top-menu"><a href="/">首页</a><span>></span><a>农贸资讯</a></div>-->
		<style type="text/css">
			a{
				text-decoration: none;
			}
			nav{
				display: block;
				width: 100%;
				height:85px;
				background: url(img/nav.png) repeat-x;
			}
			nav li{
				float: left;
				width: 122px;
				height:85px;
				line-height: 85px;
				text-align: center;
				
				}
			nav li a{
				color: #fff;
				text-align: center;
			}
				*{
					margin: 0;
					padding: 0;
				}
				li{
					list-style: none;
				}
				nav li:hover{
					width: 122px;
					height: 85px;
					background: url(img/menunow44.png) no-repeat;
				}
		</style>
       		<nav>
       			<div style="width: 1100px; margin: 0 auto;">
	       			<ul>
	       				<li><a  href="http://www.zgnmzymyw.org/">官方首页</a></li>
	       				<li><a  href="/list_news">新农资讯</a></li>
	       				<li><a  href="/list_help">精准扶贫</a></li>
	       				<li><a  href="/list_eagr">生态农业</a></li>
	       				<li><a  href="/list_food">食品安全</a></li>
	       				<li><a  href="/list_law">政策法规</a></li>
	       				<li><a  href="/list_prore">产品推荐</a></li>
	       				<li><a  href="/list_afair">农贸展会</a></li>
	       				<li><a  href="/list_proco">专业合作社</a></li>
	       			</ul>
       			</div>
       			
       		</nav>
<!--<div class="top-menu-c"><div class="top-menu-container"><div class="top-c-m-c"><a href="http://www.zgnmzymyw.org/" class="top-menu-item active">官网首页</a><a href="/list_news" class="top-menu-item" channel="news">新农资讯</a><a href="/list_help" class="top-menu-item" channel="help">精准扶贫</a><a href="/list_eagr" class="top-menu-item" channel="eagr">生态农业</a><a href="/list_food" class="top-menu-item" channel="food">食品安全</a><a href="/list_law" class="top-menu-item" channel="law">政策法规</a><a href="/list_prore" class="top-menu-item" channel="prore">产品推荐</a><a href="/list_afair" class="top-menu-item" channel="afair">农贸展会</a><a href="/list_proco" class="top-menu-item" channel="proco">专业合作社</a>
<div class="clear"></div></div></div></div>-->

<div class="info-container">
<div class="info-list-c"><%if instr(a,"_news")>0 then osql=" and ddlClassId=3"
if instr(a,"_help")>0 then osql=" and ddlClassId=4"
if instr(a,"_eagr")>0 then osql=" and ddlClassId=5"
if instr(a,"_food")>0 then osql=" and ddlClassId=6"
if instr(a,"_law")>0 then osql=" and ddlClassId=7"
if instr(a,"_prore")>0 then osql=" and ddlClassId=8"
if instr(a,"_afair")>0 then osql=" and ddlClassId=9"
if instr(a,"_proco")>0 then osql=" and ddlClassId=10"
if instr(a,"_aboutus")>0 then osql=" and ddlClassId=1"
if instr(a,"_center")>0 then osql=" and ddlClassId=12"
if instr(a,"_tech")>0 then osql=" and ddlClassId=13"
page=split(a&"__","_")(2)
if page="" or isnull(page) then page=0
set rs=server.createobject("adodb.recordset")
exec="select * from [content] where siteid="&siteid&osql&" order by cblItem_1 desc,id desc"	
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
rs.PageSize=10
pagecount=rs.PageSize
if page<=0 then
spage=1
else
spage=page+1
end if
rs.AbsolutePage=spage
end if
if rssum>0 and pagecount*page<rssum then
for i=1 to pagecount%>
<a href="/detail_<%=split(a&"__","_")(1)%>_<%=rs("id")%>" class="zx-item-c "><%if rs("cblItem_1")=1 then%><span class="icon-top">置顶</span><%end if%><img src="<%if rs("txtImgUrl")="" or isnull(rs("txtImgUrl")) then%>/images/noimg.png<%else%><%=rs("txtImgUrl")%><%end if%>" class="zx-img"><div class="zx-desc-c"><div title="<%=rs("txtTitle")%>" class="zx-desc-title"><%=CnCutString(RemoveHTML(rs("txtTitle")),16,"…")%></div><div class="zx-desc-content"><%=CnCutString(RemoveHTML(rs("txtcontent")),69,"…")%></div><div class="zx-date"><%=FormatDate(rs("txtAddtime"),"02")%></div><div class="zx-read-count">0</div></div><div class="clear"></div></a>
<%rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%>
</div></div><div class="pager"></div></div>

<div class="footer-container"><div class="footer-c"><div class="f-content">
<div class="f-wechat"><img src="/images/ewm.png"> 　 　<img src="/images/wechat.png">
  <div>官网　　　　　　　　公众号</div><div style="padding-top:6px">中国农民自由贸易网</div><div class="f-gzh">新农年鉴 • 农贸网</div></div>
<div class="contact-info"><div class="phone" style="color:#fff">010-86469678</div><div class="address">主管单位：
</div><div class="address">　　　国资委商业饮食服务业发展中心</div><div class="tel-c"><span class="tel-title">　　　国资委中华传统饮食与健康服务业推广管理委员会</span><span class="tel"></span></div><div class="email-c"><span>主办：</span><span class="email">中国新农村建设先进人物年鉴编辑委员会</span></div><div class="gf-weibo-c"><!--<span>官方微博：</span><a href="#" class="img"></a>--><div class="clear"></div></div></div>
<div class="f-links"><div class="f-items"><a href="/about?tab=0" class="f-item">公司介绍</a><a href="/about?tab=1" class="f-item">我们的团队</a><a href="/about?tab=2" class="f-item">历史历程</a><a href="/about?tab=3" class="f-item">企业荣誉</a><a href="/about?tab=4" class="f-item">招聘信息</a><a href="/about?tab=5" class="f-item">农贸动态</a><div class="clear"></div></div><div class="f-items"><a href="/join" class="f-item">申请入驻</a><a href="/join_cooperation" class="f-item">合作社</a><a href="/join_family-farm" class="f-item">家庭农场</a><a href="/join_purchaser" class="f-item">采购商</a><a href="/join_enterprise" class="f-item">涉农企业</a><div class="clear"></div></div><div class="f-items"><a href="/advantage" class="f-item">平台优势</a><a href="/advantage" class="f-item">行业沉淀</a><a href="/advantage" class="f-item">技术优势</a><a href="/advantage" class="f-item">服务优势</a><a href="/advantage" class="f-item">历史进程</a><div class="clear"></div></div>
<div class="xz-ew-c"><!--<div class="an-ew-c"></div><div class="ios-ew-c"></div>--></div>
</div><div class="clear"></div></div>
<div class="copyright-c"><span>版权所有</span><span>中国农民自由贸易网</span><a href="http://www.miitbeian.gov.cn" target="_blank" class="beian">京ICP备16039441号</a></div></div></div></div><div show="undefined" class="modal"></div><div class="alert-c"><div class="alert-content">图片尺寸太大！</div><div class="alert-btn">确定</div></div><div class="subject-c"><div class="subject-container"><a href="/subject"><img src="/images/zhuanti8.png" class="img"></a><img src="/images/close.png" class="close-subject"></div></div><div class="er-wei-container"><div class="er-wei-title">中国农民自由贸易网</div><div class="donw-guanzhu-c"><img src="/images/close.png" class="close-erwe"><div class="er-item"><img src="/images/erweima.png"><div>扫一扫 关注服务公众号</div></div><div class="clear"></div></div></div><script src="/js/jquery.js"></script><script src="/js/layout.js"></script><script src="/js/global.js"></script><script type="text/javascript" src="/js/jquery.js"></script><script teype="text/javascript" src="/js/jquery.pagination.js"></script><script type="text/javascript" src="/js/news_list.js"></script></body></html>