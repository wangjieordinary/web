<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"
domain = lcase(Request.ServerVariables("SERVER_NAME")) 
if instr(domain, "zgnmzymyw.com")>0 then
response.redirect "/CN/trade"
Response.end
end if%><!--#include file="conn.asp"--><!--#include file="config.asp"-->
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="format-detection" content="telephone=no" /><title>中国农民自由贸易网 - 官网</title><meta name="keywords" content=""><meta name="description" content=""><link type="text/css" rel="stylesheet" href="css/layout.css"><meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"><link type="text/css" rel="stylesheet" href="css/home.css"></head><body><!--<img src="/images/group45.png" class="img-lba">--><div class="container"><div class="header-c"><div class="header"><div class="l-r-container"><div class="m-re-lo not-login"><a href="http://www.zgnmzymyw.com/login" class="m-login">登录</a><span>/</span><a href="http://www.zgnmzymyw.com/reg" class="m-register">注册</a></div><div class="m-re-lo has-login"><a href="/logout" class="mn-logout">退出</a><a href="/personal/profile" class="mn-personal">个人中心</a><a href="/personal/profile" class="mn-phone-nuber">13522902423</a></div><a href="/join" class="ask-join">申请入驻</a><a href="#" class="m-stage-login">人员查询</a></div><div class="clear"></div></div></div><div class="top main-top"><a href="/"><img src="/images/logo.jpg" class="logo hide"><img src="/images/logo.png" class="logo"></a><div class="menu"><a href="http://www.zgnmzymyw.org/" class="nav-home">官网</a><a href="/detail_aboutus_183" class="nav-hezuo">三农联盟</a><a href="/CN/trade" class="nav-quality">农贸平台</a><a href="/detail_aboutus_182" class="nav-demand">三农银行</a><a href="/list_aboutus" class="nav-aboutus">关于我们</a></div><div class="clear"></div></div>
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
<div class="information-cate-c in-cate1"><div class="information-cate-container"><div class="info-left-c">
<div class="tj-left-img"></div><div class="tuijian-c"><%set rs=server.createobject("adodb.recordset")
exec="select top 3 * from [content] where siteid="&siteid&" and txtImgUrl is not null and txtImgUrl<>'' and cblItem_4=1 order by cblItem_1 desc,id desc"	
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%><div><a href="/detail_<%=getchannel(rs("ddlClassId"))%>_<%=rs("id")%>"><img src="<%=rs("txtImgUrl")%>"><div class="turn-content-c"><div class="tuijian-title"><div title="<%=rs("txtTitle")%>" class="tuijian-title-text"><%=rs("txtTitle")%></div><div class="tuijian-title-time"><%=FormatDate(rs("txtAddtime"),"02")%></div><div class="clear"></div></div><div class="tuijian-content"><%=CnCutString(Replace(Replace(RemoveHTML(rs("txtcontent")),"　",""),"&nbsp;",""),38,"…")%></div></div></a></div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%></div>
<div class="tj-right-img"></div></div><div class="info-right-c"><div class="info-title"><span>农业快讯</span><a href="/list_news">更多 ></a><div class="clear"></div></div><div class="zx-list ny-zx">
<%set rs=server.createobject("adodb.recordset")
exec="select top 4 * from [content] where siteid="&siteid&" and txtImgUrl is not null and txtImgUrl<>'' and cblItem_4=0 and ddlClassId=3 order by cblItem_1 desc,id desc"	
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%><a href="/detail_<%=getchannel(rs("ddlClassId"))%>_<%=rs("id")%>" class="zx-item-c"><%if rs("cblItem_1")=1 then%><span class="icon-top">置顶</span><%end if%><img src="<%=rs("txtImgUrl")%>" class="zx-img"><div class="zx-desc-c"><div title="<%=rs("txtTitle")%>" class="zx-desc-title"><%=rs("txtTitle")%></div><div class="zx-date"><%=FormatDate(rs("txtAddtime"),"02")%></div><div class="zx-read-count">0</div></div><div class="clear"></div></a>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%></div></div><div class="clear"></div></div></div>

