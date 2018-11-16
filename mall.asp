<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/m/")
response.end
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="zh-CN" class="ie8"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="zh-CN">
<head>
<title>中国农民自由贸易网-公链大数据平台。</title>
<!-- 头部元数据 -->
<meta name="csrf-param" content="_csrf">
<meta name="csrf-token" content="dsifyGVqf5Oe78xTkkSjFv4JrkSjhp0uN-vYt3BzMMMhufaAHz1MoNWtoCvqBdVRr0CaIMr1-kFOoKjoJD0EkQ==">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="中国农民自由贸易网,绿色农产品,绿色农资,农产品,农资电商平台" />
<meta name="Description" content="通过整合新农年鉴委员会“中国绿色农业”和“联合信息”的资源优势。将追溯体系、电商平台、ERP系统三大业务体系融合发展，全面服务于各经销商的农资销售、农资追溯、农技服务等业务，建立农资生产、销售及流通大数据。" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="format-detection" content="telephone=no">
<!-- 网站头像 -->
<link rel="icon" type="image/x-icon" href="/images/favicon.ico" />

<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<!-- #is_wabp_start -->
<meta name="is_webp" content="no" />
<!-- #is_wabp_end -->
<link rel="stylesheet" href="/nong/css/iconfont.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/common.css?v=20180702"/>
<!--整站改色 _start-->
<link rel="stylesheet" href="/nong/css/site-color-style-1.css?v=20180702"/>
<!--整站改色 _end-->
<script src="/nong/js/jquery.js?v=201807241613"></script>
<script src="/nong/js/common.js?v=201807241613"></script>
<!-- 图片缓载js -->
<script src="/nong/js/jquery.lazyload.js?v=201807241613"></script>

</head>
<body class="pace-done">

	
	
	
	<!-- 站点头部 -->
	
<!-- 判断url链接 -->



<!-- 引入头部文件 -->

<!-- 头部滚动通栏悬浮框 _start -->
<!-- 注意此效果只在首页面展示 -->
<div class="as-shelter"></div>
<div class="follow-box">
	<div class="follow-box-con">
		<a href="/CN/trade" class="logo">
			<img src="/trade/images/site-logo.png" />
		</a>
		<div class="search SZY-SEARCH-BOX-TOP">
			<form class="search-form SZY-SEARCH-BOX-FORM" method="post" name="" action="/trade/product">
				<div class="search-info">
					<div class="search-type-box">
						<ul class="search-type">
							<li class="search-li-top curr" num="0">宝贝</li>
							<li class="search-li-top" num="1">店铺</li>
						</ul>
						<i></i>
					</div>
					<div class="search-box">
						<div class="search-box-con">
														<input type="text" class="search-box-input SZY-SEARCH-BOX-KEYWORD" name="key" tabindex="9" autocomplete="off" data-searchwords="60%有机肥" placeholder="有机肥" value="" />
						</div>
					</div>
					<input type='hidden' id="searchtypeTop" name='type' value="0" class="searchtype" />
					<input type="button" id="btn_search_box_submit_top" value="搜索" class="button bg-color SZY-SEARCH-BOX-SUBMIT-TOP" />
				</div>
			</form>
		</div>
		<div class="login-info">
			<font id="login-info" class="login-info SZY-USER-NOT-LOGIN">
				<a class="login color" href="/login" target="_top">登录</a>
				<a class="register bg-color" href="/reg" target="_top">免费注册</a>
			</font>
			<font id="login-info" class="login-info SZY-USER-ALREADY-LOGIN" style="display: none;">
				<em>
					<a href="/userpanel" target="_blank" class="color SZY-USER-NAME"></a>
				</em>
				<a href="/userpanel?a=act&act=logout" data-method="post" class="logout bg-color">退出</a>
			</font>
		</div>
	</div>
</div>
<!-- 头部滚动通栏悬浮框 _end -->

<!-- 站点选择 -->
<div class="header-top">
	<div class="header-box">

		
		
		

		
		<!-- 站点 -->
		<!--站点 start-->
<div class="SZY-SUBSITE">
	
</div>
<!--站点 end-->
		

		<!-- 登录信息 -->
		<font id="login-info" class="login-info SZY-USER-NOT-LOGIN">
	<!--<em>欢迎来到中国农民自由贸易网! </em>-->
	<a class="login color" href="/login" target="_top">请登录</a>
	<a class="register" href="/reg" target="_top">免费注册</a>
</font>
<font id="login-info" class="login-info SZY-USER-ALREADY-LOGIN" style="display: none;">
	<em>
		<a href="/userpanel" target="_blank" class="color SZY-USER-NAME"></a>
		<!--欢迎您回来!-->
	</em>
	<a href="/userpanel?a=act&act=logout" data-method="post">退出</a>
</font>

		<ul>
			<li>
				<a class="menu-hd home" href="/CN/trade" target="_top">
					<i class="iconfont color">&#xe6a3;</i>
					农贸首页
				</a>
			</li>
			<li class="menu-item">
				<div class="menu">
					<a class="menu-hd myinfo" href="/userpanel" target="_blank">
						<i class="iconfont color">&#xe6a5;</i>
						我的农贸
						<b></b>
					</a>
					<div id="menu-2" class="menu-bd">
						<span class="menu-bd-mask"></span>
						<div class="menu-bd-panel">
							<a href="/u_orders" target="_blank">已买到的宝贝</a>
							<a href="/u_address" target="_blank">我的地址管理</a>
							<!--<a href="http://www.900nong.com/user/collect/goods.html" target="_blank">我收藏的宝贝</a>
							<a href="http://www.900nong.com/user/collect/shop.html" target="_blank">我收藏的店铺</a>-->
						</div>
					</div>
				</div>
			</li>
			<li class="menu-item cartbox">
				<div class="menu">
					<a class="menu-hd cart" href="/u_cart." target="_top">
						<i class="iconfont color">&#xe6a8;</i>
						购物车
						<span class="SZY-CART-COUNT">0</span>
						<b></b>
					</a>
					<div id="menu-4" class="menu-bd cart-box-main">
						<span class="menu-bd-mask"></span>
						<div class="dropdown-layer">
							<div class="spacer"></div>
							<div class="dropdown-layer-con cartbox-goods-list">
								
								
