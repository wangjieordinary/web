<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%shopid=request("shopid")
catid=request("catid")
d=request("d")
if ubound(split(d,"-"))>1 then
page=split(d,"-")(1)
xp=split(d,"-")(2)
end if
key=request("key")
if request("skey")="yes" then
key=Session("key")
else
Session("key")=key
end if
search=request("search")
%><%if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mshop/"&shopid&"_list_"&catid&".html")
response.end
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="zh-CN" class="ie8"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="zh-CN">
<head>
<title>三农联盟</title>
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
<link rel="stylesheet" href="/nong/css/iconfont.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/common.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/shop_index.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/template.css?v=20180702"/>

<!--整站改色 _start-->
<link rel="stylesheet" href="/nong/css/site-color-style-1.css?v=20180702"/>
<!--整站改色 _end-->
<!-- ================== END BASE CSS STYLE ================== -->
<script src="/nong/js/jquery.js?v=20180813"></script>
<script src="/nong/js/yii.js?v=20180813"></script>
<script src="/nong/js/layer.js?v=20180813"></script>
<script src="/nong/js/jquery.method.js?v=20180813"></script>
<script src="/nong/js/jquery.modal.js?v=20180813"></script>
<script src="/nong/js/common.js?v=20180813"></script>
<script src="/nong/js/jquery.tablelist.js?v=20180813"></script>
<!-- 图片缓载js -->
<script src="/nong/js/jquery.lazyload.js?v=20180813"></script>
</head>
<body>
	<!-- 引入头部文件 -->
	<!-- 引入头部文件 -->
<script src="/nong/js/index.js?v=20180813"></script>
<script src="/nong/js/tabs.js?v=20180813"></script>
<script src="/nong/js/bubbleup.js?v=20180813"></script>
<script src="/nong/js/jquery.hiSlider.js?v=20180813"></script>
<script src="/nong/js/index_tab.js?v=20180813"></script>
<script src="/nong/js/jump.js?v=20180813"></script>
<script src="/nong/js/nav.js?v=20180813"></script>
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
	<!--<em>欢迎来到珍佰农农业综合服务平台! </em>-->
	<a class="login color" href="/login.html" target="_top">请登录</a>
	<a class="register" href="/register.html" target="_top">免费注册</a>
</font>
<font id="login-info" class="login-info SZY-USER-ALREADY-LOGIN" style="display: none;">
	<em>
		<a href="/userpanel.html" target="_blank" class="color SZY-USER-NAME"></a>
		<!--欢迎您回来!-->
	</em>
	<a href="/userpanel?a=act&act=logout" data-method="post">退出</a>
