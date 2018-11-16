<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><%pid=int(getnumb(request("a")))
pid=replace(pid,".html","")
if pid="" then pid=0
id=1
if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mgoods-"&pid&".html")
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
if pid<>"" then pid=int(pid)
set rs=server.createobject("adodb.recordset")
exec="select * from [product] where siteid="&siteid&" and id="&pid
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
pname=rs("name")
catid=rs("catid")
brandid=rs("brandid")
pic1=rs("pic1")
pic2=rs("pic2")
pic3=rs("pic3")
pic4=rs("pic4")
pic5=rs("pic5")
pic6=rs("pic6")
pic7=rs("pic7")
pic8=rs("pic8")
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
Descriptions=rs("Descriptions")
Keywords=rs("Keywords")
ghsid=rs("ghsid")
qpsl=rs("qpsl")
danwei=rs("danwei")
llsm=""'tounicode("包装箱内的商品之间加塞填充物，保证不破损，不串味，汁液不渗漏商品内包装材料全部使用PE（聚乙烯）保鲜膜，拒绝使用含有致癌物的PVC（聚氯乙烯）使用可插型密闭箱，运输途中全 程密闭，默认发顺丰快递，顺丰不到不发货，确保用户订购的商品新鲜到家。")
content=rs("content")
ordercount=rs("ordercount")
conn.execute "update [product] set viewnum=viewnum+1 where id="&pid
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="zh-CN" class="ie8"> <![endif]-->
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="zh-CN">
<head>
<title><%=pname%> - 中国农民自由贸易网</title>
<!-- 头部元数据 -->
<meta name="csrf-param" content="_csrf">
<meta name="csrf-token" content="6dREub1uqMOwheZdDpjGAtL8RypAzwIG05dsymjbjD2qjBCUyl6dicrVgilX65lohbk1Hg-IZ0GfpCOpX5PKdA==">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="<%=pname%>,<%=Keywords%>" />
<meta name="Description" content="<%=Descriptions%>" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="format-detection" content="telephone=no">
<!-- 网站头像 -->
<link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<!-- 网站头像 -->
<link rel="stylesheet" href="/nong/css/iconfont.css?v=20180702"/>
<link rel="stylesheet" href="/nong/css/common.css?v=20180702"/>
<!--整站改色 _start-->
<link rel="stylesheet" href="/nong/css/site-color-style-1.css?v=20180702"/>
<!--整站改色 _end-->
<script src="/nong/js/jquery.js?v=20180813"></script>
<script src="/nong/js/jquery.cookie.js?v=20180813"></script>
<script src="/nong/js/layer.js?v=20180813"></script>
<script src="/nong/js/jquery.method.js?v=20180813"></script>
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
	$(".SZY-DEFAULT-SEARCH").data("cat_id", "142");
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
<link rel="stylesheet" href="/nong/css/goods.css?v=20180702"/>
<!-- 地区选择器 -->
<script src="/nong/js/jquery.widget.js?v=20180813"></script>
<script src="/nong/js/jquery.history.js?v=20180813"></script>
<!-- 放大镜 _start -->
<script type="text/javascript" src="/nong/js/magiczoom.js"></script>
<!-- 放大镜 _end -->
<div class="w1210">
	
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

<%Function getcatzid(catid) '获得子分类ID
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

<span class="crumbs-arrow">&gt;</span>
	<span class="last"><%=pname%></span>
	
	<!-- <div class="crumbs-nav">
		<span class="crumbs-search">
						<form id="1534335985i20Zc2" class="current-search-form" method="get" action="/list">
				<input type="text" value="在当前分类下搜索" name="keyword" class="search-term" />
				<input type="button" class="search-button" />
			</form>
		</span>
	</div> 
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
	</script>-->
	
	
</div>
	<div class="goods-info">
		<!-- 商品详细信息 -->
		
		<span class="SZY-GOODS-NAME-BASE" style="display: none;"><%=pname%></span>
