<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%shopid=request("shopid")
shopid=int(getnumb(shopid))
key=request("key")
if request("skey")="yes" then
key=Session("key")
else
Session("key")=key
end if
search=request("search")
%><%if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mshop/"&shopid&".html")
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
			<a href="http://www.zgnmzymyw.com" class="logo">
				
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
			</a>
			<!--<div class="extra-info">
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
		document.getElementById('search-form').action = "http://www.zgnmzymyw.com/search.html";
		document.getElementById("search-form").submit();
	}
	function search_me() {
		document.getElementById('search-form').action = "/shop/<%=shopid%>/search.html";
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
	<!--模块内容-->
<!-- #tpl_region_start -->
	<!--  店铺首页轮播广告模板  -->
	<!-- banner高度 -->
	
	
	
	
	
	<!-- banner模块 _start -->
	<div class="banner"  style='height: 400px;'>
		
		
		<ul id="fullScreenSlides" class="full-screen-slides"  style='height: 400px;'>
		
		 <li  style="display:list-item;" > 
            <a href="javascript:void(0)" target="_blank" title="" style="background:url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/25/15036360202868.jpg) no-repeat center center; background-size: auto 100%; height:400px;"></a>
          </li>
			
		</ul>

		<ul class="full-screen-slides-pagination">
		
			<li class="current">
				<a href="javascript:void(0);">0</a>
			</li>
			
		</ul>
		
	</div>
	<!-- banner模块 _end -->

	


	<!-- 默认缓载图片 -->
<!--  店铺首页楼层模板  -->
<!-- 判断url链接 -->
	<!-- 楼层 _start -->
	<div class="w1210">
		<div class="shop-floor shop-floor2 clearfix">
			
			<h2>
				
				
			</h2>
			<div class="shop-floor-ad">
				
				
			</div>
			<div class="shop-floor-goods">
				
				
				<div class="shop-goods shop-goods-spe">
					<a target="_blank" href="/trade/goods-0#104.html" title="珍佰粮 东北大米  3号香米 真空盒装" class="goods-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
						<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/02/15016581397660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/" alt="珍佰粮 东北大米  3号香米 真空盒装">
					</a>
					<div class="shop-goods-name">
						<p class="goods-name">
							<a target="_blank" href="/trade/goods-0#104.html" title="珍佰粮 东北大米  3号香米 真空盒装">珍佰粮 东北大米  3号香米 真空盒装</a>
						</p>
						<p class="goods-price color">￥79.00</p>
					</div>
				</div>
				
				<div class="shop-goods ">
					<a target="_blank" href="/trade/goods-0#100.html" title="珍佰粮 东北大米 东北稻花香大米 2.5kg 长粒香米" class="goods-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
						<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017394547486.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/" alt="珍佰粮 东北大米 东北稻花香大米 2.5kg 长粒香米">
					</a>
					<div class="shop-goods-name">
						<p class="goods-name">
							<a target="_blank" href="/trade/goods-0#100.html" title="珍佰粮 东北大米 东北稻花香大米 2.5kg 长粒香米">珍佰粮 东北大米 东北稻花香大米 2.5kg 长粒香米</a>
						</p>
						<p class="goods-price color">￥108.00</p>
					</div>
				</div>
				
				<div class="shop-goods ">
					<a target="_blank" href="/trade/goods-0#98.html" title="珍佰粮 东北大米5kg 长粒香大米" class="goods-img" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
						<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/02/15016598083309.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/" alt="珍佰粮 东北大米5kg 长粒香大米">
					</a>
					<div class="shop-goods-name">
						<p class="goods-name">
							<a target="_blank" href="/trade/goods-0#98.html" title="珍佰粮 东北大米5kg 长粒香大米">珍佰粮 东北大米5kg 长粒香大米</a>
						</p>
						<p class="goods-price color">￥98.00</p>
					</div>
				</div>
				
				
				
				
			</div>
		</div>
	</div>
	<!-- 楼层 _end -->
	


	<!-- 默认缓载图片 -->
<!--  店铺首页楼层模板  -->
<!-- 判断url链接 -->
	<!-- 楼层 _start -->
	<div class="w1210 shop-floor">
		
		
		
		
		<h2 class="shop-floor-title">
			
			<em style="background:#00b050;">&nbsp;</em>
			<a href="/shop/9_list_22" target="_blank" class="shop-floor-name" style="color:#00b050;">海外进口</a>
			<em style="background:#00b050;">&nbsp;</em>
			<a href="/shop/9_list_22" target="_blank" class="floor-more" style="color:#00b050;">更多 &gt;</a>
		</h2>
		

		
		
		<div class="shop-goods-list">
			
			<ul>
				
				<li class="first">
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#128.html" title="新西兰原装进口塔瓦瑞蜂蜜250g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017517223550.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017517223550.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="新西兰原装进口塔瓦瑞蜂蜜250g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#128.html" title="新西兰原装进口塔瓦瑞蜂蜜250g" class="goods-name">新西兰原装进口塔瓦瑞蜂蜜250g</a>
							<p>
								<span class="goods-price color fl">￥148.00</span>
								<a target="_blank" href="/trade/goods-0#128.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#127.html" title="新西兰天然柠檬蜂蜜250g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017488112362.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017488112362.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="新西兰天然柠檬蜂蜜250g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#127.html" title="新西兰天然柠檬蜂蜜250g" class="goods-name">新西兰天然柠檬蜂蜜250g</a>
							<p>
								<span class="goods-price color fl">￥156.00</span>
								<a target="_blank" href="/trade/goods-0#127.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#119.html" title="珍佰粮新西兰进口肉桂蜂蜜250g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017483291470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017483291470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰进口肉桂蜂蜜250g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#119.html" title="珍佰粮新西兰进口肉桂蜂蜜250g" class="goods-name">珍佰粮新西兰进口肉桂蜂蜜250g</a>
							<p>
								<span class="goods-price color fl">￥158.00</span>
								<a target="_blank" href="/trade/goods-0#119.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#118.html" title="珍佰粮新西兰草莓蜂蜜" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018155865755.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018155865755.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰草莓蜂蜜" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#118.html" title="珍佰粮新西兰草莓蜂蜜" class="goods-name">珍佰粮新西兰草莓蜂蜜</a>
							<p>
								<span class="goods-price color fl">￥156.00</span>
								<a target="_blank" href="/trade/goods-0#118.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#117.html" title="珍佰粮新西兰圣诞树蜂蜜" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481726660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481726660.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰圣诞树蜂蜜" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#117.html" title="珍佰粮新西兰圣诞树蜂蜜" class="goods-name">珍佰粮新西兰圣诞树蜂蜜</a>
							<p>
								<span class="goods-price color fl">￥148.00</span>
								<a target="_blank" href="/trade/goods-0#117.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li class="first">
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#116.html" title="新西兰麦卢卡10+蜂蜜250g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481113587.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017481113587.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="新西兰麦卢卡10+蜂蜜250g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#116.html" title="新西兰麦卢卡10+蜂蜜250g" class="goods-name">新西兰麦卢卡10+蜂蜜250g</a>
							<p>
								<span class="goods-price color fl">￥386.00</span>
								<a target="_blank" href="/trade/goods-0#116.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#115.html" title="珍佰粮新西兰多花种蜂蜜" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017406982154.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017406982154.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰多花种蜂蜜" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#115.html" title="珍佰粮新西兰多花种蜂蜜" class="goods-name">珍佰粮新西兰多花种蜂蜜</a>
							<p>
								<span class="goods-price color fl">￥106.00</span>
								<a target="_blank" href="/trade/goods-0#115.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#114.html" title="珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018168967679.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018168967679.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#114.html" title="珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g" class="goods-name">珍佰粮新西兰瑞瓦瑞瓦蜂蜜500g</a>
							<p>
								<span class="goods-price color fl">￥268.00</span>
								<a target="_blank" href="/trade/goods-0#114.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#113.html" title="珍佰粮新西兰麦卢卡蜂蜜250g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018175517611.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018175517611.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰麦卢卡蜂蜜250g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#113.html" title="珍佰粮新西兰麦卢卡蜂蜜250g" class="goods-name">珍佰粮新西兰麦卢卡蜂蜜250g</a>
							<p>
								<span class="goods-price color fl">￥86.00</span>
								<a target="_blank" href="/trade/goods-0#113.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#112.html" title="珍佰粮新西兰苜蓿蜂蜜" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018309701470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018309701470.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮新西兰苜蓿蜂蜜" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#112.html" title="珍佰粮新西兰苜蓿蜂蜜" class="goods-name">珍佰粮新西兰苜蓿蜂蜜</a>
							<p>
								<span class="goods-price color fl">￥106.00</span>
								<a target="_blank" href="/trade/goods-0#112.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				
			</ul>
		</div>
		
		
	</div>
	<!-- 楼层 _end -->
	

	<!-- 默认缓载图片 -->
<!--  店铺首页楼层模板  -->
<!-- 判断url链接 -->
	<!-- 楼层 _start -->
	<div class="w1210 shop-floor">
		
		
		
		
		<h2 class="shop-floor-title">
			
			<em style="background:#00b050;">&nbsp;</em>
			<a href="/shop/9_list_20" target="_blank" class="shop-floor-name" style="color:#00b050;">特产干货</a>
			<em style="background:#00b050;">&nbsp;</em>
			<a href="/shop/9_list_20" target="_blank" class="floor-more" style="color:#00b050;">更多 &gt;</a>
		</h2>
		

		
		
		<div class="shop-goods-list">
			
			<ul>
				
				<li class="first">
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#124.html" title="珍佰粮_新疆和田红枣500g 高品质大枣子 零食红枣" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018105029243.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/04/15018105029243.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮_新疆和田红枣500g 高品质大枣子 零食红枣" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#124.html" title="珍佰粮_新疆和田红枣500g 高品质大枣子 零食红枣" class="goods-name">珍佰粮_新疆和田红枣500g 高品质大枣子 零食红枣</a>
							<p>
								<span class="goods-price color fl">￥16.90</span>
								<a target="_blank" href="/trade/goods-0#124.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#123.html" title="【珍佰粮】花菇280g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017486307518.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017486307518.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="【珍佰粮】花菇280g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#123.html" title="【珍佰粮】花菇280g" class="goods-name">【珍佰粮】花菇280g</a>
							<p>
								<span class="goods-price color fl">￥65.00</span>
								<a target="_blank" href="/trade/goods-0#123.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#122.html" title="珍佰粮松茸68g   野生“菌中之王”      " style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017484984167.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/03/15017484984167.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮松茸68g   野生“菌中之王”      " />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#122.html" title="珍佰粮松茸68g   野生“菌中之王”      " class="goods-name">珍佰粮松茸68g   野生“菌中之王”      </a>
							<p>
								<span class="goods-price color fl">￥268.00</span>
								<a target="_blank" href="/trade/goods-0#122.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#120.html" title="珍佰粮 新疆红枣 大枣 和田骏枣500g" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/02/15016594023966.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/02/15016594023966.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮 新疆红枣 大枣 和田骏枣500g" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#120.html" title="珍佰粮 新疆红枣 大枣 和田骏枣500g" class="goods-name">珍佰粮 新疆红枣 大枣 和田骏枣500g</a>
							<p>
								<span class="goods-price color fl">￥45.00</span>
								<a target="_blank" href="/trade/goods-0#120.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				<li >
					<dl>
						<dt class="goods-thumb">
							<a target="_blank" href="/trade/goods-0#107.html" title="珍佰粮农家绿豆 500g 盒装 新鲜绿豆五谷杂粮精选农家绿豆" style="background: url(http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/) no-repeat center center">
								<img class="lazy" src="/nong/images/blank.png" data-original="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/02/15016596779750.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320" data-original-webp="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/9/gallery/2017/08/02/15016596779750.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320/format,webp" alt="珍佰粮农家绿豆 500g 盒装 新鲜绿豆五谷杂粮精选农家绿豆" />
							</a>
						</dt>
						<dd class="goods-info">
							<a target="_blank" href="/trade/goods-0#107.html" title="珍佰粮农家绿豆 500g 盒装 新鲜绿豆五谷杂粮精选农家绿豆" class="goods-name">珍佰粮农家绿豆 500g 盒装 新鲜绿豆五谷杂粮精选农家绿豆</a>
							<p>
								<span class="goods-price color fl">￥25.00</span>
								<a target="_blank" href="/trade/goods-0#107.html" title="立即抢购" class="shop-add-cart fr">立即抢购</a>
							</p>
						</dd>
					</dl>
				</li>
				
				
			</ul>
		</div>
		
		
	</div>
	<!-- 楼层 _end -->
	

	<!-- #tpl_region_end -->







    </div>
    
	<!--底部footer-->
	
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