<div class="information-cate-c in-cate2"><div class="information-cate-container">
<div class="info-left-c huinong-c"><div class="info-title"><span>合作社运营</span><a href="/list_proco">更多 ></a><div class="clear"></div></div>
<div class="zx-list hzs-yy">
<%set rs=server.createobject("adodb.recordset")
exec="select top 5 * from [content] where siteid="&siteid&" and ddlClassId=10 order by cblItem_1 desc,id desc"	
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%><a href="/detail_<%=getchannel(rs("ddlClassId"))%>_<%=rs("id")%>" class="zx-item-c"><%if rs("cblItem_1")=1 then%><span class="icon-top">置顶</span><%end if%><div class="zx-desc-c"><div title="<%=rs("txtTitle")%>" class="zx-desc-title"><%=CnCutString(rs("txtTitle"),16,"…")%></div><div class="zx-desc-content"><%=CnCutString(Replace(Replace(RemoveHTML(rs("txtcontent")),"　",""),"&nbsp;",""),38,"…")%></div><div class="zx-date"><%=FormatDate(rs("txtAddtime"),"02")%></div><div class="zx-read-count">0</div></div><div class="clear"></div></a>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</div></div>
<div class="info-right-c"><div class="info-title"><span>政策补贴</span><a href="/list_law">更多 ></a><div class="clear"></div></div><div class="zhengce-list">
<%set rs=server.createobject("adodb.recordset")
exec="select top 8 * from [content] where siteid="&siteid&" and ddlClassId=7 order by cblItem_1 desc,id desc"	
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%><a type="1" href="/detail_<%=getchannel(rs("ddlClassId"))%>_<%=rs("id")%>" class="wenhua-item-c"><div class="tuijian-title"><div title="<%=rs("txtTitle")%>" class="tuijian-title-text"><%=CnCutString(rs("txtTitle"),6,"…")%></div><div class="tuijian-title-time"><%=FormatDate(rs("txtAddtime"),"02")%></div><div class="clear"></div></div></a>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
</div><a href="/reg" class="right-bar-gg"><img src="/images/chuangfu.jpg"></a></div><div class="clear"></div></div></div>
  
<div class="information-cate-c in-cate3"><div class="information-cate-container"><div class="info-title"><span>社会化服务</span><a href="">更多 ></a><div class="clear"></div></div><div class="zx-list shh-fuwu">
<a href="" class="zx-item-c"><span class="icon-top">置顶</span><img src="upfile/img/PxKkHa9R8d3UCaABuDU8iL4HVJh6Rfh3.jpg" class="zx-img"><div class="zx-desc-c"><div title="国家重点栽培项目，农民种植它可年入十几万" class="zx-desc-title">国家重点栽培项目，农民种植它可年入十几万</div><div class="zx-desc-content">八月瓜是木通科木通属三叶木通的果实，别称牛腰子果、狗腰子、八月炸、九月炸等，因八月果熟开裂而得名，成熟后变为紫红色，沿腹缝线自然炸开，所以也有人叫它八月炸。八月瓜原是一种野生植物的果实，以前满山遍野都是，但是现在野生的基本不多了，因此，农民开始人工种植八月瓜。</div><div class="zx-date">2018-01-09</div><div class="zx-read-count">12</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><img src="upfile/img/4SNLo-hDZtQmyiSNfHzwFzAAVR0gS3Q6.jpg" class="zx-img"><div class="zx-desc-c"><div title="2018年各种农作物种子供需形势分析" class="zx-desc-title">2018年各种农作物种子供需形势分析</div><div class="zx-desc-content">从总需求看，玉米种植面积调减基本到位，玉米市场价格企稳回升，加上调增面积大的花生、大豆等市场价格下跌，预期全国玉米种植面积将会反弹，需种量在11亿公斤左右，今年玉米种子市场将明显好转，价格将止跌回升，期末有效库存有望下降到7亿公斤以下。</div><div class="zx-date">2018-01-05</div><div class="zx-read-count">2</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><img src="upfile/img/zRTTRKEqy-Qk8UmvCqSA03eXOLBAJS6q.jpg" class="zx-img"><div class="zx-desc-c"><div title="养殖它能让农民的收入翻一倍！超厉害！" class="zx-desc-title">养殖它能让农民的收入翻一倍！超厉害！</div><div class="zx-desc-content">蜜蜂跟农作物的关系很密切，美国农业部门曾统计，蜜蜂为农作物授粉后，效益增加的产值是蜂产品本身产值的143倍，澳大利亚做过统计是43倍，加拿大调查统计是200倍。这就是说蜜蜂授粉后农作物的产量增加了，品质也提高了。</div><div class="zx-date">2018-01-02</div><div class="zx-read-count">1</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><img src="upfile/img/qaFp-sOXfeEyYcyN1z25UusyD6YHnq1Q.jpg" class="zx-img"><div class="zx-desc-c"><div title="2018年种什么？种它们，一亩能赚五亩的钱！" class="zx-desc-title">2018年种什么？种它们，一亩能赚五亩的钱！</div><div class="zx-desc-content">树莓栽植后，第二年即具有一定产量，3年至4年进入盛果期，经济寿命可达15年至25年，亩产量可达1000公斤以上，由于口感好，品种新，一般市场销售价格都在10元/公斤左右，平均亩收入可达万元。树莓果实氨基酸含量高于苹果、葡萄，其抗衰老物质及抗癌物质鞣化酸的含量高...</div><div class="zx-date">2017-11-29</div><div class="zx-read-count">5</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><img src="upfile/img/UV6KlGqJOZmilntxtatwrFPZ3NCRFjiQ.png" class="zx-img"><div class="zx-desc-c"><div title="芦笋、桃林、香蕉、草莓……，这个农场为何种啥都赚钱？ " class="zx-desc-title">芦笋、桃林、香蕉、草莓……，这个农场为何种啥都赚钱？ </div><div class="zx-desc-content">种植芦笋效益好，今年行情不错，收购价一斤6元，一亩地就可以卖6000元，收入翻番了。而在四年前，这里种植的还是稻谷。梅颂园2014年流转土地成立农业公司，第一年和周边农户一样种了稻谷，虽然这里是稻谷的优势产区，但是效益仍然不好。</div><div class="zx-date">2017-11-16</div><div class="zx-read-count">0</div></div><div class="clear"></div></a>
</div></div></div>
  
