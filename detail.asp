<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%a=Request("a")
if instr(a,"?")>0 then a=SPLIT(a,"?")(0)
id=split(a&"__","_")(2)
if id="" or isnull(id) then
id=0
else
id=int(id)
end if
set rs=server.createobject("adodb.recordset")
exec="select * from [content] where siteid="&siteid&" and id="&id	
rs.open exec,conn,1,1
if not (rs.bof and rs.eof) then
txtTitle=rs("txtTitle")
txtAddtime=rs("txtAddtime")
txtcontent=rs("txtcontent")
end if
rs.close
set rs=nothing%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="format-detection" content="telephone=no" /><title><%=txtTitle%>-农贸官网</title><meta name="keywords" content="<%=txtTitle%>"><meta name="description" content=""><link type="text/css" rel="stylesheet" href="css/layout.css"><meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"><link type="text/css" rel="stylesheet" href="css/news_detail.css"></head><body><!--<img src="/images/group45.png" class="img-lba">--><div class="container"><div class="header-c"><div class="header"><div class="l-r-container"><div class="m-re-lo not-login"><a href="/login" class="m-login">登录</a><span>/</span><a href="/reg" class="m-register">注册</a></div><div class="m-re-lo has-login"><a href="/logout" class="mn-logout">退出</a><a href="/personal/profile" class="mn-personal">个人中心</a><a href="/personal/profile" class="mn-phone-nuber">13522902423</a></div><a href="/join" class="ask-join">申请入驻</a><a href="#" class="m-stage-login">人员查询</a></div><div class="clear"></div></div></div><div class="top main-top"><a href="/"><img src="/images/logo.jpg" class="logo hide"><img src="/images/logo.png" class="logo"></a><div class="menu"><a href="http://www.zgnmzymyw.org/" class="nav-home">官网</a><a href="/detail_aboutus_183" class="nav-hezuo">三农联盟</a><a href="/CN/trade" class="nav-quality">农贸平台</a><a href="/detail_aboutus_182" class="nav-demand">三农银行</a><a href="/list_aboutus" class="nav-aboutus">关于我们</a></div><div class="clear"></div></div>
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

<div class="content-body"><div class="info-container"><div class="info-content-c"><div class="info-title"><%=txtTitle%></div><div class="info-time"><%if txtAddtime<>"" then%><%=FormatDate(txtAddtime,"02")%><%end if%></div><div class="info-content"><%=txtcontent%></div><div class="clear"></div><div class="share-line-c"><div class="share-line"></div><span>分享</span><div class="share-line"></div><div class="clear"></div></div><div class="news-gzh-c"><a target="_blank" class="gz-qq"></a><a target="_blank" class="gz-wb"></a></div></div><!--<div class="information-cate-c last-cate-c in-cate5"><div class="information-cate-container"><div class="info-title-2"><span>相关资讯</span><div class="clear"></div></div><div class="zx-list college-list"><a href="/news/detail/5a69879d538d17e37160001b" class="zx-item-c"><img src="http://repos.b2cf.cn/images/nonghe_news/eAf5evRn57eRdgbivDz5fPYvltYgowzF.jpg" class="zx-img"><div class="zx-desc-c"><div title="2018年农村宅基地迎来新变化，三个“好消息”，一个“坏消息”" class="zx-desc-title">2018年农村宅基地迎来新变化，三个“好消息”，一个“坏消息...</div><div class="zx-desc-content"></div><div class="zx-date">2018-01-26</div><div class="zx-read-count">3</div></div><div class="clear"></div></a><a href="/news/detail/5a698670e7e4ed91647d75ae" class="zx-item-c"><img src="http://repos.b2cf.cn/images/nonghe_news/03wDsF9gs5a7zxcBp-ui1E66suJ-24DO.jpg" class="zx-img"><div class="zx-desc-c"><div title="2018年中央一号文件将聚焦乡村振兴 土地流转等多领域受益" class="zx-desc-title">2018年中央一号文件将聚焦乡村振兴 土地流转等多领域受益</div><div class="zx-desc-content"></div><div class="zx-date">2018-01-25</div><div class="zx-read-count">1</div></div><div class="clear"></div></a><a href="/news/detail/5a698400538d17e3715fff74" class="zx-item-c"><img src="http://repos.b2cf.cn/images/nonghe_news/gjJQx3igLCiwI61ZX1KXcIkoDeFWDbAU.jpg" class="zx-img"><div class="zx-desc-c"><div title="注意！2018农民朋友需要关注农产品市场的这四个问题！" class="zx-desc-title">注意！2018农民朋友需要关注农产品市场的这四个问题！</div><div class="zx-desc-content"></div><div class="zx-date">2018-01-25</div><div class="zx-read-count">0</div></div><div class="clear"></div></a><a href="/news/detail/5a697e69538d17e3715ffe2e" class="zx-item-c"><img src="http://repos.b2cf.cn/images/nonghe_news/q69fKSoHFz5Ls-XUfPsoK5kgYM0Ve2fz.jpg" class="zx-img"><div class="zx-desc-c"><div title="稻谷也要清库存？那今年还有保护价吗？" class="zx-desc-title">稻谷也要清库存？那今年还有保护价吗？</div><div class="zx-desc-content"></div><div class="zx-date">2018-01-25</div><div class="zx-read-count">4</div></div><div class="clear"></div></a></div></div></div><!--<div class="comment-c"><div class="comment-title-c"><div class="comment-title">网友评论</div><div class="comment-count">93条评论</div></div><textarea class="k-textarea comment-content"></textarea><div class="clear"></div><div class="submit-comment"><div class="word-count-c"><span>还可以输入</span><span class="word-count">200</span><span>个字符</span></div><div class="k-button btn-submit-comment">发表评论 </div><div class="clear"></div></div><div class="comment-list"></div></div><div class="pager"></div>--></div></div></div>