<!-- 正在加载 -->
<div class="cart-type">
	<i class="cart-type-icon"></i>
</div>

								
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<a class="menu-hd" href="#" target="_blank">卖家中心</a>
			</li>
			
			<li class="menu-item">
				<div class="menu">
					<a class="menu-hd we-chat" href="javascript:;" target="_top">
						<i class="iconfont color">&#xe6a4;</i>
						关注微信
						<b></b>
					</a>
					<div id="menu-5" class="menu-bd we-chat-qrcode">
						<span class="menu-bd-mask"></span>
						<a target="_top">
							<img src="/images/erweima.png" alt="官方微信" />
						</a>
						<p class="font-14">关注官方微信</p>
					</div>
				</div>
			</li>
			
			
			<li class="menu-item">
				<div class="menu">
					<a class="menu-hd mobile" href="javascript:;" target="_top">
						<i class="iconfont color">&#xe60b;</i>
						手机版
						<b></b>
					</a>
					<div id="menu-6" class="menu-bd qrcode">
						<span class="menu-bd-mask"></span>
						<a target="_top">
							<img src="/images/zmw.png" alt="手机客户端" />
						</a>
						<!--<p>手机客户端</p>-->
					</div>
				</div>
			</li>
<!--
			
			<li class="menu-item">
				<div class="menu">
					<a href="javascript:;" class="menu-hd site-nav">
						商家支持
						<b></b>
					</a>
					<div id="menu-7" class="menu-bd site-nav-main">
						<span class="menu-bd-mask"></span>
						<div class="menu-bd-panel">
							<div class="site-nav-con">
								
								<a href="/shop/apply.html" target="_blank"  title="商家入驻">商家入驻</a>
								
								<a href="/help/48.html" target="_blank"  title="商家规则">商家规则</a>
								
								<a href="/help/49.html" target="_blank"  title="商家须知">商家须知</a>
								
								<a href="/help/4.html" target="_blank"  title="购物流程">购物流程</a>
								
								<a href="/help/5.html" target="_blank"  title="网上支付">网上支付</a>
								
								<a href="/help/47.html" target="_blank"  title="支付答疑">支付答疑</a>
								
							</div>
						</div>
					</div>
				</div>
			</li>
-->
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$(".SZY-SEARCH-BOX-TOP .SZY-SEARCH-BOX-SUBMIT-TOP").click(function() {
			if ($(".search-li-top.curr").attr('num') == 0) {
				var keyword_obj = $(this).parents(".SZY-SEARCH-BOX-TOP").find(".SZY-SEARCH-BOX-KEYWORD");

				var keywords = $(keyword_obj).val();
				if ($.trim(keywords).length == 0 || $.trim(keywords) == "请输入关键词") {
					keywords = $(keyword_obj).data("searchwords");
				}
				$(keyword_obj).val(keywords);
			}
			$(this).parents(".SZY-SEARCH-BOX-TOP").find(".SZY-SEARCH-BOX-FORM").submit();
		});
	});
</script>

<div class="header">
	<div class="w1210">
		<div class="logo-info">
			<a href="/CN/trade" class="logo">
				
				<img src="/trade/images/site-logo.png" />
				
			</a>

			
		</div>
		
		<div class="search  SZY-SEARCH-BOX">
			<form class="search-form SZY-SEARCH-BOX-FORM" method="post" action="/trade/product">
				<div class="search-info">
					<div class="search-type-box">
						<ul class="search-type" style="display: none;">
							<li class="search-li curr" num="0">宝贝</li>
							<li class="search-li" num="1">店铺</li>
						</ul>
						<i></i>
					</div>
					<div class="search-box">
						<div class="search-box-con">
							<input type="text" class="keyword search-box-input SZY-SEARCH-BOX-KEYWORD" name="key" tabindex="9" autocomplete="off" data-searchwords="" placeholder="" value="" />
						</div>
					</div>
					<input type='hidden' id="searchtype" name='type' value="0" class="searchtype" />
					<input type="button" id="btn_search_box_submit" value="搜索" class="button bg-color btn_search_box_submit SZY-SEARCH-BOX-SUBMIT" />
				</div>
				<!---热门搜索热搜词显示--->
				<div class="search-results hide SZY-SEARCH-BOX-HELPER">
	<ul class="history-results SZY-SEARCH-RECORDS">
		<li class="title">
			<span>最近搜索</span>
			<a href="javascript:void(0);" class="clear-history clear">
				<i></i>
				清空
			</a>
		</li>
		<!--
		<li class="active rec_over" id="索引">
			<span>
				<a href="/search.html?keyword=关键词" title="关键词">关键词</a>
				<i onclick="search_box_remove('索引')"></i>
			</span>
		</li>
		-->
	</ul>
	<ul class="rec-results SZY-HOT-SEARCH">
		<li class="title">
			<span>正在热搜中</span>
			<i class="close"></i>
		</li>
		<!-- 
		<li>
			<a target="_blank" href="" title=""></a>
		</li>
		 -->
	</ul>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		// 搜索框提示显示
		$('.SZY-SEARCH-BOX .SZY-SEARCH-BOX-KEYWORD').focus(function() {
			$(".SZY-SEARCH-BOX .SZY-SEARCH-BOX-HELPER").show();
		});
		// 搜索框提示隐藏
		$(".SZY-SEARCH-BOX-HELPER .close").on('click', function() {
			$(".SZY-SEARCH-BOX .SZY-SEARCH-BOX-HELPER").hide();
		});
		// 清除记录
		$(".SZY-SEARCH-BOX-HELPER .clear").click(function() {
			var url = '/search/clear-record.html';
			$.post(url, {}, function(result) {
				if (result.code == 0) {
					$(".history-results .active").empty();
				} else {
					$.msg(result.message);
				}
			}, 'json');
		});
	});
	function search_box_remove(key) {
		console.info(key);
		var url = '/search/delete-record.html';
		$.post(url, {
			data: key
		}, function(result) {
			if (result.code == 0) {
				$("#search_record_" + key).remove();
			} else {
				$.msg(result.message);
			}
		}, 'json');
	}
	$(document).on("click", function(e) {
		var target = $(e.target);
		if (target.closest(".SZY-SEARCH-BOX").length == 0) {
			$('.SZY-SEARCH-BOX-HELPER').hide();
		}
	})