<!-- 商品图片以及相册 _star-->
<div id="preview" class="preview">
	<!-- 商品相册容器 -->
	<div class="goodsgallery"></div>
	<script id="SZY_SKU_IMAGES" type="text"><%if pic1<>"" then piclist="["""&replace(pic1,"/","\/")&""","""&replace(pic1,"/","\/")&""","""&replace(pic1,"/","\/")&"""]"%>
	<%if pic2<>"" then piclist=piclist&",["""&replace(pic2,"/","\/")&""","""&replace(pic2,"/","\/")&""","""&replace(pic2,"/","\/")&"""]"%>
	<%if pic3<>"" then piclist=piclist&",["""&replace(pic3,"/","\/")&""","""&replace(pic3,"/","\/")&""","""&replace(pic3,"/","\/")&"""]"%>
	<%if pic4<>"" then piclist=piclist&",["""&replace(pic4,"/","\/")&""","""&replace(pic4,"/","\/")&""","""&replace(pic4,"/","\/")&"""]"%>
	<%if pic5<>"" then piclist=piclist&",["""&replace(pic5,"/","\/")&""","""&replace(pic5,"/","\/")&""","""&replace(pic5,"/","\/")&"""]"%>
	<%if pic6<>"" then piclist=piclist&",["""&replace(pic6,"/","\/")&""","""&replace(pic6,"/","\/")&""","""&replace(pic6,"/","\/")&"""]"%>
	<%if pic7<>"" then piclist=piclist&",["""&replace(pic7,"/","\/")&""","""&replace(pic7,"/","\/")&""","""&replace(pic7,"/","\/")&"""]"%>
	<%if pic8<>"" then piclist=piclist&",["""&replace(pic8,"/","\/")&""","""&replace(pic8,"/","\/")&""","""&replace(pic8,"/","\/")&"""]"%>
			[<%=piclist%>]
			</script>
	<script type="text/javascript">
		// 图片相册
		$(".goodsgallery").goodsgallery({
			images: $.parseJSON($("#SZY_SKU_IMAGES").html()),
			video: ""
		});
	</script>
	<!--相册 END-->
	
	<div class="goods-gallery-bottom">
		<!--
		
		<a href="javascript:void(0);" class="goods-compare compare-btn fr add-compare" data-goods-id="3146" data-sku-id="4652" data-image-url="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/643/gallery/2017/12/15/15133246532419.jpg?x-oss-process=image/resize,m_pad,limit_0,h_320,w_320">
			<i class="iconfont">&#xe715;</i>
			对比
		</a>
		

		
		<a href="javascript:void(0);" class="goods-col fr collect-goods" data-goods-id="3146">
			<i class="iconfont">&#xe6b3;</i>
			<span>收藏商品</span>
		</a>-->
		
		<div class="bdsharebuttonbox fr">
			<a class="bds_more" href="#" data-cmd="more" style="background: none; color: #999; line-height: 25px; height: 25px; margin: 0px 10px; padding-left: 20px; display: block;">
				<i class="iconfont">&#xe6ac;</i>
				分享
			</a>
		</div>
	</div>
	
	<script type="text/javascript">
		window._bd_share_config = {
			"common": {
				"bdSnsKey": {},
				"bdText": "我在@中国农民自由贸易网 发现了一个非常不错的商品：" + $(".SZY-GOODS-NAME-BASE").text() + "。感觉不错，分享一下~",
				"bdMini": "2",
				"bdMiniList": false,
				"bdPic": "http://www.zgnmzymyw.com/<%=pic1%>",
				"bdStyle": "0",
				"bdSize": "16"
			},
			"share": {}
		};
		with (document) {
			0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = '//bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
		}
	</script>
</div>
<!-- 商品图片以及相册 _end-->
<!-- 商品详细信息 _star-->
<div class="detail-info">
	<form action="" method="post" name="" id="">
		

		<!-- 商品名称 -->
		<h1 class="goods-name SZY-GOODS-NAME"><%=pname%></h1>
		<!-- 限时折扣 -->
		

		<!-- 预售 -->
		

		<!-- 商品简单描述 -->
		<p class="goods-brief second-color">朋友们，所售产品价格均不包含运费哦，具体运费的咨询电话：010-86469678
</p>
		<!-- 商品团购倒计时 -->
		<!--当团购商品未开始时-->
		
		
		<div class="goods-price">
			
			<!-- 商品不同的价格 -->
			<div class="show-price">
				
				<span class="price">市场价</span>
				<em class="market-price SZY-MARKET-PRICE">￥<%=gshjg(price1)%></em>
				
			</div>
			<!-- 商品市场价 _end -->
			<!-- 销量及评价 _start -->
			<div class="goods-info-other">
				
				<div class="item sale">
					<p>累计销量</p>
					<em class="second-color"><%=ordercount%></em>
				</div>
				
				<div class="item evaluate">
					<p>用户评价</p>
					<a id="evaluate_num" href="#goods_evaluate" class="second-color">0</a>
				</div>
			</div>
			<!-- 销量及评价 _end -->

			<div class="realy-price">
				
				<div class="now-prices">
					<span class="price">售&nbsp;&nbsp;&nbsp;价</span>
					<strong class="p-price second-color SZY-GOODS-PRICE">￥<%=gshjg(price2)%></strong>
				</div>
				
				<!--
						<div class="depreciate">
							<a href="" title="">（降价通知）</a>
						</div>
						 -->
				
			</div>
			

			
			<!-- 促销 -->
			<div class="shop-prom SZY-ACTIVITY" style="display: none;">
				<div class="shop-prom-title">
					<dl>
						<dt class="dt">促&nbsp;&nbsp;&nbsp;销</dt>
						<div class="shop-prom-box">
							<!--会员价 _start-->
							
							<!-- 会员价 _end -->

							<!-- 领红包 _start -->
							
							<!-- 领红包 _end -->
							<!-- 赠品 _start -->
							
							<!--赠品 _end-->
							<!-- 满减、满折 _start -->
							
							<!-- 满减送_end -->
							<!-- 当促销方式多于2个时，此模块显示----显示的是所有活动前面的标签 _start -->
							<div class="pro-type-group">
								<span class="pro-info-down">
									展开促销
									<i class="more"></i>
								</span>
							</div>
							<!-- <dd class="pro-type-group">
								<div class="pro-item">
									<span class="pro-type">红包</span>
									<span class="pro-type">赠品</span>
									<span class="pro-type">限购</span>
									<span class="pro-type">满减</span>
									<span class="pro-type">包邮</span>
									<span class="pro-type">赠</span>
									<span class="pro-type">加价购</span>
									<span class="pro-info-down">
										展开促销
										<i class="more"></i>
									</span>
								</div>
							</dd> -->
							<!-- 当促销方式多于2个时，此模块显示 _end -->
						</div>
					</dl>
				</div>
			</div>
			
			
			
		</div>
		

		<!-- 在售的商品 _start -->
		

		

		<!-- 运费
		<div class="freight">
			<div class="dt">配送至</div>
			<div class="dd">
				<div class="post-age">
					<div class="region-chooser-container" style="z-index: 3"></div>
					<div class="post-age-info">
						<span class="freight-info"></span>
						<div class="service-tips freight-free-info" style="display: none;">
							<i class="sprite-question"></i>
							<div class="tips">
								<div class="sprite-arrow"></div>
								<div class="tips-bg"></div>
								<div class="content">
									<p></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->

		

		<!-- 服务 -->
		<div class="freight">
			<div class="dt">服&nbsp;&nbsp;&nbsp;务</div>
			<div class="dd">
				<div class="post-age">
					由
					<a href="/shop/9.html" target="_blank" class="color">三农联盟</a>
					负责发货，并提供售后服务。
				</div>
			</div>
		</div>

		<!-- 评价、销量、积分 准备删除的模块 _start -->
		<!-- <div class="info-other" style="display: none;">
					<ul class="other">
						<li>
							<p>
								累积评价
								<span>
									<a id="evaluate_num" href="#goods_evaluate" class="second-color">0人评价</a>
								</span>
							</p>
						</li>
						<li>
							<p>
								累计销量
								<span class="second-color">0</span>
							</p>
						</li>
						<li class="last">
							<p>
								赠送积分
								<span class="second-color">0</span>
							</p>
						</li>
					</ul>
				</div>-->
		<!-- 评价、销量、积分 准备删除的模块 _end -->
		
		
		<div class="choose SZY-GOODS-SPEC-ITEMS">
			<!-- 商品规格 -->
			
			<!-- 梁：如果规格下没有库存，红色提示背景给dl标签追加class值"no-stock-bg" -->
<%if colors<>"" or sizes<>"" then%><%if ubound(split(colors,"|"))>0 then%>
			<dl class="attr">
				<dt class="dt">款色</dt>
				<dd class="dd">
					<ul data-attr-id="<%=pid&"0"%>"><%for i=0 to zc Step 1
if i=0 then
sssd=" selected"
else
sssd=""
end if
Response.Write("<li class=""goods-spec-item"&sssd&""" data-spec-id="""&i&""" data-attr-id="""&pid&"0"""" data-is-default=""1"" data-points-goods=""0""><a href=""javascript:void(0);"" title="""&split(colors,"|")(i)&"""><span class=""value-label"">"&split(colors,"|")(i)&"</span></a><i></i></li>") 
Next%></ul>

			</dd>
			<input type="hidden" name="sku_ids[]" class="sku_aaaa" value="">
		</dl><%end if%><%if ubound(split(sizes,"|"))>0 then%>
			<dl class="attr">
				<dt class="dt">尺码</dt>
				<dd class="dd">
					<ul data-attr-id="<%=pid&"1"%>">
<%for i=0+zc to zs+zc Step 1
if i=0+zc then
sssd=" selected"
else
sssd=""
end if
Response.Write("<li class=""goods-spec-item"&sssd&""" data-spec-id="""&i+1&""" data-attr-id="""&pid&"1"""" data-is-default=""1"" data-points-goods=""0""><a href=""javascript:void(0);"" title="""&split(sizes,"|")(i-zc)&"""><span class=""value-label"">"&split(sizes,"|")(i-zc)&"</span></a><i></i></li>") 
Next%>
				</ul>
			</dd>
			<input type="hidden" name="sku_ids[]" class="sku_aaaa" value="">
		</dl><%end if%><%end if%>
			
			<!-- 购买数量 -->
			<dl class="amount">
				<dt class="dt">数&nbsp;&nbsp;&nbsp;量</dt>
				<dd class="dd">
					<span class="amount-widget">
						<input type="text" class="amount-input" value="1" data-sales_model="0" data-goods_id="<%=pid%>" data-sku_id="<%=pid%>" data-amount-min="1" data-amount-max="<%=kucun%>" maxlength="8" title="请输入购买量">
						<span class="amount-btn">
							<span class="amount-plus">
								<i>+</i>
							</span>
							<span class="amount-minus">
								<i>-</i>
							</span>
						</span>
						<span class="amount-unit">件</span>
					</span>
					
					<em class="stock SZY-GOODS-NUMBER">
						
						库存<%=kucun%>件
						
					</em>
					

				</dd>
			</dl>
			
			<!-- 限购提示语 -->
			
			
			
			<!-- 加入购物车按钮、手机购买 -->
			<div class="action">
				
				<div class="btn-buy">
					<a href="javascript:void(0);" class="buy-goods color ">
						<span class="buy-goods-bg bg-color"></span>
						<span class="buy-goods-border"></span>
						立即购买					</a>
				</div>
				
				<div class="btn-buy">
					<a href="javascript:void(0);" class="add-cart bg-color ">
						<i class="iconfont">&#xe6a8;</i>
						加入购物车
					</a>
				</div>
				
				<div class="btn-phone">
					<a href="javascript:void(0);" class="go-phone">
						<span>手机购买</span>
						<i class="iconfont">&#xe6bc;</i>
						<div id="phone-tan">
							<span class="arr"></span>
							<div class="m-qrcode-wrap">
								<img src="/goods_qrcode.php?data=<%=pid%>" width="100" height="100" />
							</div>
						</div>
					</a>
				</div>
				

			</div>
			
			<!-- 服务承诺 -->
			
		</div>

		<!-- 在售的商品 _end -->
		
	</form>
</div>
<script id="SZY_SKU_LIST" type="text">
<%if colors<>"" or sizes<>"" then%>
<%if colors<>"" then%><%for i=0 to zc Step 1
if skulist<>"" then dhao=","
skulist=""""&i&""":{""sku_id"":"""&i&""",""spec_ids"":"""&pid&"0"&i&""",""goods_price"":"""&price2&""",""goods_number"":"""&kucun&""",""spec_names"":"""&tounicode(split(colors,"|")(i))&"""}"&dhao&skulist
Next%><%end if%><%if sizes<>"" then%><%for i=0+zc to zs+zc Step 1
if skulist<>"" then dhao=","
skulist=""""&i+1&""":{""sku_id"":"""&i+1&""",""spec_ids"":"""&pid&"0"&i+1&""",""goods_price"":"""&price2&""",""goods_number"":"""&kucun&""",""spec_names"":"""&tounicode(split(sizes,"|")((i-zc)))&"""}"&dhao&skulist
Next%><%end if%>
<%end if%>{<%=skulist%>}
</script>
<script type="text/javascript">
	var sku_ids = [];
	var local_region_code = "61,01";
	var sku_freights = [];
	var change_sku_images = false;

	/*function getSkuId() {
		var spec_ids = [];

		$(".choose").find(".attr").each(function() {
			var spec_id = $(this).find(".selected").data("spec-id");
			spec_ids.push(spec_id);
		});

		var sku_id = $.cart.getSkuId(spec_ids, sku_ids);

		if (sku_id == null) {
			return false;
		}

		return sku_id;
	}*/

	/*function changeLocation(region_code) {
		if (region_code == undefined || region_code == null || region_code.length == 0) {
			return;
		}

		var sku_id = getSkuId();

		return $.get("/goods_change-location", {
			"sku_id": sku_id,
			"region_code": region_code
		}, function(result) {
			if (result.code == 0) {
				local_region_code = region_code;
				sku_freights[region_code] = result.data;

				if (result.data.is_last == 0) {
					return;
				}

				$(".freight-info").html(result.data.freight_info);
				$(".freight-free-info").find(".content").html("");

				if ($.isArray(result.data.free_list) && result.data.free_list.length > 0) {

					for (var i = 0; i < result.data.free_list.length; i++) {
						$(".freight-free-info").find(".content").append("<p>" + result.data.free_list[i] + "</p>");
					}

					// 显示包邮条件
					$(".freight-free-info").show();
				} else {
					// 隐藏包邮条件
					$(".freight-free-info").hide();
				}

				if ($(document).data("SZY-SKU-" + sku_id)) {
					var sku = $(document).data("SZY-SKU-" + sku_id);
					setSkuInfo(sku);
				} else {

					// 库存
					if (result.data.goods_number > 0) {
						if ("1" == 1) {
							$(".SZY-GOODS-NUMBER").html("库存" + result.data.goods_number + "件");
						} else {
							$(".SZY-GOODS-NUMBER").html("");
						}
					} else {
						$(".SZY-GOODS-NUMBER").html("库存不足");
					}
					// 购买
					if (result.data.goods_number == 0) {
						//$(".add-cart").addClass("disabled");
						//$(".buy-goods").addClass("disabled");
					} else {
						$(".buy-goods").removeClass("disabled");
						$(".add-cart").removeClass("disabled");
					}
				}
			}
		}, "json");
	}*/

	/*function getSkuInfo(sku_id, callback) {
		if ($(document).data("SZY-SKU-" + sku_id)) {
			var sku = $(document).data("SZY-SKU-" + sku_id);
			// 回调
			if ($.isFunction(callback)) {
				callback.call({}, sku);
			}
		} else {
			$.get('/goods/sku', {
				sku_id: sku_id,
				is_lib_goods: ""
			}, function(result) {
				if (result.code == 0) {
					var sku = result.data;
					$(document).data("SZY-SKU-" + sku_id, sku);
					// 回调
					if ($.isFunction(callback)) {
						callback.call({}, sku);
					}
				} else {
					$.msg(result.message, {
						time: 5000
					});
				}
			}, "json");
		}
	}*/

	// 设置SKU信息
	/*function setSkuInfo(sku) {
		var is_lib_goods = "";
		if (is_lib_goods == true) {
			return false;
		}
		
		if (sku == undefined || sku == null || sku == false) {
			//$(".add-cart").addClass("disabled");
			//$(".buy-goods").addClass("disabled");
			$(".SZY-GOODS-NUMBER").html("库存不足");
			return;
		}

		// 点击默认规格才会切换相册
		if (change_sku_images == true) {
			// 相册
			$(".goodsgallery").goodsgallery({
				images: sku.sku_images,
				video: ""
			});
			change_sku_images = false;
		}

		var goods_number = sku.goods_number;

		if (goods_number > 0) {
			if (sku_freights[local_region_code]) {
				if (sku_freights[local_region_code].limit_sale == 1) {
					// 区域限售商品
				}
			} else {
				changeLocation(local_region_code).always(function(result) {
					if (result.code == 0 && result.data.limit_sale == 1) {
						setSkuInfo(sku);
					}
				});
				return;
			}
		}

		// 商品名称
		$(".SZY-GOODS-NAME").html(sku.sku_name);
		// 售价
		$(".SZY-GOODS-PRICE").html(sku.goods_price_format);
		// 市场价
		$(".SZY-MARKET-PRICE").html(sku.market_price_format);

		if (parseFloat(sku.market_price) == 0) {
			$(".SZY-MARKET-PRICE").parents(".show-price").hide();
		} else {
			$(".SZY-MARKET-PRICE").parents(".show-price").show();
		}
		// 预售定金显示
		if (parseFloat(sku.earnest_money) > 0 && $('.SZY-EARNST-MONEY').length > 0) {
			$('.SZY-EARNST-MONEY').html(sku.earnest_money_format);
			$('.SZY-TAIL-MONEY').html(sku.tail_money_format);
		}

		// 库存
		if (goods_number > 0) {
			if ("1" == 1) {
				$(".SZY-GOODS-NUMBER").html("库存" + goods_number + "件");
			} else {
				$(".SZY-GOODS-NUMBER").html("");
			}
		} else {
			$(".SZY-GOODS-NUMBER").html("库存不足");
		}

		if (goods_number == 0) {
			//$(".add-cart").addClass("disabled");
			//$(".buy-goods").addClass("disabled");
		} else {
			$(".buy-goods").removeClass("disabled");
			$(".add-cart").removeClass("disabled");
		}

		$(".amount-input").data("amount-min", 1);
		$(".amount-input").data("amount-max", goods_number);

		if (goods_number > 0 && $(".amount-input").val() == 0) {
			$(".amount-input").val(1);
		} else if (goods_number == 0 && $(".amount-input").val() != 0) {
			$(".amount-input").val(0);
		}

		var goods_number_input = parseInt($(".amount-input").val());

		if (goods_number_input > goods_number) {
			$(".amount-input").val(goods_number);
		}

		// 判断促销模块是否显示
		var show_activity = false;

		// 

		// 会员价格
		if (sku.rank_prices != undefined && sku.rank_prices != null) {
			$(".SZY-RANK-LIST").find("p").remove();
			var html = "";
			for (var i = 0; i < sku.rank_prices.length; i++) {
				var item = sku.rank_prices[i];
				html += "<p>" + item.rank_name + ":" + item.rank_price_format + "</p>";
			}
			$(".SZY-RANK-LIST").append(html);
			$(".SZY-RANK-PRICES").show();
			// 展示促销
			show_activity = true;
		} else {
			$(".SZY-RANK-PRICES").hide();
		}

		if (sku.order_act_id) {
			show_activity = true;
		}
		if (sku.member_price_message) {
			$(".SZY-RANK-PRICES").show();
			$(".SZY-RANK-MESSAGE").html(sku.member_price_message);
			// 展示促销
			show_activity = true;
		} else {
			$(".SZY-RANK-PRICES").hide();
		}

		// 处理赠品
		if (sku.gift_list && sku.gift_list.length > 0) {

			$(".SZY-GIFT-LIST").show();
			$(".SZY-GIFT-LABEL").nextAll().remove();

			for (var i = 0; i < sku.gift_list.length; i++) {
				var gift = sku.gift_list[i];
				var template = $("#SZY_GIFT_TEMPLATE").html();
				var element = $($.parseHTML(template));
				$(element).find("img").attr("src", gift.goods_image_thumb);
				$(element).find("a").attr("href", "/" + gift.gift_sku_id + ".html");
				$(element).find("a").attr("title", "/" + gift.sku_name);
				$(element).find(".gift-number").html("×" + gift.gift_number);
				$(".SZY-GIFT-LABEL").after(element);
			}

			// 展示促销
			show_activity = true;
		} else {
			$(".SZY-GIFT-LIST").hide();
			$(".SZY-GIFT-LABEL").nextAll().remove();
		}

		if (show_activity) {
			$(".SZY-ACTIVITY").show();
		} else {
			$(".SZY-ACTIVITY").hide();
		}
	}*/

	$().ready(function() {


		//商品规格选择
		//选择规格修改样式
		$(".SZY-GOODS-SPEC-ITEMS > .attr").each(function(){
			$(this).children('dd').children('ul').children('li').each(function(){
				if($(this).hasClass('selected')){
					$(this).parent('ul').parent('dd').parent('dl').children('input').val($(this).attr('data-spec-id'))
				}
				$(this).children('a').click(function(){
					$(this).parent('li').siblings(".selected").removeClass("selected").find("i").remove();
					$(this).parent('li').addClass("selected").append("<i></i>");
					$(this).parent('li').parent('ul').parent('dd').parent('dl').children('input').val($(this).parent('li').attr('data-spec-id'));
				})
			})
		})
		// 步进器
		var goods_number_amount = $(".amount-input").amount({
			value: 1,
			min: 1,
			max: "<%=kucun%>",
			change: function(element, value) {
				var sku_id = element.data('sku_id');
				if (value == this.max) {

				}
			},
			max_callback: function() {
				$.msg("最多只能购买" + this.max + "件");
			},
			min_callback: function() {
				$.msg("商品数量必须大于" + (this.min - 1));
			}
		});

		// 添加购物车
		$(".add-cart").click(function(event) {

			var is_lib_goods = "";
			if (is_lib_goods == true) {
				return false;
			}

			if ($(this).hasClass("disabled")) {
				return false;
			}

			var image_url = $(".goodsgallery").find(".gg-handler li:first img").attr("src");
			var sku_id = [];
			$('input[class=sku_aaaa]').each(function(){
				sku_id.push($(this).val())
			})
			console.log(sku_id);

			var pid = "<%=pid%>";
			$.cart.add(sku_id, pid, $(".amount-input").val(), {
				is_sku: true,
				image_url: image_url,
				event: event,
				info_callback: function() {

				}
			});
			return false;
		});

		// 立即购买
		$(".buy-goods").click(function() {
			var act_type = "";
			var purchase = "15";
			var pre_sale = "2";
			var is_lib_goods = "";
			if (is_lib_goods == true) {
				return;
			}

			if ($(this).hasClass("disabled")) {
				return;
			}
			var sku_id = [];
			$('input[class=sku_aaaa]').each(function(){
				sku_id.push($(this).val())
			})
			console.log(sku_id);

			var pid = "<%=pid%>";
			var number = $(".amount-input").val();
			var kucunstr = $('.SZY-GOODS-NUMBER').html();
			kucunstr = kucunstr.replace(/\s+/g,"");
			kucun = parseInt(kucunstr.substring(2,5));
			if(parseInt(number)>parseInt(kucunstr)){
				throw SyntaxError();
			}

			if (act_type == purchase || act_type == pre_sale) {
				$.cart.quickBuy(sku_id,pid, number, {
					act_type: act_type
				});
			} else {
				$.cart.quickBuy(sku_id,pid, number);
			}

		});

		// 立即兑换
		$(".exchange-goods").click(function() {

			if ($(this).hasClass("disabled")) {
				var goods_number = "";
				if (goods_number == 0) {
					$.msg('库存不足');
				} else {
					$.msg('积分不足');
				}
				return;
			}
			var sku_id = getSkuId();
			var number = $(".amount-input").val();
			var data = {};
			data.exchange = true;
			$.cart.quickBuy(sku_id, number, data);
		});

		//身份验证弹框
		//        $(".buy-goods").click(function() {
		//			layer.open({
		//				type: 1,
		//                title: '身份验证',
		//                area: ['700px', '330px'],
		//				content: $('#status-verify').html()
		//			});
		//        });
	});
