<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"-->
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
<link href="/nong/css/common.css" rel="stylesheet" type="text/css" />
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
<link rel="stylesheet" href="/nong/css/site-color-style-1.css?v=20180702"/>
<!--整站改色 _end-->
<script src="/nong/js/jquery.js?v=201807241613"></script>
<script src="/nong/js/common.js?v=201807241613"></script>
<script src="/nong/js/jquery.lazyload.js?v=201807241613"></script>
<link rel="stylesheet" href="/nong/css/index.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/template.css?v=20180702"/>
<script src="/nong/js/index.js?v=201807241613"></script>
<script src="/nong/js/tabs.js?v=201807241613"></script>
<script src="/nong/js/bubbleup.js?v=201807241613"></script>
<script src="/nong/js/jquery.hiSlider.js?v=201807241613"></script>
<script src="/nong/js/index_tab.js?v=201807241613"></script>
<script src="/nong/js/jump.js?v=201807241613"></script>
<script src="/nong/js/nav.js?v=201807241613"></script>
<!-- preventing FOUC -->
<style>	@media screen and (min-width:641px){#m{display:none;}} @media screen and (max-width: 640px) {#pc{display:none;}} @media screen and (max-width: 380px) {#bar_search_select{display:none;}}
  .no-fouc {display: none;}
</style>
<script type="text/javascript">
  document.documentElement.className += ' no-fouc';
</script>
<!-- end of preventing FOUC -->

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
     <div id="pageheader" class="pageheader">
     <div id="ADB"><ul id="carousel" class="carousel list-unstyled cycle-slideshow" 
					data-cycle-caption=".carousel-caption" 
					data-cycle-caption-template="{{cycleTitle}}" 
					data-cycle-fx=scrollHorz 
					data-cycle-swipe=true 
					data-cycle-log=false 
					data-cycle-prev=".prev"
					data-cycle-next=".next"
					data-cycle-timeout=10000 
					data-cycle-auto-height="1920:460"
					data-cycle-pager="#per-slide-template"
					><img src='/trade/img/ad1.jpg' class="imglist" data-cycle-outlink='/trade/product15'  data-cycle-pager-template='<a href=#>滞销产品推荐 脱贫攻坚工程</a>'><img src='/trade/img/ad2.jpg' class="imglist" data-cycle-outlink='/detail_aboutus_184' data-cycle-pager-template='<a href=#>三农服务联盟</a>'><img src='/trade/img/ad3.jpg' class="imglist" data-cycle-outlink='/trade/product15' data-cycle-pager-template='<a href=#>三农科技 高优牧草</a>'></ul><div id=per-slide-template class="center external"></div><div class="tool_box"><div class="tool_box2"><a href=# class="prev"><i class="fa fa-angle-left"></i></a><a href=# class="next"><i class="fa fa-angle-right"></i></a></div></div></div><script type="text/javascript">
					var imgs = document.getElementById('ADB').getElementsByClassName('imglist');
					for(i = 0;i < imgs.length; i++){
						var img = imgs[i];
						img.addEventListener('click',function(){
							window.location.href = this.getAttribute('data-cycle-outlink');
						})
					}
				</script>        <div id="pageheader2" class="pageheader-inner clearfix">
           
	<a href="/CN/trade" title="回首页">
		<img src="/trade/images/logo.jpg" alt="LOGO" title="回首页" />
	</a>

        </div>
      </div>
      
<link rel="stylesheet" href="/trade/css/swiper.min.css">
<script src="/trade/js/swiper.min.js"></script>
		<div id="M" class="swiper-container">
	        <div class="swiper-wrapper">
	        	<div class="swiper-slide"><img src='/trade/img/ad1m.jpg'/></div>
	            <div class="swiper-slide"><img src='/trade/img/ad2m.jpg'></div>
	            <div class="swiper-slide"><img src='/trade/img/ad3m.jpg'></div>
	        </div>
	        <!--点-->
	        <div class="swiper-pagination"></div>
	    </div>
	<script>
        var swiper = new Swiper('.swiper-container',{
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            pagination: '.swiper-pagination',
            loop: true,
            autoplay : 3000,
            autoplayDisableOnInteraction: false
        });
    </script>


  
<div class="w1210 floor-list">
		<div class="floor" color='#4cb946'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 1F </span>
							<!-- } -->
							<a href="/list-140.html" target="_blank"  style='color:#4cb946;'>绿色生资</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #4cb946 #4cb946 #fff; color: #4cb946;'>精品推荐</h3>
							</li>
							
							
							<li>
								<h3>绿色肥料</h3>
							</li>
							
							<li>
								<h3>绿色农药</h3>
							</li>
							
							<li>
								<h3>绿色饲料及添加剂</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #4cb946 solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/list-140.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040845029260.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040845029260.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
								

								
								
								<li>
									<a href="/nong/list-141.html" target="_blank" title="绿色肥料">绿色肥料</a>
								</li>
								
								
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/list-140.html" target="_blank">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040845715846.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040845715846.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/goods-638.html" target="_blank">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040845753596.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040845753596.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="goods-353.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846308636.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846308636.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/goods-436.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846302304.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846302304.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/goods-438.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846319864.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846319864.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/goods-433.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846311212.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846311212.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/goods-136.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846317882.jpg" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/site/1/gallery/2017/08/30/15040846317882.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-638.html" title="济农乐土 " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/8/gallery/2017/08/15/15027729651837.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/8/gallery/2017/08/15/15027729651837.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="济农乐土 " style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-638.html" title="济农乐土 ">济农乐土 </a>
										</p>
										<p class="price">
											<span class="second-color">￥200.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/8/gallery/2017/08/15/15027729651837.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-639.html" title="济农冲力钾" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/taobao-yun-images/556268592984/TB2XJWdcgwjyKJjSspeXXXXZXXa_!!2250758866.gif?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/taobao-yun-images/556268592984/TB2XJWdcgwjyKJjSspeXXXXZXXa_!!2250758866.gif?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="济农冲力钾" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-639.html" title="济农冲力钾">济农冲力钾</a>
										</p>
										<p class="price">
											<span class="second-color">￥200.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='639' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/taobao-yun-images/556268592984/TB2XJWdcgwjyKJjSspeXXXXZXXa_!!2250758866.gif?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" style="width: 204px">
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-1007.html" title="富万钾 烟草型 250ml" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/08/31/15041574916614.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/08/31/15041574916614.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="富万钾 烟草型 250ml" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-1007.html" title="富万钾 烟草型 250ml">富万钾 烟草型 250ml</a>
										</p>
										<p class="price">
											<span class="second-color">￥39.90</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='1007' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/08/31/15041574916614.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-643.html" title="济农 腐殖酸水溶肥料（营养调理型）" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/taobao-yun-images/556398957773/TB20sbcedsmyKJjSZFvXXcE.FXa_!!2250758866.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/taobao-yun-images/556398957773/TB20sbcedsmyKJjSZFvXXcE.FXa_!!2250758866.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="济农 腐殖酸水溶肥料（营养调理型）" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-643.html" title="济农 腐殖酸水溶肥料（营养调理型）">济农 腐殖酸水溶肥料（营养调理型）</a>
										</p>
										<p class="price">
											<span class="second-color">￥50.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='643' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/taobao-yun-images/556398957773/TB20sbcedsmyKJjSZFvXXcE.FXa_!!2250758866.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-999.html" title="富万钾20ML，有机钾，全吸收，效果好。" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/08/29/15039972300748.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/08/29/15039972300748.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="富万钾20ML，有机钾，全吸收，效果好。" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-999.html" title="富万钾20ML，有机钾，全吸收，效果好。">富万钾20ML，有机钾，全吸收，效果好。</a>
										</p>
										<p class="price">
											<span class="second-color">￥3.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='999' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/08/29/15039972300748.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-3203.html" title="硕丰481（0.0075%芸苔素内酯）" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/23/gallery/2017/08/24/15035557378689.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/23/gallery/2017/08/24/15035557378689.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="硕丰481（0.0075%芸苔素内酯）" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-3203.html" title="硕丰481（0.0075%芸苔素内酯）">硕丰481（0.0075%芸苔素内酯）</a>
										</p>
										<p class="price">
											<span class="second-color">￥30.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='3203' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/23/gallery/2017/08/24/15035557378689.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-3202.html" title="美多收 0.0075%芸苔素内酯  水剂AS" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/23/gallery/2017/08/31/15041580520193.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/23/gallery/2017/08/31/15041580520193.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="美多收 0.0075%芸苔素内酯  水剂AS" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-3202.html" title="美多收 0.0075%芸苔素内酯  水剂AS">美多收 0.0075%芸苔素内酯  水剂AS</a>
										</p>
										<p class="price">
											<span class="second-color">￥320.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='3202' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/23/gallery/2017/08/31/15041580520193.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" style="width: 204px">
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-3177.html" title="路富达 德国拜耳 氟吡菌酰胺 根结线虫特效 白粉病 农药杀菌剂" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/19/15136624539776.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/19/15136624539776.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="路富达 德国拜耳 氟吡菌酰胺 根结线虫特效 白粉病 农药杀菌剂" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-3177.html" title="路富达 德国拜耳 氟吡菌酰胺 根结线虫特效 白粉病 农药杀菌剂">路富达 德国拜耳 氟吡菌酰胺 根结线虫特效 白粉病 农药杀菌剂</a>
										</p>
										<p class="price">
											<span class="second-color">￥230.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='3177' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/19/15136624539776.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-3176.html" title="藜芦碱5% 植物源杀虫剂 绿色有机无公害 茶黄螨 红蜘蛛生物杀虫药" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/19/15136626057774.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/19/15136626057774.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="藜芦碱5% 植物源杀虫剂 绿色有机无公害 茶黄螨 红蜘蛛生物杀虫药" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-3176.html" title="藜芦碱5% 植物源杀虫剂 绿色有机无公害 茶黄螨 红蜘蛛生物杀虫药">藜芦碱5% 植物源杀虫剂 绿色有机无公害 茶黄螨 红蜘蛛生物杀虫药</a>
										</p>
										<p class="price">
											<span class="second-color">￥23.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='3176' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/19/15136626057774.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-3175.html" title="微生物农药短稳杆菌悬浮剂杀虫剂 微生物杀虫 防治菜青虫斜纹夜蛾" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/12/18/15135806226147.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/12/18/15135806226147.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="微生物农药短稳杆菌悬浮剂杀虫剂 微生物杀虫 防治菜青虫斜纹夜蛾" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-3175.html" title="微生物农药短稳杆菌悬浮剂杀虫剂 微生物杀虫 防治菜青虫斜纹夜蛾">微生物农药短稳杆菌悬浮剂杀虫剂 微生物杀虫 防治菜青虫斜纹夜蛾</a>
										</p>
										<p class="price">
											<span class="second-color">￥10.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='3175' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/11/gallery/2017/12/18/15135806226147.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								<div class="item" style="width: 204px">
									<div class="wrap">
										<a target="_blank" href="http://www.900nong.com/goods-3174.html" title="硕丰481花之果芸苔素内酯保花保果植物生长调节解药剂" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/assets/d2eace91/images/common/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/644/gallery/2017/12/18/15135779988233.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/644/gallery/2017/12/18/15135779988233.jpg?x-oss-process=image/resize,m_pad,limit_0,h_220,w_220/format,webp/quality,q_75" alt="硕丰481花之果芸苔素内酯保花保果植物生长调节解药剂" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="http://www.900nong.com/goods-3174.html" title="硕丰481花之果芸苔素内酯保花保果植物生长调节解药剂">硕丰481花之果芸苔素内酯保花保果植物生长调节解药剂</a>
										</p>
										<p class="price">
											<span class="second-color">￥15.00</span>
										</p>
										<a class="add-cart" style="background-image: url(http://www.900nong.com/images/add-cart.jpg)" title="加入购物车" data-goods_id='3174' data-image_url='http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/644/gallery/2017/12/18/15135779988233.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80'></a>
									</div>
								</div>
								
								
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
								
								
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  

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
 主管单位：国资委商业饮食服务业发展中心　<span id="m"><br></span>国资委中华传统饮食与健康服务业推广管理委员会　<span id="m"><br></span>主办：中国新农村建设先进人物年鉴编辑委员会
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
	
</script><div id="extradiv2"></div><div id="extradiv3"></div><div id="extradiv4"></div><div id="extradiv5"></div><div id="extradiv6"></div>	<script src="/nong/js/jquery.cookie.js?v=201807241613"></script>
<script src="/nong/js/layer.js?v=201807241613"></script>
<script src="/nong/js/jquery.method.js?v=201807241613"></script> <script src="/nong/js/jquery.fly.min.js?v=201807241613"></script>
<script src="/nong/js/szy.cart.js?v=201807241613"></script>
	<!--[if lte IE 9]>
	<script src="/js/requestAnimationFrame.js?v=201807241613"></script>
	<![endif]-->
	<script type="text/javascript">
	// 缓载图片
	$().ready(function(){
		$.imgloading.loading();
		//图片预加载
		document.onreadystatechange = function() {
			 if (document.readyState == "complete") {
					$.imgloading.setting({
						threshold: 1000
					});
					$.imgloading.loading();
			 }
		}
	});
	</script>
</body>
</html>