</script>
			</form>
			<ul class="hot-query SZY-DEFAULT-SEARCH">
			</ul>
		</div>
	
	</div>
</div>

<script type="text/javascript">
	//解决因为缓存导致获取分类ID不正确问题，需在ready之前执行
	$(".SZY-DEFAULT-SEARCH").data("cat_id", "");
	$().ready(function() {
		$(".SZY-SEARCH-BOX-KEYWORD").val("");
		$(".SZY-SEARCH-BOX-KEYWORD").data("search_type", "");
		// 

		$(".SZY-SEARCH-BOX .SZY-SEARCH-BOX-SUBMIT").click(function() {
			if ($(".search-li.curr").attr('num') == 0) {
				var keyword_obj = $(this).parents(".SZY-SEARCH-BOX").find(".SZY-SEARCH-BOX-KEYWORD");
				var keywords = $(keyword_obj).val();
				if ($.trim(keywords).length == 0 || $.trim(keywords) == "请输入要搜索的关键词") {
					keywords = $(keyword_obj).data("searchwords");
				}
				$(keyword_obj).val(keywords);
			}
			$(this).parents(".SZY-SEARCH-BOX").find(".SZY-SEARCH-BOX-FORM").submit();
		});
	});
</script>

	
	
	

	<!-- 站点导航 -->
	
	
	
	<!-- 内容 -->
	<!--顶部topbar-->
<!-- #nav_region_start -->
			<!-- #nav_region_end -->
<!--页面css/js-->
<link rel="stylesheet" href="/nong/css/index.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/template.css?v=20180702"/>
<script src="/nong/js/index.js?v=201807241613"></script>
<script src="/nong/js/tabs.js?v=201807241613"></script>
<script src="/nong/js/bubbleup.js?v=201807241613"></script>
<script src="/nong/js/jquery.hiSlider.js?v=201807241613"></script>
<script src="/nong/js/index_tab.js?v=201807241613"></script>
<script src="/nong/js/jump.js?v=201807241613"></script>
<script src="/nong/js/nav.js?v=201807241613"></script>

<!-- 分类导航设置  _start -->
<!-- 分类导航设置  _end -->

<!-- 判断url链接 -->
<div class="category-box category-box-border">
	<div class="w1210">
		<div class="home-category fl">
			<a href="/trade/product" class="menu-event" title="查看全部商品分类">
				<i></i>
				全部商品分类
			</a>

			
<%tblist="&#xe63d;|&#xe70a;|&#xe622;|&#xe606;|&#xe62b;|&#xe620;|&#xe70f;|&#xe648;|&#xe651;|&#xe621;|&#xe62a;|&#xe70a;|&#xe640;|&#xe63d;|&#xe70a;|&#xe622;|&#xe606;|&#xe62b;|&#xe620;|&#xe70f;|&#xe648;|&#xe651;|&#xe621;|&#xe62a;|&#xe70a;|&#xe640;|"