</script>
		
		<!-- 商品详细信息 _end-->
		<!-- 店铺信息 _star-->
		
		<div class="store-info">
	<dl class="store-logo">
		<a href="/shop/643.html" target="_blank">
			<img src="/images/nmqrlogo.png" width="" height="" />
		</a>
	</dl>
	<dl class="store-name third-store">
		
		<a href="/shop/9.html" target="_blank" class="name" title="三农联盟">三农联盟</a>
	</dl>
	
	<dl class="store-score">
		<dd>
			<!-- 通过分数判断width的宽度-->
			 			<div class="score-sum color">
				5.00
				<span>综合</span>
			</div>
			<ul class="score-part">
				<li>
					<span class="score-desc">描述相符</span>
					<span class="score-detail color">5.00</span>
				</li>
				<li>
					<span class="score-desc">服务态度</span>
					<span class="score-detail color">5.00</span>
				</li>
				<li>
					<span class="score-desc">发货速度</span>
					<span class="score-detail color">5.00</span>
				</li>
			</ul>
		</dd>
	</dl>
	<dl class="store-other">
		<dt>信 誉：</dt>
		<dd>
			
			<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/shop/shop-credit/2017/10/16/15081220606421.gif" class="rank" title="一钻" />
			
		</dd>
	</dl>
	
	
	<dl class="store-other">
		<dt>所在地：</dt>
		<dd></dd>
	</dl>
	<!-- 客服 -->
	
	
	<div class="enter-store">
		<div class="enter-store-item">
			<a class="bg-color goto-shop" href="#" target="_blank">
				<i class="iconfont">&#xe895;</i>
				进入店铺
			</a>
			<a class="bg-color shop-add collect-shop" href="javascript:void(0);">
				
				<i class="iconfont collect">&#xe6b3;</i>
				<span>收藏本店</span>
				
			</a>
		</div>
	</div>
