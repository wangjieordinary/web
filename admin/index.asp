<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="../conn.asp"--><!--#include file="../config.asp"--><%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
atype=SPLIT(teh,"&")(2)
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="操作员"
if atype=3 then ttype="业务员"
power=SPLIT(teh,"&")(3)
end if
if admin="" or isnull(admin) then Response.Redirect("/admin/login")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head><title>
	<%=SiteName%>
</title><link href="/css/jquery-ui-1.7.2.custom.css" rel="Stylesheet" type="text/css" /><link rel="stylesheet" type="text/css" href="/admin/css/style.css" />
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="/admin/js/manager.js"></script>
       <script src="/Js/calendar.js" type="text/javascript"></script>
<style type="text/css">
/*三角型 包含兼容IE6样式class放在最下面*/
.triangle{width:0;height:0;font-size:0;overflow:hidden;
	border-style:solid;
}
/*蓝色朝下*/
.t_BlueDowm,.t_blackDown{border-width:5px 5px  0px 5px;border-color:#789DCB transparent transparent transparent;
	_border-left-color:white!important;
	_border-right-color:white!important;
	_filter: chroma(color='white')!important;
}
/*#505050朝下*/
.t_blackDown{border-width:4px 4px  0px 4px;border-color:#505050 transparent transparent transparent;}
/*#505050朝右*/
.t_blackRight{border-width:4px  0px 4px 4px;border-color:transparent transparent transparent #505050;
	_border-top-color:white;
	_border-bottom-color:white;
	_filter: chroma(color='white');
}
/* scrollBar */
.sweb::-webkit-scrollbar {height:8px; width:8px;}
.sweb::-webkit-scrollbar-button {height:0; width:0}
.sweb::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment { display:block}
.sweb::-webkit-scrollbar-button:vertical:start:increment,::-webkit-scrollbar-button:vertical:end:decrement { display:none}
.sweb::-webkit-scrollbar-track:vertical,::-webkit-scrollbar-track:horizontal,::-webkit-scrollbar-thumb:vertical,::-webkit-scrollbar-thumb:horizontal,::-webkit-scrollbar-track:vertical,::-webkit-scrollbar-track:horizontal,::-webkit-scrollbar-thumb:vertical,::-webkit-scrollbar-thumb:horizontal { border-style:solid; border-color:transparent}
.sweb::-webkit-scrollbar-track:vertical::-webkit-scrollbar-track:horizontal{background-clip:padding-box;background-color:#fff;}
.sweb::-webkit-scrollbar-thumb { background-clip:padding-box; background-color:rgba(209,211,217,1); min-height:28px; padding-top:100;-webkit-border-radius:15px;}
.sweb::-webkit-scrollbar-thumb:hover {background-color:rgba(166,167,175,1);-webkit-border-radius:15px;}
.sweb::-webkit-scrollbar-thumb:active {background-color:rgba(166,167,175,1);-webkit-border-radius:15px;}
.sweb::-webkit-scrollbar-track:vertical,::-webkit-scrollbar-track:horizontal,::-webkit-scrollbar-thumb:vertical,::-webkit-scrollbar-thumb:horizontal {  border-width:0;}
.sweb::-webkit-scrollbar-track:hover {background-color:rgba(228,229,233,1);-webkit-border-radius:15px;}
.sweb::-webkit-scrollbar-track:active {background-color:rgba(228,229,233,1);-webkit-border-radius:15px;}
#sidebar{overflow-x:hidden;*width:198px;_width:auto;}
.subList{background:#f4f5f9;padding:12px 0 7px 0;overflow:hidden; border:1px solid;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;}
.subList a{text-decoration:none;color:#333;}
.subList .big li {margin:0px 5px;position:relative;margin-bottom:1px;}
.subList .big li a{padding:3px 0 3px 19px;display:block;position:relative;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;height:18px;line-height:18px;font-size:13px;_zoom:1;*vertical-align: top;}
.subList .big li a .i_lock{position:absolute;left:2px;top:5px;} 
.subList .big li a:hover,.subList .big li a.on{background-color:#d7e2f0;text-decoration:none;-webkit-transition-duration:0.3s;}
.subList .big li.bottomLi{border-bottom:1px solid #e3e4e6;height:0;font-size:0;overflow:hidden;margin:7px 0;}
.subList .big li .otheMail{white-space:nowrap;overflow:hidden;/* text-overflow:ellipsis; */display:inline-block;vertical-align:top;*cursor:pointer;}
.subList .big li .otheMailNum{display:inline-block;vertical-align:top;*cursor:pointer;}

/*.subList a .i_plus,.subList a .i_minus2,.subList a .user_vip,*/.subList a .triangle{position:absolute;top:8px;left:4px;top:7px\9;*top:7px;_top:6px;cursor: pointer;}
.subList a .t_blackRight{left:6px;}
.subList a .t_blackDown{top:10px;*top:9px;}
.subList a .user_vip{margin-left: 4px;vertical-align:-2px;*vertical-align:2px;_vertical-align: 4px;_position: relative;_top:2px;}
.subList a .i_add{position:absolute;top:3px;right:23px;cursor:pointer}
.subList a .i_del{position:absolute;top:4px;right:8px;cursor:pointer;}
.subList .i_star_y,.subList .i_star{position:relative;margin-top:-4px;_margin-top:1px;_vertical-align:baseline;margin-right: 4px;}
/*.subList .user_vip,.subList .user_gray_vip{position:relative;margin-top:-2px;*margin-top:0px;_margin-top:1px;_vertical-align:baseline;margin-left:5px;}
*/
.subList .i_set{position:absolute;top:3px;right:3px;cursor:pointer}
.subList .small li{margin-top:1px;margin:0px;/* vertical-align:top; */}
.subList .small{display:none;/*margin-left:12px;*/}
.subList .small li a{padding-left:27px; white-space:nowrap;overflow:hidden;/*text-overflow:ellipsis; */zoom:1;} 
/*#folder_tag  li a{padding-left:3px;}*/
.subList .small li a .i_lock{position:absolute;left:2px;top:3px;} 
.subList .small .tagText{display:block;white-space:nowrap;overflow:hidden;/* text-overflow:ellipsis; */margin-left:3px; /*width:136px;*/cursor:pointer;float:left;}
.subList .small .tagMin{vertical-align:baseline;float:left;margin-top:4px;margin-right: 4px;}
</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" style="background:#EBF5FC;">
<tbody>
  <tr>
    <td height="70" colspan="3" style="background:url(/admin/images/head_bg.gif);"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="24%" height="70"><img src="/admin/images/head_logo.png" height="50"></td>
        <td width="76%" valign="bottom">
	  <!--导航菜单,与下面的相关联,修改时注意参数-->
         

        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30" colspan="3" style="padding:0px 10px;font-size:12px;background:url(/admin/images/navsub_bg.gif) repeat-x;">
    <div style="float:right;line-height:20px;"><a href="/admin/center" target="sysMain">管理中心</a> | 
        <a target="_blank" href="../">预览网站</a> | 
        <a href="/admin/logout">安全退出</a>
        </div>
    <div style="padding-left:20px;line-height:20px;background:url(/admin/images/siteico.gif) 0px 0px no-repeat;">当前登录用户：<font color="#FF0000"><span id="lblAdminName"><%=admin%>（<%=ttype%>）</span></font>您好，欢迎光临。</div>
    </td>
  </tr>

  <tr>
    <td align="middle" id="mainLeft" valign="top" style="background:#FFF;">
	  <div class="subList sweb" id="sb_h" style="text-align:left;width:138px;height:100%;font-size:12px;">

<ul class="big" id="folder_main"> 
<li style="background: #3F6CA3; text-align: center; line-height: 28px; margin: 0px auto 3px 0px; width: 100%; height: 28px; color: #fff; font-size: 11pt; -webkit-border-radius: 6px; -moz-border-radius: 6px">常用功能　</li>  
<li fid="1"><a target="sysMain" href="/admin/sysconfig">系统参数设置</a></li>   
<li style='display:block;'><a target="sysMain" href="/admin/Product_Add">添加商品</a></li>
<li fid="2"><a target="sysMain" href="/admin/Product_List">商品列表</a></li>   
<li id="li_vip"><a href="/admin/dingdan_List" target="sysMain">订单列表</a></li>
<li id="li_vip"><a href="/admin/jifen_List" target="sysMain">积分明细</a></li>
<li><a href="/admin/shouhuo_List" target="sysMain">佣金明细</a></li>
<li><a href="/admin/payout_List" target="sysMain">提现明细</a></li>
<li><a target="sysMain" href="/admin/User_List">会员列表</a></li>
<li><a target="sysMain" href="/admin/Manage_List">管理员管理</a></li>
<li class="bottomLi"></li>
</ul>
        
<div style="overflow-y: auto; position: relative; height: 500px;" id="sidebar" class="sweb"><ul class="big"><li style="background: #3F6CA3; text-align: center; line-height: 28px; margin: 0px auto 3px 0px; width: 100%; height: 28px; color: #fff; font-size: 11pt; -webkit-border-radius: 6px; -moz-border-radius: 6px">功能菜单　</li>  
<li>
<a href="javascript:;" id="imgmenu1" onMouseOver="this.className='menu_title1';" onClick="showsubmenu(1)" onMouseOut="i_unfoldOther1.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther1"></i>系统参数</a>
<ul id="submenu1" style="display:none;">	
<li><a target="sysMain" href="/admin/sysconfig">系统参数设置</a></li> 	</ul>
</li>
<li>
<a href="javascript:;" id="imgmenu2" onMouseOver="this.className='menu_title2';" onClick="showsubmenu(2)" onMouseOut="i_unfoldOther2.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther2"></i>商品管理</a>
<ul id="submenu2" style="display:none;">		
<li style='display:block;'><a target="sysMain" href="/admin/Product_Add">添加商品</a></li>
<li style='display:block;'><a target="sysMain" href="/admin/Product_List">商品管理</a></li>  
<li style='display:block;'><a target="sysMain" href="/admin/Category_List">商品分类</a></li>  
<li style='display:block;'><a target="sysMain" href="/admin/Brand_List">品牌分类</a></li> </ul>
</li>
<li>
<a href="javascript:;" id="imgmenu3" onMouseOver="this.className='menu_title3';" onClick="showsubmenu(3)" onMouseOut="i_unfoldOther3.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther3"></i>会员管理</a>
<ul id="submenu3" style="display:none;">		
<li><a target="sysMain" href="/admin/User_List">会员列表</a></li>
<li fid="1"><a target="sysMain" href="/admin/Shenji_List">升级管理</a></li></ul>
</li>
<li>
<a href="javascript:;" id="imgmenu4" onMouseOver="this.className='menu_title4';" onClick="showsubmenu(4)" onMouseOut="i_unfoldOther4.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther4"></i>资讯管理</a>
<ul id="submenu4" style="display:none;">		
<li style='display:block;'><a href="/admin/Article_Add" target="sysMain">发布新闻</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=3" target="sysMain">新农资讯</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=4" target="sysMain">精准扶贫</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=5" target="sysMain">生态农业</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=6" target="sysMain">食品安全</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=7" target="sysMain">政策法规</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=8" target="sysMain">产品推荐</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=9" target="sysMain">农贸展会</a></li>
<li style='display:block;'><a href="/admin/Article_List&act=m&ddlClassId=10" target="sysMain">专业合作社</a></li> </ul>
</li>
<li>
<a href="javascript:;" id="imgmenu5" onMouseOver="this.className='menu_title5';" onClick="showsubmenu(5)" onMouseOut="i_unfoldOther5.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther5"></i>内容管理</a>
<ul id="submenu5" style="display:none;">		
<li style='display:block;'><a href="/admin/Contents_Add" target="sysMain">增加内容</a></li>
<li style='display:block;'><a href="/admin/Contents_List_0" target="sysMain">内容管理</a></li>
<li style='display:block;'><a href="/admin/Channel_List_0" target="sysMain">内容类别</a></li></ul>
</li>
<li>
<a href="javascript:;" id="imgmenu6" onMouseOver="this.className='menu_title6';" onClick="showsubmenu(6)" onMouseOut="i_unfoldOther6.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther6"></i>广告管理</a>
<ul id="submenu6" style="display:none;">		
<li style='display:block;'><a href="/admin/AD_List_0" target="sysMain">广告管理</a></li></ul>
</li>
<li>
<a href="javascript:;" id="imgmenu7" onMouseOver="this.className='menu_title7';" onClick="showsubmenu(7)" onMouseOut="i_unfoldOther7.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther7"></i>商户管理</a>
<ul id="submenu7" style="display:none;">		
<li style='display:block;'><a href="/admin/shop_List_0" target="sysMain">商户审核</a></li></ul>
</li>
<li class="bottomLi"></li>
<li><a href="javascript:;" id="imgmenu8" onMouseOver="this.className='menu_title8';" onClick="showsubmenu(8)" onMouseOut="i_unfoldOther8.className='triangle t_blackDown';"><i class="triangle t_blackRight" name="i_unfoldOther" id="i_unfoldOther8"></i>版权信息</a>
<ul id="submenu8" style="display:none;"><li style="line-height:23px;">&nbsp;中国农民自由贸易网<br>&nbsp;&nbsp;睿店&reg; SaaS<br>400-0011-195</li></ul></li>
          </ul>
    </div>
</div>
	</td>
	<td valign="middle" style="width:8px;background:url(/admin/images/main_cen_bg.gif) repeat-x;">
      <div id="sysBar" style="cursor:pointer;"><img id="barImg" src="/admin/images/butClose.gif" alt="关闭/打开左栏" /></div>
	</td>
	<td style="width:100%" valign="top">
      <iframe frameborder="0" id="sysMain" name="sysMain" scrolling="yes" src="/admin/center" style="height:100%;visibility:inherit; width:100%;z-index:1;"></iframe>
	</td>
  </tr>
  <tr>
    <td height="28" colspan="3" bgcolor="#EBF5FC" style="padding:0px 10px;font-size:10px;color:#2C89AD;background:url(/admin/images/foot_bg.gif) repeat-x;">www.<%=zurl%></td>
  </tr>
  </tbody>
</table>
<script language=javascript>
function showsubmenu1(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
this.eval("i_unfoldOther" + sid).className='triangle t_blackDown';
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
this.eval("i_unfoldOther" + sid).className='triangle t_blackRight';
}
}
function showsubmenu(sid)
{ 
 for(var i=1;i<9;i++){
//whichEl = eval("submenu" + i);
//imgmenu = eval("imgmenu" + i);

if (sid == i)
{document.getElementById("submenu"+i).style.display="";
 document.getElementById("i_unfoldOther"+i).className='triangle t_blackDown';
 }
else
{
document.getElementById("submenu"+i).style.display="none";
document.getElementById("i_unfoldOther"+i).className='triangle t_blackRight';
}

}
}
</script>
</form>
</body>
</html>
