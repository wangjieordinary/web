<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%a=request("actnews_product_class")
if a="" or isnull(a) then
a=request("a")
end if
a=int(getnumb(a))
key=request("key")
if request("skey")="yes" then
key=Session("key")
else
Session("key")=key
end if
search=request("search")
%><%if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mcategory")
response.end
end if
%>
<!doctype html>
<html lang="zh-tw"><head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="中国农民自由贸易网" />
<meta name="description" content="中国农民自由贸易网" />
<title>中国农民自由贸易网</title>
<link href="/trade/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="/trade/css/general.css" rel="stylesheet" type="text/css" />
<link href="/trade/css/wforms.css" rel="stylesheet" type="text/css" />
<link href="/trade/css/editor.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 8]><link rel="stylesheet" type="text/css" href="/trade/css/ie.css"><![endif]-->
<link href="/trade/css/main.css" rel="stylesheet" type="text/css" />
<link href="/trade/css/zh-tw.css" rel="stylesheet" type="text/css" /><script src="/trade/js/modernizr.js"></script>
<script src="/trade/js/prototype/prototype.js"></script>
<script src="/trade/js/scriptaculous/scriptaculous.js"></script>
<script src="/trade/js/jquery/jquery.js"></script>
<script src="/trade/js/utils.js"></script>
<script src="/trade/js/jquery/jquery.cycle2.min.js"></script>
<script src="/trade/js/jquery/jquery.cycle2.swipe.min.js"></script>
<script src="/trade/js/jquery/cycle2.carousel.min.js"></script>
<script src="/trade/js/orbit-bar.js"></script>
<script src="/trade/js/caacoop.js"></script>
<script>jQuery.noConflict();</script>
<script src="/trade/js/wforms/wforms.js"></script>
<!-- preventing FOUC -->
<style>	@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}} @media screen and (max-width: 380px) {#bar_search_select{display:none;}}
  .no-fouc {display: none;}
</style>
<script type="text/javascript">
  document.documentElement.className += ' no-fouc';
</script>
<!-- end of preventing FOUC -->
<script language="javaScript" runat="Server">
function GG2UTF8(str)
{
return encodeURIComponent(str)
}
function GB2UTF8(str)
{
return encodeURIComponent(str)
}
</script>
<script src="/trade/js/wforms/localization-tw.js" type="text/javascript"></script>
<script src="/trade/js/sorttable.js" type="text/javascript"></script>
<meta name="renderer" content="webkit"> 
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
</head>
<body id="page_main">
<noscript>您的浏览器不支援Javascript，部分功能将无法呈现。</noscript>

<div id="site_logo"><div id="site_logo2">
	<a href="/CN/trade">
		<h1 class="site_logo">
			<span><img src="/trade/images/site-logo.png"></span>
		</h1>
	</a>
</div></div>
<div class="site_link_map"><div class="menu"><a href="http://www.zgnmzymyw.org" class="nav-home">官网</a><a href="/detail_aboutus_183" class="nav-hezuo">三农联盟</a><a href="#" class="nav-quality">农贸平台</a><a href="/detail_aboutus_182" class="nav-demand">三农银行</a><a href="/list_aboutus" class="nav-aboutus">关于我们</a></div><div class="clear"></div>
        <!--<div id="top-bar-lang-switch">
            <ul class="lang-switch-list list-unstyled">
              
              <li class="lang-switch-item "><a class="btn-primary" href="?Trad2Simp=n&lang=zh-tw" >繁体中文</a></li>
              <li class="lang-switch-item active"><a class="btn-primary" href="?Trad2Simp=y&lang=zh-tw">简体中文</a></li>
              <li class="lang-switch-item "><a class="btn-primary" href="?lang=en&amp;Trad2Simp=n" >English</a></li>
            </ul>
        </div>--> <!-- end end of .more-info -->

		<!--<div id="click_link">
			<img src="/trade/images/link_mapA.jpg" alt="link">
		</div>
		<div id="click_link2">
			<img src="/trade/images/link_mapC.jpg" alt="link">
		</div>
		<div id="click_link3">
			<img src="/trade/images/link_mapD.jpg" alt="link">
		</div>
		<div id="site_link-tab" class="site_link-tab">
			<ul class="tabs-area">
				<li><a href="#area-china">中文</a></li>
				<li><a href="#area-china-en">English</a></li>
				<li><a href="/">返回总站</a></li>
			</ul> 
			<div class="tab-container" id="map_link">
					<div id="area-china" class="tab-area-content">
						<h2>中国地图<span>map of China</span></h2>						<img class="map-img" src="/trade/images/map_imgC.png" alt="map">
						<a class="beijing" href="/BJ/trade" target=\"_blank\"><span></span></a>
						<a class="fujian" href="/FJ/trade" target=\"_blank\"><span></span></a>
						<a class="guangdong" href="/GD/trade" target=\"_blank\"><span></span></a>
						<a class="guangxi" href="/GX/trade" target=\"_blank\"><span></span></a>
						<a class="hebei" href="/HE/trade" target=\"_blank\"><span></span></a>
						<a class="henan" href="/HA/trade" target=\"_blank\"><span></span></a>
						<a class="hubei" href="/HB/trade" target=\"_blank\"><span></span></a>
						<a class="hunan" href="/HV/trade" target=\"_blank\"><span></span></a>
						<a class="jilin" href="/JL/trade" target=\"_blank\"><span></span></a>
						<a class="liaoning" href="/LN/trade" target=\"_blank\"><span></span></a>
						<a class="mongolia" href="/mongolia/trade" target=\"_blank\"><span></span></a>
						<a class="ningxia" href="/NX/trade" target=\"_blank\"><span></span></a>
						<a class="shaanxi" href="/SN/trade" target=\"_blank\"><span></span></a>
						<a class="shandong" href="/SD/trade" target=\"_blank\"><span></span></a>
						<a class="sichuan" href="/SC/trade" target=\"_blank\"><span></span></a>
						<a class="yunnan" href="/YN/trade" target=\"_blank\"><span></span></a>
						<a class="xinjiang" href="/XJ/trade" target=\"_blank\"><span></span></a>
						<a class="qingdao" href="/QD/trade" target=\"_blank\"><span></span></a>
						<a class="zaozhuang" href="/ZZ/trade" target=\"_blank\"><span></span></a>
						<a class="shanxi" href="/SX/trade" target=\"_blank\"><span></span></a>
						<a class="HI" href="/HI/trade" target=\"_blank\"><span></span></a>
						<a class="SH" href="/SH/trade" target=\"_blank\"><span></span></a>
						<a class="TW" href="/TW/trade" target=\"_blank\"><span></span></a>
						<a class="JX" href="/JX/trade" target=\"_blank\"><span></span></a>
						<a class="JJJ" href="/JJJ/trade" target=\"_blank\"><span></span></a>
					</div>
					<div id="area-china-en" class="tab-area-content">
						<h2>中国地图<span>map of China</span></h2>						<img class="map-img" src="/trade/images/map_en_imgC.png" alt="map">
						<a class="beijing" href="/BJ/trade" target=\"_blank\"><span></span></a>
						<a class="fujian" href="/FJ/trade" target=\"_blank\"><span></span></a>
						<a class="guangdong" href="/GD/trade" target=\"_blank\"><span></span></a>
						<a class="guangxi" href="/GX/trade" target=\"_blank\"><span></span></a>
						<a class="hebei" href="/HE/trade" target=\"_blank\"><span></span></a>
						<a class="henan" href="/HA/trade" target=\"_blank\"><span></span></a>
						<a class="hubei" href="/HB/trade" target=\"_blank\"><span></span></a>
						<a class="hunan" href="/HV/trade" target=\"_blank\"><span></span></a>
						<a class="jilin" href="/JL/trade" target=\"_blank\"><span></span></a>
						<a class="liaoning" href="/LN/trade" target=\"_blank\"><span></span></a>
						<a class="mongolia" href="/mongolia/trade" target=\"_blank\"><span></span></a>
						<a class="ningxia" href="/NX/trade" target=\"_blank\"><span></span></a>
						<a class="shaanxi" href="/SN/trade" target=\"_blank\"><span></span></a>
						<a class="shandong" href="/SD/trade" target=\"_blank\"><span></span></a>
						<a class="sichuan" href="/SC/trade" target=\"_blank\"><span></span></a>
						<a class="yunnan" href="/YN/trade" target=\"_blank\"><span></span></a>
						<a class="xinjiang" href="/XJ/trade" target=\"_blank\"><span></span></a>
						<a class="qingdao" href="/QD/trade" target=\"_blank\"><span></span></a>
						<a class="zaozhuang" href="/ZZ/trade" target=\"_blank\"><span></span></a>
						<a class="shanxi" href="/SX/trade" target=\"_blank\"><span></span></a>
						<a class="HI" href="/HI/trade" target=\"_blank\"><span></span></a>
						<a class="SH" href="/SH/trade" target=\"_blank\"><span></span></a>
						<a class="TW" href="/TW/trade" target=\"_blank\"><span></span></a>
						<a class="JX" href="/JX/trade" target=\"_blank\"><span></span></a>
						<a class="JJJ" href="/JJJ/trade" target=\"_blank\"><span></span></a>
					</div>

			</div>
		</div>

		<div id="site_link-tab2" class="site_link-tab">
			<ul class="tabs-area2">
				<li><a href="#area-caacn">中文</a></li>
				<li><a href="#area-caacn-en">English</a></li>
				<li><a href="/">返回总站</a></li>
			</ul> 
			<div class="tab-container" id="map_link">
					<div id="area-caacn" class="tab-area2-content">
						<h2>东盟十国地图<span>ASEAN map</span></h2>						<img class="map-img" src="/trade/images/map_imgA.png" alt="map">
						<a class="philippines" href="/philippines/trade" target=\"_blank\"><span></span></a>
						<a class="vietnam" href="/vietnam/trade" target=\"_blank\"><span></span></a>
					</div>
					<div id="area-caacn-en" class="tab-area2-content">
						<h2>东盟十国地图<span>ASEAN map</span></h2>						<img class="map-img" src="/trade/images/map_en_imgA.png" alt="map">
						<a class="philippines" href="/philippines/trade" target=\"_blank\"><span></span></a>
						<a class="vietnam" href="/vietnam/trade" target=\"_blank\"><span></span></a>
					</div>
			</div>
		</div>

		<div id="site_link-tab3" class="site_link-tab">
			<ul class="tabs-area3">
				<li><a href="#pacific-ocean">中文</a></li>
				<li><a href="#pacific-ocean-en">English</a></li>
				<li><a href="/">返回总站</a></li>
			</ul> 
			<div class="tab-container" id="map_link">
					<div id="pacific-ocean" class="tab-area3-content">
						<h2>太平洋国家入口<span>THE PACIFIC OCEAN</span></h2>						<img class="map-img" src="/trade/images/map_imgD.png" alt="map">
					</div>
					<div id="pacific-ocean-en" class="tab-area3-content">
						<h2>太平洋国家入口<span>THE PACIFIC OCEAN</span></h2>						<img class="map-img" src="/trade/images/map_en_imgD.png" alt="map">
					</div>
			</div>
		</div>-->

</div>


<div id="orbitBar" class="orbit-bar orbitBar-fixed">
  <div class="region transparent-bg-white">
    <div class="region-inner clearfix">
        <div class="col-section-left">
          <div class="sub-nav col-left">
              <ul class="list-unstyled">
                <li><a class="btn btn-primary btn-large" href="#">分站导航</a></li>
              </ul>
          </div> <!-- end of .sub-nav -->
          <div class="main-regions col-center">
            <ul class="list-inline">
              <li class="highlight"><a href="/CN/trade" target="_blank">总站</a></li><li><a href="/BJ/trade" target="_blank">北京</a></li><li><a href="/FJ/trade" target="_blank">福建</a></li><li><a href="/GD/trade" target="_blank">广东</a></li><li><a href="/GX/trade" target="_blank">广西</a></li><li><a href="/HE/trade" target="_blank">河北</a></li><li><a href="/HA/trade" target="_blank">河南</a></li><li><a href="/HB/trade" target="_blank">湖北</a></li><li><a href="/HV/trade" target="_blank">湖南</a></li><li><a href="/JL/trade" target="_blank">吉林</a></li><li><a href="/LN/trade" target="_blank">辽宁</a></li><li><a href="/NM/trade" target="_blank">内蒙</a></li><li><a href="/NX/trade" target="_blank">宁夏</a></li><li><a href="/SN/trade" target="_blank">陜西</a></li><li><a href="/SD/trade" target="_blank">山东</a></li><li><a href="/QD/trade" target="_blank">青岛</a></li><li><a href="/ZZ/trade" target="_blank">枣庄</a></li><li><a href="/SC/trade" target="_blank">四川</a></li><li><a href="/YN/trade" target="_blank">云南</a></li><li><a href="/XJ/trade" target="_blank">新疆</a></li><li><a href="/SX/trade" target="_blank">山西</a></li><li><a href="/HI/trade" target="_blank">海南</a></li><li><a href="/JJJ/trade" target="_blank">京津冀</a></li><li><a href="/SH/trade" target="_blank">上海</a></li><li><a href="/TW/trade" target="_blank">台湾</a></li><li><a href="/JX/trade" target="_blank">江西</a></li><li><a href="/GZ/trade" target="_blank">贵州</a></li>            </ul>
          </div> <!-- end of .main-regions -->
        </div>
        <div id="orbit-bar-lang-switch" class="orbit-bar-lang-switch col-right">
            <!--<ul class="lang-switch-list list-unstyled">
              <li class="lang-switch-item "><a class="btn btn-primary" href="?Trad2Simp=n&lang=zh-tw" >繁体中文</a></li>
              <li class="lang-switch-item active"><a class="btn btn-primary" href="?Trad2Simp=y&lang=zh-tw">简体中文</a></li>
              <li class="lang-switch-item "><a class="btn btn-primary" href="?lang=en&amp;Trad2Simp=n" >English</a></li>
            </ul>-->
        </div> <!-- end end of .more-info -->
      </div>
  </div> <!-- end of .region -->

  <div class="service transparent-bg-white">
    <div class="service-inner clearfix">
              <div class="login-form col-right">
          <div id="loginstyle"><%nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if telephone="" or isnull(telephone) then%>
            <h4>登录<small class="slogan">Login</small></h4>
            <form name="login_form" id="login_form" method="post" action="/trade/login">
                <p>
                <label class="hide" for="login_id">账号:</label>
                  <input class="orbit-bar-login-username input" name="login_id" type="text" id="login_id" value="" placeholder="用户名或手机号" required>
                <label class="hide" for="login_pw">密码:</label>
                  <input class="orbit-bar-login-password input" name="login_pw" type="password" id="login_pw" placeholder="密码" required>
              </p>
                <p>
                  <div class="login-forgot">
                    <a class="loginbutton" name="login_Submit3" onclick="window.location='/trade/forget';return false;" onkeypress="window.location='/trade/forget';return false;">忘记密码?</a>
                  </div>

                  <input class="loginbutton btn btn-primary" type="submit" name="login_Submit" value="登录" />
                <span class="hide"> <a href="/trade/forget">忘记密码</a></span>
                <input type="hidden" name="PreviousPage" value="/trade" />
              </p>
            </form>
<%else%>
 <p> <span><a href="#"><%=telephone%></a> <font class="wFont">你好！</font></span></p><p>&nbsp;</p>
 <p> <input class="loginbutton btn btn-primary" type="submit" name="login_Submit" onclick="window.location='/userpanel';return false;" value="进入会员中心" /></p><p>&nbsp;</p>
 <p> <input class="loginbutton btn btn-primary" type="submit" name="login_Submit" onclick="window.location='/u_cart';return false;" value="购物车" /></p>
<%end if%>
          </div>
        </div>
        <div class="sign-up-form col-center">
          <h4>注册<small class="slogan">Register</small></h4>
          <p>还不是会员？<br>那快点注册成为我们的一员吧</p>
                          <a class="sign-up-btn btn btn-primary" href="/trade/webreg_station">会员注册</a>
                    </div>

          </div>
  </div>

  <div class="orbit-bar-inner"><div class="orbit-bar-inner2">
    <div class="orbit-bar-logo orbit-bar-item">
      <a id="orbit-bar-site-logo" class="orbit-bar-icon orbit-bar-site-logo hide-text" href="/CN/trade" target="_blank">Site-logo</a>
    </div>

    <div class="home orbit-bar-item">
      <a class="orbit-bar-icon" href="/CN/trade">
        <i class="fa fa-home"> 菜单</i>
        <span class="hide">Home</span>
      </a>
    </div>
    <ul class="orbit-bar-nav orbit-bar-item">
      <li class="orbit-bar-nav-item">
        <a id="orbit-bar-nav-main-site" class="orbit-bar-link" href="#">总站</a>
      </li>

      <li class="orbit-bar-nav-item">
        <a class="orbit-bar-link" href="/trade/product" target="_blank">产品</a>
          <ul class="orbit-bar-nav-dropdown list-unstyled">
<%set rs=server.createobject("adodb.recordset")
exec="select * from [category] where ParentID=1 and hide=0 and siteid="&siteid&" order by categoryorder asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if a=rs("id") then category=rs("category")
%><li><a href="/trade/product<%=rs("id")%>"><%=rs("category")%></a></li><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
          </ul>
      </li>

      <li class="orbit-bar-nav-item">
        <a class="orbit-bar-link" href="/trade/product2" target="_blank">农资</a>
          <ul class="orbit-bar-nav-dropdown list-unstyled">
<%set rs=server.createobject("adodb.recordset")
exec="select * from [category] where ParentID=2 and hide=0 and siteid="&siteid&" order by categoryorder asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if a=rs("id") then category=rs("category")
%><li><a href="/trade/product<%=rs("id")%>"><%=rs("category")%></a></li><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%>
          </ul>
      </li>
      <li class="orbit-bar-nav-item">
        <a class="orbit-bar-link" href="/trade/product2?actnews_product_class=3" target="_blank">兴农扶贫</a>
      </li>
      
      <li class="orbit-bar-nav-item">
        <a class="orbit-bar-link" href="/list_afair" target="_blank">会展平台</a>
      </li>
      <li class="orbit-bar-nav-item">
        <a class="orbit-bar-link" href="/trade/news2?class=901,902,903,904,905,906" target="_blank">信息</a>
          <ul class="orbit-bar-nav-dropdown list-unstyled">
              <li><a href="/list_news" target="_blank">新农资讯</a></li>
              <li><a href="/list_help" target="_blank">精准扶贫</a></li>
              <li><a href="/list_eagr" target="_blank">生态休闲农业</a></li>
              <li><a href="/list_food" target="_blank">食品安全</a></li>
              <li><a href="/list_law" target="_blank">政策法规</a></li>
              <li><a href="/list_proco" target="_blank">专业合作社</a></li>
              <li><a href="/list_prore" target="_blank">产品推荐</a></li>
          </ul>
      </li>
      <li class="orbit-bar-nav-item">
        <a class="orbit-bar-link" href="/trade/info2_super_pages?ID=info304" target="_blank">服务</a>
          <ul class="orbit-bar-nav-dropdown list-unstyled">
              <li><a href="/trade/info2_super_pages?ID=info304" target="_blank">金融服务</a></li>
              <li><a href="/trade/logistics" target="_blank">物流服务</a></li>
              <li><a href="/trade/safe" target="_blank">保险服务</a></li>
              <li><a href="/trade/info2_super_pages?ID=info301" target="_blank">担保服务</a></li>
              <li><a href="/trade/info2_super_pages?ID=info306" target="_blank">采购供应</a></li>
              <li><a href="/trade/ad_advertisement" target="_blank">广告服务</a></li>
          </ul>
      </li>	
    </ul>

	
    <div id="orbit-bar-nav-user" class="orbit-bar-nav-user orbit-bar-item">
      <a class="service-center orbit-bar-link" href="/login.php">
                  <span class="service-center-txt">登录 | 注册</span>
              </a>
    </div>

    <div id="orbit-bar-services" class="orbit-bar-nav-user orbit-bar-item">
    <!-- <a class="service-items orbit-bar-link" href="#footer2"> -->
       
    </div>

    <script type="text/javascript">   
      function OnSubmitForm()
      {
        $q = jQuery.noConflict();

        if( $q('#bar_search_select').val() =='store' ) document.barsearch_form.action ="/trade/product";
        else if( $q('#bar_search_select').val() =='product' ) document.barsearch_form.action ="/trade/product";
        else if( $q('#bar_search_select').val() =='news' ) document.barsearch_form.action ="/trade/product";

        return true;
      }
    </script>
    <div class="orbit-bar-nav-search">
            <form method="post" name="barsearch_form" onsubmit="return OnSubmitForm();">
        <select name='bar_search_select' id='bar_search_select' class="orbit-bar-search-category">
          <option value="product">产品</option>
          <option value="store">商家</option>
          <option value="news">新闻</option>
        </select>
        
        <input type="text" class="orbit-bar-search-query" name="key" id="key" value="" placeholder="请输入你想搜寻的内容" /> 
        <input type="submit" name="action" class="orbit-bar-search-action" id="action" value="."/> 
        <input type="hidden" name="search" value="blur"/> 
      </form>
    </div>
    <div class="orbit-bar-service-mobile rwd-btn">
      <i class="fa fa-shopping-cart"></i>
    </div>
  </div></div>
</div> <!-- end of #orbitBar -->


<div id="container" class="container">
    <div id="container2" class="container-inner">
<div id="main" class="main">
    <div id="main2" class="main-inner  wrapper">

        <a id="accesskey_submenu" accesskey="S" href="/accesskey.php" title="子选单" >:::</a><h2><span><%=category%></span></h2><div id="submenu" style="padding-top:12px;"><div id="submenu_b"><ul id="ul_submenu_0" class=""><!--<li class="odd"><span><a href="product.php?actnews_product_class=14"  ><span>果蔬</span></a></span></li><li><span><a href="product.php?actnews_product_class=9"  ><span>水产畜牧</span></a></span></li><li class="odd"><span><a href="product.php?actnews_product_class=12"  ><span>粮油作物</span></a></span></li><li><span><a href="product.php?actnews_product_class=10"  ><span>土特产</span></a></span></li><li class="odd"><span><a href="product.php?actnews_product_class=11"  ><span>酒水茶叶</span></a></span></li>--></ul></div></div>
    <div id="content" class="content">
        <div id="content2" class="content-inner clearfix">

          <a id="accesskey_content" accesskey="C" href="/accesskey.php" title="内容区块">:::</a>

        
	<fieldset class="product-search fieldset"><legend class="legend">搜寻</legend>	
	<form method="post" id="searchform" class="product-query-form" action="?"><input name="action" type="hidden" value="" />
		<div class="form-control">
			<div class="combine product-category"><label class="form-label from-label-horizontal">商品分类</label>
				<select name="actnews_product_class" class="actnews_product_class select border-radius">
					<option value="">请选择分类</option>
<%set rs=server.createobject("adodb.recordset")
exec="select * from [category] where ParentID=1 and hide=0 and siteid="&siteid&" order by categoryorder asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof
if a=rs("id") then category=rs("category")
%><option value='<%=rs("id")%>'<%if a=rs("id") then%> selected<%end if%>><%=rs("category")%></option><%		
rs.movenext
Loop
rs.close
set rs=nothing
end if%></select>
				<select name="actnews_product_class2" class="actnews_product_class2 select border-radius">
		      <option value="">请选择子分类</option>
		    </select>
		    </div>
	    </div>
	<div class="search_name form-control">
		<label class="form-label from-label-horizontal">
			<div class="col_text"><li class="col" for="key">关键字搜寻</li><li class="col_r"><input name="key" type="text" id="key" value="<%=key%>" size="25"  /></li></div>			<div class="col_radio"><li class="col">搜寻方式</li><li class="col_r"><div class="combine"><input name="search" id="search_blur" type="radio" value="blur"<%if search="blur" or search="" then%> checked<%end if%>/> <label for="search_blur" class="checkbox">模糊搜寻</label></div><div class="combine"><input name="search" id="search_complete" type="radio" value="complete"<%if search="complete" then%> checked<%end if%>/> <label for="search_complete" class="checkbox">精准搜寻</label></div></li></div>		</label>
		<input type="submit" id="searchsubmit" class="search-btn btn btn-primary btn-small" value="搜寻" />
	</div>
	</form>
	</fieldset>
<%page=Request("page")
if page="" or isnull(page) then page=0
PageNo=page
if PageNo="" then PageNo=1
if isnumeric(PageNo) or PageNo="" then
PageNo=abs(PageNo)
 if PageNo=0 then PageNo=1
else
 PageNo=1
end if
TblName = "[product]"
FldName = "id" '说明，排序字段值在数据库不能有重复 : 建议是主键
FieldName="id,name,pic1,Descriptions,price1,price2,catid"
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
if a=0 then
StrWhere="onsale=0"
else
catlist=getzcat(a)
if catlist<>"" and isnull(catlist)=false then
zcatlist=SPLIT(catlist,",")
for z=1 to Ubound(zcatlist)
zcatsql=zcatsql&" or catid="&SPLIT(catlist,",")(z)
next
end if
StrWhere="onsale=0 and (catidlist like '%|"&a&"|%' or catid="&a&")"
if zcatsql<>"" then StrWhere="onsale=0 and (catidlist like '%|"&a&"|%' or catid="&a&zcatsql&")"
end if
if search<>"" then
if key<>"" and search="complete" then StrWhere=StrWhere&" and name='"&key&"'"
if key<>"" and (search="blur" or search="") then StrWhere=StrWhere&" and name like '%"&key&"%'"
else
if key<>"" then StrWhere=StrWhere&" and name like '%"&key&"%'"
end if
if key<>"" then skey="&skey=yes"
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
end if

if PageNo>1 then pagelist="<li><a class=""prev_btn"" href=""/trade/product"&a&"?a=act"&skey&"&page="&page-1&"""><</a></li>"
for p=1 to PageCountX
if PageNo=p then
pagelist=pagelist&"<li>"&p&"</li>"
else
pagelist=pagelist&"<li><a class=""paging"" href=""/trade/product"&a&"?a=act"&skey&"&page="&p&""">"&p&"</a></li>"
end if
next
if PageCountX>PageNo then pagelist=pagelist&"<li><a class=""next_btn"" href=""/trade/product"&a&"?a=act"&skey&"&page="&page+1&""">></a></li>"

if FieldCount>0 then
do while not rs.eof
prolist=prolist&"<div id=""product"" class=""product-wrap""><a class=""product-image-link"" href=/trade/goods?action=buy&Sn="&rs("catid")&"&BSn="&rs("id")&" target='_blank'><div id=""Product_Pic"" class=""product-pic-wrap""><img src="""&rs("pic1")&""" width=""180"" height=""180"" alt="""&rs("name")&""" /></div></a><div class=""product-info-wrap""><a class=""product-name"" href=/trade/goods?action=buy&Sn="&rs("catid")&"&BSn="&rs("id")&" target='_blank'>"&rs("name")&"</a><span class=""product-price label label-primary""><s>￥"&rs("price1")&"</s></span> <span class=""product-price label label-warning"">￥"&rs("price2")&"</span><!--<a class=""product-owner-page"" href=/trade/product?Sn=97 target='_blank'> <i class=""product-owner-page-icon fa fa-user""></i><span class=""product-owner-page-name"">新农合作社</span></a>--></div></div>"
rs.movenext
loop
rs.close
set rs=nothing
end if%>
<%=prolist%>
<div class="PageDetails">第 <%=page%> 页 / 共 <%=PageCountX%> 页<ol class="PageList"><%=pagelist%></ol></div><script type="text/javascript">
$q = jQuery.noConflict();
$q(document).ready(function (){

	$q('.actnews_product_class').change(function(){
		$q.ajax({
			url: window.location.origin+'/working',
			cache: false,
			dataType: 'html',
			type:'GET',
			data: 'action=product_class&product_class1='+$q('.actnews_product_class').val(),
			error: function(xhr) {
				alert('Ajax request 发生错误');
			},
			success: function(data) {
				$q(".actnews_product_class2").empty().append(data);
			}
		});
	});
});
</script>


 
						</div></div></div></div> 
  	
	  	<div id="linklist"><div id="linklist2"><div id="linklist3"><!-- 个人服务区  -->

<a id="accesskey_menu" accesskey="M" href="/accesskey.php" title="主选单" >:::</a>


<!-- 网站选单 --> 

<div id="menu1"><div id="menu1_b"><ul id="ul_menu1_0" class=""><li class="odd"><span><a href="/trade/product1?actnews_product_class=5,2,6,7,4,8"  ><span>农资</span></a><ul id="ul_submenu1_0" class=""><li class="odd"><span><a href="/trade/product1?actnews_product_class=5"  ><span>化肥</span></a></span></li><li><span><a href="/trade/product1?actnews_product_class=2"  ><span>农药</span></a></span></li><li class="odd"><span><a href="/trade/product1?actnews_product_class=6,7"  ><span>种子种苗</span></a></span></li><li><span><a href="/trade/product1?actnews_product_class=4,8"  ><span>农膜</span></a></span></li></ul></span></li><li><span><a href="/trade/product2?actnews_product_class=3"  ><span>农业机械</span></a><ul id="ul_submenu1_0" class=""><li class="odd"><span><a href="/trade/product1?actnews_product_class=5"  ><span>化肥</span></a></span></li><li><span><a href="/trade/product1?actnews_product_class=2"  ><span>农药</span></a></span></li><li class="odd"><span><a href="/trade/product1?actnews_product_class=6,7"  ><span>种子种苗</span></a></span></li><li><span><a href="/trade/product1?actnews_product_class=4,8"  ><span>农膜</span></a></span></li></ul></span></li><li class="odd"><span><a href="/trade/product3?actnews_product_class=9,10,11,12,14"  ><span>农副产品</span></a><ul id="ul_submenu1_0" class=""><li class="odd"><span><a href="/trade/product3?actnews_product_class=9"  ><span>生鲜</span></a></span></li><li><span><a href="/trade/product3?actnews_product_class=10"  ><span>土特产</span></a></span></li><li class="odd"><span><a href="/trade/product3?actnews_product_class=11"  ><span>茶叶</span></a></span></li><li><span><a href="/trade/product3?actnews_product_class=12,14"  ><span>其他类别</span></a></span></li></ul></span></li><li><span><a href="/trade/news2?class=901,902,903,904,905,906"  ><span>资讯中心</span></a><ul id="ul_submenu1_0" class=""><li class="odd"><span><a href="/trade/news2?class=901,902,903,904,905,906"  ><span>农业投资项目</span></a></span></li><li><span><a href="/trade/news2?class=901"  ><span>国际农情</span></a></span></li><li class="odd"><span><a href="/trade/news2?class=902"  ><span>智慧农业</span></a></span></li><li><span><a href="/trade/news2?class=903"  ><span>行情分析</span></a></span></li><li class="odd"><span><a href="/trade/news2?class=904"  ><span>三农要闻</span></a></span></li><li><span><a href="/trade/news2?class=905"  ><span>政策法规</span></a></span></li><li class="odd"><span><a href="/trade/news2?class=906"  ><span>致富经验</span></a></span></li><li><span><a href="/news/store.php"  ><span>商家信息</span></a></span></li></ul></span></li><li class="odd"><span><a href="/trade/info2_super_pages?ID=info304"  ><span>服务中心</span></a><ul id="ul_submenu1_0" class=""><li class="odd"><span><a href="/trade/info2_super_pages?ID=info304"  ><span>金融服务</span></a></span></li><li><span><a href="/trade/info2_super_pages?ID=info302"  ><span>物流服务</span></a></span></li><li class="odd"><span><a href="/trade/info2_super_pages?ID=info303"  ><span>保险服务</span></a></span></li><li><span><a href="/trade/info2_super_pages?ID=info301"  ><span>担保服务</span></a></span></li><li class="odd"><span><a href="/trade/info2_super_pages?ID=info305"  ><span>会展服务</span></a></span></li><li><span><a href="/trade/info2_super_pages?ID=info306"  ><span>采购供应</span></a></span></li></ul></span></li><li><span><a href="/trade/info3_news?class=501"  ><span>帮助中心</span></a><ul id="ul_submenu1_0" class=""><li class="odd"><span><a href="/trade/info3_news?class=501"  ><span>买家服务</span></a></span></li><li><span><a href="/trade/info3_news?class=502"  ><span>卖家服务</span></a></span></li><li class="odd"><span><a href="/trade/info2_super_pages?ID=info203"  ><span>采购指南</span></a></span></li><li><span><a href="/trade/info2_super_pages?ID=info204"  ><span>商家入驻</span></a></span></li><li class="odd"><span><a href="/trade/info2_super_pages?ID=info205"  ><span>交易须知</span></a></span></li><li><span><a href="/trade/info2_super_pages?ID=info206"  ><span>关于我们</span></a></span></li></ul></span></li></ul></div></div>
</div>
</div></div></div>
		<div class="footer-bar-inner"><div class="footer-bar-inner2">
		    <ul class="footer-bar-navm">
				
		            <li class="footer-bar-nav-item">		
		              <a class="footer-bar-link" href="#">联系客服</a>			  
						<ul class="footer-bar-nav-dropdown1">
				            <li class="orbit-bar-nav-item"><a class="orbit-bar-link" href="#" target="_blank"> QQ客服</a>	</li>
		                    <li><a href="#">电话咨询</a></li>
						
		                </ul> 
		            </li>
		            <span>|</span>
		            <li class="footer-bar-nav-item">
		              <a class="footer-bar-link" href="#">帮助中心</a>
						<ul class="footer-bar-nav-dropdown2">
		                    <li><a href="/trade/info3_news?class=501" target="_blank">买家服务</a></li>
		                    <li><a href="/trade/info3_news?class=502" target="_blank">卖家服务</a></li>
		                    <li><a href="/trade/info2_super_pages?ID=info203" target="_blank">采购指南</a></li>
		                    <li><a href="/trade/info2_super_pages?ID=info204" target="_blank">商家入驻</a></li>
		                    <li><a href="/trade/info2_super_pages?ID=info205" target="_blank">交易须知</a></li>
		                </ul>
		            </li>
		            <span>|</span>
		            <li class="footer-bar-nav-item">
		              <a class="footer-bar-link" href="#">合作伙伴</a>
						<ul class="footer-bar-nav-dropdown3">
		                    <li><a href="http://www.china-clearing.com/" target="_blank">中金支付</a></li>
		                    <li><a href="http://www.epicc.com.cn/" target="_blank">中国人保财险</a></li>
		                    <li><a href="http://www.pecc-china.org/" target="_blank">PECC(外经委)</a></li>
		                </ul> 
		            </li>
		            <span>|</span>
		            <li class="footer-bar-nav-item">
		              <a class="footer-bar-link" href="#">关于我们</a>
						<ul class="footer-bar-nav-dropdown4">
		                    <li><a href="http://www.zgnmzymyw.org/" target="_blank">中国农贸</a></li>
		                </ul> 
		            </li>
		            <span>|</span>
		            <li class="footer-bar-nav-item">
		              <a class="footer-bar-link" href="#">合作加盟</a>
						<ul class="footer-bar-nav-dropdown5">
		                    <li><a href="/trade/info2_super_pages?ID=info206" target="_blank">联系我们</a></li>
		                </ul> 
		            </li>
		            <span>|</span>
		            <li class="footer-bar-nav-item">
		              <a class="footer-bar-link" href="#">友情链接</a>
						<ul class="footer-bar-nav-dropdown6">
		                    <li><a href="https://www.kuaidi100.com/" target="_blank">快递100</a></li>
		                    <li><a href="http://www.geetest.com/" target="_blank">极验验证</a></li>
		                    <li><a href="https://www.juhe.cn/" target="_blank">聚合数据</a></li>
		                </ul> 
		            </li>
		            <span>|</span>
		            <li class="footer-bar-nav-item">
		              <a class="footer-bar-link" href="#">微信公众</a>
						<ul class="footer-bar-nav-dropdown7">
		                    <li><img class="qr-img" src="/trade/images/caacn-qrcode.jpg" alt="QRcode"></li>
		                </ul> 
		            </li>


		    </ul>
		</div></div>
		<div id="extralist10"><script type="text/javascript">
	var $m = jQuery.noConflict(); 
	$m(document).ready(
		function(){
		// 预设显示第一个 Tab
		var _showTab = 0;

		$m('ul.tabs-area li').eq(_showTab).addClass('active');
		$m('.tab-area-content').hide().eq(_showTab).show();

		$m('ul.tabs-area2 li').eq(_showTab).addClass('active');
		$m('.tab-area2-content').hide().eq(_showTab).show();

		$m('ul.tabs-area3 li').eq(_showTab).addClass('active');
		$m('.tab-area3-content').hide().eq(_showTab).show();
	 
		// 当 li 页籤被点击时...
		// 若要改成鼠标移到 li 页籤就切换时, 把 click 改成 mouseover
		$m('ul.tabs-area li,ul.tabs-area2 li,ul.tabs-area3 li').click(function() {
			// 找出 li 中的超连结 href(#id)
			
			var $this = $m(this), 
						_clickTab = $this.find('a').attr('href');
			
			// 把目前点击到的 li 页籤加上 .active
			// 并把兄弟元素中有 .active 的都移除 class
			$this.addClass('active').siblings('.active').removeClass('active');
			// 淡入相对应的内容并隐藏兄弟元素
			$m(_clickTab).stop(false, true).fadeIn().siblings().hide();
	 
			return false;
		}).find('a').focus(function(){
			this.blur();
		});
	});
</script></div>
		<div class="help-bt"><a href="/trade/info3_news?class=501">help</a></div>
		</div></div>
		<div id="footer" class="footer">
			<div id="footer2" class="footer-inner clearfix">
					<!-- 网站版权宣告 -->

<div class="info-wrap footer-top-col"><div class="info-wrap2 wrapper">
	<div id="info1" class="footer-info-section">
		<h3>关于我们</h3>
		<ul>
			<li><a href="/trade/info1_super_pages?ID=info101" target="_blank">中国农贸</a></li>
			<li><a href="/trade/info1_super_pages?ID=info102" target="_blank">交易保障</a></li>
			<li><a href="/trade/info1_super_pages?ID=info103" target="_blank">合作联系</a></li>
		</ul>	
	</div>	
	<div id="info2" class="footer-info-section">
		<h3>买卖家服务</h3>
		<ul>
			<li><a href="/trade/info2_super_pages?ID=info201" target="_blank">找企业</a></li>
			<li><a href="/trade/info2_super_pages?ID=info202" target="_blank">找产品</a></li>
			<li><a href="/trade/info2_super_pages?ID=info203" target="_blank">采购指南</a></li>
			<li><a href="/trade/info2_super_pages?ID=info204" target="_blank">商家入驻</a></li>
		</ul>	
	</div>
	<div id="info3" class="footer-info-section">
		<h3>整合服务</h3>
		<ul>
			<li><a href="/trade/booth_act" target="_blank">会展服务</a></li>
			<li><a href="/trade/logistics" target="_blank">物流服务</a></li>
			<li><a href="/trade/safe" target="_blank">保险服务</a></li>
			<li><a href="/trade/info2_super_pages?ID=info304" target="_blank">银行服务</a></li>
			<li><a href="/trade/info2_super_pages?ID=info305" target="_blank">担保服务</a></li>
		</ul>	
	</div>	
	<div id="info4" class="footer-info-section">
		<h3>友情链结</h3>
		<ul>
			<li><a href="http://www.zgxnnj.org" target="_blank">新农年鉴</a></li>
			<li><a href="http://www.zgnmzymyw.org" target="_blank">农贸平台</a></li>
			<li><a href="http://m.kuaidi100.com" target="_blank">快递查询</a></li>
		</ul>	
	</div>	
</div></div>

<div id="footer_address" class="footer-bottom-col"><div id="footer_address2" class="wrapper">
	<a href="/CN/trade"><img src="/trade/images/footer-logo.jpg" alt="Footer Logo"></a> 
	<div class="footer-info-link" style="height:auto; line-height:38px; padding-top:10px;">
 主管单位：国资委商业饮食服务业发展中心　<span id="m"><br></span>国资委中华传统饮食与健康服务业推广管理委员会　<span id="m"><br></span>主办：中国新农村建设先进人物年鉴编辑人物年鉴编辑委员会
		<!--<ul>
			<li><a href="/info0/super_pages.php?ID=info001" target="_blank">法律声明</a>
			</li>
			<li class="separator">|</li>
			<li><a href="/info0/super_pages.php?ID=info002" target="_blank">服务条款</a>
			</li>
		</ul>	-->
	</div>	
<p>
<div style="text-align: center;"><span style="font-size: 14px; line-height:38px;">copyright &copy; 2018 中国农民自由贸易网 <a href="http://www.miitbeian.gov.cn" target="_blank" style="font-size: 14px; line-height:38px;">京ICP备16039441号</a></span></div>
<div style="text-align: center;"><span style="font-size: 14px; line-height:38px;">客服电话：010-86469678 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span id="m"><br></span>E-mail: <a href="mailto:nmw@zgnmzymyw.com" style="font-size: 14px">nmw@zgnmzymyw.com</a><br />
<img src="/trade/images/_archive_504_718eccbf.jpg" width="11" height="4" alt="" />&nbsp; &nbsp; &nbsp;&nbsp;<img src="/trade/images/_archive_505_7ec98e23.jpg" width="10" height="12" alt="" />&nbsp; &nbsp; &nbsp;&nbsp;<img src="/trade/images/_archive_506_a9b21eac.jpg" width="10" height="5" alt="" /><br type="_moz" />
</span></div><br />
</p>
</div></div>
			</div>
		</div>

	
<script>
(function($, undefined) {
  'use strict';

  $(document).ready(function() {
      $('#webreg').prepend('<div class="header wrapper"></div>');
      $('#webreg > img').first().appendTo('.header').addClass('logo');
      $('#webreg > span').first().appendTo('.header').addClass('welcome');
      $('#webreg > ul').first().appendTo('.header').addClass('nav');
      $('#webreg > ul').first().appendTo('.header').addClass('reg-step');
      $('#page_webreg').prepend('<div class="header wrapper"></div>');
      $('#page_webreg > img').first().appendTo('.header').addClass('logo');
      $('#page_webreg > span').first().appendTo('.header').addClass('welcome');
      $('#page_webreg > ul').first().appendTo('.header').addClass('nav');
      $('#page_webreg > ul').first().appendTo('.header').addClass('reg-step');
      for(var i=0;i<=2;i++)
      { var num = i+1;
        $('.nav').find('li').eq(i).prepend('<img src="../images/webreg'+num+'.png">');
      }
      var url = location.href;
      if(url.indexOf("webreg.php")!=-1)
      {

         $('#captcha_random').appendTo($('#form2').find('.col_text').last().find('.col_r')); 
         $('.word_change').insertAfter('input[name="captcha_code"]'); 
         $('.reg-step > li').first().removeClass('webreg-option');
         $('.reg-step > li').eq(1).find('span').attr('class','webreg-option').end().addClass('active');

      }
      else if(url.indexOf("webreg_station.php")!=-1){
         $('.reg-step > li').eq(0).find('span').attr('class','webreg-option').end().addClass('active');        
      }
      else if(url.indexOf("webreg.rev.php")!=-1){
        $('.reg-step > li').first().removeClass('webreg-option');
        $('.reg-step > li').eq(2).find('span').attr('class','webreg-option').end().addClass('active'); 
        $('#main2 >h2').remove();
        $('#content2').prepend('<img id="ok" src="../images/ok.png">');
        $('#content2 > h2').first().append('<span class="confirm-words"></span>');
        // $('#content2 > h2').first().find('span').addClass('confirm');
        $('#content2 > a').eq(1).addClass('login-email');
      }
      else if(url.indexOf("webreg_auth.php")!=-1){
         $('.reg-step > li').first().removeClass('webreg-option');
         $('.reg-step > li').eq(3).find('span').attr('class','webreg-option').end().addClass('active');       
      }

  });
  window.onload = function(){
    $('#ok').addClass('active');
    $('#page_webreg #content2 > h2,#page_webreg #content2 > p').addClass('active');
  };
}(jQuery));
	
</script><div id="extradiv2"></div><div id="extradiv3"></div><div id="extradiv4"></div><div id="extradiv5"></div><div id="extradiv6"></div>
</body>
</html>