</div>
		
		<!-- 店铺信息 _end-->

		<!--看了又看 _star-->
		<div class="goods-recommend" style="display: none">
			<div class="title">
				<h3>看了又看</h3>
				<span></span>
			</div>
			<div id="recommend-list" class="recommend-stage">
				<ul>
					<li>
						<a class="" href="javascript:;" title="" target="_blank">
							<img src="/nong/images/user_headimg.gif" alt="" width="150" height="150">
							<p class="price">￥18.00</p>
						</a>
					</li>
					<li>
						<a class="" href="javascript:;" title="" target="_blank">
							<img src="/nong/images/user_headimg.gif" alt="" width="150" height="150">
							<p class="price">￥38.00</p>
						</a>
					</li>
					<li>
						<a class="" href="javascript:;" title="" target="_blank">
							<img src="/nong/images/user_headimg.gif" alt="" width="150" height="150">
							<p class="price">￥38.00</p>
						</a>
					</li>
					<li>
						<a class="" href="javascript:;" title="" target="_blank">
							<img src="/nong/images/user_headimg.gif" alt="" width="150" height="150">
							<p class="price">￥18.00</p>
						</a>
					</li>
					<li>
						<a class="" href="javascript:;" title="" target="_blank">
							<img src="/nong/images/user_headimg.gif" alt="" width="150" height="150">
							<p class="price">￥58.00</p>
						</a>
					</li>
					<li>
						<a class="" href="javascript:;" title="" target="_blank">
							<img src="/nong/images/user_headimg.gif" alt="" width="150" height="150">
							<p class="price">￥58.00</p>
						</a>
					</li>
				</ul>
			</div>
			<div class="recommend-btn">
				<a class="prev" href="javascript:;"></a>
				<a class="next" href="javascript:;"></a>
			</div>
		</div>

		<!--看了又看 _end-->
	</div>

	<!-- 搭配套餐 -->
	
	<!-- 内容 -->
	<div class="clearfix">
		<!-- 左半部分内容 -->
		<div class="fl">
			<!-- 客服组 -->
			
			<!-- 店内分类 -->
			<!-- -->
			<!-- 排行榜 -->
			
			<div class="store-rank-list">
				<h3 class="left-title">店内排行榜</h3>
				<div class="left-content rank-list">
					<ul class="tab-nav j-tab-nav">
						<li class="current">销售量</li>
						<li>收藏数</li>
					</ul>
					<div class="tab-con">
						<div class="j-tab-con">
							<ul class="goods-list" style="display: block">
