<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><!--#include file="md5.asp"--><%mobile=trim(Request("login_id"))
password=trim(Request("login_pw"))
login_Submit=trim(Request("login_Submit"))
errn=Session("errn")
errn=1
if errn="" or isnull(errn) then errn=0
if login_Submit="登录" and mobile<>"" and password<>"" and errn<6 then
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [member] where telephone='"&mobile&"' and password='"&md5(password)&"'"
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then
Session("uid")=chkrs("id")
Session("telephone")=chkrs("telephone")
Session("userno")=chkrs("userno")
Response.Cookies("nmw").Expires=DateAdd("m",60,now()) 
Response.Cookies("nmw")("token")=base64Encode(chkrs("id")&"&"&chkrs("userno")&"&"&chkrs("telephone")&"&"&siteid)
Session("errn")=0
Response.Redirect("/userpanel")
else
Session("errn")=errn+1
Response.Redirect("/login?e=err&a=err&c="&errn+1)
end if
chkrs.close
set chkrs=nothing
end if
if instr(request.servervariables("http_user_agent"),"Mobile")>0 then
response.redirect("/mlogin")
response.end
end if
%>
<!DOCTYPE html><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta name="format-detection" content="telephone=no" /><title>会员注册-农贸官网</title><meta name="keywords" content="<%=txtTitle%>"><meta name="description" content=""><link type="text/css" rel="stylesheet" href="/css/layout.css"><meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9;IE=8;"><link type="text/css" rel="stylesheet" href="/css/login.css"></head>

<body><div class="header-c"><div class="header"><div class="l-r-container"><div class="m-re-lo not-login"><a href="http://www.zgnmzymyw.com/login" class="m-login">登录</a><span>/</span><a href="http://www.zgnmzymyw.com/reg" class="m-register">注册</a></div><div class="m-re-lo has-login"><a href="/logout" class="mn-logout">退出</a><a href="/personal/profile" class="mn-personal">个人中心</a><a href="/personal/profile" class="mn-phone-nuber">13522902423</a></div><a href="/join" class="ask-join">申请入驻</a><a href="#" class="m-stage-login">人员查询</a></div><div class="clear"></div></div></div><div class="top main-top"><a href="/"><img src="/images/logo.jpg" class="logo hide"><img src="/images/logo.png" class="logo"></a><div class="menu"><a href="/" class="nav-home">总站</a><a href="/CN/trade" class="nav-quality">自由贸易</a><a href="#" class="nav-demand">三农银行</a><a href="/list_aboutus" class="nav-aboutus">关于我们</a><!--<a href="#" class="nav-hezuo">战略合作</a>--></div><div class="clear"></div></div>
<div class="content-body"><div class="top-menu-c"><div class="top-menu-container"><div class="top-c-m-c"><a href="/" class="top-menu-item">官网首页</a><a href="/list_news" class="top-menu-item" channel="news">新农资讯</a><a href="/list_help" class="top-menu-item" channel="help">精准扶贫</a><a href="/list_eagr" class="top-menu-item" channel="eagr">生态农业</a><a href="/list_food" class="top-menu-item" channel="food">食品安全</a><a href="/list_law" class="top-menu-item" channel="law">政策法规</a><a href="/list_prore" class="top-menu-item" channel="prore">产品推荐</a><a href="/list_afair" class="top-menu-item" channel="afair">农贸展会</a><a href="/list_proco" class="top-menu-item" channel="proco">专业合作社</a>
<div class="clear"></div></div></div></div></div>