<div class="information-cate-c in-cate4"><div class="information-cate-container">
<div class="info-left-c huinong-c"><div class="info-title"><span>实用农技</span><a href="">更多 ></a><div class="clear"></div></div><div class="zx-list nongji">
<a type="1" href="" class="zx-item-c"><span class="icon-top">置顶</span><div class="zx-desc-c"><div title="没想到桔子皮养猪还有这个效果" class="zx-desc-title">没想到桔子皮养猪还有这个效果</div><div class="zx-desc-content">桔子的皮、脉络都含有丰富的粗蛋白、粗脂肪和纤维素，还含有铁、锰和锌等多种微量元素，对于猪的生长具有很大的帮助。养殖户可以将桔子皮收集起来晒...</div><div class="zx-date">2018-01-27</div><div class="zx-read-count">1</div></div><div class="clear"></div></a>
<a type="1" href="" class="zx-item-c"><span class="icon-top">置顶</span><div class="zx-desc-c"><div title="收割机停放与保管要做到“10防”" class="zx-desc-title">收割机停放与保管要做到“10防”</div><div class="zx-desc-content">秋收结束后，收割机要闲置停放较长时间。闲置前除了维护保养外，还要妥善的停放与保管。目的是为了延长收割机的使用寿命，有利于下年作业中“高效、...</div><div class="zx-date">2018-01-23</div><div class="zx-read-count">1</div></div><div class="clear"></div></a>
<a type="1" href="" class="zx-item-c"><span class="icon-top">置顶</span><div class="zx-desc-c"><div title="冬季草莓如何避免僵化果" class="zx-desc-title">冬季草莓如何避免僵化果</div><div class="zx-desc-content">冬季，在种植草莓的过程中易出现花芽分化受阻、花朵受精受阻、果实发育受阻等问题，尤其容易出现僵化果，草莓僵化果虽然生理成熟，但果个极小，口感...</div><div class="zx-date">2018-01-18</div><div class="zx-read-count">1</div></div><div class="clear"></div></a>
</div></div>
<div class="info-right-c"><div class="info-title"><span>农贸观点</span><a href="">更多 ></a><div class="clear"></div></div><div class="wenhua-list">
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="农村宅基地&quot;三权分置&quot;改革将带来哪些红利？" class="tuijian-title-text">农村宅基地&quot;三权分置&quot;改...</div><div class="tuijian-title-time">2018-01-27</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="韩部长详解目前农业困境及2018年发展思路" class="tuijian-title-text">韩部长详解目前农业困境及...</div><div class="tuijian-title-time">2018-01-18</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="乡村能不能实现振兴？ 怎么实施乡村振兴战略?" class="tuijian-title-text">乡村能不能实现振兴？ 怎...</div><div class="tuijian-title-time">2017-12-06</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="中国农业已迈入高成本时代，如何提升竞争力？" class="tuijian-title-text">中国农业已迈入高成本时代...</div><div class="tuijian-title-time">2018-02-22</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="2018农业怎么发展？农民地怎么种？太详细了！" class="tuijian-title-text">2018农业怎么发展？农...</div><div class="tuijian-title-time">2018-01-15</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="相信这两个字，农庄路上不走错路、不掉大坑" class="tuijian-title-text">相信这两个字，农庄路上不...</div><div class="tuijian-title-time">2017-12-15</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="农村，我们是深情拥抱，还是装模作样的怀念？" class="tuijian-title-text">农村，我们是深情拥抱，还...</div><div class="tuijian-title-time">2017-12-13</div><div class="clear"></div></div></a>
<a type="1" href="" class="wenhua-item-c"><div class="tuijian-title"><div title="重磅：大佬务农，套路几何？" class="tuijian-title-text">重磅：大佬务农，套路几何...</div><div class="tuijian-title-time">2017-12-11</div><div class="clear"></div></div></a>
</div></div><div class="clear"></div></div></div>
  