<!--
								<li class="goods-item first">
									<div class="picture">
										<a href="/4635.html" title="拜耳艾美乐吡虫啉5g">
											<img src="http://zhenbainong.oss-cn-beijing.aliyuncs.com/images/backend/gallery/2017/10/25/15089138899281.jpg?x-oss-process=image/resize,m_pad,limit_0,h_80,w_80">
										</a>
									</div>
									<div class="price">
										<a href="/4635.html" title="拜耳艾美乐吡虫啉5g">拜耳艾美乐吡虫啉5g</a>
										<span class="color">￥5.00</span>
									</div>
								</li>-->

							</ul>
							<ul class="goods-list">
								
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 您浏览过 -->
			
		</div>
		<!-- 右半部分内容 -->
		<div class="right right-con ">
			<div class="wrapper">
				<div id="main-nav-holder" class="goods-detail">
					<ul id="nav" class="tab">
						<!--<li class="title-list current">
							<a href="javascript:;">规格参数</a>
						</li>-->
						<li class="title-list">
							<a href="javascript:;">商品详情</a>
						</li>
						
						<li class="title-list">
							<a id="evaluate_count" href="javascript:;">累计评价(0)</a>
						</li>
						
						
					</ul>
					<div class="right-side">
						<!-- 失效不展示 -->

						

						
						<a href="javascript:void(0);" class="right-addcart add-cart " id="right-addcart">
							<i class="iconfont">&#xe6a8;</i>
							加入购物车
						</a>
						
						
						<div class="right-side-con">
							<ul class="right-side-ul">
								<!--<li class="abs-active">
									<i></i>
									<span>规格参数</span>
								</li>-->
								<li>
									<i></i>
									<span>商品详情</span>
								</li>
								
								<li>
									<i></i>
									<span>商品评价</span>
								</li>
								
								
								
								
							</ul>
						</div>
					</div>
				</div>
				<div id="main_widget_1">
					<!-- 规格参数 _star 
					<div id="goods_attr_list" class="goods-detail-con goods-detail-tabs">
						<ul class="goods-spec">
							<li>
								商品名称：
								<span id="goods_attr_goods_name" title="<%=pname%>" class="goods-attr-value"><%=pname%></span>
							</li>
							<li>
								商品编号：
								<span id="goods_attr_goods_id" title="3146" class="goods-attr-value">3146</span>
							</li>
							<li>
								店铺：
								<span id="goods_attr_shop_name" title="三农联盟" class="goods-attr-value">三农联盟</span>
							</li>
							
							<li>
								商品品牌：
								<span id="goods_attr_brand_name" title="Bayer/拜耳" class="goods-attr-value">Bayer/拜耳</span>
							</li>
							

							<!-- 商品规格 ->
							
							<li>
								规格：
								<span title="规格" class="goods-attr-value">
									
									100ml/瓶&nbsp;
									
								</span>
							</li>
							

							
							
							<li>
								绿色生资编码：
								<span id="goods_attr_" title="LSSZ-02-1612110065" class="goods-attr-value">LSSZ-02-1612110065</span>
							</li>
							
							<li>
								农药登记证号：
								<span id="goods_attr_" title="LS20140298" class="goods-attr-value">LS20140298</span>
							</li>
							
							<li>
								农药生产许可证（或生产批准文件）号：
								<span id="goods_attr_" title="HNP 33121-D5211" class="goods-attr-value">HNP 33121-D5211</span>
							</li>
							
							<li>
								产品标准证号：
								<span id="goods_attr_" title="Q/HZ-JV 066-2014" class="goods-attr-value">Q/HZ-JV 066-2014</span>
							</li>
							
							<li>
								净含量：
								<span id="goods_attr_" title="100ml" class="goods-attr-value">100ml</span>
							</li>
							
							<li>
								生产企业：
								<span id="goods_attr_" title="拜耳作物科学（中国）有限公司" class="goods-attr-value">拜耳作物科学（中国）有限公司</span>
							</li>
							
							<li>
								毒性：
								<span id="goods_attr_" title="低毒" class="goods-attr-value">低毒</span>
							</li>
							
							
						</ul>
					</div>
					<!-- 规格参数 _end -->
					<!-- 商品详情 _star -->
					<div id="goods_introduce" class="goods-detail-con goods-detail-tabs">
						<!-- 店铺红包 -->
						
						<!-- 推荐商品 -->
						
						<!-- 商品后台上传的商品描述 -->
						<div class="detail-content goods-detail-content">
							<div class="ajax-loading">
								<img src="/images/loading.gif" />
							</div>
							

							
						</div>
					</div>
					<!-- 商品详情 end -->

					<!-- 商品评价 start -->
					<div id="goods_evaluate" class="goods-detail-con goods-detail-tabs"></div>
					<!-- 商品评价 end -->

					<!-- 服务 start -->
					
					<!-- 服务 end -->

				</div>
			</div>
		</div>
	</div>