<div class="container"><div class="content-body"><div class="login-container"><div class="l-left"><h2>会员登录</h2><img src="/images/login-img.jpg"></div><div class="l-right"><a href="http://www.zgnmzymyw.com/reg" class="btn-register">注册账号</a><div class="l-nav"><span target="common-lc" class="active">普通登录方式</span><!--<span target="mobile-lc">手机动态码登录</span>--><div class="clear"></div></div><div class="login-form-c"><div class="common-lc login-form"><div class="k-item"><div class="k-label">手机号</div><input class="k-input common-phone-number"><span class="en-form-error require-common-phone-number">请输入手机号</span><span class="en-form-error error-common-phone-number">请输入正确的手机号</span><div class="clear"></div></div><div class="k-item"><div class="k-label">密码</div><input type="password" class="k-input password"><span class="en-form-error require-password">请输入密码</span><div class="clear"></div></div><div class="k-item"><div class="k-label">图片验证码</div><input class="img-code k-input common-img-code"><span class="en-form-error error-img-code">图片验证码不正确</span><img class="k-img-code"><div class="clear"></div></div><div class="k-item"><div class="k-button btn-login btn-pwd-login">确认登录</div><a href="/forget_password" class="forget-pwd">忘记密码</a><span class="en-form-error error-submit">。。。</span><div class="clear"></div></div></div><div class="mobile-lc login-form"><div class="k-item"><div class="k-label">手机号</div><input class="k-input mobile-phone-number"><span class="en-form-error require-mobile-phone-number">请输入手机号</span><span class="en-form-error error-mobile-phone-number">请输入正确的手机号</span><div class="clear"></div></div><div class="k-item"><div class="k-label">图片验证码</div><input class="img-code k-input mobile-img-code"><img class="k-img-code"><span class="en-form-error error-img-code">图片验证码不正确</span><div class="clear"></div></div><div class="k-item"><div class="k-label">手机验证码</div><input class="phone-code k-input phone-code"><div class="k-button btn-get-code">获取验证码</div><span class="en-form-error require-phone-code">请输入手机验证码</span><div class="clear"></div></div><div class="k-item"><div class="k-button btn-login btn-code-login">确认登录</div><span class="en-form-error error-submit">。。。</span><div class="clear"></div></div></div></div></div><div class="clear"></div></div></div><div class="footer-container"><div class="footer-c"><div class="f-content">
<div class="f-wechat"><img src="/images/ewm.png"> 　 　<img src="/images/wechat.png">
  <div>官网　　　　　　　　公众号</div><div style="padding-top:6px">中国农民自由贸易网</div><div class="f-gzh">新农年鉴 • 农贸网</div></div>
<div class="contact-info"><div class="phone" style="color:#FFF">010-86469678</div><div class="address">主管单位：
</div><div class="address">　　　国资委商业饮食服务业发展中心</div><div class="tel-c"><span class="tel-title">　　　国资委中华传统饮食与健康服务业推广管理委员会</span><span class="tel"></span></div><div class="email-c"><span>主办：</span><span class="email">中国新农村建设先进人物年鉴编辑委员会</span></div><div class="gf-weibo-c"><!--<span>官方微博：</span><a href="#" class="img"></a>--><div class="clear"></div></div></div>
<div class="f-links"><div class="f-items"><a href="/about?tab=0" class="f-item">公司介绍</a><a href="/about?tab=1" class="f-item">我们的团队</a><a href="/about?tab=2" class="f-item">历史历程</a><a href="/about?tab=3" class="f-item">企业荣誉</a><a href="/about?tab=4" class="f-item">招聘信息</a><a href="/about?tab=5" class="f-item">农贸动态</a><div class="clear"></div></div><div class="f-items"><a href="/join" class="f-item">申请入驻</a><a href="/join_cooperation" class="f-item">合作社</a><a href="/join_family-farm" class="f-item">家庭农场</a><a href="/join_purchaser" class="f-item">采购商</a><a href="/join_enterprise" class="f-item">涉农企业</a><div class="clear"></div></div><div class="f-items"><a href="/advantage" class="f-item">平台优势</a><a href="/advantage" class="f-item">行业沉淀</a><a href="/advantage" class="f-item">技术优势</a><a href="/advantage" class="f-item">服务优势</a><a href="/advantage" class="f-item">历史进程</a><div class="clear"></div></div>
<div class="xz-ew-c"><!--<div class="an-ew-c"></div><div class="ios-ew-c"></div>--></div>
</div><div class="clear"></div></div>
<div class="copyright-c"><span>版权所有</span><span>中国农民自由贸易网</span><a href="http://www.miitbeian.gov.cn" target="_blank" class="beian">京ICP备16039441号</a></div></div></div></div><div show="undefined" class="modal"></div><div class="alert-c"><div class="alert-content">图片尺寸太大！</div><div class="alert-btn">确定</div></div><div class="subject-c"><div class="subject-container"><img src="/images/close.png" class="close-subject"></div></div><div class="er-wei-container"><div class="er-wei-title">农合应用APP下载</div><div class="donw-guanzhu-c"><img src="/images/close.png" class="close-erwe"><div class="er-item"><img src="/images/erweima.png"><div>扫一扫 下载农合APP</div></div><div class="clear"></div></div></div><script src="/js/jquery.js"></script><script src="/js/layout.js"></script><script type="text/javascript" src="/js/jquery.js"></script><script type="text/javascript" src="/js/login.js"></script><%a=Request("a")
c=Request("c")
if a<>"" and c<>"" then
if a="err" then%><script type="text/javascript" src="/js/tooltips.js"></script><%end if
if a="err" and int(c)>3 then%><script type="text/javascript">show_err_msg('错误超过限制，请完全退出APP再试。','');</script><%end if
if a="err" and int(c)<4 and int(c)>0 then%><script type="text/javascript">show_err_msg('用户密码错误<%=int(c)&"次"%>，验证失败！','');</script><%end if%><%end if%></body></html>