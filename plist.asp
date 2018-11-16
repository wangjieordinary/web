<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%a=request("actnews_product_class")
if a="" or isnull(a) then a=request("a")
px="0"
if ubound(split(a,"-"))>1 then
catid=split(a,"-")(1)
page=split(a,"-")(2)
tehui=split(a&"-","-")(3)
px=split(a&"------","-")(8)
pxlx=split(a&"-------","-")(9)
zdj=0
zgj=0
if pxlx="" then pxlx=3
jgqj1=getnumb(split(a&"-------------","-")(13))
jgqj2=getnumb(split(a&"--------------","-")(14))
if int(jgqj1)>int(jgqj2) then
zdj=int(jgqj2)
zgj=int(jgqj1)
else
zdj=int(jgqj1)
zgj=int(jgqj2)
end if
if catid="" then catid=0
elseif instr(a,"-")>0 then
catid=split(a,"-")(1)
catid=int(getnumb(catid))
else
catid=int(getnumb(catid))
end if
key=request("key")
if key="" then key=request("keyword")
if request("skey")="yes" then
key=Session("key")
else
Session("key")=key
end if
keylist=Session("keylist")
if keylist<>"" and instr(keylist,""""&key&"""")=0 and key<>"" then
Session("keylist")=keylist&","""&key&""""
elseif key<>"" and keylist="" then
Session("keylist")=""""&key&""""
end if
'Session("keylist")=""
search=request("search")
%><%if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mlist-"&catid&".html")
response.end
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="zh-CN" class="ie8"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="zh-CN">
<head>
<title>中国农民自由贸易网-公链大数据平台。<%=Session("keylist")%></title>
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
<script src="/nong/js/jquery.js?v=20180813"></script>
<script src="/nong/js/jquery.cookie.js?v=20180813"></script>
<script src="/nong/js/layer.js?v=20180813"></script>
<script src="/nong/js/jquery.method.js?v=20180813"></script>
<script src="/nong/js/jquery.modal.js?v=20180813"></script>
<script src="/nong/js/common.js?v=20180813"></script>
<!-- 图片缓载js -->
<script src="/nong/js/jquery.lazyload.js?v=20180813"></script>
<script type="text/javascript">
	$().ready(function() {
		
																				
	})
</script>
</head>
<body class="pace-done">
<div id="bg" class="bg" style="display: none;"></div>

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
														<input type="text" class="search-box-input SZY-SEARCH-BOX-KEYWORD" name="key" tabindex="9" autocomplete="off" data-searchwords="<%=Session("key")%>" placeholder="<%=Session("key")%>" value="" />
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
<!-- 头部滚动通栏悬浮框 _end --
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
					<a class="menu-hd cart" href="/u_cart" target="_top">
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
		var url = '/delete-recordapi';
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
	$(".SZY-DEFAULT-SEARCH").data("cat_id", "148");
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
	
<link rel="stylesheet" href="/nong/css/index.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/template.css?v=20180702"/>
<script src="/nong/js/index.js?v=20180813"></script>
<script src="/nong/js/tabs.js?v=20180813"></script>
<script src="/nong/js/bubbleup.js?v=20180813"></script>
<script src="/nong/js/jquery.hiSlider.js?v=20180813"></script>
<script src="/nong/js/index_tab.js?v=20180813"></script>
<script src="/nong/js/jump.js?v=20180813"></script>
<script src="/nong/js/nav.js?v=20180813"></script>
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



	
	
	<!-- 内容 -->
	
<!-- css -->
<link rel="stylesheet" href="/nong/css/category.css?v=20180702"/>
<!-- 筛选条件数量 -->
<!-- 占位符 -->
<script type="text/javascript">
var begin_hidden = "2";

function Show_More_Attrgroup() {
	
	if("2" == 0){
		$(".attr-group-more").hide();
	}
	
	if (begin_hidden == 0) {
		$("[name='attr-group-dl']").each(function(i){
			$(this).show();
		});
		$('#attr-group-more-text').html("收起");
		begin_hidden = "2";
	}else{
		var more_text = "";
		var attr_names = [];
		$("[name='attr-group-dl']").each(function(i){
			if(i >= begin_hidden){
				$(this).hide();
				attr_names.push($(this).data("attr-name"));
			}else{
				$(this).show();
			}
		});
		
		if(attr_names.length > 4){
			attr_names = attr_names.slice(0, 4);
			more_text = "更多选项（"+attr_names.join("、")+" 等）";
		}else{
			attr_names = attr_names.slice(0, attr_names.length);
			more_text = "更多选项（"+attr_names.join("、")+"）";
		}
		
		$('#attr-group-more-text').html(more_text);
		begin_hidden = 0;
	}
	
	var kuan1 = $("#attr-list-ul").width();
	var kuan2 = $("#attr-group-more").width();
	var kuan = (kuan1 - kuan2) / 2;
	$('#attr-group-more').css("margin-left", kuan + "px");
}

$().ready(function(){
	Show_More_Attrgroup();
})

// 是否显示“更多”__初始化
function init_more(boxid, moreid, height) {
	var obj_brand = document.getElementById(boxid);
	var more_brand = document.getElementById(moreid);
	if (obj_brand.clientHeight > height) {
		obj_brand.style.height = height + "px";
		obj_brand.style.overflow = "hidden";
		more_brand.innerHTML = '<a href="javascript:void(0);"  onclick="slideDiv(this, \'' + boxid + '\', \'' + height + '\');" class="more" >更多</a>';
	}
}
// 收起
function slideDiv(thisobj, divID, Height) {
	var obj = document.getElementById(divID).style;
	if (obj.height == "") {
		obj.height = Height + "px";
		obj.overflow = "hidden";
		thisobj.innerHTML = "更多";
		thisobj.className = "more";
		// 如果是品牌，额外处理
		if (divID == 'brand-abox') {
			// obj.width="456px";
			getBrand_By_Zimu(document.getElementById('brand-zimu-all'), '');
			document.getElementById('brand-sobox').style.display = "none";
			document.getElementById('brand-zimu').style.display = "none";
			document.getElementById('brand-abox-father').className = "";
		}
	} else {
		obj.height = "";
		obj.overflow = "";
		thisobj.innerHTML = "收起";
		thisobj.className = "more opened";
		// 如果是品牌，额外处理
		if (divID == 'brand-abox') {
			// obj.width="456px";
			document.getElementById('brand-sobox').style.display = "block";
			document.getElementById('brand-zimu').style.display = "block";
			// getBrand_By_Zimu(document.getElementById('brand-zimu-all'),'');
			document.getElementById('brand-abox-father').className = "brand-more";
		}
	}
}
function getBrand_By_Name(val) {
	val = val.toLocaleLowerCase();
	var brand_list = document.getElementById('brand-abox').getElementsByTagName('li');
	for (var i = 0; i < brand_list.length; i++) {
		// document.getElementById('brand-abox').style.width="auto";
		var name_attr_value = brand_list[i].getAttribute("name").toLocaleLowerCase();
		if (brand_list[i].title.indexOf(val) == 0 || name_attr_value.indexOf(val) == 0 || val == '') {
			brand_list[i].style.display = 'block';
		} else {
			brand_list[i].style.display = 'none';
		}
	}
}
// 点击字母切换品牌
function getBrand_By_Zimu(obj, zimu) {
	document.getElementById('brand-sobox-input').value = "可搜索拼音、汉字查找品牌";
	obj.focus();
	var brand_zimu = document.getElementById('brand-zimu');
	var zimu_span_list = brand_zimu.getElementsByTagName('span');
	for (var i = 0; i < zimu_span_list.length; i++) {
		zimu_span_list[i].className = '';
	}
	var thisspan = obj.parentNode;
	thisspan.className = 'span';
	var brand_list = document.getElementById('brand-abox').getElementsByTagName('li');
	for (var i = 0; i < brand_list.length; i++) {
		// document.getElementById('brand-abox').style.width="auto";
		if (brand_list[i].getAttribute('rel') == zimu || zimu == '') {
			brand_list[i].style.display = 'block';
		} else {
			brand_list[i].style.display = 'none';
		}
	}
}
var duoxuan_a_valid = new Array();
// 点击多选， 显示多选区
function showDuoXuan(dx_divid, a_valid_id) {
	var dx_dl_div = document.getElementById('attr-list-ul').getElementsByTagName('dl');
	for (var i = 0; i < dx_dl_div.length; i++) {
		dx_dl_div[i].className = '';
		//dx_dl_div[0].className = 'selected-attr-dl';
	}
	var dxDiv = document.getElementById(dx_divid);
	dxDiv.className = "duoxuan";
	duoxuan_a_valid[a_valid_id] = 1;

	// 显示更多
	if($("#"+dx_divid).find(".more").hasClass("opened") == false){
		$("#"+dx_divid).find(".more").click();
	}
}
function hiddenDuoXuan(dx_divid, a_valid_id) {
	var dxDiv = document.getElementById(dx_divid);
	dxDiv.className = "";
	duoxuan_a_valid[a_valid_id] = 0;
	if (a_valid_id == 'brand') {
		var ul_obj_div = document.getElementById('brand-abox');
		var li_list_div = ul_obj_div.getElementsByTagName('li');
		if (li_list_div) {
			for (var j = 0; j < li_list_div.length; j++) {
				li_list_div[j].className = "";
			}
		}
	} else {
		var ul_obj_div = document.getElementById('attr-abox-' + a_valid_id);
	}
	var input_list = ul_obj_div.getElementsByTagName('input');
	var span_list = ul_obj_div.getElementsByTagName('span');
	for (var j = 0; j < input_list.length; j++) {
		input_list[j].checked = false;
	}
	if (span_list.length) {
		for (var j = 0; j < span_list.length; j++) {
			span_list[j].className = "";
		}
	}
	// 隐藏更多
	if($("#"+dx_divid).find(".more").hasClass("opened") == true){
		$("#"+dx_divid).find(".more").click();
	}
}
function duoxuan_Onclick(a_valid_id, idid, thisobj) {
	if (duoxuan_a_valid[a_valid_id]) {
		if (thisobj) {
			var fatherObj = thisobj.parentNode;
			if (a_valid_id == "brand") {
				fatherObj.className = fatherObj.className == "brand-seled" ? "" : "brand-seled";
			} else {
				fatherObj.className = fatherObj.className == "" ? "selected" : "";
			}
		}
		document.getElementById('chk-' + a_valid_id + '-' + idid).checked = !document.getElementById('chk-' + a_valid_id + '-' + idid).checked;
		return false;
	}
	
	var url = $(thisobj).data("url");
	
	$.go(url);
}

function duoxuan_Submit(dxid, indexid, url) {

	var theForm = document.forms['theForm'];
	var chklist = theForm.elements['checkbox_' + dxid + '[]'];
	var value = "";
	var mm = 0;

	for (var k = 0; k < chklist.length; k++) {
		if (chklist[k].checked) {
			value += mm > 0 ? "_" : "";
			value += chklist[k].value;
			mm++;
		}
	}

	if (mm == 0) {
		return false;
	}
	
	if (dxid == 'brand') {
		url = url.replace("{0}", value);
	} else {
		url = url.replace("{0}", value);
	}
	
	$.go(url);
}

//自定义价格
function setPrice(url) {
	var min = $('#price_min').val();
	var max = $('#price_max').val();
	
	if(min == "" && max == ""){
		return;
	}
	
	if(!isNaN(min) && min != "" && min >= 0){
		url = url.replace("{0}", min);
	}else{
		url = url.replace("{0}", 0);
	}
	
	if(!isNaN(max) && max != "" && max >= 0){
		url = url.replace("{1}", max);
	}else{
		url = url.replace("{1}", 0);
	}
	
	$.go(url);
}
</script>
<!-- 缓载图片 -->
<div class="blank"></div>
<div class="w1210">
	<!--热卖推荐-->
	
	<!--当前位置，面包屑-->
	<div class="breadcrumb clearfix">
	<a href="/" class="index">首页</a>

<%if catid=0 then%>
	<span class="crumbs-arrow">&gt;</span>
	<div class="crumbs-nav crumbs-nav0">
		<a class="crumbs-title" href="#" title="自贸平台">
			自贸平台
			<i class="icon"></i>
		</a>
		<div class="crumbs-drop">
			<ul class="crumbs-drop-list">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=1 and hide=0 and category<>'' and category is not null and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
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
	</div>
	<span class="crumbs-arrow">&gt;</span>
	<div class="crumbs-nav crumbs-nav0">
		<a class="crumbs-title" href="#" title="农贸平台">
			农贸平台
			<i class="icon"></i>
		</a>
		<div class="crumbs-drop">
			<ul class="crumbs-drop-list">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID=2 and hide=0 and category<>'' and category is not null and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
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
	</div>
<%end if%>
	
<%fid=getcatfid(catid)
fid2=getcatfid(fid)
fid3=getcatfid(fid2)
if fid3>0 then%>
	<span class="crumbs-arrow">&gt;</span>
	<div class="crumbs-nav crumbs-nav0">
		<a class="crumbs-title" href="/trade/product-<%=fid3%>.html" title="<%=getcatname(fid3)%>">
			<%=getcatname(fid3)%>
			<i class="icon"></i>
		</a>
		<div class="crumbs-drop">
			<ul class="crumbs-drop-list">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&fid3&" and hide=0 and category<>'' and category is not null and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
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
	</div>
<%end if%>

<%if fid2>0 then%>
	<span class="crumbs-arrow">&gt;</span>
	<div class="crumbs-nav crumbs-nav0">
		<a class="crumbs-title" href="/trade/product-<%=fid2%>.html" title="<%=getcatname(fid2)%>">
			<%=getcatname(fid2)%>
			<i class="icon"></i>
		</a>
		<div class="crumbs-drop">
			<ul class="crumbs-drop-list">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&fid2&" and hide=0 and category<>'' and category is not null and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
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
	</div>
<%end if%>

<%if fid>0 then%>
	<span class="crumbs-arrow">&gt;</span>
	<div class="crumbs-nav crumbs-nav0">
		<a class="crumbs-title" href="/trade/product-<%=fid%>.html" title="<%=getcatname(fid)%>">
			<%=getcatname(fid)%>
			<i class="icon"></i>
		</a>
		<div class="crumbs-drop">
			<ul class="crumbs-drop-list">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&fid&" and hide=0 and category<>'' and category is not null and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
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
	</div>
<%end if%>

<%Function getcatzid(catid) '获得父分类ID
Set gcnrs = Server.CreateObject( "ADODB.Recordset" )
gcnsql="Select * from [category] where ParentID="&catid
gcnrs.open gcnsql,conn,1,1
if not (gcnrs.bof and gcnrs.eof) then
getcatzid=1
else
getcatzid=0
end if
gcnrs.close
set gcnrs=nothing
End Function%>
	
<%zid=getcatzid(catid)
if zid>0 and catid>0 then%>
	<span class="crumbs-arrow">&gt;</span>
	<div class="crumbs-nav crumbs-nav0">
		<a class="crumbs-title" href="/trade/product-<%=catid%>.html" title="<%=getcatname(catid)%>">
			<%=getcatname(catid)%>
			<i class="icon"></i>
		</a>
		<div class="crumbs-drop">
			<ul class="crumbs-drop-list">
<%set rs1=server.createobject("adodb.recordset")
exec1="select * from [category] where ParentID="&catid&" and hide=0 and siteid="&siteid&" order by ParentID asc,categoryorder asc"		
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
	</div>
<%end if%>
	
	
	<!-- <div class="crumbs-nav">
		<span class="crumbs-search">
						<form id="1534335985i20Zc2" class="current-search-form" method="get" action="/list">
				<input type="text" value="在当前分类下搜索" name="keyword" class="search-term" />
				<input type="button" class="search-button" />
			</form>
		</span>
	</div> -->
	<script type="text/javascript">
		$().ready(function() {
			$("#1534335985i20Zc2").find(".search-button").click(function() {
				var keyword = $("#1534335985i20Zc2").find("[name='keyword']").val();

				var url = "/list.html?cat_id=148&amp;region=61_01&amp;keyword={0}";
				url = url.replace(/&amp;/g, "&");

				if ($.trim(keyword) == '在当前分类下搜索') {
					url = url.replace("{0}", "");
				} else {
					url = url.replace("{0}", $.trim(keyword));
				}

				$.go(url);
			});
			$("#1534335985i20Zc2").find("[name='keyword']").click(function() {
				if ($(this).val() == '在当前分类下搜索') {
					$(this).val("");
				}
			});
		});
	</script>
	
	
</div>
	<form action="" method="post" name="theForm">
		<!--筛选条件-->
		<div class="search-wrap" id="attr-list-ul" style="border-top: none;">
			<!--已选条件-->
<%if int(zgj)>0 then%>
			<dl class="selected-attr-dl" style="border-bottom: none;">
				<dt>已选条件：</dt>
				<dd class="moredd">
					<a href="/trade/product-<%=catid%>.html">全部撤销</a>
				</dd>
				<dd>
					<ul class="selected-attr">
						<!-- 以选择的筛选属性、品牌、价格 -->
						<!-- -->
						<li>
							<a href="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-0-0.html">
								价格：
								<b class="color"><%=zdj%>-<%=zgj%></b>
								<i>×</i>
							</a>
						</li>
						<!-- -->
					</ul>
				</dd>
			</dl><%end if%>
			<!-- -->
			<!-- 品牌 -->
			
			<dl class="" id="attr-group-dl-brand">
				<dt>品牌：</dt>
				<dd class="moredd">
					<label id="brand-more"></label>
					<label>
						<a href="javascript:void(0)" class="multiple" onclick="showDuoXuan('attr-group-dl-brand','brand');">
							<font class="duo-b">+</font>
							多选
						</a>
					</label>
				</dd>
				<dd>
					<div id="brand-sobox">
						<input id="brand-sobox-input" value="可搜索拼音、汉字查找品牌" type="text" onkeyup="getBrand_By_Name(this.value);" />
					</div>
					<div id="brand-zimu" class="clearfix">
						<span class="span">
							<a href="javascript:void(0);" onmouseover="getBrand_By_Zimu(this,'')" id="brand-zimu-all">所有品牌</a>
							<b></b>
						</span>

						
						<span>
							<a href="javascript:void(0);" onmouseover="getBrand_By_Zimu(this,'Z')">Z</a>
							<b></b>
						</span>
						

					</div>
					<div id="brand-abox-father">
						<ul id="brand-abox" class="brand-abox-imgul">
							<!-- 品牌选中状态为brand-seled样式 -->
							
							<li class="brand" title="香港优势" rel="Z" name="Z">
								<input type="checkbox" style="display: none;" name="checkbox_brand[]" id="chk-brand-1" value="161">
								<a href="javascript:void(0);" data-url="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html" onclick="return duoxuan_Onclick('brand','1', this);">
																		<img class="lazy" src="/nong/images/blank.png" data-original="/images/yssb1.png">
																		<span class="color">香港优势</span>
									<i></i>
								</a>
							</li>
							
						</ul>
					</div>

					<div class="duoxuan-btnbox">
						<!-- 当没有选中任何品牌时，确定按钮为禁用状态disabled;当选中品牌后，确定按钮添加select-button-sumbit样式 -->
						<a id="button-brand"></a>
						<a class="select-button disabled" onclick="duoxuan_Submit('brand',0,'/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-{0}.html');">确定</a>
						<a href="javascript:void(0);" onclick="hiddenDuoXuan('attr-group-dl-brand', 'brand');" class="select-button">取消</a>
					</div>
				</dd>
			</dl>
			<script type="text/javascript">
			duoxuan_a_valid['brand'] = 0;
			init_more('brand-abox', 'brand-more', '83');	
			</script>
			
			<!-- 价格 -->
<%if int(zgj)=0 then%>
			<dl>
				<dt>价格：</dt>
				<dd class="moredd">&nbsp;</dd>
				<dd>
					<ul>
						
						<li>
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-10-200.html">10&nbsp;-&nbsp;200</a>
						</li>
						
						<li>
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-201-500.html">201&nbsp;-&nbsp;500</a>
						</li>
						<li>
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-501-1000.html">501&nbsp;-&nbsp;1000</a>
						</li>
						<li>
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-2001-5000.html">2001&nbsp;-&nbsp;5000</a>
						</li>
						
						<li>
							<input name="price_min" id="price_min" value="" class="input-txt" autocomplete="off" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
							<i></i>
							<input name="price_max" id="price_max" value="" class="input-txt" autocomplete="off" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
							<a class="select-button" href="javascript:void(0);" onclick="setPrice('/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-{0}-{1}.html');">确定</a>
						</li>
					</ul>
				</dd>
			</dl>
<%end if%>
			<!-- 当展开时，为dl添加duoxuan样式 -->
			<!-- 
			
			
			<dl id="attr-group-dl-1" name="attr-group-dl" data-attr-name="净含量" class="filter-attr">
				<dt>净含量：</dt>
				<dd class="moredd">
					<label id="attr-more-1"></label>
					
					<label>
						<a href="javascript:void(0)" class="multiple" onclick="showDuoXuan('attr-group-dl-1', '1');">
							<font class="duo-b">+</font>
							多选
						</a>
					</label>
					
				</dd>
				<dd>
					<ul id="attr-abox-1" class="color-value">
						
						<li class="other-vattr-li">
							<input class="checkBox" type="checkbox" value="1825" id="chk-1-1" name="checkbox_1[]" />
							<a href="javascript:void(0);" data-url="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-0-0-1825.html" onclick="return duoxuan_Onclick('1','1', this);" class="duo-vattr">0.5KG以下</a>
						</li>
						
						<li class="other-vattr-li">
							<input class="checkBox" type="checkbox" value="1826" id="chk-1-2" name="checkbox_1[]" />
							<a href="javascript:void(0);" data-url="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-0-0-1826.html" onclick="return duoxuan_Onclick('1','2', this);" class="duo-vattr">0.5kg(含）-2.5kg(不含)</a>
						</li>
						
						<li class="other-vattr-li">
							<input class="checkBox" type="checkbox" value="1828" id="chk-1-3" name="checkbox_1[]" />
							<a href="javascript:void(0);" data-url="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-0-0-1828.html" onclick="return duoxuan_Onclick('1','3', this);" class="duo-vattr">5kg及以上</a>
						</li>
						
					</ul>
					<div class="duoxuan-btnbox">
						<a id="button-1"></a>
						<a id="select-button-1" class="select-button disabled" onclick="duoxuan_Submit(1, '0', '/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-0-0-{0}.html');">确定</a>
						<a href="javascript:void(0);" onclick="hiddenDuoXuan('attr-group-dl-1', '1');" class="select-button">取消</a>
					</div>
				</dd>
			</dl>-->
			<script type="text/javascript">
            init_more('attr-abox-1', 'attr-more-1', '29');
            </script>
			
		</div>

		
	</form>
	<script type="text/javascript">
	$(function(){
		$('.other-vattr-li').bind('click',function(){
			var seled_input_num = $(this).parents('ul').find('input[type="checkbox"]:checked').length;
			if(seled_input_num>0){
				$(this).parents('dd').find('.select-button').eq(0).attr('class','select-button select-button-sumbit');	
			}else if(seled_input_num == 0){
				$(this).parents('dd').find('.select-button').eq(0).attr('class','select-button disabled');
			}
		})  
	})
    </script>
	<div class="blank15"></div>
	<div class="content-wrap category-wrap clearfix">
		<!--左侧内容-->
		<div class="aside" >
			<span class="slide-aside" ></span>
			<div class="aside-inner">
				<!--新品推荐-->
				
				<!--销量排行榜-->
				
				<div class="aside-con">
					<h2 class="aside-tit">销量排行榜</h2>
					<ul class="aside-list">
<%if catid=0 then
csql=" and onsale=0"
else
catlist=getzcat(catid)
if catlist<>"" and isnull(catlist)=false then
zcatlist=SPLIT(catlist,",")
for z=1 to Ubound(zcatlist)
zcatsql=zcatsql&" or catid="&SPLIT(catlist,",")(z)&" or catidlist like '%|"&SPLIT(catlist,",")(z)&"|%' "
next
end if
csql=" and onsale=0 and (catidlist like '%|"&catid&"|%' or catid="&catid&")"
if zcatsql<>"" then csql=" and onsale=0 and (catidlist like '%|"&catid&"|%' or catid="&catid&zcatsql&")"
end if
set rs=server.createobject("adodb.recordset")
exec="select top 5 * from [product] where siteid="&siteid&csql&" and pic1<>'' and pic1 is not null and recommend=3 order by id asc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
do while not rs.eof%>
						<li>
							<!--售罄-->
							
							<div class="p-img">
								<a target="_blank" title="<%=rs("name")%>" href="/trade/goods-<%=rs("id")%>.html" style="background: url() no-repeat center center;">
									<img class="lazy" alt="<%=rs("name")%>" src="/nong/images/blank.png" data-original="<%=rs("pic1")%>" />
								</a>
							</div>
							<div class="p-name">
								<a target="_blank" title="<%=rs("name")%>" href="/trade/goods-<%=rs("id")%>.html"><%=rs("name")%></a>
							</div>
							<div class="p-price">
								<span class="sale-price second-color">￥<%=gshjg(rs("price2"))%></span>
								<span class="sale-num">销量：<%=rs("ordercount")+1%></span>
							</div>
						</li><%rs.movenext
loop
rs.close
set rs=nothing
end if%>
						
					</ul>
				</div>
				
			</div>
		</div>
		<!--右侧内容-->
		<div class="main "  >
			<div class="" id="filter">
				<!--排序-->
				<form method="GET" name="listform" action="">
					<div class="fore1">
						<dl class="order">
							
							<dd class="<%if px="0" then%>first curr<%end if%>">
								<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-0-<%if pxlx="3" and (px="0" or px="") then%>4<%else%>3<%end if%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
									综合
									
								</a>
							</dd>
							
							<dd class="<%if px="1" then%>first curr<%end if%>">
								<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-1-<%if pxlx="3" and px="1" then%>4<%else%>3<%end if%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
									销量
									
									<i class="iconfont<%if px="1" and pxlx="4" then%> icon-ASC<%else%> icon-DESC<%end if%>"></i>
									
								</a>
							</dd>
							
							<dd class="<%if px="2" then%>first curr<%end if%>">
								<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-2-<%if pxlx="3" and px="2" then%>4<%else%>3<%end if%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
									新品
									
									<i class="iconfont<%if px="2" and pxlx="4" then%> icon-ASC<%else%> icon-DESC<%end if%>"></i>
									
								</a>
							</dd>
							
							<dd class="<%if px="3" then%>first curr<%end if%>">
								<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-3-<%if pxlx="3" and px="3" then%>4<%else%>3<%end if%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
									评论
									
									<i class="iconfont<%if px="3" and pxlx="4" then%> icon-ASC<%else%> icon-DESC<%end if%>"></i>
									
								</a>
							</dd>
							
							<dd class="<%if px="4" then%>first curr<%end if%>">
								<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-4-<%if pxlx="3" and px="4" then%>4<%else%>3<%end if%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
									价格
									
									<i class="iconfont<%if px="4" and pxlx="4" then%> icon-ASC<%else%> icon-DESC<%end if%>"></i>
									
								</a>
							</dd>
							
							<dd class="<%if px="5" then%>first curr<%end if%>">
								<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-5-<%if pxlx="3" and px="5" then%>4<%else%>3<%end if%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
									人气
									
									<i class="iconfont<%if px="5" and pxlx="4" then%> icon-ASC<%else%> icon-DESC<%end if%>"></i>
									
								</a>
							</dd>
							
						</dl>
<%if page="" then page=1
if isnumeric(page) then
page=abs(page)
 if page=0 then page=1
else
 page=1
end if
if catid=0 then
StrWhere=" and onsale=0"
else
catlist=getzcat(catid)
if catlist<>"" and isnull(catlist)=false then
zcatlist=SPLIT(catlist,",")
for z=1 to Ubound(zcatlist)
zcatsql=zcatsql&" or catid="&SPLIT(catlist,",")(z)&" or catidlist like '%|"&SPLIT(catlist,",")(z)&"|%' "
next
end if
StrWhere=" and onsale=0 and (catidlist like '%|"&catid&"|%' or catid="&catid&")"
if zcatsql<>"" then StrWhere=" and onsale=0 and (catidlist like '%|"&catid&"|%' or catid="&catid&zcatsql&")"
end if
if search<>"" then
if key<>"" and search="complete" then StrWhere=StrWhere&" and name='"&key&"'"
if key<>"" and (search="blur" or search="") then StrWhere=StrWhere&" and name like '%"&key&"%'"
else
if key<>"" then StrWhere=StrWhere&" and name like '%"&key&"%'"
end if
if pxlx="3" then
pxlxsql=" desc"
else
pxlxsql=" asc"
end if
if key<>"" then skey="&skey=yes"
pxsql=" ontime"
if px="0" then pxsql=" ontime"
if px="1" then pxsql=" ordercount"
if px="2" then pxsql=" id"
if px="3" then pxsql=" viewnum"
if px="4" then pxsql=" price2"
if px="5" then pxsql=" recommend"
if zgj>0 then StrWhere=StrWhere&" and price2>="&zdj&" and price2<="&zgj
if tehui="5" then StrWhere=StrWhere&" and recommend="&int(tehui)
set rs=server.createobject("adodb.recordset")
exec="select * from [product] where siteid="&siteid&StrWhere&" order by"&pxsql&pxlxsql
rs.open exec,conn,1,1
FieldCount=rs.recordcount
if FieldCount>0 then
rs.PageSize=20
if page<=0 then
spage=1
else
spage=page
ppage=FieldCount/20
if int(ppage)<FieldCount/20 then ppage=ppage+1
if page>ppage then spage=1
end if
rs.AbsolutePage=spage
end if
PageSizeX=20
PageCountX=FieldCount/PageSizeX
if int(PageCountX)<PageCountX then PageCountX=int(PageCountX)+1

if spage>1 then pagelist="<span ><a class=""num prev "" data-go-page="""&spage-1&""" title=""上一页"">上一页</a></span>"
for p=1 to PageCountX
if spage=p then
pagelist=pagelist&"<span class=""num curr""><a data-cur-page="""&p&""">"&p&"</a></span>"
else
pagelist=pagelist&"<span><a class=""num "" href=""javascript:void(0);"" data-go-page="""&p&""">"&p&"</a></span>"
end if
next
if PageCountX>page then pagelist=pagelist&"<span><a class=""num next"" data-go-page="""&spage+1&""" title=""下一页"">下一页</a></span>"

if FieldCount>0 then
for i=1 to PageSizeX
if i mod 4 =0 then
prolist=prolist&"<li class=""item last"">"
else
prolist=prolist&"<li class=""item"">"
end if
prolist=prolist&"<div class=""item-con""><div class=""item-pic""><a href=""/trade/goods-"&rs("id")&".html"" title="""&rs("name")&""" target=""_blank"" style=""background: url() no-repeat center center;""><img class=""lazy"" alt="""&rs("name")&""" src=""/nong/images/blank.png"" data-original="""&rs("pic1")&""" /></a></div><div class=""item-info""><div class=""item-price""><s>￥"&gshjg(rs("price1"))&"</s><em class=""sale-price second-color"">￥"&gshjg(rs("price2"))&"</em><em class=""sale-count"">已售"&rs("ordercount")&"件</em></div><div class=""item-name""><a href=""/trade/goods-"&rs("id")&".html"" target=""_blank"" title="""&rs("name")&""">"&rs("name")&"</a></div><div class=""item-con-info""><div class=""fl""><div class=""item-operate""></div><div class=""item-shop""><a href=""/shop/9.html"" target=""_blank"" title=""三农联盟""><span>三农联盟</span></a></div></div><div class=""fr""><!--<div class=""item-add-cart""><a href=""javascript:void(0);"" style=""background-image: url(/nong/images/add-cart.jpg)"" data-goods-id="""&rs("id")&""" data-image-url="""&rs("pic1")&""" class=""add-cart disable"" title=""加入购物车""></a></div>--></div></div></div></div></li>"
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if%>
						<div class="pagin">

							<!---->
							<a class="prev disabled" href="/trade/product-<%=catid%>-<%if page>0 then%><%=page%><%end if%>-<%=tehui%>-1-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
								<span class="icon prev-disabled"></span>
							</a>
							<!---->

							<span class="text">
								<font class="color"><%=page%></font>
								/
								
								<%=PageCountX%>
								
							</span>
							<!-- -->
							<a class="next disabled" href="/trade/product-<%=catid%>-<%if page<=PageCountX then%><%=page%><%end if%>-<%=tehui%>-1-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html">
								<span class="icon next-disabled"></span>
							</a>
							
						</div>
						<div class="total">
							共
							<span class="color"><%=FieldCount%></span>
							个商品
						</div>
					</div>
					<div class="fore2">
						<div class="filter-btn">
							<!--<span class="distribution">配送至</span>
							<div class="region-chooser-container" style="z-index: 3"></div>
							<!-- 选中的筛选条件给 a 标签追加类名 即  class="filter-tag curr" _star-->
							
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-1-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html" class="filter-tag ">
								<input class="none" name="fff" onclick="" type="checkbox">
																<i class="iconfont">&#xe715;</i>
																<span class="text">平台自营</span>
							</a>
							
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-1-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html" class="filter-tag ">
								<input class="none" name="fff" onclick="" type="checkbox">
																<i class="iconfont">&#xe715;</i>
																<span class="text">包邮</span>
							</a>
							
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-1-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html" class="filter-tag ">
								<input class="none" name="fff" onclick="" type="checkbox">
																<i class="iconfont">&#xe715;</i>
																<span class="text">支持货到付款</span>
							</a>
							
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-1-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html" class="filter-tag ">
								<input class="none" name="fff" onclick="" type="checkbox">
																<i class="iconfont">&#xe715;</i>
																<span class="text">仅显示有货</span>
							</a>
							
						</div>
						<div class="filter-mod">
							<!--选中样式为a标签添加curr样式-->
							
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html" title="大图模式" class="filter-type filter-type-grid curr">
								<i class="iconfont icon-grid"></i>
							</a>
							
							<a href="javascript:void(0);" data-go="/trade/product-<%=catid%>-<%=page%>-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-1.html" title="列表模式" class="filter-type filter-type-list">
								<i class="iconfont icon-list"></i>
							</a>
							
						</div>
					</div>
				</form>
			</div>
			<!--主体商品内容展示-->
			
			<form name="compareForm" action="compare.php" method="post" onsubmit="" id="table_list">
				
				
				
				
				<ul class="list-grid clearfix">
					<!-- -->
					<!-- 如果是4的整数倍，给 li 标签添加class="last"值，即class="item last" -->
<%=prolist%>
				</ul>
				
				
				
				
				
				
				<!--分页-->
				<div class="pull-right page-box">
					
					
					
<div id="pagination" class="page">
	<script data-page-json="true" type="text">
	{"page_key":"page","page_id":"pagination","default_page_size":10,"cur_page":<%=page%>,"page_size":<%=PageCountX%>,"page_size_list":[10,50,500,1000],"record_count":<%=FieldCount%>,"page_count":<%=page%>,"offset":<%=page*20%>,"url":null,"sql":null}
</script>
	<div class="page-wrap fr">
		<div class="total">共<%=FieldCount%>条记录
		<!-- 每页显示：
		<select class="select m-r-5" data-page-size="20">
			
			
			<!--<option value="10">10</option>-->
			
			
			
			<!--<option value="50">50</option>-->
			
			
			
			<!--<option value="500">500</option>-->
			
			
			
			<!--<option value="1000">1000</option>-->
			
			
		<!--</select>
		条 -->
		
		</div>
	</div>
	<div class="page-num fr">
<%=pagelist%>
		
	</div>
<!-- <div class="pagination-goto">
		<input class="ipt form-control goto-input" type="text">
		<button class="btn btn-default goto-button" title="点击跳转到指定页面">GO</button>
		<a class="goto-link" data-go-page="" style="display: none;"></a>
	</div> -->	
	<script type="text/javascript">
		$().ready(function() {
			$(".pagination-goto > .goto-input").keyup(function(e) {
				$(".pagination-goto > .goto-link").attr("data-go-page", $(this).val());
				if (e.keyCode == 13) {
					$(".pagination-goto > .goto-link").click();
				}
			});
			$(".pagination-goto > .goto-button").click(function() {
				var page = $(".pagination-goto > .goto-link").attr("data-go-page");
				if ($.trim(page) == '') {
					return false;
				}
				$(".pagination-goto > .goto-link").attr("data-go-page", page);
				$(".pagination-goto > .goto-link").click();
				return false;
			});
		});
	</script>
</div>
					
				</div>

			</form>
			
			<!--对比栏-->
		</div>
	</div>
	<!--历史记录和猜你喜欢-->
	
</div>

<script src="/nong/js/jquery.region.js?v=20180813"></script>
<script src="/nong/js/jquery.widget.js?v=20180813"></script>
<script src="/nong/js/jquery.tablelist.js?v=20180813"></script>
<!-- 选中当前分类弹出同级分类JS -->
<script type="text/javascript">
	$(function() {
		$('.breadcrumb .crumbs-nav').hover(function() {
			$(this).toggleClass('curr');
		})
	});
</script>

<script type="text/javascript">
	$().ready(function() {
		var page_url = "/trade/product-<%=catid%>-{0}-<%=tehui%>-0-0-0-0-<%=px%>-<%=pxlx%>-61_01-0-0-<%=zdj%>-<%=zgj%>.html";
		page_url = page_url.replace(/&amp;/g, '&');
		
		var tablelist = $("#table_list").tablelist({
			page_mode: 1,
			go: function(page){
				page_url = page_url.replace("{0}", page);
				$.go(page_url);
			}
		});
			
		$(".prev-page").click(function(){
			tablelist.prePage();
		});
		
		$(".next-page").click(function(){
			tablelist.nextPage();
		});
		$(".add-cart").click(function(event) {
			var goods_id = $(this).data("goods-id");
			var pid = $(this).data("goods-id");
			var image_url = $(this).data("image-url");
			var buy_enable = $(this).data("buy-enable");
			if(buy_enable){
				$.msg(buy_enable);
				return false;
			}
			$.cart.add(goods_id,pid, 1, {
				is_sku: false, 
				event: event,
				image_url: image_url,
				callback: function(){
					var attr_list = $('.attr-list').height(); 
					$('.attr-list').css({ 
						"overflow":"hidden" 
					});
					if(attr_list >= 200){ 
						$('.attr-list').addClass("attr-list-border");
						$('.attr-list').css({ 
							"overflow-y":"auto" 
						}); 
					}       
				}
			});
			return false;
		});
		// 跳转页面
		$("[data-go]").click(function(){
			$.go($(this).data("go"));
		});
	});
</script>
<!-- 暂时去掉 滚动条定位功能
<script type="text/javascript">
window.onbeforeunload = function() {  
    var scrollPos;  
    if (typeof window.pageYOffset != 'undefined') {  
        scrollPos = window.pageYOffset;  
    } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {  
        scrollPos = document.documentElement.scrollTop;  
    } else if (typeof document.body != 'undefined') {  
        scrollPos = document.body.scrollTop;  
    }  
    document.cookie = "SZY_GOODS_LIST_SCROLLTOP=" + scrollPos; //存储滚动条位置到cookies中  
}  
if (document.cookie.match(/SZY_GOODS_LIST_SCROLLTOP=([^;]+)(;|$)/) != null) {  
    //cookies中不为空，则读取滚动条位置  
    var arr = document.cookie.match(/SZY_GOODS_LIST_SCROLLTOP=([^;]+)(;|$)/);  
    document.documentElement.scrollTop = parseInt(arr[1]);  
    document.body.scrollTop = parseInt(arr[1]);  
} 
</script> -->
<script src="/nong/js/category.js?v=20180813"></script>
<!--[if lte IE 9]>
<script src="/nong/js/requestAnimationFrame.js?v=20180813"></script>
<![endif]-->
<!-- 飞入购物车js _end -->

	<!-- 站点底部-->
	
	
	
	
<!-- 右侧边栏 _start -->

<!-- 右侧边栏 _end -->

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

	<script src="/nong/js/jquery.fly.min.js?v=20180813"></script>
<script src="/nong/js/szy.cart.js?v=20180813"></script>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1275170681'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1275170681%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
	<!--[if lte IE 9]>
	<script src="/nong/js/requestAnimationFrame.js?v=20180813"></script>
	<![endif]-->
	<script type="text/javascript">
	$().ready(function(){
		// 缓载图片
		$.imgloading.loading();
	});
	</script>
	
</body>
</html>