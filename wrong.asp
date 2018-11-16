<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><%dim urlname,addressname
urlname=Request.ServerVariables("QUERY_STRING")
addressname=Request.ServerVariables("SCRIPT_NAME")
if urlname<>"" then
addressname=addressname+"?" +urlname
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>抱歉！页面出错了！</title>
<script type='text/javascript' src='/js/jquery.js'></script>
<style type="text/css">
<!--
body {margin: 0px; padding:0px; font-family:"微软雅黑", Arial, "Trebuchet MS", Verdana, Georgia,Baskerville,Palatino,Times; font-size:16px;}
div{margin-left:auto; margin-right:auto;}
a {text-decoration: none; color: #1064A0;}
a:hover {color: #0078D2;}
img { border:none; }
h1,h2,h3,h4 {
/*	display:block;*/
	margin:0;
	font-weight:normal; 
	font-family: "微软雅黑", Arial, "Trebuchet MS", Helvetica, Verdana ; 
}
h1{font-size:42px; color:#0188DE; padding:20px 0px 10px 0px;}
h2{color:#0188DE; font-size:28px; padding:10px 0px 40px 0px;}
#wrapper{width:100%;}
#page{width:380px; padding:20px 20px 40px 20px; margin-top:80px;}

.button{width:180px; height:28px; margin-left:0px; margin-top:10px; background:#009CFF; border-bottom:4px solid #0188DE; text-align:center;}
.button a{width:180px; height:28px; display:block; font-size:14px; color:#fff; }
.button a:hover{ background:#5BBFFF;}

-->
</style></head>

<body>
<div id="page" style="border-style:dashed; border-color:#e4e4e4; line-height:30px; background:url(sorry.png) no-repeat right;">
<h1>抱歉！网页出错了…</h1>
<h2>Sorry! The page is wrong.</h2>
<font color="#666666"><a onclick="check_sb()" style="color:red;">>>点此报告管理员处理</a>，感谢您对我们工作的支持！<br /><br /><a onclick="window.history.back();">返回上一页>></a> &nbsp; &nbsp; &nbsp; <a href="/">返回首页>></a></font>
</div><script>setTimeout("window.history.back();",60000)</script><script type="text/javascript">
function check_sb(){
	var bugurl = "<%=Replace(addressname,".asp","")%>";
		var getUrl = "/BugReport";
		$.post(getUrl,{bugurl:bugurl,site:'zgnmzymyw'},function(rdata){
			if(rdata==null||rdata==''){
				alert('网络连接失败！请重试');
			}else if(rdata.fail==''){
				if(rdata.Word!=null&&rdata.Word!=''){
					alert(rdata.Word);
				}
				setTimeout("window.history.back();",3000)
			}else if(rdata.Word!=null&&rdata.Word!=''){
					alert(rdata.Word);
				}else{
					alert('网络连接失败！请重试');
				}
		},'json')
}
</script>
</body>
</html>