Function getcatls(pid)
set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&int(pid)&" and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
getcatls=getcatls&"<a href=""/trade/product-"&rs1("id")&".html"" target=""_blank"" title="""&rs1("category")&""">"&rs1("category")&"</a>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing
End Function%>

<%Function getcatlss(pid)
set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&int(pid)&" and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
getcatlss=getcatlss&"<div class=""subitems""><dl class=""fore1""><dt><a href=""/trade/product-"&rs("id")&".html"" target=""_blank"" title="""&rs("category")&"""><em>"&rs("category")&"</em><i>&gt;</i></a></dt><dd>"&getcatls(rs("id"))&"</dd></dl></div>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing
End Function%>

<%Function getcatlss(pid)
set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&int(pid)&" and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
getcatlss=getcatlss&"<div class=""subitems""><dl class=""fore1""><dt><a href=""/trade/product-"&rs1("id")&".html"" target=""_blank"" title="""&rs1("category")&"""><em>"&rs1("category")&"</em><i>&gt;</i></a></dt><dd>"&getcatls(rs1("id"))&"</dd></dl></div>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing
End Function%>
			
			<div class="expand-menu category-layer category-layer1">
				<span class="category-layer-bg bg-color"></span>
<%cat1=0
set rs=server.createobject("adodb.recordset")
exec="select * from [category] where (ParentID=1 or ParentID=2) and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs.open exec,conn,1,1
i=0
if rs.recordcount>0 then
do while not rs.eof%><div class="list">
					<dl class="cat">
						<dt class="cat-name">
							<i class="iconfont"><%=split(tblist,"|")(i)%></i>
							<a href='/trade/product-<%=rs("id")%>.html' target='_blank' title='<%=rs("category")%>'><%=rs("category")%></a>
						</dt>
						<i class="right-arrow">&gt;</i>
					</dl>
					<div class="categorys">
						<div class="item-left fl">
							<!-- 推荐分类 -->
							
							<div class="item-channels">
								<div class="channels">
									<a href="/trade/product-<%=rs("id")%>.html" target="_blank"  title="<%=rs("category")%>"> <%=rs("category")%> </a>
								</div>
							</div>
							
<%=getcatlss(rs("id"))%>

						</div>
						<div class="item-right fr">
							<!-- 品牌logo -->
							<div class="item-brands">
								<div class="brands-inner">
									
								</div>
							</div>
							<!-- 分类广告图片 -->
							
							
							<div class="item-promotions">
								<a href="/trade/product-867.html" class="img-link" target="_blank">
									<img src="/trade/img/cat<%=rs("id")%>.jpg" width="180" />
								</a>
							</div>
							
							
						</div>
					</div>
				</div><%		
rs.movenext
i=i+1
Loop
rs.close
set rs=nothing
end if%>
			

			</div>
			

			<!-- 带有二级分类的分类导航 _start -->
			
			<!-- 带有二级分类的分类导航 _end -->
		</div>

		<div class="all-category fl" id="nav">
			<ul>
				
				
				
				
				
				
				<li class="fl">
					<a class="nav "  href="/CN/trade" target="_blank"  title="农贸首页">农贸首页</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
				
				
				
				
				
				
				<li class="fl">
					<a class="nav "  href="/detail_aboutus_183" target="_blank"  title="三农联盟">三农联盟</a>
					<!-- 导航小标签 _start -->
					
					<span class="nav-icon">
						<!--<img src="/nong/images/14766722355540.gif" />-->
					</span>
					
					<!-- 导航小标签 _end -->
				</li>
				
				
				
				
				
				
				
				<li class="fl">
					<a class="nav "  href="/list_help" target="_blank"  title="精准扶贫">精准扶贫</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
				
				
				
				
				
				
				<li class="fl">
					<a class="nav "  href="/detail_aboutus_182" target="_blank"  title="三农银行">三农银行</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
				
				
				
				
				
				
				<li class="fl">
					<a class="nav "  href="/trade/product-1.html" target="_blank"  title="自贸平台">自贸平台</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				<li class="fl">
					<a class="nav" style="color: red;"  href="http://www.zgnmzymyw.com/trade/product-1-0-5-0-0-0-0-1-3-61_01-0-0-0-0.html" target="_blank"  title="特惠专区">特惠专区</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
				
				
				
				
				
				
				
				<li class="fr">
					<a class="nav "  href="http://www.zgnmzymyw.com/trade/product-972.html" target="_blank"  title="香港优势">香港优势</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
				
				
				<li class="fr">
					<a class="nav "  href="#" target="_blank"  title="信息">信息</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
				<li class="fr">
					<a class="nav "  href="#" target="_blank"  title="服务">服务</a>
					<!-- 导航小标签 _start -->
					
					<!-- 导航小标签 _end -->
				</li>
				
			</ul>

		</div>
	</div>
</div>
<div class="template-one">

	<!-- banner模块 _start -->
	<div class="banner">
		
		<!-- banner轮播 _start -->
		<ul id="fullScreenSlides" class="full-screen-slides">
			
			<li style="background: url('/trade/img/ad1.jpg') center center no-repeat;  display:list-item; ">
				<a href="https://s.wcd.im/v/3ju5gZ3p/" target="_blank"   title="">&nbsp;</a>
			</li>
			
			<li style="background: url('/trade/img/ad2.jpg') center center no-repeat;  display:list-item; ">
				<a href="https://s.wcd.im/v/3ju5gZ3p/" target="_blank"   title="">&nbsp;</a>
			</li>
			
			<li style="background: url('/trade/img/ad3.jpg') center center no-repeat;  display:list-item; ">
				<a href="https://s.wcd.im/v/3ju5gZ3p/" target="_blank"   title="">&nbsp;</a>
			</li>
			<li style="background: url('/trade/img/ad4.jpg') center center no-repeat;  display:list-item; ">
				<a href="https://s.wcd.im/v/3ju5gZ3p/" target="_blank"   title="">&nbsp;</a>
			</li>
			<li style="background: url('/trade/img/ad5.jpg') center center no-repeat;  display:list-item; ">
				<a href="https://s.wcd.im/v/3ju5gZ3p/" target="_blank"   title="">&nbsp;</a>
			</li>
			
		</ul>

		<ul class="full-screen-slides-pagination">
			
			<li class="current">
				<a href="javascript:void(0);">0</a>
			</li>
			
			<li >
				<a href="javascript:void(0);">1</a>
			</li>
			
			<li >
				<a href="javascript:void(0);">2</a>
			</li>
			<li >
				<a href="javascript:void(0);">3</a>
			</li>
			<li >
				<a href="javascript:void(0);">4</a>
			</li>
			
		</ul>
		<!-- banner轮播 _end -->
		
		
		
		<!-- banner背景图 _start -->
		<!-- <div class="banner-bg">
        	<a href="" target="_blank" class="banner-bg-img" style="background: url(Array) no-repeat 50% 0;"></a>
        </div>-->
		
		
		<!-- banner背景图 _end -->
	</div>
	<!-- banner模块 _end -->
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var nowtime = Date.parse(new Date());
		$(".time-remain").each(function(i) {
			var time = $(this).data("end_time") * 1000 - nowtime;
			$(this).countdown({
				time: time,
				htmlTemplate: '<span><em class="bg-color">%{d}</em> 天 <em class="bg-color">%{h}</em> 小时 <em class="bg-color">%{m}</em> 分 <em class="bg-color">%{s}</em> 秒</span>',
				leadingZero: true,
				onComplete: function(event) {
					$(this).html("活动已经结束啦!");
				}
			});
		});

		//加入购物车
		$('body').on('click', '.add-cart', function(event) {
			var goods_id = $(this).data('goods_id');
			var pid = $(this).data('goods_id');
			var image_url = $(this).data('image_url');
			$.cart.add(goods_id,pid, 1, {
				is_sku: false,
				image_url: image_url,
				event: event,
				callback: function() {
					var attr_list = $('.attr-list').height();
					$('.attr-list').css({
						"overflow": "hidden"
					});
					if (attr_list >= 200) {
						$('.attr-list').addClass("attr-list-border");
						$('.attr-list').css({
							"overflow-y": "auto"
						});
					}
				}
			});
			return false;
		});
	});
</script>

<div class="template-one">
<div class="floor"></div>

	<!--模块内容-->
	<!-- #tpl_region_start -->
	<!-- 默认缓载图片 -->
	<!-- 内容开始 -->
	<div class=" custom-box">
        <div class="custom">
            

            
                
                	
                    <style>
.floor-layout .floor-content5 .floor-right .floor-tabs-panel .floor-tabs-ad-up a.floor-tabs-ad-img{border-left: 1px #ccc solid;}
.floor-layout .floor-content5 .floor-right .floor-tabs-panel .floor-tabs-ad-down a.floor-tabs-ad-img{border-left: 1px #ccc solid;}
.floor-layout .floor-content5 .floor-right .floor-tabs-panel .floor-tabs-ad-up{border-bottom: 1px #ccc solid;}
.floor-layout .floor-content .floor-left .floor-words{background:none}
.floor-layout .floor-content5 .floor-left .floor-words li a{color:#000}
.floor-layout .floor-content5 .floor-left .floor-words li a:hover{color:#000}
.header .header-right{width:192px !important}
area{outline:none;}
</style>
<img src="/trade/img/t1.png" alt="" width="1210" height="592" usemap="#Map" /> 
<map name="Map">
	<area shape="rect" coords="50,89,192,230" href="/detail_center_188" target="_blank" />
  <area shape="rect" coords="239,91,393,232" href="/list_tech" target="_blank" />
  <area shape="rect" coords="428,95,589,232" href="/detail_center_190" target="_blank" />
  <area shape="rect" coords="623,94,781,232" href="/trade/product-1.html" target="_blank" />
  <area shape="rect" coords="816,94,979,233" href="/list_center" target="_blank" />
  <area shape="rect" coords="1007,93,1171,233" href="http://www.zgnmzymyw.com/trade/product-972.html" target="_blank" />
  <area shape="rect" coords="6,286,397,491" href="/detail_aboutus_183" target="_blank" />
  <area shape="rect" coords="407,288,802,490" href="/list_help" target="_blank" />
  <area shape="rect" coords="812,287,1205,488" href="/detail_aboutus_182" target="_blank" />
</map>
                    
                
        	
        </div>
    </div>
	<div class=" custom-box">
        <div class="custom"><a href="/trade/product-867.html" class="img-link" target="_blank">
                    <img src="/nong/img/nzcp.png" alt="" /></a>
        </div>
    </div>
	<!-- 内容结束 -->
	

	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	
	
	
	<div class="w1210 floor-list">
		<div class="floor" color='#4cb946'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 1F </span>
							<!-- } -->
							<a href="/trade/product-867.html" target="_blank"  style='color:#4cb946;'>农资产品</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #4cb946 #4cb946 #fff; color: #4cb946;'>精品推荐</h3>
							</li>
 
							<li>
								<h3>农药</h3>
							</li>
							
							<li>
								<h3>肥料</h3>
							</li>
							
						
							<li>
								<h3>绿色生资</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #4cb946 solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/trade/product-867.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040845029260.jpg" data-original-webp="/nong/images/15040845029260.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=867 and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
Response.write "<li><a href=""/trade/product-"&rs1("id")&".html"" title="""&rs1("category")&""">"&rs1("category")&"</a></li>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing%>
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/trade/product-867.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040845715846.jpg" data-original-webp="/nong/images/15040845715846.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/trade/goods?action=buy&BSn=638.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040845753596.jpg" data-original-webp="/nong/images/15040845753596.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="/trade/goods?action=buy&BSn=353.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040846308636.jpg" data-original-webp="/nong/images/15040846308636.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=436.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040846302304.jpg" data-original-webp="/nong/images/15040846302304.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=438.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040846319864.jpg" data-original-webp="/nong/images/15040846319864.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/trade/goods?action=buy&BSn=433.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040846311212.jpg" data-original-webp="/nong/images/15040846311212.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=136.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15040846317882.jpg" data-original-webp="/nong/images/15040846317882.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catid=17 or catidlist like '%|17|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catid=18 or catidlist like '%|18|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
								
								
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catid=19 or catidlist like '%|19|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	



	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	<div class=" custom-box">
        <div class="custom">
                   <a href="/trade/product-865.html" target="_blank"  style='color:#bd6702;' ><img src="/nong/img/nfcp.png" alt="" /></a>
        </div>
    </div>
	
	<div class="w1210 floor-list">
		<div class="floor" color='#bd6702'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 2F </span>
							<!-- } -->
							<a href="/trade/product-865.html" target="_blank"  style='color:#bd6702;'>农副产品</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #bd6702 #bd6702 #fff; color: #bd6702;'>精品推荐</h3>
							</li>
							
							
							<li>
								<h3>水果蔬菜</h3>
							</li>
							
							<li>
								<h3>绿色食品</h3>
							</li>
							
							<li>
								<h3>酒水茶饮</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #bd6702 solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/trade/product-865.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045097431347.jpg" data-original-webp="/nong/images/15045097431347.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=865 and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
Response.write "<li><a href=""/trade/product-"&rs1("id")&".html"" title="""&rs1("category")&""">"&rs1("category")&"</a></li>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing%>							
								
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/trade/product-865.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045098980095.jpg" data-original-webp="/nong/images/15045098980095.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/trade/goods?action=buy&BSn=355.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15078652599846.jpg" data-original-webp="/nong/images/15078652599846.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="/trade/goods?action=buy&BSn=539.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045102772295.jpg" data-original-webp="/nong/images/15045102772295.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=538.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045102778267.jpg" data-original-webp="/nong/images/15045102778267.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=537.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045102778902.jpg" data-original-webp="/nong/images/15045102778902.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/trade/goods?action=buy&BSn=182.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045103272385.jpg" data-original-webp="/nong/images/15045103272385.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=540.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045103271005.jpg" data-original-webp="/nong/images/15045103271005.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catidlist like '%|850|%' or catidlist like '%|851|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
								
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catidlist like '%|854|%' or catidlist like '%|853|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>	
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|70|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	



	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	
	<div class=" custom-box">
        <div class="custom"><a href="/trade/product-868.html" target="_blank"  style='color:#81b232;'>
                    <img src="/nong/img/nyjxsb.png" alt="" /></a>
        </div>
    </div>
	
	<div class="w1210 floor-list">
		<div class="floor" color='#81b232'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 3F </span>
							<!-- } -->
							<a href="/trade/product-868.html" target="_blank"  style='color:#81b232;'>农业机械设备</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #81b232 #81b232 #fff; color: #81b232;'>精品推荐</h3>
							</li>
							
							
							<li>
								<h3>农业机械/工具</h3>
							</li>
							
							<li>
								<h3>园艺工具</h3>
							</li>
							
							<li>
								<h3>飞机、无人机</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #81b232 solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/trade/product-868.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045104392861.jpg" data-original-webp="/nong/images/15045104392861.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=868 and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
Response.write "<li><a href=""/trade/product-"&rs1("id")&".html"" title="""&rs1("category")&""">"&rs1("category")&"</a></li>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing%>								
								
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/trade/product-868.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105106192.jpg" data-original-webp="/nong/images/15045105106192.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/trade/goods?action=buy&BSn=532.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105101767.jpg" data-original-webp="/nong/images/15045105101767.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="/trade/goods?action=buy&BSn=533.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105549035.jpg" data-original-webp="/nong/images/15045105549035.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=534.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105544769.jpg" data-original-webp="/nong/images/15045105544769.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=529.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105544798.jpg" data-original-webp="/nong/images/15045105544798.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/trade/goods?action=buy&BSn=531.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105824678.jpg" data-original-webp="/nong/images/15045105824678.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=530.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045105822629.jpg" data-original-webp="/nong/images/15045105822629.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|873|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>	
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|874|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|875|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	



	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	
	<div class=" custom-box">
        <div class="custom"><a href="/trade/product-869.html" target="_blank"  style='color:#088080;'>
                    <img src="/nong/img/qdllbxsb.png" alt="" /></a>
        </div>
    </div>
	
	<div class="w1210 floor-list">
		<div class="floor" color='#088080'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 4F </span>
							<!-- } -->
							<a href="/trade/product-869.html" target="_blank"  style='color:#088080;'>气调冷链、保鲜设备</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #088080 #088080 #fff; color: #088080;'>精品推荐</h3>
							</li>
							
							
							<li>
								<h3>大型机组</h3>
							</li>
							
							<li>
								<h3>恒温湿冷库</h3>
							</li>
							
							<li>
								<h3>真空预冷机</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #088080 solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/trade/product-869.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045108066574.jpg" data-original-webp="/nong/images/15045108066574.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=869 and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
Response.write "<li><a href=""/trade/product-"&rs1("id")&".html"" title="""&rs1("category")&""">"&rs1("category")&"</a></li>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing%>
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/trade/product-869.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045108705551.jpg" data-original-webp="/nong/images/15045108705551.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/trade/goods?action=buy&BSn=221.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045108708934.jpg" data-original-webp="/nong/images/15045108708934.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="/trade/goods?action=buy&BSn=213.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045109129606.jpg" data-original-webp="/nong/images/15045109129606.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=216.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045109136491.jpg" data-original-webp="/nong/images/15045109136491.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=217.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045109136395.jpg" data-original-webp="/nong/images/15045109136395.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/trade/goods?action=buy&BSn=227.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045109569221.jpg" data-original-webp="/nong/images/15045109569221.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=232.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045109565109.jpg" data-original-webp="/nong/images/15045109565109.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catidlist like '%|878|%' or catidlist like '%|879|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>	
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|876|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>		
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|877|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	
	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	
	<div class=" custom-box">
        <div class="custom"><a href="/trade/product-870.html" target="_blank"  style='color:#097d1c;'>
                    <img src="/nong/img/zxcptj.png" alt="" /></a>
        </div>
    </div>
	
	<div class="w1210 floor-list">
		<div class="floor" color='#097d1c'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 5F </span>
							<!-- } -->
							<a href="/trade/product-870.html" target="_blank"  style='color:#097d1c;'>滞销产品推荐</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #097d1c #097d1c #fff; color: #097d1c;'>精品推荐</h3>
							</li>
							
							
							<li>
								<h3>水果</h3>
							</li>
							
							<li>
								<h3>蔬菜</h3>
							</li>
							
							<li>
								<h3>其他滞销品</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #097d1c solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/trade/product-870.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155506072320.jpg" data-original-webp="/nong/images/15155506072320.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=870 and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
Response.write "<li><a href=""/trade/product-"&rs1("id")&".html"" title="""&rs1("category")&""">"&rs1("category")&"</a></li>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing%>
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/trade/product-870.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155506435818.jpg" data-original-webp="/nong/images/15155506435818.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/trade/product-870.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155506499690.jpg" data-original-webp="/nong/images/15155506499690.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="/trade/product-870.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155508793390.jpg" data-original-webp="/nong/images/15155508793390.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/product-870.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155509249864.jpg" data-original-webp="/nong/images/15155509249864.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/product-870.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155509298770.jpg" data-original-webp="/nong/images/15155509298770.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/trade/product-870.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155524561501.jpg" data-original-webp="/nong/images/15155524561501.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/product-870.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15155524719689.jpg" data-original-webp="/nong/images/15155524719689.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|881|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>				
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|882|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where catidlist like '%|883|%' and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	
	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	<div class=" custom-box">
        <div class="custom"><a href="/trade/product-871.html" target="_blank"  style='color:#179215;'>
                    <img src="/nong/img/nyfw.png" alt="" /></a>
        </div>
    </div>
	
	<div class="w1210 floor-list">
		<div class="floor" color='#179215'>
			<div class="floor-layout">
				<div class="floor-con floor-con5">
					<div class="floor-title">
						<h2>
							
							
							<span class="floor-name SZY-FLOOR-NAME"> 6F </span>
							<!-- } -->
							<a href="/trade/product-871.html" target="_blank"  style='color:#179215;'>农业服务</a>
							<input type="hidden" value="" class="SZY-SHORT-NAME">
							
							
						</h2>
						
						<ul class="floor-tabs-nav">
							
							
							<li class="floor-tabs-selected">
								<h3 style='border-color: #179215 #179215 #fff; color: #179215;'>精品推荐</h3>
							</li>
							
							
							<li>
								<h3>广告金融</h3>
							</li>
							
							<li>
								<h3>担保保险</h3>
							</li>
							
							<li>
								<h3>网络设计</h3>
							</li>
							
						</ul>
						
					</div>
					<div class="floor-content floor-content5" style='border-top: 1px #179215 solid;'>
						<div class="floor-left">
							<div class="floor-suspend">
								
								
								
								<a href="/trade/product-871.html" target="_blank"  class="floor-suspend-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
									<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045114158115.jpg" data-original-webp="/nong/images/15045114158115.jpg?x-oss-process=image/format,webp/quality,q_75" width="210" height="485" />
								</a>
								
								
							</div>
							<ul class="floor-words">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=871 and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
rs1.open exec1,conn,1,1
if rs1.recordcount>0 then
do while not rs1.eof
Response.write "<li><a href=""/trade/product-"&rs1("id")&".html"" title="""&rs1("category")&""">"&rs1("category")&"</a></li>"
rs1.movenext
Loop
end if
rs1.close
set rs1=nothing%>
							</ul>
						</div>
						<div class="floor-middle">
							<div class="floor-banner">
								

								
								<ul class="hiSlider SZY-FLOOR-HISLIDER">
									
									<li class="hiSlider-item">
										<a href="/trade/product#12.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15093285180643.jpg" data-original-webp="/nong/images/15093285180643.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
									<li class="hiSlider-item">
										<a href="/trade/goods?action=buy&BSn=98.html" target="_blank">
											<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045115003231.jpg" data-original-webp="/nong/images/15045115003231.jpg?x-oss-process=image/format,webp/quality,q_75" width="390" height="485" />
										</a>
									</li>
									
								</ul>
								
							</div>
						</div>
						<div class="floor-right">
							<!-- 第一屏广告 _start -->
							<div class="floor-tabs-panel">
								<div class="floor-tabs-suspend-up">
									
									
									
									<a href="/trade/goods?action=buy&BSn=599.html" target="_blank"  class="floor-tabs-suspend-img first" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045117674304.jpg" data-original-webp="/nong/images/15045117674304.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=324.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045117677180.jpg" data-original-webp="/nong/images/15045117677180.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=101.html" target="_blank"  class="floor-tabs-suspend-img " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045117672220.jpg" data-original-webp="/nong/images/15045117672220.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
								<div class="floor-tabs-suspend-down">
									
									
									
									<a href="/trade/goods?action=buy&BSn=124.html" target="_blank"  class="floor-tabs-suspend-img first">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045117980678.jpg" data-original-webp="/nong/images/15045117980678.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									<a href="/trade/goods?action=buy&BSn=432.html" target="_blank"  class="floor-tabs-suspend-img ">
										<img class="lazy" src="/m/images/blank.png" data-original="/nong/images/15045117985747.jpg" data-original-webp="/nong/images/15045117985747.jpg?x-oss-process=image/format,webp/quality,q_75" />
									</a>
									
									
								</div>
							</div>
							<!-- 第一屏广告 _end -->
							
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catidlist like '%|884|%' or catidlist like '%|885|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>	
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catidlist like '%|888|%' or catidlist like '%|887|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>	
							</div>
							
							<div class="floor-tabs-panel floor-tabs-hide">
		<%set rs=server.createobject("adodb.recordset")
exec="select top 6 * from [product] where (catidlist like '%|890|%' or catidlist like '%|891|%') and onsale=0 and homepic is not null and homepic<>'' and siteid="&siteid&" order by id desc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
do while not rs.eof%>
								<div class="item" >
									<div class="wrap">
										<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
											<img class="lazy" src="/m/images/blank.png" data-original="<%=rs("homepic")%>" data-original-webp="<%=rs("homepic")%>" alt="<%=rs("name")%>" style="width: 140px; height: 140px;">
										</a>
										<p class="title">
											<a target="_blank" href="/trade/goods-<%=rs("id")%>.html" title="<%=rs("name")%>"><%=rs("name")%></a>
										</p>
										<p class="price">
											<span class="second-color">￥<%=rs("price2")%></span>
										</p>
										<a class="add-cart" style="background-image: url(/nong/images/add-cart.jpg)" title="加入购物车" data-goods_id='638' data-image_url='<%=rs("homepic")%>'></a>
									</div>
								</div>
<%rs.movenext
Loop
rs.close
set rs=nothing
end if%>	
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	



	<!-- 默认缓载图片 -->
<!-- 前台首页楼层模板  -->
	<!-- 楼层 _star -->
	<!-- 楼层颜色 -->
	
	
	
	<div class=" custom-box">
        <div class="custom">
                   <a href="/trade/product-1.html" target="_blank"  style='color:#179215;'> <img src="/trade/img/t8.png" alt="" usemap="#Map2" border="0" /></a>
                    <map name="Map2" id="Map2">
                      <area shape="rect" coords="13,161,186,238" href="/trade/product-10.html" />
                      <area shape="rect" coords="198,162,389,244" href="/trade/product-27.html" />
                      <area shape="rect" coords="403,163,595,245" href="/trade/product-28.html" />
                      <area shape="rect" coords="611,160,793,245" href="/trade/product-56.html" />
                      <area shape="rect" coords="806,159,992,241" href="/trade/product-64.html" />
                      <area shape="rect" coords="1001,157,1185,240" href="/trade/product-78.html" />
                      <area shape="rect" coords="8,256,185,336" href="/trade/product-99.html" />
                      <area shape="rect" coords="200,262,387,341" href="/trade/product-107.html" />
                      <area shape="rect" coords="404,260,593,342" href="/trade/product-118.html" />
                      <area shape="rect" coords="609,262,799,346" href="/trade/product-123.html" />
                      <area shape="rect" coords="808,263,995,341" href="/trade/product-129.html" />
                      <area shape="rect" coords="1002,257,1186,340" href="/trade/product-137.html" />
                    </map>
        </div>
    </div>
	

	<!-- 默认缓载图片 -->
	<!-- 内容开始 -->
	<div class=" custom-box">
        <div class="custom">
            

            
                
                	
                    <img src="/trade/img/t9.png" alt="" width="1210" usemap="#Map3" border="0" />
                    <map name="Map3" id="Map3">
                      <area shape="rect" coords="-10,127,289,391" href="/detail_center_191" />
                      <area shape="rect" coords="307,129,598,392" href="/detail_center_192" />
                      <area shape="rect" coords="614,126,905,394" href="/detail_center_193" />
                      <area shape="rect" coords="920,126,1212,395" href="/detail_center_194" />
                    </map> 
                
                
        	
        </div>
    </div>
	<!-- 内容结束 -->
	

	<!-- #tpl_region_end -->

	<!-- 左侧楼层定位 _start-->
	<div class="elevator">
		<div class="elevator-floor">
		</div>
	</div>
</div>

<style>
.drop-item:hover {
	border: 0px
}
</style>



	<!-- 站点底部-->

<!-- 底部 _start-->



<div class="site-footer">
	
	
	<div class="footer-service"><div align="center">
	<br />
</div></div>
	
	
	<div class="footer-related">
		
		

		


		
		
		<div class="footer-article w1210">
			<dl class="col-article col-article-spe">
				<dt class="phone color">010-86469678</dt>
<dd class="customer"><span>主管单位：<br />　　　国资委商业饮食服务业发展中心<br />　　　国资委中华传统饮食与健康服务业推广管理委员会<br />主办：中国新农村建设先进人物年鉴编辑委员会</span></dd>
</dl>
			<!---->
			<dl class="col-article col-article-first">
				<dt>关于我们</dt>
				
				<dd>
					
					<a rel="nofollow" href="#" target="_blank">中国农贸</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="#" target="_blank">交易保障</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="#" target="_blank">合作联系</a>
					
				</dd>
				<!-- -->
			</dl>
			<!---->
			<dl class="col-article col-article-first">
				<dt>商务服务</dt>
				
				<dd>
					
					<a rel="nofollow" href="#" target="_blank">找企业</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="#" target="_blank">找产品</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="#" target="_blank">采购指南</a>
					
				</dd>
  				<dd>
					
					<a rel="nofollow" href="#" target="_blank">商家入驻</a>
					
				</dd>
				<!-- -->
			</dl>
			<!---->
			<dl class="col-article col-article-first">
				<dt>整合服务</dt>
				
				<dd>
					
					<a rel="nofollow" href="/list_afair" target="_blank">会展服务</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="/trade/product-886.html" target="_blank">物流服务</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="/trade/product-888.html" target="_blank">保险服务</a>
					
				</dd>
				<dd>
					
					<a rel="nofollow" href="/trade/product-885.html" target="_blank">金融服务</a>
					
				</dd>
				<dd>
					
					<a rel="nofollow" href="/trade/product-887.html" target="_blank">担保服务</a>
					
				</dd>
				<!-- -->
			</dl>
			<!---->
			<dl class="col-article col-article-first">
				<dt>友情链接</dt>
				
				<dd>
					
					<a rel="nofollow" href="http://www.zgxnnj.org" target="_blank">新农年鉴</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="/CN/trade" target="_blank">农贸平台</a>
					
				</dd>
				
				<dd>
					
					<a rel="nofollow" href="http://www.kuadi100.com" target="_blank">快递查询</a>
					
				</dd>
				<!-- -->
			</dl>
			<!---->

			<div class="QR-code fr">
				
				
				<ul class="tabs">
					
					<li class="current">官网</li>
					<li >微信</li>
					
				</ul>
				<div class="code-content">
					
					<div class="code">
						<img src="/images/ewm.png">
					</div>
					
					
					<div class="code hide">
						<img src="/images/erweima.png">
					</div>
					
				</div>
				
				
			</div>
		</div>
</div>
</div>
<!-- 底部 _end-->


	
	<!-- JS -->
	<script src="/nong/js/jquery.cookie.js?v=201807241613"></script>
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
	<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1275170681'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1275170681%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>