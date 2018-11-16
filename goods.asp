<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%bsn=request("bsn")
if bsn="" then bsn=int(getnumb(request("a")))
bsn=replace(bsn,".html","")
if bsn="" then bsn=0
id=1
if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mgoods-"&bsn&".html")
response.end
end if
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
end if
if telephone<>"" then
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [member] where telephone='"&telephone&"' and siteid="&siteid
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
UserMoney=rs("UserMoney")
GiftPrice=rs("GiftPrice")
if GiftPrice="" or isnull(GiftPrice) then GiftPrice=0
ddusergroup=rs("ddusergroup")
else
ddusergroup=0
end if
rs.close
set rs=nothing
else
ddusergroup=0
end if
if bsn<>"" then bsn=int(bsn)
set rs=server.createobject("adodb.recordset")
exec="select * from [product] where siteid="&siteid&" and id="&bsn
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
pname=rs("name")
pic1=rs("pic1")
pic2=rs("pic2")
pic3=rs("pic3")
pic4=rs("pic4")
pic5=rs("pic5")
Descriptions=rs("Descriptions")
price1=rs("price1")
price2=rs("price2")
price3=rs("price3")
colors=rs("colors")
if colors<>"" then
zc=ubound(split(colors,"|"))
else
zc=0
end if
sizes=rs("sizes")
if sizes<>"" then
zs=ubound(split(sizes,"|"))
else
zs=0
end if
guige=rs("guige")
zuhe=rs("zuhe")
kdlist="<option value=\""3|"&tounicode("顺丰")&"\"">"&tounicode("顺丰快递")&"<\/option>"
ordercount=int(rs("ordercount"))
kucun=rs("kucun")
ghsid=rs("ghsid")
qpsl=rs("qpsl")
danwei=rs("danwei")
llsm=""'tounicode("包装箱内的商品之间加塞填充物，保证不破损，不串味，汁液不渗漏商品内包装材料全部使用PE（聚乙烯）保鲜膜，拒绝使用含有致癌物的PVC（聚氯乙烯）使用可插型密闭箱，运输途中全 程密闭，默认发顺丰快递，顺丰不到不发货，确保用户订购的商品新鲜到家。")
content=rs("content")
else
if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('该产品上架处理中，请稍后再试！');location.href = '/mlist'</Script></body></html>"
else
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('该产品上架处理中，请稍后再试！');location.href = '/trade/product'</Script></body></html>"
end if
Response.end
end if
rs.close
set rs=nothing%>
<!doctype html>
<html lang="zh-tw"><head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="中国农民自由贸易网" />
<meta name="description" content="中国农民自由贸易网" />
<title><%=pname%> - 中国农民自由贸易网</title><link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/trade/css/reset.css">
<link rel="stylesheet" href="/trade/css/modules.css">
<link rel="stylesheet" href="/trade/css/actnews.css">
<link id="style-css" rel="stylesheet" href="/trade/css/style.css">
<link id="box-css" rel="stylesheet" href="/trade/css/box.css">
<script src="/trade/js/modernizr.js"></script>
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
#detail_content img{border:0;display: block; float: left;}
  .no-fouc {display: none;}
</style>
<script type="text/javascript">
  document.documentElement.className += ' no-fouc';
</script>
<!-- end of preventing FOUC -->

<script src="/trade/js/wforms/localization-tw.js" type="text/javascript"></script>
<script src="/trade/js/sorttable.js" type="text/javascript"></script>
<link type="text/css" href="/trade/css/base.css" rel="stylesheet" />

</head>

<body id="page_actnews">

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
%><li><a href="/trade/product<%=rs("id")%>?actnews_product_class=9,10,11,12,14"><%=rs("category")%></a></li><%		
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

<script>
  (function() {
    // appending orbit-bar stylesheet
    var sitePath = "/trade";
    var stylePath = sitePath + "/css/orbit-bar.css";
    var helpPath = sitePath + "/css/helper.css";

    UTILS.appendStyleSheet(helpPath);
    UTILS.appendStyleSheet(stylePath);
  }());
</script>