<div class="footer-container"><div class="footer-c"><div class="f-content">
<div class="f-wechat"><img src="/images/ewm.png"> 　 　<img src="/images/wechat.png">
  <div>官网　　　　　　　　公众号</div><div style="padding-top:6px">中国农民自由贸易网</div><div class="f-gzh">新农年鉴 • 农贸网</div></div>
<div class="contact-info"><div class="phone" style="color:#FFF">010-86469678</div><div class="address">主管单位：
</div><div class="address">　　　国资委商业饮食服务业发展中心</div><div class="tel-c"><span class="tel-title">　　　国资委中华传统饮食与健康服务业推广管理委员会</span><span class="tel"></span></div><div class="email-c"><span>主办：</span><span class="email">中国新农村建设先进人物年鉴编辑委员会</span></div><div class="gf-weibo-c"><!--<span>官方微博：</span><a href="#" class="img"></a>--><div class="clear"></div></div></div>
<div class="f-links"><div class="f-items"><a href="/about?tab=0" class="f-item">公司介绍</a><a href="/about?tab=1" class="f-item">我们的团队</a><a href="/about?tab=2" class="f-item">历史历程</a><a href="/about?tab=3" class="f-item">企业荣誉</a><a href="/about?tab=4" class="f-item">招聘信息</a><a href="/about?tab=5" class="f-item">农贸动态</a><div class="clear"></div></div><div class="f-items"><a href="/join" class="f-item">申请入驻</a><a href="/join_cooperation" class="f-item">合作社</a><a href="/join_family-farm" class="f-item">家庭农场</a><a href="/join_purchaser" class="f-item">采购商</a><a href="/join_enterprise" class="f-item">涉农企业</a><div class="clear"></div></div><div class="f-items"><a href="/advantage" class="f-item">平台优势</a><a href="/advantage" class="f-item">行业沉淀</a><a href="/advantage" class="f-item">技术优势</a><a href="/advantage" class="f-item">服务优势</a><a href="/advantage" class="f-item">历史进程</a><div class="clear"></div></div>
<div class="xz-ew-c"><!--<div class="an-ew-c"></div><div class="ios-ew-c"></div>--></div>
</div><div class="clear"></div></div>
<div class="copyright-c"><span>版权所有</span><span>中国农民自由贸易网</span><a href="http://www.miitbeian.gov.cn" target="_blank" class="beian">京ICP备16039441号</a></div></div></div></div><div show="undefined" class="modal"></div><div class="alert-c"><div class="alert-content">图片尺寸太大！</div><div class="alert-btn">确定</div></div><div class="subject-c"><div class="subject-container"><a href="/subject"><img src="/images/zhuanti8.png" class="img"></a><img src="/images/close.png" class="close-subject"></div></div><div class="er-wei-container"><div class="er-wei-title">中国农民自由贸易网</div><div class="donw-guanzhu-c"><img src="/images/close.png" class="close-erwe"><div class="er-item"><img src="/images/erweima.png"><div>扫一扫 关注服务公众号</div></div><div class="clear"></div></div></div><script src="/js/jquery.js"></script><script src="/js/layout.js"></script><script src="/js/global.js"></script><script type="text/javascript" src="js/jquery.js"></script><script type="text/javascript" src="js/jquery.kinMaxShow.js"></script><script type="text/javascript" src="js/news_detail.js"></script></body></html>