</font>

		<ul>
			<li>
				<a class="menu-hd home" href="/" target="_top">
					<i class="iconfont color">&#xe6a3;</i>
					商城首页
				</a>
			</li>
			<li class="menu-item">
				<div class="menu">
					<a class="menu-hd myinfo" href="/userpanel.html" target="_blank">
						<i class="iconfont color">&#xe6a5;</i>
						我的商城
						<b></b>
					</a>
					<div id="menu-2" class="menu-bd">
						<span class="menu-bd-mask"></span>
						<div class="menu-bd-panel">
							<a href="/u_orders" target="_blank">已买到的宝贝</a>
							<a href="/u_address" target="_blank">我的地址管理</a>
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
	<div class="w1210 clearfix">
		<div class="logo-info">
			<a href="http://www.900nong.com" class="logo">
				
				<img src="/trade/images/site-logo.png" />
				
			</a>
		</div>
		<div class="shop-info">
			<div class="shop">
				<div class="shop-name ">
					<a href="/shop/0.html" title="三农联盟">三农联盟</a>
				</div>
				
				<p>
					<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/shop-credit/2017/10/16/15081220688024.gif" title="二钻" />
				</p>
				

			</div>
			<div class="shop-main">
				
				<div class="shop-score-box">
					<div class="shop-score-item">
						<div class="shop-score-title">描 述</div>
						<div class="score color">
							<span>5.00</span>
						</div>
					</div>
					<div class="shop-score-item">
						<div class="shop-score-title">服 务</div>
						<div class="score color">
							<span>5.00</span>
						</div>
					</div>
					<div class="shop-score-item">
						<div class="shop-score-title">发 货</div>
						<div class="score color">
							<span>5.00</span>
						</div>
					</div>
				</div>
				
			</div>
			<a class="slogo-triangle">
				<i class="icon-triangle"></i>
			</a><!--
			<div class="extra-info">
				<div class="hd">
					<p class="shop-collect">
						<a href="/shop/9.html" title="珍佰粮旗舰店" class="shop-logo">
							<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/images/2017/08/10/15023489784266.jpg">
						</a>
						<a href="javascript:void(0);" onClick="toggleShop(9,this)" class="collect-btn bg-color">收藏本店</a>
					</p>
					<p class="collect-count" style="display: none;">
						<em id="collect-count">0</em>
					</p>
					<p class="collect-tip" style="display: none;">收藏</p>
					<p class="shop-qr-code">
						<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/images/2017/08/10/15023327397739.png" alt="店铺二维码" />
					</p>
				</div>
				<div class="bd">
					
					<div class="shop-rate">
						<h4>店铺动态评分</h4>
						<ul>
							<li>
								描述相符：
								<a target="_blank" href="javascript:void(0);">
									<em class="count color" title="">5.00</em>
								</a>
							</li>
							<li>
								服务态度：
								<a target="_blank" href="javascript:void(0);">
									<em class="count color" title="">5.00</em>
								</a>
							</li>
							<li>
								发货速度：
								<a target="_blank" href="javascript:void(0);">
									<em class="count color" title="">5.00</em>
								</a>
							</li>
						</ul>
					</div>
					
					<div class="extend ">
						<h4 class="extend-title">店铺服务</h4>
						<ul>
							<li>
								<label>店铺掌柜：</label>
								<div class="extend-right">
									<a href="/shop/9.html" class="color">ZBN153MNNL6513</a>
								</div>
							</li>
							
							
							<li>
								<label>开店时长：</label>
								<div class="extend-right">
									<span class="duration-time">1年</span>
								</div>
							</li>
							
							<li class="locus">
								<label>所在地：</label>
								<div class="extend-right">
									<span>陕西省 西安市 雁塔区 太白南路181号A座工业写字楼A区三层</span>
								</div>
							</li>

							
							<li>
								<label>工商执照：</label>
								<div class="extend-right">
									
									<a id="license" href="#" target="_blank">
										<img src="/nong/images/national_emblem_light.png" width="20" height="22" border="0" alt="工商执照" />
									</a>
									
									
								</div>
							</li>
							
						</ul>
					</div>
				</div>
			</div>-->
		</div>
		<!-- 
		<div class="mobile-shop">
			<div class="mobile-qr-code">
				<span>手机逛</span>
				<i class="qr-code"></i>
			</div>
			<a href="javascript:void(0);" class="arrow">
				<i class="down-up"></i>
			</a>
			<div class="mobile-qr-code-box">
				<img width="140" height="140" src="" />
				<p>扫一扫，手机逛起来</p>
			</div>
		</div>
		 -->
		<div class="search">
			<form class="search-form" method="get" name="" id="search-form" action="/shop/9/search.html" onSubmit="">
				<!-- <input type='hidden' name='type' id="searchtype" value=""> -->
				<div class="search-info">
					<div class="search-box">
						<div class="search-box-con">
							<input class="search-box-input" name="keyword" id="keyword" tabindex="9" autocomplete="off" value="" onFocus="if( this.value=='请输入关键词'){ this.value=''; }else{ this.value=this.value; }" onBlur="if(this.value=='')this.value='请输入关键词'" type="text">
						</div>
					</div>
					<input type="button" onclick="search_all()" value="搜全站" class="button bg-color">
				</div>
				<input type="button" onclick="search_me()" value="搜本店" class="button button-spe">
			</form>
			<ul class="hot-query">
				<!-- 默认搜索词 -->
				
				<li class="first">
					<a href="/plist.asp?act=so&key=肥料" title="肥料">肥料</a>
				</li>
				
				<li >
					<a href="/plist.asp?act=so&key=农机具" title="农机具">农机具</a>
				</li>
				
				<li >
					<a href="/plist.asp?act=so&key=水果" title="水果">水果</a>
				</li>
				
				<li >
					<a href="/plist.asp?act=so&key=米面粮油" title="米面粮油">米面粮油</a>
				</li>
				
			</ul>
		</div>
	</div>
</div>
<!-- 右侧客服 _start-->
<!-- 右侧客服_end -->