<div class="information-cate-c last-cate-c in-cate5"><div class="information-cate-container"><div class="info-title"><span>农贸学院</span><a href="">更多 ></a><div class="clear"></div></div><div class="zx-list college-list">
<a href="" class="zx-item-c"><div class="zx-img"><img src="/images/play.png" class="play-icon"><img src="http://p.qpic.cn/videoyun/0/200027783_d2ec1402b24911e695ff957a64bb4efc_1/640" class="video-img"></div><div class="zx-desc-c"><div title="【农贸学院视频】合作社如何申报示范社" class="zx-desc-title">【农贸学院视频】合作社如何申报示范社</div><div class="zx-desc-content">本期课程从以下四个方面进行了深入讲解： 1、什么是示范社？ 2、申报示范社的好处有哪些？ 3、申报示范社的条件有哪些？ 4、如何申报示范社？ 如果对于本次课程有疑问，欢迎在下面进行回复交流！</div><div class="zx-date">2016-11-24</div><div class="zx-read-count">13</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><div class="zx-img"><img src="/images/play.png" class="play-icon"><img src="http://p.qpic.cn/videoyun/0/200027783_f6fe1d6ead5211e68de251afb86a2098_1/640" class="video-img"></div><div class="zx-desc-c"><div title="如何做好合作社团队组建工作及动员入社？ " class="zx-desc-title">如何做好合作社团队组建工作及动员入社？ </div><div class="zx-desc-content">如何做好合作社团队组建工作及动员入社？ </div><div class="zx-date">2016-11-18</div><div class="zx-read-count">8</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><div class="zx-img"><img src="/images/play.png" class="play-icon"><img src="http://p.qpic.cn/videoyun/0/200027783_8f8d29eeaba011e6b833913b8a24d56d_1/640" class="video-img"></div><div class="zx-desc-c"><div title="教你巧用农贸app提高农业运营效率" class="zx-desc-title">教你巧用农贸app提高农业运营效率</div><div class="zx-desc-content">农合平台app功能及使用介绍。</div><div class="zx-date">2016-11-16</div><div class="zx-read-count">0</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><div class="zx-img"><img src="/images/play.png" class="play-icon"><img src="http://p.qpic.cn/videoyun/0/200027783_c60e64c4a7e011e6b833913b8a24d56d_1/640" class="video-img"></div><div class="zx-desc-c"><div title="【视频】合作社运营模式与盈利诀窍大揭秘	" class="zx-desc-title">【视频】合作社运营模式与盈利诀窍大揭秘	</div><div class="zx-desc-content">合作社运营模式与盈利诀窍大揭秘-视频回放。</div><div class="zx-date">2016-11-11</div><div class="zx-read-count">5</div></div><div class="clear"></div></a>
<a href="" class="zx-item-c"><div class="zx-img"><img src="/images/play.png" class="play-icon"><img src="http://p.qpic.cn/videoyun/0/200027783_27503b08a1c511e6b10ad9b59b98037c_1/640" class="video-img"></div><div class="zx-desc-c"><div title="【视频】新农人如何创办运营合作社" class="zx-desc-title">【视频】新农人如何创办运营合作社</div><div class="zx-desc-content">本堂课主要从以下两方面进行讲解： 1、合作社创办的立足点如何选择与确定； 2、合作社运营过程中需要注意哪些方面的内容。 如有问题，请在下方直接回复！</div><div class="zx-date">2016-11-04</div><div class="zx-read-count">13</div></div><div class="clear"></div></a>
</div></div></div></div>