</div>
<div id="content" style="display: none;">
	<p class="common-right">
		一般情况下，退货处理周期（不包含检测时间）：自接收到问题商品之日起 7 日之内为您处理完成，各支付方式退款时间请点击查阅退款多久可以到账；
		</br>
		换货处理周期：自接收到问题商品之日起 15 日之内为您处理完成；
		</br>
		正常维修处理周期：自接收到问题商品之日起 30 日内为您处理完成。
	</p>
</div>
<!-- 头部右侧鼠标经过图片放大效果 _start -->
<script type="text/javascript" src="/nong/js/bubbleup.js"></script>
<!-- 头部右侧鼠标经过图片放大效果 _end -->
<!-- 套餐、店内排行等左右切换效果 _start-->
<script type="text/javascript" src="/nong/js/tabs.js"></script>
<!-- 套餐、店内排行等左右切换效果 _end -->
<!-- 右侧商品信息等定位切换效果 _start -->
<script type="text/javascript" src="/nong/js/tabs_totop.js"></script>
<!-- 右侧商品信息等定位切换效果 _end -->
<!-- 控制图片经过放大 -->
<script type="text/javascript" src="/nong/js/goods.js"></script>
<!-- 地址选择 _start -->
<script type="text/javascript" src="/nong/js/select_region.js"></script>
<!-- 地址选择 _end -->
<script id="SZY_GIFT_TEMPLATE" type="text">
<div class="prom-gift-list">
	<a href="" title="" target="_blank">
		<img src="" width="25" height="25" class="gift-img" />
	</a>
	<em class="gift-number color">×</em>