<div class="layout">
	
	
	
	
	
	<div class="shop-menu" style='background-color:#00b050;'>
		<div class="shop-menu-box">
			<ul class="shop-menu-left">
				<li>
					<a href="/shop/9.html" target="">首页</a>
				</li>
				<li class="all-category">
					<a href="/shop/9_list.html" target="">
						全部分类
						<span class="arrow"></span>
					</a>
					<div class="all-category-coupon">

						<!-- 获取店铺内商品分类 -->
						
						

						
						
						<dl>
							<dt>
								<a href="/shop/9_list_0.html" target="_blank">全部商品 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
						<dl>
							<dt>
								<a href="/shop/9_list_20.html" target="_blank">特产干货 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
						<dl>
							<dt>
								<a href="/shop/9_list_22.html" target="_blank">海外进口 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
						<dl>
							<dt>
								<a href="/shop/9_list_23.html" target="_blank">生鲜果蔬 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
						<dl>
							<dt>
								<a href="/shop/9_list_24.html" target="_blank">蛋禽肉类 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
						<dl>
							<dt>
								<a href="/shop/9_list_25.html" target="_blank">休闲食品 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
						<dl>
							<dt>
								<a href="/shop/9_list_26.html" target="_blank">花卉绿植 ></a>
							</dt>
							<dd>
								<ul>
									
									
								</ul>
							</dd>
						</dl>

						
											</div>
				</li>
				<!-- 获取店铺导航 -->
			</ul>
			<ul class="shop-menu-right">
				

				
				<li class="shop-nav">
					
					<a href="/shop/9_list_22"  target="_blank">海外进口</a>
					
				</li>
				
				<li class="shop-nav">
					
					<a href="/shop/9_list_20"  target="_blank">特产干货</a>
					
				</li>
				
			</ul>
		</div>
	</div>
</div>
<script type='text/javascript'>
	function search_all() {
		document.getElementById('search-form').action = "http://xa.900nong.com/search.html";
		document.getElementById("search-form").submit();
	}
	function search_me() {
		document.getElementById('search-form').action = "/shop/9/search.html";
		document.getElementById("search-form").submit();
	}

	function toggleShop(shop_id, obj) {
		$.collect.toggleShop(shop_id, function(result) {
			if (result.code == 0) {
				$(".collect-count").html(result.collect_count);
				$(obj).parent().toggleClass("fav-shop-box-select");
				if ($(obj).html() == "收藏本店") {
					$(obj).html("取消收藏");
					$(".collect-tip").html("已收藏");
				} else {
					$(obj).html("收藏本店");
					$(".collect-tip").html("收藏");
				}
				
				if(result.show_collect_count == 1 && result.collect_count > 0){
					$(".collect-tip").show();
					$(".collect-count").show();
				}else{
					$(".collect-tip").hide();
					$(".collect-count").hide();
				}
			}
		}, true);
	}