<div id="container1" class="container1">
	<div id="container2" class="container2">
		<div id="banner" class="banner">
			<div id="conner" class="site-title-wrap">
                <div class="site-title">
        			<img src="/trade/images/b5050.png" alt="实名" align="top" width="50" /> <a href="?action=buy&bsn=<%=bsn%>" title="回首页">&nbsp;中国三农服务联盟</a> <!--<img src="/trade/images/b5050.png" alt="实名" align="top" width="50" />-->                    <div class="contact-wrap">
                    		<a class="contact-number" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1979798939&site=qq&menu=yes">
                        	<div class="contact-txt" id="pc"><i class="fa fa-qq"></i> QQ咨询</div>
												</a>
                        <!-- <a class="contact-number" href="tel:+0771-5672423">0771-5672423</a> -->
                    </div>
                </div>
			</div>
			<div id="pageheader" class="pageheader">
						
						<a href="index.php?bsn=<%=bsn%>" title="回首页"></a>
						<img src="/trade/images/404625_banner.jpg" width="1010" height="300" alt="LOGO" />			
		
			
			</div>
		</div>


<div id="main" class="main">
	<div id="main2" class="main2">
		<div id="main3" class="main3">
		
		<!-- 选单区 start -->

		<div id="linklist" class="linklist">
			<div id="linklist2" class="linklist2">
				<div id="linklist3" class="linklist3">
				<span class="hamburger">
					<i class="fa fa-bars"></i>
				</span>
		<!--<div id="menu"><div id="menu_b"><ul id="ul_menu_0" class=""><li class="odd"><span><a href="/trade/seller?a=home&bsn=<%=bsn%>"  ><span>首页</span></a></span></li><li><span><a href="/trade/seller?a=content&bsn=<%=bsn%>"  ><span>商家联系方式</span></a></span></li><li class="odd"><span><a href="/trade/seller?a=news&bsn=<%=bsn%>"  ><span>信息公告</span></a></span></li><li><span><a href="/trade/seller?a=goods&bsn=<%=bsn%>"  ><span>商品</span></a></span></li></ul></div></div>		-->
		</div></div></div>
	
<!-- 选单区 end -->		<div id="ActOption" class="act-option">
		
		
		</div>		

		<!-- 购买 -->
					<div id="ActOption" class="act-purchase">
			
			
						<!-- <form method="post" name="goods_form" id="goods_form" enctype="multipart/form-data" action="/actnews/buycart.php?bsn=<%=bsn%>"> -->
					<div id='combine'>		
						<div class="goods-pic-col">
						<div 
									class="pic-wrap cycle-slideshow" 
									data-cycle-slides="div"
									data-cycle-pager=".goods-pic-pager"
								    data-cycle-pager-template=""
								    data-cycle-auto-height="container"
									data-cycle-pause-on-hover="true"
									data-cycle-log=false
								><%if pic1<>"" then%><div id='pic' class='product-pic'><img src="<%=pic1%>" width="600" height="600" alt="<%=pname%>" /></div><%end if%><%if pic2<>"" then%><div id='pic' class='product-pic'><img src="<%=pic2%>" width="600" height="600" alt="<%=pname%>" /></div><%end if%><%if pic3<>"" then%><div id='pic' class='product-pic'><img src="<%=pic3%>" width="600" height="600" alt="<%=pname%>" /></div><%end if%><%if pic4<>"" then%><div id='pic' class='product-pic'><img src="<%=pic4%>" width="600" height="600" alt="<%=pname%>" /></div><%end if%><%if pic5<>"" then%><div id='pic' class='product-pic'><img src="<%=pic5%>" width="600" height="600" alt="<%=pname%>" /></div><%end if%></div><div class="goods-pic-pager"><%if pic1<>"" then%><img src="<%=pic1%>" width="50" height="50" alt="<%=pname%>" /><%end if%><%if pic2<>"" then%><img src="<%=pic2%>" width="50" height="50" alt="<%=pname%>" /><%end if%><%if pic3<>"" then%><img src="<%=pic3%>" width="50" height="50" alt="<%=pname%>" /><%end if%><%if pic4<>"" then%><img src="<%=pic4%>" width="50" height="50" alt="<%=pname%>" /><%end if%><%if pic5<>"" then%><img src="<%=pic5%>" width="50" height="50" alt="<%=pname%>" /><%end if%></div>						</div>
					 
						<div id='detail' class="act-purchase-detail">
							<h2><span><%=pname%></span></h2><table cellspacing="0" class="ts_rowsonly" width="100%" id="RSS_Table_page_actnews_1" >