</div>
</script>

<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=4f58d0ea45873e3f2a29759da1cd0165&&plugin=AMap.Geocoder,AMap.Geolocation,AMap.Autocomplete"></script>
<!-- 获取当前地址 -->
<script type="text/javascript">
	var deferred = $.Deferred();
	
	var local_region_code = "61,01";

	$().ready(function() {


		
		//在线客服
		/* 	$(".service-online").click(function() {
				var goods_id = 3146;
				$.openim({
					goods_id:goods_id
				});
			}) */


		// 添加对比
		$(".add-compare").click(function(event) {
			var target = $(this);
			var goods_id = $(this).data("goods-id");
			var sku_id = $(this).add("sku-id");
			var image_url = $(this).data("image-url");
			$.compare.toggle(goods_id, image_url, event, function(result) {
				if (result.data == 1) {
					$(target).addClass("curr");
					$(target).find('i').html('&#xe6ae;');
				} else {
					$(target).removeClass("curr");
					$(target).find('i').html('&#xe715;');
				}
			});
		});

		// 添加收藏
		$(".collect-goods").click(function(event) {
			var target = $(this);
			var goods_id = $(this).data("goods-id");
			
			var sku_id = getSkuId();
			
			$.collect.toggleGoods(goods_id, sku_id, function(result) {
				if (result.code != 0) {
					return;
				}
				
				var desc = "";
				
				// 
				if(result.collect_count > 0){
					desc = "(" + result.collect_count + "人气)";
				}
				// 
				if (result.data == 1) {
					$(target).addClass("curr");
					$(target).find('i').html('&#xe6b1;');
					$(target).find("span").html("取消收藏" + desc);
				} else {
					$(target).removeClass("curr");
					$(target).find('i').html('&#xe6b3;');
					$(target).find("span").html("收藏商品" + desc);
				}
			}, true);
		});
		// 添加收藏
		$(".collect-shop").click(function(event) {
			var target = $(this);
			var shop_id = "643";
			$.collect.toggleShop(shop_id, function(result) {
				if (result.data == 1) {
					$(target).find("span").html("取消收藏");
					$(target).find('i').html('&#xe6b1;');
				} else {
					$(target).find("span").html("收藏本店");
					$(target).find('i').html('&#xe6b3;');
				}
			});
		});

		// 领取红包
		$("body").on("click", ".bonus-receive", function() {
			var bonus_id = $(this).data("bonus-id");
			var target = $(this);
			$.bonus.receive(bonus_id, function(result) {
				if (result.code == 0) {
					// 0-已领取 1-还可以继续领取
					if (result.data == 0) {
						$(target).html("已领取").removeClass("color").removeClass("bonus-receive").addClass("bonus-received");
					}
					$.msg(result.message);
					return;
				} else if (result.code == 130) {
					$(target).html("已领取").removeClass("color").removeClass("bonus-receive").addClass("bonus-received");
				} else if (result.code == 131) {
					$(target).html("已抢光").removeClass("color").removeClass("bonus-receive").addClass("bonus-received");
				} else {

				}
				$.msg(result.message, {
					time: 5000
				});
			});
		});
	});