</script>
<script type="text/javascript">
	$().ready(function() {
		$.ajax({
			url: '/shop_index_info_<%=shopid%>',
			dataType: 'json',
			success: function(result) {
				var is_collect = result.data.is_collect;
				var collect_count = result.data.collect_count;
				var duration_time = result.data.duration_time;
				if (is_collect == false) {
					$(".collect-btn").html("收藏本店");
					$(".collect-tip").html("收藏");
				} else {
					$(".collect-btn").html("取消收藏");
					$(".collect-tip").html("已收藏");
				}
				
				$('.duration-time').html(duration_time);
				$(".collect-count").html(collect_count);
				
				if(result.data.show_collect_count == 1 && collect_count > 0){
					$(".collect-tip").show();
					$(".collect-count").show();
				}else{
					$(".collect-tip").hide();
					$(".collect-count").hide();
				}
			}
		});
			
		//加入购物车
		$('body').on('click', '.add-cart', function(event) {
			var goods_id = $(this).data('goods_id');
			var image_url = $(this).data('image_url');
			var buy_enable = $(this).data("buy-enable");
			if(buy_enable){
				$.msg(buy_enable);
				return false;
			}
			$.cart.add(goods_id, 1, {
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

    <div class="layout"  style="min-height:400px;">
	<!-- 内容 -->
	
<!-- 右侧客服 _start-->
<!-- 右侧客服_end -->

<div class="condition-screen w1210">
	<div class="blank15"></div>
	<div class="content-wrap category-wrap clearfix">
		<div class="fl">
			<div class="store-category">
				<h3 class="left-title">店内分类</h3>
				<div class="left-content tree">
					<ul>
												
												
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list.html" target="_self" title="全部商品" class="tree-first">全部商品</a>
							<ul>
								
							</ul>
						</li>
						
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list_20.html" target="_self" title="特产干货" class="tree-first">特产干货</a>
							<ul>
								
							</ul>
						</li>
						
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list_22.html" target="_self" title="海外进口" class="tree-first">海外进口</a>
							<ul>
								
							</ul>
						</li>
						
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list_23.html" target="_self" title="生鲜果蔬" class="tree-first">生鲜果蔬</a>
							<ul>
								
							</ul>
						</li>
						
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list_24.html" target="_self" title="蛋禽肉类" class="tree-first">蛋禽肉类</a>
							<ul>
								
							</ul>
						</li>
						
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list_25.html" target="_self" title="休闲食品" class="tree-first">休闲食品</a>
							<ul>
								
							</ul>
						</li>
						
						<li>
							<span>
								<i class="icon-minus-sign"></i>
							</span>
							<a href="/shop/9_list_26.html" target="_self" title="花卉绿植" class="tree-first">花卉绿植</a>
							<ul>
								
							</ul>
						</li>
						
				  </ul>
				</div>
			</div>
		</div>

		<div class="main fr">
			<div class="" id="filter">
				<!--排序-->
				<form method="GET" name="listform" action="category.php">
					<div class="fore1">
						<dl class="order">
							
							<dd class="first curr">
								<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-0-0-4-0-0.html">
									综合
									
								</a>
							</dd>
							
							<dd class="">
								<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-0-1-3-0-0.html">
									销量
									
									<i class="iconfont icon-DESC"></i>
									
								</a>
							</dd>
							
							<dd class="">
								<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-0-2-3-0-0.html">
									新品
									
									<i class="iconfont icon-DESC"></i>
									
								</a>
							</dd>
							
							<dd class="">
								<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-0-3-3-0-0.html">
									评论
									
									<i class="iconfont icon-DESC"></i>
									
								</a>
							</dd>
							
							<dd class="">
								<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-0-4-3-0-0.html">
									价格
									
									<i class="iconfont icon-DESC"></i>
									
								</a>
							</dd>
							
							<dd class="">
								<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-0-5-3-0-0.html">
									人气
									
									<i class="iconfont icon-DESC"></i>
									
								</a>
							</dd>
							
						</dl>
						<div class="pagin">
							<!---->
							<a class="prev disabled">
								<span class="icon prev-disabled"></span>
							</a>
							<!---->
							<span class="text">
								<font class="color">1</font>
								/
								
								1
								
							</span>
							<!-- -->
							<a class="next disabled" href="javascript:;">
								<span class="icon next-disabled"></span>
							</a>
							
						</div>
						<div class="total">
							共
							<span class="color">14</span>
							个商品
						</div>
					</div>
					<div class="fore2">
						<div class="filter-btn">
							
							<a href="javascript:void(0);" data-go="/shop/9_list_22-0-1-0-0-0-3-0-0.html" class="filter-tag ">
								<input class="none" name="fff" onclick="" type="checkbox">
																<i class="iconfont">&#xe715;</i>
																<span class="text">包邮</span>
							</a>
							
							<a href="javascript:void(0);" data-go="/shop/9_list_22-0-0-0-1-0-3-0-0.html" class="filter-tag ">
								<input class="none" name="fff" onclick="" type="checkbox">
																<i class="iconfont">&#xe715;</i>
																<span class="text">仅显示有货</span>
							</a>
							
						</div>
					</div>
				</form>
			</div>
			
			<!--主体商品内容展示-->
			<form name="compareForm" action="compare.php" method="post" onsubmit="">
				<ul class="list-grid clearfix">
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#108.html" title="珍佰粮新西兰咖啡蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018320601174.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018320601174.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018320601174.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥156.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#108.html" target="_blank" title="珍佰粮新西兰咖啡蜂蜜250g">珍佰粮新西兰咖啡蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(108,142,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#108.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="108" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018320601174.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#109.html" title="珍佰粮新西兰生姜蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018318562520.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018318562520.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018318562520.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥158.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#109.html" target="_blank" title="珍佰粮新西兰生姜蜂蜜250g">珍佰粮新西兰生姜蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(109,143,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#109.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="109" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018318562520.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#110.html" title="珍佰粮新西兰蓝莓蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018313614731.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018313614731.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018313614731.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥156.00</em>
																		
									<em class="sale-count">已售1件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#110.html" target="_blank" title="珍佰粮新西兰蓝莓蜂蜜250g">珍佰粮新西兰蓝莓蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(110,144,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#110.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="110" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018313614731.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item last">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#111.html" title="珍佰粮新西兰金猕猴桃蜂蜜500g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018308847401.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018308847401.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018308847401.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥326.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#111.html" target="_blank" title="珍佰粮新西兰金猕猴桃蜂蜜500g">珍佰粮新西兰金猕猴桃蜂蜜500g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(111,145,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#111.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="111" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018308847401.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#112.html" title="珍佰粮新西兰苜蓿蜂蜜" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018309701470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018309701470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018309701470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥106.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#112.html" target="_blank" title="珍佰粮新西兰苜蓿蜂蜜">珍佰粮新西兰苜蓿蜂蜜</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(112,320,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#112.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="112" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018309701470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#113.html" title="珍佰粮新西兰麦卢卡蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018175517611.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018175517611.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018175517611.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥86.00</em>
																		
									<em class="sale-count">已售1件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#113.html" target="_blank" title="珍佰粮新西兰麦卢卡蜂蜜250g">珍佰粮新西兰麦卢卡蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(113,147,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#113.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="113" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018175517611.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#114.html" title="珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018168967679.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018168967679.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018168967679.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥268.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#114.html" target="_blank" title="珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g">珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(114,148,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#114.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="114" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018168967679.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item last">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#115.html" title="珍佰粮新西兰多花种蜂蜜" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017406982154.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017406982154.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017406982154.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥106.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#115.html" target="_blank" title="珍佰粮新西兰多花种蜂蜜">珍佰粮新西兰多花种蜂蜜</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(115,322,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#115.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="115" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017406982154.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#116.html" title="新西兰麦卢卡10+蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481113587.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481113587.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481113587.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥386.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#116.html" target="_blank" title="新西兰麦卢卡10+蜂蜜250g">新西兰麦卢卡10+蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(116,150,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#116.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="116" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481113587.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#117.html" title="珍佰粮新西兰圣诞树蜂蜜" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481726660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481726660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481726660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥148.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#117.html" target="_blank" title="珍佰粮新西兰圣诞树蜂蜜">珍佰粮新西兰圣诞树蜂蜜</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(117,386,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#117.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="117" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481726660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#118.html" title="珍佰粮新西兰草莓蜂蜜" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018155865755.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018155865755.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018155865755.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥156.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#118.html" target="_blank" title="珍佰粮新西兰草莓蜂蜜">珍佰粮新西兰草莓蜂蜜</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(118,329,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#118.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="118" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018155865755.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item last">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#119.html" title="珍佰粮新西兰进口肉桂蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017483291470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017483291470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017483291470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥158.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#119.html" target="_blank" title="珍佰粮新西兰进口肉桂蜂蜜250g">珍佰粮新西兰进口肉桂蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(119,153,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#119.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="119" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017483291470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#127.html" title="新西兰天然柠檬蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017488112362.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017488112362.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017488112362.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥156.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#127.html" target="_blank" title="新西兰天然柠檬蜂蜜250g">新西兰天然柠檬蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(127,161,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#127.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="127" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017488112362.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- -->
					<li class="item ">
						<div class="item-con">
							
							<!--售罄-->
							
							<div class="item-pic">
								<a href="/trade/goods-0#128.html" title="新西兰原装进口塔瓦瑞蜂蜜250g" target="_blank">
								<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017517223550.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" alt="" />
								</a>
							</div>
							<div class="img-scroll" style="display: none;">
								<a href="javascript:void(0);" class="img-prev">&lt;</a>
								<a href="javascript:void(0);" class="img-next">&gt;</a>
								<div class="img-wrap">
									<ul class="img-main" style="left: 0px;">
										
										<li class="img-item">
											<a href="javascript:;" title="">
												<img class="lazy" width="25" height="25" alt="" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017517223550.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" data-src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017517223550.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" />
											</a>
										</li>
										

									</ul>
								</div>
							</div>
							<div class="item-info">
								<div class="item-price">
									<em class="sale-price color">￥148.00</em>
																		
									<em class="sale-count">已售0件</em>
									
								</div>
								<div class="item-name">
									<!-- 注意商品名称长度，需考虑包邮、赠品标签 -->
									<a href="/trade/goods-0#128.html" target="_blank" title="新西兰原装进口塔瓦瑞蜂蜜250g">新西兰原装进口塔瓦瑞蜂蜜250g</a>
									<!-- 包邮、赠品标签  _star -->
									
									
									<!-- 包邮、赠品标签  _end -->
								</div>
								<div class="item-con-info">
									<div class="fl">
										<div class="item-operate">
											
											<a href="javascript:;" onClick="toggleGoods(128,162,this)" class="operate-btn collet-btn  ">
												<i class="iconfont">&#xe6b3;</i>
												<span> 收藏 </span>
											</a>
											
											<a href="/trade/goods-0#128.html#goods_evaluate" target="_blank" class="operate-btn comment-btn">
												<i class="iconfont">&#xe6e4;</i>
												0
											</a>
										</div>

									</div>
									<div class="fr">
										<div class="item-add-cart">
											<!--售罄时，为加入购物车按钮添加sell-out-btn样式-->
											
											
											<a href="javascript:;" data-goods-id="128" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017517223550.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80" class="add-cart" title="加入购物车"></a>
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					
				</ul>
				<!--当没有数据时，显示如下div-->
				
				<!--分页-->
				<div class="pull-right page-box">
					
					
					
<div id="pagination" class="page">
	<script data-page-json="true" type="text">
	{"page_key":"page","page_id":"pagination","default_page_size":10,"cur_page":1,"page_size":20,"page_size_list":[10,50,500,1000],"record_count":14,"page_count":1,"offset":0,"url":null,"sql":null}
</script>
	<div class="page-wrap fr">
		<div class="total">共14条记录
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
		<span class="num prev disabled"class="disabled" style="display: none;">
			<a class="fa fa-angle-double-left" data-go-page="1" title="第一页"></a>
		</span>
		
		<span >
			<a class="num prev disabled " title="上一页">上一页</a>
		</span>
		
		
		
		
		
		
		
		
		<!--   -->
		
		<span class="num curr">
			<a data-cur-page="1">1</a>
		</span>
		
		
		
		
		
		
		
		<span class="disabled" style="display: none;">
			<a class="num " class="fa fa-angle-double-right" data-go-page="1" title="最后一页"></a>
		</span>
		
		<span >
			<a class="num next disabled" title="下一页">下一页</a>
		</span>
		
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
			
		</div>
	</div>
</div>

<script src="/nong/js/category.js?v=20180813"></script>
<script src="/nong/js/jquery.tablelist.js?v=20180813"></script>
<script type="text/javascript">
	$().ready(function() {
		var page_url = "/shop/<%=shopid%>_list_<%=catid%>-{0}-0-0-0-0-3-0-0.html";
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
			var image_url = $(this).data("image-url");
			var buy_enable = $(this).data("buy-enable");
			if(buy_enable){
				$.msg(buy_enable);
				return false;
			}
			$.cart.add(goods_id, 1, {
				is_sku: false, 
				event: event,
				image_url: image_url,
				callback: function(){
					var attr_list = $('.attr-list').height(); 
					$('.attr-list').css({ 
						"overflow":"hidden" 
					});
					if(attr_list>=200){ 
						$('.attr-list').addClass("attr-list-border");
						$('.attr-list').css({ 
							"overflow-y":"auto" 
						}); 
					}       
				}
			});
			return false;
		});
		
		//规格相册
		sildeImg(0);
		
		// 跳转页面
		$("[data-go]").click(function(){
			$.go($(this).data("go"));
		});
	});
</script>

    </div>
    
	<!--底部footer-->
	
<!-- 右侧边栏 _start -->
<div class="right-sidebar-con">
	<div class="right-sidebar-main">
		<div class="right-sidebar-panel">
			<div id="quick-links" class="quick-links">
				<ul>
					<li class="quick-area quick-login sidebar-user-trigger">
						<!-- 用户 -->
						<a href="javascript:void(0);" class="quick-links-a">
	<i class="iconfont">&#xe6cc;</i>
</a>
<div class="sidebar-user quick-sidebar">
	<i class="arrow-right"></i>
	<div class="sidebar-user-info">
		<!-- 没有登录的情况 _start -->
		<div class="SZY-USER-NOT-LOGIN" style="display: none;">
			<div class="user-pic">
				<div class="user-pic-mask"></div>
				<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/system/config/default_image/default_user_portrait_0.jpg" />
			</div>
			<br />
			<p>
				你好！请
				<a href="javascript:void(0);" class="quick-login-a color ajax-login">登录</a>
				|
				<a href="http://xa.900nong.com/register.html" class="color">注册</a>
			</p>
		</div>
		<!-- 没有登录的情况 _end -->
		<!-- 有登录的情况 _start -->
		<div class="SZY-USER-ALREADY-LOGIN" style="display: none;">
			<div class="user-have-login">
				<div class="user-pic">
					<div class="user-pic-mask"></div>
					<img src="" class="SZY-USER-PIC" />
				</div>
				<div class="user-info">
					<p>
						用&nbsp;&nbsp;&nbsp;户：
						<span class="SZY-USER-NAME"></span>
					</p>
					<p class="SZY-USER-RANK" style="display: none;">
						等&nbsp;&nbsp;&nbsp;级：
						<img class="SZY-USER-RANK-IMG" />
						<span class="SZY-USER-RANK-NAME"></span>
					</p>
				</div>
			</div>
			<p class="m-t-10">
				<span class="prev-login">
					上次登录时间：
					<span class="SZY-USER-LAST-LOGIN"></span>
				</span>
				<a href="http://xa.900nong.com/user.html" class="btn account-btn" target="_blank">个人中心</a>
				<a href="http://xa.900nong.com/user/order.html" class="btn order-btn" target="_blank">订单中心</a>
			</p>
		</div>
		<!-- 有登录的情况 _end -->
	</div>
</div>
					</li>
					<li class="sidebar-tabs">
						<!-- 购物车 -->
						<div class="cart-list quick-links-a sidebar-cartbox-trigger">
							<i class="iconfont">&#xe6c5;</i>
							<div class="span">购物车</div>
							<span class="ECS_CARTINFO">
								<span class="cart_num SZY-CART-COUNT">0</span>
								<div class="sidebar-cart-box">
									<h3 class="sidebar-panel-header">
										<a href="javascript:void(0);" class="title">
											<i class="cart-icon"></i>
											<em class="title">购物车</em>
										</a>
										<span class="close-panel"></span>
									</h3>
								</div>
							</span>
						</div>
					</li>
					<li class="sidebar-tabs">
						<a href="javascript:void(0);" class="mpbtn_history quick-links-a sidebar-historybox-trigger">
							<i class="iconfont">&#xe76a;</i>
						</a>
						<div class="popup">
							<font id="mpbtn_histroy">我看过的</font>
							<i class="arrow-right"></i>
						</div>
					</li>
					<!-- 如果当前页面有对比功能 则显示对比按钮 _start-->
					<li class="sidebar-tabs">
						<a href="javascript:void(0);" class="mpbtn-contrast quick-links-a sidebar-comparebox-trigger">
							<i class="iconfont">&#xe8f8;</i>
						</a>
						<div class="popup">
							对比商品
							<i class="arrow-right"></i>
						</div>
					</li>
					<!-- 如果当前页面有对比功能 则显示对比按钮 _end-->
					<li>
						<a href="http://xa.900nong.com/user/collect/shop.html" target="_blank" class="mpbtn_stores quick-links-a">
							<i class="iconfont">&#xe6c8;</i>
						</a>
						<div class="popup">
							我收藏的店铺
							<i class="arrow-right"></i>
						</div>
					</li>
					<li id="collectGoods">
						<a href="http://xa.900nong.com/user/collect/goods.html" target="_blank" class="mpbtn_collect quick-links-a">
							<i class="iconfont">&#xe6b3;</i>
						</a>
						<div class="popup">
							我的收藏
							<i class="arrow-right"></i>
						</div>
					</li>
				</ul>
			</div>
			<div class="quick-toggle">
				<ul>
					
					<li class="quick-area">
						<a class="quick-links-a" href="javascript:void(0);">
							<i class="iconfont">&#xe6ad;</i>
						</a>
						<div class="sidebar-service quick-sidebar">
							<i class="arrow-right"></i>
							
							<div class="customer-service">
								<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2060783854&site=qq&menu=yes">
									<i class="iconfont color">&#xe6cd;</i>
									QQ
								</a>
							</div>
							
							
							
						</div>
					</li>
					
					
					<li class="quick-area">
						<a class="quick-links-a" href="javascript:void(0);">
							<i class="iconfont qr-code">&#xe6bc;</i>
						</a>
						<div class="sidebar-code quick-sidebar">
							<i class="arrow-right"></i>
							<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/system/config/mall/mall_wx_qrcode_0.png" />
						</div>
					</li>
					
					<li class="returnTop">
						<a href="javascript:void(0);" class="return_top quick-links-a">
							<i class="iconfont">&#xe6cb;</i>
						</a>
						<div class="popup">
							返回顶部
							<i class="arrow-right"></i>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="">
			<!--红包 start-->
			<!--红包 end-->
			<!--购物车 start-->
			
<div class="right-sidebar-panels sidebar-cartbox">
	<div class="sidebar-cart-box">
		<h3 class="sidebar-panel-header">
			<a href="javascript:void(0);" class="title" target="_blank">
				<i class="cart-icon"></i>
				<em class="title">购物车</em>
			</a>
			<span class="close-panel"></span>
		</h3>
		<div class="sidebar-cartbox-goods-list">
			
			<div class="cart-panel-main">
				<div class="cart-panel-content">
					
					<!-- 没有商品的展示形式 _start -->
					<div class="tip-box">
						<img src="/nong/images/noresult.png" class="tip-icon" />
						<div class="tip-text">

							您的购物车里什么都没有哦
							<br />
							<a class="color" href="http://xa.900nong.com" title="再去看看吧" target="_blank">再去看看吧</a>
						</div>
					</div>
					<!-- 没有商品的展示形式 _end-->
					
				</div>
			</div>
			
			
		</div>
	</div>
</div>
			<!--购物车 end-->
			<!--浏览历史 start-->
			<!---->
<div class="right-sidebar-panels sidebar-historybox">
	<h3 class="sidebar-panel-header">
		<a href="javascript:;" class="title">
			<i></i>
			<em class="title">我的足迹</em>
		</a>
		<span class="close-panel"></span>
	</h3>
	<div class="sidebar-panel-main">
		<div class="sidebar-panel-content sidebar-historybox-goods-list">
			<!---->
			<!---->
			<!-- 没有浏览历史的展示形式 _start -->
			<div class="tip-box">
				<img src="/nong/images/noresult.png" class="tip-icon" />
				<div class="tip-text">
					您还没有在商城留下任何足迹哦
					<br />
					<a class="color" href="./">赶快去看看吧</a>
				</div>
			</div>
			<!-- 没有浏览历史的展示形式 _end-->
			<!---->
			<!---->
		</div>
	</div>
</div>
<!---->
			<!--浏览历史 end-->
			<!--对比列表 start-->
			
<!--对比列表 start-->
<div class="right-sidebar-panels sidebar-comparebox">
	<h3 class="sidebar-panel-header">
		<a href="javascript:void(0);" class="title">
			<i class="compare-icon"></i>
			<em class="title">宝贝对比</em>
		</a>
		<span class="close-panel"></span>
	</h3>
	<div>
		<div class="sidebar-panel-main sidebar-comparebox-goods-list">
			
			<div class="sidebar-panel-content compare-panel-content">
				
				<!-- 没有对比商品的展示形式 _start -->
				<div class="tip-box">
					<img src="/nong/images/noresult.png" class="tip-icon" />
					<div class="tip-text">
						您还没有选择任何的对比商品哦 
						<br />
						<a class="color" href="./">再去看看吧</a>
					</div>
				</div>
				<!-- 没有对比商品的展示形式 _end-->
				
			</div>
		</div>
		
		
	</div>
</div>
<!--对比列表 end-->

			<!--对比列表 end-->
		</div>
	</div>
</div>
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

</body>
<script src="/nong/js/shop_index.js?v=20180813"></script>
<script src="/nong/js/jquery.fly.min.js?v=20180813"></script>
<script src="/nong/js/szy.cart.js?v=20180813"></script>
<script type="text/javascript">
$().ready(function(){
	// 缓载图片
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
</html>