<caption> 价格 </caption>
<thead><tr><th>市场价</th><th>会员价</th><th>批发价</th><th>起批量</th></tr></thead><tbody><tr><td><p><span class="iteminfo_mktprice"><b class="sys_item_mktprice"><%=price1%></b></span>元 / <%=danwei%></p></td><td><p><span class="iteminfo_price"><b class="sys_item_price"><%=price2%></b></span>元 / <%=danwei%></p></td><td><p><%if ddusergroup>2 then%><%=price3%>元 / <%=danwei%><%else%>代理可见<%end if%></p></td><td><p><%=qpsl%> <%=danwei%></p></td></tr>
</tbody></table>							<p class="goods-shipping-methods goods-shipping">供货方式：现货</p>
<!--<p class="goods-distribution-address goods-shipping">发货地址：三农联盟<%=ghsid%>号仓</p>-->
							<p class="goods goods-shipping">上市时间：全年供应</p>
							<p class="goods goods-shipping">库存数量：<%=kucun%></p>
							<p class="goods-distribution goods-shipping">物流配置：卖家承担物流</p>
<%if colors<>"" or sizes<>"" then%><div class="iteminfo_buying">
	<!--规格属性-->
	<div class="sys_item_spec"><%if colors<>"" then%>
		<dl class="clearfix iteminfo_parameter sys_item_specpara" data-sid="1">
			<dt>款色</dt>
			<dd>
				<ul class="sys_spec_text scolors"><%for i=0 to zc Step 1