<div class="footer-container"><div class="footer-c"><div class="f-content">
<div class="f-wechat"><img src="/images/ewm.png"> 　 　<img src="/images/wechat.png">
  <div>官网　　　　　　　　公众号</div><div style="padding-top:6px">中国农民自由贸易网</div><div class="f-gzh">新农年鉴 • 农贸网</div></div>
<div class="contact-info"><div class="phone" style="color:#FFF">010-86469678</div><div class="address">主管单位：
</div><div class="address">　　　国资委商业饮食服务业发展中心</div><div class="tel-c"><span class="tel-title">　　　国资委中华传统饮食与健康服务业推广管理委员会</span><span class="tel"></span></div><div class="email-c"><span>主办：</span><span class="email">中国新农村建设先进人物年鉴编辑委员会</span></div><div class="gf-weibo-c"><!--<span>官方微博：</span><a href="#" class="img"></a>--><div class="clear"></div></div></div>
<div class="f-links"><div class="f-items"><a href="/about?tab=0" class="f-item">公司介绍</a><a href="/about?tab=1" class="f-item">我们的团队</a><a href="/about?tab=2" class="f-item">历史历程</a><a href="/about?tab=3" class="f-item">企业荣誉</a><a href="/about?tab=4" class="f-item">招聘信息</a><a href="/about?tab=5" class="f-item">农贸动态</a><div class="clear"></div></div><div class="f-items"><a href="/join" class="f-item">申请入驻</a><a href="/join_cooperation" class="f-item">合作社</a><a href="/join_family-farm" class="f-item">家庭农场</a><a href="/join_purchaser" class="f-item">采购商</a><a href="/join_enterprise" class="f-item">涉农企业</a><div class="clear"></div></div><div class="f-items"><a href="/advantage" class="f-item">平台优势</a><a href="/advantage" class="f-item">行业沉淀</a><a href="/advantage" class="f-item">技术优势</a><a href="/advantage" class="f-item">服务优势</a><a href="/advantage" class="f-item">历史进程</a><div class="clear"></div></div>
<div class="xz-ew-c"><!--<div class="an-ew-c"></div><div class="ios-ew-c"></div>--></div>
</div><div class="clear"></div></div>
<div class="copyright-c"><span>版权所有</span><span>中国农民自由贸易网</span><a href="http://www.miitbeian.gov.cn" target="_blank" class="beian">京ICP备16039441号</a></div></div></div></div><div show="undefined" class="modal"></div><div class="alert-c"><div class="alert-content">图片尺寸太大！</div><div class="alert-btn">确定</div></div><div class="subject-c"><div class="subject-container"><a href="/subject"><img src="/images/zhuanti8.png" class="img"></a><img src="/images/close.png" class="close-subject"></div></div><div class="er-wei-container"><div class="er-wei-title">中国农民自由贸易网</div><div class="donw-guanzhu-c"><img src="/images/close.png" class="close-erwe"><div class="er-item"><img src="/images/erweima.png"><div>扫一扫 关注服务公众号</div></div><div class="clear"></div></div></div><script src="/js/jquery.js"></script><script src="/js/layout.js"></script><script src="/js/global.js"></script><script type="text/javascript" src="js/jquery.js"></script><script type="text/javascript" src="js/jquery.kinMaxShow.js"></script><script type="text/javascript" src="js/news.js"></script></body></html>