</script>
<script type="text/javascript">
	//固定滚动条位置
	$.fixedScorll.read("SZY_GOODS_SCORLL");

	$().ready(function() {

		// 导入
		$("body").on("click", ".no-auth", function() {
			// 商品ID
			var id = $(this).data("goods_id");
			$.open({
				title: "申请代理	",
				//type:2,
				ajax: {
					url: '/compare/agent',
					data: {
						goods_id: id
					//	single: single
					}
				},
				width: "900px",
				btn: ['确定', '取消'],
				yes: function(index, container) {
					if (!validator.form()) {
						return;
					}

					var data = $(container).serializeJson();
					$.loading.start();
					$.post('/compare/agent', data, function(result) {
						$.loading.stop();
						if (result.code == 0) {
							//tablelist.load();
							$.msg(result.message);
							$.closeDialog(index);
						} else {
							$.msg(result.message, {
								time: 5000
							})
						}
					}, "json");
				}
			});
		});

		var desc_container = $(".goods-detail-content");
		var evaluate_container = $("#goods_evaluate");

		function load() {

			// 加载商品详情
			if (!$("body").data("loading-goods-desc")) {
				// 计算高度
				if ($(document).scrollTop() >= $(desc_container).offset().top - $(window).height()) {
					$("body").data("loading-goods-desc", true);
					$.get("/pgoods-desc", {
						sku_id: "4652",
						pid: "<%=pid%>",
						is_lib_goods: ""
					}, function(result) {
						$(desc_container).html(result.pc_desc);
					}, "json");
				}
			}
			// 评论
			if (!$("body").data("loading-goods-comment")) {
				// 计算高度
				if ($(document).scrollTop() >= $(evaluate_container).offset().top - $(window).height()) {
					$("body").data("loading-goods-comment", true);
					$.get('/pgoods-comment', {
						sku_id: "4652",
						pid: "<%=pid%>",
						output: 1
					}, function(result) {
						if (result.code == 0) {
							$(evaluate_container).html(result.data);
						}
					}, "json");
				}
			}
		}

		load();

		// 加载商品详情和评论
		$(window).scroll(function() {
			load();
		});
	});
	//计算阶梯价格
	function getFinalPrice(sku_id, number) {
		var data = {
			sku_id: sku_id,
			number: number
		};
		$.get('/goods/get-final-price.html', data, function(result) {

			$('.SZY-GOODS-PRICE').html(result.data.goods_price_format);

		}, 'json');
	}
</script>

<!-- 预售倒计时 -->
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