Response.Write("<li data-aid="""&i&"""><a href=""javascript:;"" title="""&split(colors,"|")(i)&""">"&split(colors,"|")(i)&"</a><i></i></li>") 
Next%></ul>

			</dd>
		</dl><%end if%><%if sizes<>"" then%>
		<dl class="clearfix iteminfo_parameter sys_item_specpara" data-sid="2">
			<dt>尺码</dt>
			<dd>
				<ul class="sys_spec_text ssizes">
<%for i=0+zc to zs+zc Step 1
Response.Write("<li data-aid="""&i+1&"""><a href=""javascript:;"" title="""&split(sizes,"|")(i-zc)&""">"&split(sizes,"|")(i-zc)&"</a><i></i></li>") 
Next%>
				</ul>
			</dd>
		</dl><%end if%>
					</div>
	<!--规格属性-->
</div><%end if%>

							<!-- <p class="goods goods-shipping">在线联系：<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1979798939&site=qq&menu=yes">
<img border="0" src="http://wpa.qq.com/pa?p=2:1979798939:51" alt="点击这里给我发消息" title="点击这里给我发消息"/>
								</a>
							</p>
														<p class="goods goods-shipping">详細内容：<div style="text-align: center;"><span style="font-family: Verdana;"><strong><span style="color: rgb(255, 0, 0);"><span style="font-size: xx-large;">西瓜西瓜西瓜</span></span></strong></span></div></p>
							<p class="goods goods-shipping"></p> -->
							<p>	

															<div class="goods-purchase-actions">
									<div class="col_text"><li class="col" for="GoodsAmount">采购量</li><li class="col_r"><input name="GoodsAmount" type="text" id="GoodsAmount" value="1" size="10" class="GoodsAmount" onblur="Blur()" /></li></div>									<span id="price_into_goods" class="goods-total"></span>
									<div class="goods-purchase-btns">
										<a class="reduce purchase-btn" href="javascript:void(0)"><i class="fa fa-minus"></i></a>
										<a class="add purchase-btn" href="javascript:void(0)"><i class="fa fa-plus"></i></a>
									</div>
								</div>
								<div class="goods-submit-actions">
									<input type="button" value="订购" id="buy" class="buy">
									<input type="button" value="加入进货单" id="buycart" class="buycart">
								</div>
								<div id="msg" class="success-message"> </div>
														</p>

						</div>
						<div id='detail_content' class="act-purchase-detail-content">
<%=content%>
						</div>
					</div>	
	
			</div>

			
			<p>
				<input name="action" type="hidden" value="buy" /><input name="scolors" type="hidden" value="" /><input name="ssizes" type="hidden" value="" /><input name="sguige" type="hidden" value="" /><input name="szuhe" type="hidden" value="" /><input name="Sn" type="hidden" value="<%=bsn%>" /><input name="OSn" type="hidden" value="" /><input name="BSn" type="hidden" value="605" />
			</p>
						</div>
		
		<!-- 购买完成 -->
		
		</div>	
	</div>	
</div>
<script type="text/javascript">
var error = '';
function Blur(){
	var price_calculator = [{"min":1,"max":1000,"price":<%=price2%>}],
	count = $q('.GoodsAmount').val();
	
	if(count < price_calculator[0].min){
		alert('购买数量不能小于'+price_calculator[0].min);
		error='购买数量不能小于'+price_calculator[0].min;
		$q('.GoodsAmount').val(price_calculator[0].min);
	}else if(price_calculator[price_calculator.length-1].max < count){
		alert('购买数量不能大于'+price_calculator[price_calculator.length-1].max);
		error='购买数量不能大于'+price_calculator[price_calculator.length-1].max;
		$q('.GoodsAmount').val(price_calculator[price_calculator.length-1].max);
	}else{
		option = price_calculator.filter(function(x){return (count >= x.min && x.max >= count)});
		option = option[0];
		$q("#price_into_goods").text("总金额：" + (Math.ceil(option.price * count * 100)/100).toFixed(2));
		error='';
	}
}

var price_calculator = [{"min":1,"max":1000,"price":<%=price2%>}];
$q = jQuery.noConflict();

//价格json
var sys_item={
	"mktprice":"13.00",
	"price":"6.80",
	"sys_attrprice":{"3_13":{"price":"6.80","mktprice":"13.00"},"3_14":{"price":"7.80","mktprice":"14.00"},"3_16":{"price":"8.80","mktprice":"15.00"},"3_17":{"price":"9.80","mktprice":"16.00"},"4_13":{"price":"6.80","mktprice":"13.00"},"4_14":{"price":"7.80","mktprice":"14.00"},"4_16":{"price":"8.80","mktprice":"15.00"},"4_17":{"price":"9.80","mktprice":"16.00"},"8_13":{"price":"6.80","mktprice":"13.00"},"8_14":{"price":"7.80","mktprice":"1400"},"8_16":{"price":"8.80","mktprice":"15.00"},"8_17":{"price":"9.80","mktprice":"16.00"},"9_13":{"price":"6.80","mktprice":"13.00"},"9_14":{"price":"7.80","mktprice":"14.00"},"9_16":{"price":"8.80","mktprice":"15.00"},"9_17":{"price":"9.80","mktprice":"16.00"},"10_13":{"price":"6.80","mktprice":"13.00"},"10_14":{"price":"7.80","mktprice":"14.00"},"10_16":{"price":"8.80","mktprice":"15.00"},"10_17":{"price":"9.80","mktprice":"16.00"},"12_13":{"price":"6.80","mktprice":"13.00"},"12_14":{"price":"7.80","mktprice":"14.00"},"12_16":{"price":"8.80","mktprice":"15.00"},"12_17":{"price":"9.80","mktprice":"16.00"}}};

//商品规格选择
$q(document).ready(function(){
	$q(".sys_item_spec .sys_item_specpara").each(function(){
		var i=$q(this);
		var p=i.find("ul>li");
		p.click(function(){
			if(!!$q(this).hasClass("selected")){
				$q(this).removeClass("selected");
				i.removeAttr("data-attrval");
				$q('input[name="scolors"]').val("");
				$q('input[name="ssizes"]').val("")
			}else{
				$q(this).addClass("selected").siblings("li").removeClass("selected");
				i.attr("data-attrval",$q(this).attr("data-aid"));
				if($q(this).attr("data-aid")<=<%=zc%>){$q('input[name="scolors"]').val($q(this).attr("data-aid"))}
				else if($q(this).attr("data-aid")<=<%=zs+zc+1%>){$q('input[name="ssizes"]').val($q(this).attr("data-aid")-<%=zc+1%>)}
			}
			//getattrprice() //输出价格
		})
	})
	
	//获取对应属性的价格
	function getattrprice(){
		var defaultstats=true;
		var _val='';
		var _resp={
			mktprice:".sys_item_mktprice",
			price:".sys_item_price"
		}  //输出对应的class
		$q(".sys_item_spec .sys_item_specpara").each(function(){
			var i=$q(this);
			var v=i.attr("data-attrval");
			if(!v){
				defaultstats=false;
			}else{
				_val+=_val!=""?"_":"";
				_val+=v;
			}
		})
		if(!!defaultstats){
			_mktprice=sys_item['sys_attrprice'][_val]['mktprice'];
			_price=sys_item['sys_attrprice'][_val]['price'];
		}else{
			_mktprice=sys_item['mktprice'];
			_price=sys_item['price'];
		}
		//输出价格
		$q(_resp.mktprice).text(_mktprice);  ///其中的math.round为截取小数点位数
		$q(_resp.price).text(_price);
	}
})

$q(document).ready(function(){ 
	var count = $q('.GoodsAmount').val();
	option = price_calculator.filter(function(x){return (count >= x.min && x.max >= count)});
	option = option[0];

	$q("#price_into_goods").text("总金额：" + (Math.ceil(option.price * count * 100)/100).toFixed(2));

	//采购量加一
	$q(".add").click(function(){
		var index = $q(".add").index(this);
		$q(".GoodsAmount").eq(index).val(parseFloat($q(".GoodsAmount").eq(index).val())+1);
		if((parseFloat($q(".GoodsAmount").eq(index).val()))>price_calculator[price_calculator.length-1].max){
			$q(".GoodsAmount").eq(index).val(price_calculator[price_calculator.length-1].max);
			alert('购买数量不能大于'+price_calculator[price_calculator.length-1].max);
			$q('.GoodsAmount').val(price_calculator[price_calculator.length-1].max);
			return;   
		}else{
			var count = $q('.GoodsAmount').eq(index).val();
			$q('.GoodsAmount').eq(index).val(count);
			option = price_calculator.filter(function(x){return (count >= x.min && x.max >= count)});
			option = option[0];
			$q("#price_into_goods").text("总金额：" + (Math.ceil(option.price * count * 100)/100).toFixed(2));
			error='';
		}
	});

	//采购量减一
	$q(".reduce").click(function(){
		var index = $q(".reduce").index(this);
		if((parseFloat($q(".GoodsAmount").eq(index).val())-1)<price_calculator[0].min){
			$q(".GoodsAmount").eq(index).val(price_calculator[0].min);
			alert('购买数量不能小于'+price_calculator[0].min);
			$q('.GoodsAmount').val(price_calculator[0].min);
			return;   
		}else{
			var count = $q('.GoodsAmount').eq(index).val();
			$q('.GoodsAmount').eq(index).val(count--);
			option = price_calculator.filter(function(x){return (count >= x.min && x.max >= count)});
			option = option[0];
			$q("#price_into_goods").text("总金额：" + (Math.ceil(option.price * count * 100)/100).toFixed(2));
			error='';
		}
		$q(".GoodsAmount").eq(index).val(parseFloat($q(".GoodsAmount").eq(index).val())-1);	 
	});
});

$q(document).ready(function (){
	$q('#buy').click(function(){
		var session = '<%=telephone%>';
		if(session==''){
			alert('购买前，请先登入');
			return false;
		}

		if(error!=''){
			alert(error);
			return false;
		}
<%if colors<>"" then%>
			if($q('input[name="scolors"]').val()==''){
				alert('请选择款色');
				return false;
			}
<%end if%>
<%if sizes<>"" then%>
			if($q('input[name="ssizes"]').val()==''){
				alert('请选择尺码');
				return false;
			}
<%end if%>

		$q.ajax({
			url: '/u_cart.php?idweb=9707&isCenter=1',
			cache: false,
			dataType: 'html',
			type:'GET',
			data: 
			{ 
				act: 'add',
				PSn: option.price,
				scolors: $q('input[name="scolors"]').val(),
				ssizes: $q('input[name="ssizes"]').val(),
				pid: <%=bsn%>,
				num: $q('#GoodsAmount').val(), 
				PID: ''
			},
			error: function(xhr) {
				// alert('服务器没有返回数据，可能服务器忙碌中，请重試');
			},
			success: function(response) {
				setTimeout(function(){ window.document.location.href="/u_cart.php?idweb=9707&isCenter=1&bsn=<%=bsn%>";},600);
			}
		});
	});

	$q("#GoodsAmount").keypress(function(event) {
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			error='';
			var price_calculator = [{"min":1,"max":1000,"price":<%=price2%>}],
			count = $q('.GoodsAmount').val();
	
			if(count < price_calculator[0].min){
				error='购买数量不能小于'+price_calculator[0].min;
				$q('.GoodsAmount').val(price_calculator[0].min);
			}else if(price_calculator[price_calculator.length-1].max < count){
				error='购买数量不能大于'+price_calculator[price_calculator.length-1].max;
				$q('.GoodsAmount').val(price_calculator[price_calculator.length-1].max);
			}

			var session = '<%=telephone%>';
			if(session==''){
				alert('购买前，请先登入');
				return false;
			}

			if(error!=''){
				alert(error);
				return false;
			}

<%if colors<>"" then%>
			if($q('input[name="scolors"]').val()==''){
				alert('请选择款色');
				return false;
			}
<%end if%>
<%if sizes<>"" then%>
			if($q('input[name="ssizes"]').val()==''){
				alert('请选择尺码');
				return false;
			}
<%end if%>
			$q.ajax({
				url: '/u_cart.php?idweb=9707&isCenter=1',
				cache: false,
				dataType: 'html',
				type:'GET',
				data: 
				{ 
					act: 'add',
					PSn: option.price,
					scolors: $q('input[name="scolors"]').val(),
					ssizes: $q('input[name="ssizes"]').val(),
					pid: <%=bsn%>,
					num: $q('#GoodsAmount').val(), 
					PID: ''
				},
				error: function(xhr) {
					// alert('服务器没有返回数据，可能服务器忙碌中，请重試');
				},
				success: function(response) {
					setTimeout(function(){ window.document.location.href="buycart.php?bsn=<%=bsn%>";},600);
				}
			});
		}
	});	
});

$q(document).ready(function (){
	$q('#buycart').click(function(){
		var session = '<%=telephone%>';
		if(session==''){
			alert('购买前，请先登入');
			return false;
		}
<%if colors<>"" then%>
			if($q('input[name="scolors"]').val()==''){
				alert('请选择款色');
				return false;
			}
<%end if%>
<%if sizes<>"" then%>
			if($q('input[name="ssizes"]').val()==''){
				alert('请选择尺码');
				return false;
			}
<%end if%>
		$q.ajax({
			url: '/u_cart.php?idweb=9707&isCenter=1',
			cache: false,
			dataType: 'html',
			type:'GET',
			data: 
			{ 
				act: 'add',
				PSn: option.price,
				scolors: $q('input[name="scolors"]').val(),
				ssizes: $q('input[name="ssizes"]').val(),
				pid: <%=bsn%>,
				num: $q('#GoodsAmount').val(), 
				PID: ''
			},
			error: function(xhr) {
				// alert('服务器没有返回数据，可能服务器忙碌中，请重試');
			},
			success: function(response) {
				$q('#msg').html(response);
				$q('#msg').fadeIn();
				setTimeout(function(){ window.document.location.reload();},600);
			}
		});
	});
});

(function($) {
	$(document).ready(function() {
		// moving purchase buttons into col_text element, need to do this for layout
		var $btns = $('.goods-purchase-btns');
		$btns
			.siblings('.col_text')
			.find('.col_r')
			.append($btns);
	});
}(jQuery))

</script>

		<div id="footer" class="footer">
			<div id="footer2" class="footer2">
				<div id="footer3" class="footer3">
			
			<div id="footer_ruling" class="footer-ruling">
								<a href=""><img src="/trade/images/site-logo.png" width="229" alt="Warrant" /></a>
			</div>
			
			<div id="footer_info" class="footer-info">
				&nbsp;			</div>
		
		</div></div></div>
		<div id="extraDiv1"><span></span></div>
		<div id="extraDiv2"><span></span></div>
	</div> <!-- end of container2 -->
	<div id="extraDiv3"><span></span></div>
	<div id="extraDiv4"><span></span></div>
</div> <!-- end of container1 -->
<div id="extraDiv5"><span></span></div>
<div id="extraDiv6"><span></span></div>
</body>
</html>