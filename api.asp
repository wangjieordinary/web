<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%Response.CodePage=65001
Response.Charset="utf-8"%><!--#include file="conn.asp"--><!--#include file="config.asp"--><!--#include file="md5.asp"--><%
Response.AddHeader "Access-Control-Allow-Origin", "*" 
response.ContentType="text/json"
a=request("a")
d=request("d")
lx=request("lx")
if lx="" or isnull(lx) then lx=2
phone=request("phone")
if k="" then
k=0
else
k=int(k)
end if

if a="data" then
%>{"data":[{"_id":"5a6c16aae7e4ed91647e1221","channel":"operation","title":"任大鹏：农民专业合作社法的制度创新","content":"<p style=\"text-align: center;\"><strong>农民专业合作社法的制度创新</strong><br/></p><p style=\"text-align: right;\">　　中国农业大学人文与发展学院教授 任大鹏</p><p>　　<span style=\"text-decoration: none;\"></span></p><p>《农民专业合作社法》实施十年后，于2017年12月27日经十二届全国人大常委会第三十一次会议修订通过。新法突出了对农民专业合作社及其成员的保护，进一步规范了合作社的组织和行为，强化了对农民专业合作社发展的促进政策。新法更加强调对合作社中的农民成员利益保护，凸显了在现代农业发展中合作社对小农户的***作用。新法在对合作社的规范和促进两个方面，有一系列重大的制度创新。</p><p>　　</p><p>首先是合作社的规范发展问题。实践中，农民专业合作社发展的同时，出现了一些不规范现象，如一些合作社出现了少数人控制现象，小农户在合作社中的民主权利和经济利益得不到有效保护；一些合作社成员不履行章程规定的出资、交易等义务，损害了合作社整体利益。针对这些问题，新法从退出机制和治理结构两个方面进行了规定。一方面，新法增加了成员除名和合作社退出机制。在合作社的发展过程中，个别成员违反章程规定，严重损害其他成员及合作社的整体利益，合作社依据新法规定的除名制度，对这些成员予以除名，可以更好体现合作社的凝聚力，以利于合作社的可持续发展。鉴于除名制度可能会导致一些合作社滥用除名权，剥夺成员本应享有的民主权利和经济利益，法律规定了严格的除名程序，并保护被除名成员获得救济的权利。在合作社发展实践中，也出现了“空壳”合作社现象，损害了合作社在市场中的整体商誉。针对这一问题，新法的第七十一条规定，农民专业合作社连续两年未从事经营活动的，吊销其营业执照。另一方面，新法在重申设立成员代表大会需要满足成员总数超过150人的条件外，规定了成员代表大会的代表人数一般为成员总人数的百分之十，并明确最低人数为五十一人，以防止合作社以代表大会的名义剥夺成员对合作社治理的参与权利。</p><p>　　</p><p>其次是促进合作社发展的制度建设问题。适应合作社十年发展中出现的一些新情况、新问题，新法设立了一系列有利于合作社发展的制度安排，为合作社提供了更加宽松的发展环境。</p><p>　　</p><p>第一，取消“同类”限制，拓宽法律适用范围。实践中，农民专业合作社对成员的服务不再局限于某一类农产品的生产经营。新法呼应实践发展需要，取消同类限制，有助于合作社为其成员提供多元化、多环节的服务，能够更好发挥合作社在现代农业发展中对小农户的带动作用。同时，新法允许合作社开展农村民间工艺及制品、休闲农业和乡村旅游资源的开发经营等业务，体现了农业的文化传承功能，也有利于通过合作社这一组织平台多渠道增加农民收入。</p><p>　　</p><p>第二，新法明确了土地经营权、林权可以作价向合作社出资，这一规定符合农村土地“三权”分置的政策方向，也在一定程度上改变了合作社仅有少数成员的货币出资形成的成员异质性问题，多数小规模农户可以更明确地参与合作社事物管理，也能够以其出资的土地经营权分享合作社盈余。</p><p>　　</p><p>第三，新法适应农民专业合作社相互之间联合与合作的需求，专章增加了联合社制度，明确了农民专业合作社联合社的法律地位，对农民专业合作社联合社的设立、登记、责任、机构设置及其议事规则、盈余分配办法、退社等做出了特别规定。联合社的建立与发展，可以解决单个合作社规模过小、竞争能力较弱等问题，可以更好配置资源、延伸农业的产业链条，提高合作社经营效率。按照新法规定，三个以上的农民专业合作社可以成立联合社，即联合社的成员必须是合作社，公司和其他组织不能直接成为联合社的成员。这一规定体现了农民为主体的原则，更有利于通过联合社提高其带动小农户参与市场竞争的能力。同时，法律要求，联合社不设代表大会，实行一社一票的表决制度，更能体现加入联合社的合作社之间平等的治理权利。</p><p>　　</p><p>第四，新法增加了对合作社用电、用地的支持，明确规定农民专业合作社从事农产品初加工用电执行农业生产用电价格，农民专业合作社生产性配套辅助设施用地按农用地管理。这一规定显然是合作社的利好政策，有助于合作社降低生产经营成本，通过延伸产业链条分享农产品附加值。</p><p>　　</p><p>另外，新法还对农民专业合作社的对外投资，成员的盈余转出资，以及对国有农场等企业职工兴办农民专业合作社的法律适用等做出了规定。</p><p>　　</p><p>新法的上述制度创新，为农民专业合作社的发展提供了更好的法律环境。但制度的实施还需要一系列配套法规、规章的完善，如农民专业合作社的注册登记制度、财务会计制度、税收优惠制度等，都需要尽快修订，以使新法规定的制度更具可操作性。</p><p>　　</p><p>新法在进行制度创新的同时，保留了大量实践证明行之有效的法律规范。例如，新法在合作社的设立上，仍然体现低门槛、包容性的原则；仍然强调农民为主体的原则，并以一系列制度保障该原则的实现；继续坚持一人一票的民主管理原则，保护小农户在合作社中的民主权利；仍然体现惠顾额返还为主的盈余分配原则，并保障财政补助形成的财产的利益由全体成员均享等。</p><p>　　</p><p>需要强调的是，农民专业合作社作为互助性经济组织，法律也为合作社的自治保留了空间。例如，合作社可以依法自主制定章程、自主设立组织机构、自主确定公积金的提取和使用、自主决定盈余分配的具体办法等。应当说，新法既体现了合作社的基本原则和特征，更突出了我国农民专业合作社发展的实际需要；既照顾合作社发展的阶段性特点，也体现了一定的前瞻性；既突出了合作社作为市场主体实现效率最大化的需求，更强调了对小农户的保护。新法的颁布实施，将会进一步促进对农民专业合作社的规范化和可持续发展，并有利于合作社在实施乡村振兴战略中发挥更大作用。</p><p><br/></p>","description":"《农民专业合作社法》实施十年后，于2017年12月27日经十二届全国人大常委会第三十一次会议修订通过。新法突出了对农民专业合作社及其成员的保护，进一步规范了合作社的组织和行为，强化了对农民专业合作社发展的促进政策。新法更加强调对合作社中的农民成员利益保护，凸显了在现代农业发展中合作社对小农户的***作用。新法在对合作社的规范和促进两个方面，有一系列重大的制度创新。","author":{"_id":"56fe404fc70d83b1360ffad9","interests":[],"organizations":[{"organizationId":"56b02f437bc453d504c26a91","organizationType":1,"_id":"57b66ac7667a895f349f48f9"}],"status":1,"loginCount":133,"gender":0,"headimgurl":"http://repos.b2cf.cn/images/user/32M9nVjY8mZ1-CQUtNuLz6fcjefKMgVV_thumbnail.jpg","wechat":{"subscribe_time":1521177543,"unionid":"oI028wrVGK2N7APqAxunvKFjpuAY","headimgurl":"http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJK5X8Q6DiaFgqXCgXqDsS9gOKLqUX3KqoUs0xmCjIcyZlXfRKYt9CEibKNWWPiaib2H1pCBeITvLaAbw/132","nickname":"Mr Yu","openid":"oivAKt2i1i-3G5hdI2pAiU1rRikY","cachedheadimg":"http://repos.b2cf.cn/images/user/56fe404fc70d83b1360ffad9_wechat_headimg.jpg"},"lastLoginTime":"2018-03-14T09:22:22.026Z","realname":"王兴玉","wechatPaymentOpenId":"oHBZjwaS38UEA7zk65Gqm45xR6JE","nickname":"Mr Yu","location":"硅谷亮城","region":"北京市海淀区","subsysUserId":6154583,"lastGeo":{"_id":"5aa92e84f497d55715260abc","createTime":"2018-03-14T14:15:32.531Z","address":{"street":"龙锦二街","isMunicipality":true,"streetNumber":"86号","building":"","neighborhood":"","township":"龙泽园街道","adcode":"110114","district":"昌平区","citycode":"010","city":"北京市","province":"北京市"},"geocode":{"latitude":40.085391,"longitude":116.34647}}},"publishTime":"2018-01-27T06:05:29.994Z","version":"1.0","supports":[],"updateTime":"2018-01-30T06:38:37.065Z","createTime":"2018-01-27T06:05:30.002Z","replies":[],"replyCount":0,"favoriteCount":2,"shareCount":15,"readCount":244,"isDigested":false,"isTop":true,"isRecommended":true,"status":"published","tags":["农民专业合作社制度创新"],"photo":{"image":{"url":"http://repos.b2cf.cn/images/nonghe_news/nLS3S-blgyejlhkHUi63r-gYlsgcxUuB.jpg"},"thumbnail":{"height":210,"width":350,"url":"http://repos.b2cf.cn/images/nonghe_news/nLS3S-blgyejlhkHUi63r-gYlsgcxUuB_thumbnail.jpg"}},"multPhotos":[],"platform":["mobile","pc"],"type":1,"__v":0,"typeDisplayName":"图文","channelDisplayName":"合作社运营","statusDisplayName":"发布","createTimeDisplayName":"2018-01-27 14:05:30","updateTimeDisplayName":"2018-01-30 14:38:37","publishDisplayName":"2018-01-27 14:05:29"}],"count":{"count":562}}<%
end if

if a="shop_index_info" then
islogin=false
shopid=chkstr(request("d"))
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if uid>0 then islogin=true
if islogin=false then%>{"code":0,"data":{"shop_id":"<%=shopid%>","shop_info":{"shop":{"shop_id":"<%=shopid%>","user_id":"12","site_id":"1","shop_name":"三农联盟","shop_image":"/shop/9/images/2017/08/10/15023459311907.jpg","shop_logo":"/shop/9/images/2017/08/10/15023489784266.jpg","shop_poster":"/shop/9/images/2017/08/10/15023462242872.jpg","shop_sign":"","shop_type":"2","is_supply":"0","cat_id":"0","credit":"23","desc_score":"5.00","service_score":"5.00","send_score":"5.00","logistics_score":"5.00","region_code":"61,01,13","address":"太白南路181号A座工业写字楼A区三层","shop_lng":"108.909882","shop_lat":"34.213842","opening_hour":"a:5:{s:4:\"week\";a:7:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"4\";i:5;s:1:\"5\";i:6;s:1:\"6\";}s:10:\"begin_hour\";a:1:{i:0;s:1:\"0\";}s:12:\"begin_minute\";a:1:{i:0;s:1:\"0\";}s:8:\"end_hour\";a:1:{i:0;s:2:\"23\";}s:10:\"end_minute\";a:1:{i:0;s:2:\"59\";}}","add_time":"1501485217","pass_time":"1501486767","duration":"1","unit":"0","clearing_cycle":"2","open_time":"1501430400","end_time":"1627660799","system_fee":"0.00","insure_fee":"0.00","goods_status":"2","shop_status":"1","close_info":"","shop_sort":"255","shop_audit":"1","fail_info":null,"simply_introduce":null,"shop_keywords":"","shop_description":"","detail_introduce":"","service_tel":null,"service_hours":null,"shop_sign_m":"","take_rate":"0.00","qrcode_take_rate":"0","collect_allow_number":"0","collected_number":"0","store_allow_number":"0","store_number":"0","comment_allow_number":"0","comment_number":"0","login_status":"1","show_credit":"1","show_in_street":"1","goods_is_show":"1","control_price":"1","show_price":"1","show_content":"","button_content":"","button_url":null,"start_price":"0.00","shop_sn":"","region_name":"陕西省 西安市 雁塔区"},"user":{"user_id":"","user_name":"","mobile":"","email":null,"nickname":"","headimg":null},"real":{"company_name":"西安珍佰粮行有限公司","registation_no":"610131100122677","organization_code":"123","artificial_person":"刘冉","card_no":"612429198701275562","license":"/shop/9/field/2017/07/31/15014866028281.jpg","card_type":"formal\r\n临时身份证","card_side_a":"/shop/9/field/2017/07/31/15014866025052.jpg","card_side_b":"/shop/9/field/2017/07/31/15014866039211.jpg"},"credit":{"credit_id":"2","credit_name":"二钻","credit_img":"/shop/shop-credit/2017/10/16/15081220688024.gif","min_point":"11","max_point":"40","remark":""},"address":[{"address_id":"36","consignee":"邓玉芳","region_code":"51,04,21","address_detail":"四川省 攀枝花市 米易县 迷阳水岸七栋二单元502","mobile":"15984591420","tel":"","email":"","is_default":"1","shop_id":"9"}],"customer_main":false,"aliim_enable":"","customer":null},"region_name":"陕西省 西安市 雁塔区","duration_time":"1年 1个月 9天","is_collect":false,"collect_count":"1","goods_count":44,"bonus_count":"0","im_enable":"0","position":"info","is_opening":true,"show_collect_count":"1"},"message":""}<%
elseif islogin then%>{"code":0,"data":{"shop_id":"<%=shopid%>","shop_info":{"shop":{"shop_id":"<%=shopid%>","user_id":"12","site_id":"1","shop_name":"三农联盟","shop_image":"/shop/9/images/2017/08/10/15023459311907.jpg","shop_logo":"/shop/9/images/2017/08/10/15023489784266.jpg","shop_poster":"/shop/9/images/2017/08/10/15023462242872.jpg","shop_sign":"","shop_type":"2","is_supply":"0","cat_id":"0","credit":"23","desc_score":"5.00","service_score":"5.00","send_score":"5.00","logistics_score":"5.00","region_code":"61,01,13","address":"太白南路181号A座工业写字楼A区三层","shop_lng":"108.909882","shop_lat":"34.213842","opening_hour":"a:5:{s:4:\"week\";a:7:{i:0;s:1:\"0\";i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"4\";i:5;s:1:\"5\";i:6;s:1:\"6\";}s:10:\"begin_hour\";a:1:{i:0;s:1:\"0\";}s:12:\"begin_minute\";a:1:{i:0;s:1:\"0\";}s:8:\"end_hour\";a:1:{i:0;s:2:\"23\";}s:10:\"end_minute\";a:1:{i:0;s:2:\"59\";}}","add_time":"1501485217","pass_time":"1501486767","duration":"1","unit":"0","clearing_cycle":"2","open_time":"1501430400","end_time":"1627660799","system_fee":"0.00","insure_fee":"0.00","goods_status":"2","shop_status":"1","close_info":"","shop_sort":"255","shop_audit":"1","fail_info":null,"simply_introduce":null,"shop_keywords":"","shop_description":"","detail_introduce":"","service_tel":null,"service_hours":null,"shop_sign_m":"","take_rate":"0.00","qrcode_take_rate":"0","collect_allow_number":"0","collected_number":"0","store_allow_number":"0","store_number":"0","comment_allow_number":"0","comment_number":"0","login_status":"1","show_credit":"1","show_in_street":"1","goods_is_show":"1","control_price":"1","show_price":"1","show_content":"","button_content":"","button_url":null,"start_price":"0.00","shop_sn":"","region_name":"陕西省 西安市 雁塔区"},"user":{"user_id":"<%=userid%>","user_name":"<%=telephone%>","mobile":"<%=telephone%>","email":null,"nickname":"<%=telephone%>","headimg":null},"real":{"company_name":"西安珍佰粮行有限公司","registation_no":"610131100122677","organization_code":"123","artificial_person":"刘冉","card_no":"612429198701275562","license":"/shop/9/field/2017/07/31/15014866028281.jpg","card_type":"formal\r\n临时身份证","card_side_a":"/shop/9/field/2017/07/31/15014866025052.jpg","card_side_b":"/shop/9/field/2017/07/31/15014866039211.jpg"},"credit":{"credit_id":"2","credit_name":"二钻","credit_img":"/shop/shop-credit/2017/10/16/15081220688024.gif","min_point":"11","max_point":"40","remark":""},"address":[{"address_id":"36","consignee":"邓玉芳","region_code":"51,04,21","address_detail":"四川省 攀枝花市 米易县 迷阳水岸七栋二单元502","mobile":"15984591420","tel":"","email":"","is_default":"1","shop_id":"9"}],"customer_main":false,"aliim_enable":"","customer":null},"region_name":"陕西省 西安市 雁塔区","duration_time":"1年 1个月 9天","is_collect":false,"collect_count":"1","goods_count":<%Set dfrs = Server.CreateObject("ADODB.RecordSet")
dfrs.Open "select * from [gouwuche] where uid="&uid&" and (ddh is null or ddh='') and siteid="&siteid,conn,1,1
response.write dfrs.recordcount
dfrs.Close
set dfrs=nothing%>,"bonus_count":"0","im_enable":"0","position":"info","is_opening":true,"show_collect_count":"1"},"message":""}<%end if
end if

'ajax 分类数据
if a="working" then%><option value="">暂无子类</option><%
end if

'会员注册
if a="pcreg" then
email=chkstr(request("email"))
firstname=chkstr(request("firstname"))
te=request("te")
telephone=request("telephone")
address=request("address")
password=trim(request("password"))
confirm_password=trim(request("confirm_password"))
olduserno=request("userno")
salename=chkstr(request("salename"))
reuserno=chkstr(request("reuserno"))
wxid=chkstr(request("wxid"))
facebookid=chkstr(request("facebookid"))
saleinfo=getsaleinfo(salename)
csno=0
if ubound(split(saleinfo,"|"))=3 then
saleid=split(saleinfo,"|")(1)
saleno=split(saleinfo,"|")(2)
csno=split(saleinfo,"|")(3)+1
if instr(csno,"4")>0 then csno=int(Replace(csno,"4","5"))
userno=saleno&csno
end if
qq=chkstr(request("qq"))
if email="" or firstname="" or te="" or password="" or confirm_password="" or telephone="" or address="" or salename="" then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('必填资料有误，请重新提交。');history.go(-1);</Script></body></html>"
elseif gsjc(email,3)=false then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('邮箱格式错误。');history.go(-1);</Script></body></html>"
elseif emailregchk(email,0) then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('邮箱已被注册。');history.go(-1);</Script></body></html>"
elseif password<>confirm_password then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('两次输入密码不一致。');history.go(-1);</Script></body></html>"
elseif csno=0 then
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('业务代表信息有误。');history.go(-1);</Script></body></html>"
else
if salename<>"" then salenameinfo=getsaleinfo(salename)
'if reuserno<>"" then reusernoinfo=getreuserno(reuserno)
saleid=SPLIT(salenameinfo,"|")(1)
conn.execute("insert into [member] (email,firstname,te,telephone,address,password,userno,olduserno,salename,saleid,reuserno,wxid,facebookid,qq,siteid) values('"&email&"','"&firstname&"','"&te&"','"&telephone&"','"&address&"','"&md5(password)&"','"&userno&"','"&olduserno&"','"&salename&"',"&saleid&",'"&reuserno&"','"&wxid&"','"&facebookid&"','"&qq&"',"&siteid&")") 
conn.Execute("update [admin] set csno = "&csno&" where txtUserName='"&salename&"' or txtReadName='"&salename&"'")
Session("email")=email
Session("firstname")=firstname
Session("userno")=userno
'Response.Cookies("teh").Expires=DateAdd("m",60,now()) 
'Response.Cookies("teh")("token")=base64Encode(email&"&"&userno&"&"&firstname&"&"&siteid)
Response.Write "<!DOCTYPE html><html><head><meta charset=""utf-8"" /></head><body><Script Language=JavaScript>alert('注册成功！');location.href='/user.html';</Script></body></html>"
end if
end if

'NMW会员注册
if a="reg" then
telephone=request("mobile")
password=request("password")
verifyCode=request("verifyCode")
sj1=request("sj1")
tuid=0
tcj=1
uid1=0
uid2=0
uid3=0
uid4=0
uid5=0
uid6=0
if gsjc(sj1,4) then
tuid=getuserid(sj1)
tuidinfo=gettuidinfo(tuid)
if ubound(split(tuidinfo,"|"))=7 then
tcj=split(tuidinfo,"|")(0)
uid1=split(tuidinfo,"|")(1)
uid2=split(tuidinfo,"|")(2)
uid3=split(tuidinfo,"|")(3)
uid4=split(tuidinfo,"|")(4)
uid5=split(tuidinfo,"|")(5)
uid6=split(tuidinfo,"|")(6)
end if
end if
if gsjc(telephone,4)=false then%>{"status":"fail","Word":"手机号码格式不对！","fail":"true"}<%
elseif sjchk(telephone) then%>{"status":"fail","Word":"手机号已被注册，请更换手机号注册！","fail":"true"}<%
elseif chkvcode(telephone,verifyCode,1)=false then%>{"status":"fail","Word":"手机验证码已失效！","fail":"true"}<%else
if tuid>0 then
if tcj=6 then conn.execute("insert into [member] (telephone,password,uid0,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid6&","&siteid&")")
if tcj=5 then conn.execute("insert into [member] (telephone,password,uid0,uid5,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid5&","&uid6&","&siteid&")") 
if tcj=4 then conn.execute("insert into [member] (telephone,password,uid0,uid4,uid5,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid4&","&uid5&","&uid6&","&siteid&")") 
if tcj=3 then conn.execute("insert into [member] (telephone,password,uid0,uid3,uid4,uid5,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid3&","&uid4&","&uid5&","&uid6&","&siteid&")") 
if tcj=2 then conn.execute("insert into [member] (telephone,password,uid0,uid2,uid3,uid4,uid5,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid2&","&uid3&","&uid4&","&uid5&","&uid6&","&siteid&")") 
if tcj=1 then conn.execute("insert into [member] (telephone,password,uid0,uid1,uid2,uid3,uid4,uid5,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid1&","&uid2&","&uid3&","&uid4&","&uid5&","&uid6&","&siteid&")") 
if tcj=0 then conn.execute("insert into [member] (telephone,password,uid0,uid1,uid2,uid3,uid4,uid5,uid6,siteid) values('"&telephone&"','"&md5(password)&"',"&tuid&","&uid1&","&uid2&","&uid3&","&uid4&","&uid5&","&uid6&","&siteid&")") 
else
conn.execute("insert into [member] (telephone,password,siteid) values('"&telephone&"','"&md5(password)&"',"&siteid&")") 
end if
uid=getuserid(telephone)
Session("uid")=""
Session("telephone")=telephone
Session("userno")=""
Response.Cookies("nmw").Expires=DateAdd("m",60,now()) 
Response.Cookies("nmw")("token")=base64Encode(uid&"&"&""&"&"&telephone&"&"&siteid)
%>{"status":"fail","Word":"注册成功","fail":""}<%
end if
end if

'农贸网登陆
if a="chklogin" then
mobile=trim(Request("mobile"))
password=trim(Request("password"))
errn=Session("errn")
errn=1
if errn="" or isnull(errn) then errn=0
if mobile<>"" and password<>"" and errn<6 then
Set chkrs = Server.CreateObject( "ADODB.Recordset" )
chkql="Select * from [member] where telephone='"&mobile&"' and password='"&md5(password)&"'"
chkrs.open chkql,conn,1,1
if not (chkrs.bof and chkrs.eof) then
Session("uid")=chkrs("id")
Session("telephone")=chkrs("telephone")
Session("userno")=chkrs("userno")
Response.Cookies("nmw").Expires=DateAdd("m",60,now()) 
Response.Cookies("nmw")("token")=base64Encode(chkrs("id")&"&"&chkrs("userno")&"&"&chkrs("telephone")&"&"&siteid)
'Response.Cookies("xfa")("uid")=chkrs("id")
'Response.Cookies("xfa")("uname")=chkrs("uname")
'Response.Cookies("xfa")("sj")=chkrs("sj")
'Response.Redirect("/mall/user.asp")
Session("errn")=0%>{"Word":"/userpanel","fail":""}<%
else
Session("errn")=errn+1%>{"Word":"/login?e=err&a=err&c=<%=errn+1%>","fail":"true"}<%
end if
chkrs.close
set chkrs=nothing
else%>{"Word":"/login?e=err&a=err&c=<%=errn%>","fail":"true"}<%
end if
end if

'农贸网找回密码
if a="password_reset" then
mobile=trim(Request("mobile"))
password=trim(Request("password"))
verifyCode=trim(Request("verifyCode"))
errn=Session("errn")
errn=1
if errn="" or isnull(errn) then errn=0
if mobile<>"" and password<>"" and verifyCode<>"" and errn<6 then
if chkvcode(mobile,verifyCode,2)=false then
Session("errn")=errn+1%>{"Word":"/forget_password?e=err&a=err&c=<%=errn+1%>","fail":"true"}<%else
conn.Execute("update [member] set password = '"&md5(password)&"' where telephone='"&mobile&"'")
Session("errn")=0%>{"Word":"/userpanel","fail":""}<%
end if
else%>{"Word":"/forget_password?e=err&a=err&c=<%=errn+1%>","fail":"true"}<%
end if
end if

'发送验证码
mobile=request("mobile")
if a="sendsms" and gsjc(mobile,4) then
'vcode=Session("vcode")
if vcode="" or isnull(vcode) then
vcode=randStr(6,"NUMB")
'Session("vcode")=vcode
end if
ddm=randStr(6,"NUMB")
lx=1
if d="forget_password" or d="login" then lx=2
sendzt=sendsms(mobile,vcode,lx,ddm) '1为注册校验码,在发送JS中提交
if int(SPLIT(sendzt&",",",")(0))=1 then%>{"status":"ok","code":0,"data":null,"message":"发送成功"}<%
elseif int(SPLIT(sendzt&",",",")(0))=2 then%>{"info":"获取验证码已超上限！","code":1}<%
elseif int(SPLIT(sendzt&",",",")(0))=0 then%>{"info":"系统开小差了，稍后再试！","code":1}<%end if
end if

'添加收货地址
if a="adduseraddressapi" then
txtusername=request("consignee")
txtcellphone=request("tel")
txttelphone=request("telephone")
txtPostcode=request("postcode")
country=request("country")
countryid=SPLIT(country,"|")(0)
countrytxt=SPLIT(country,"|")(1)
txtAddress=request("address")
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if userid=0 then
zt=1
elseif txtusername<>"" and txtcellphone<>"" and txttelphone<>"" and txtPostcode<>"" and countrytxt<>"" and countryid<>"" and txtAddress<>"" then
conn.execute("insert into [user_address] (txtusername,txtcellphone,txttelphone,txtPostcode,country,countryid,txtAddress,userid,IsDefault,siteid) values('"&txtusername&"','"&txtcellphone&"','"&txttelphone&"','"&txtPostcode&"','"&countrytxt&"','"&countryid&"','"&txtAddress&"',"&userid&",0,"&siteid&")") 
zt=2
else
zt=0
end if
%><%=zt%><%end if

'输出运输方式
if a="postwayapi" then
ordertype=int(request("ordertype"))
set rs=server.createobject("adodb.recordset")
exec="select * from [postway] where siteid="&siteid&" and rblUserType="&ordertype&" order by id asc"		
rs.open exec,conn,1,1
if rs.recordcount>0 then
i=1%>[<%do while not rs.eof
if i=1 then%>{"CityID":<%=rs("id")%>,"CityName":"<%=rs("txtpostwayname")%>"}<%else%>,{"CityID":<%=rs("id")%>,"CityName":"<%=rs("txtpostwayname")%>"}<%end if
i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing%>]<%end if%>
<%end if

'账户管理
if a="muser" then
sname=request("sname")
nbxfa=chkxfa()
uname=SPLIT(nbxfa,"&")(2)
if sname="" or uname="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("update [userinfo] set sname = '"&sname&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/muser41","fail":""}<%
end if
end if

'添加银行卡号
if a="cardno" then
khh=request("khh")
cardno=request("cardno")
sname=request("sname")
moren=request("moren")
nbxfa=chkxfa()
uname=SPLIT(nbxfa,"&")(2)
if moren or getmrk(uname)="" then
moren=1
else
moren=0
end if
if khh="" or cardno="" or sname="" or moren="" or uname="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
if moren=1 then conn.Execute("update [cardno] set moren = 0 where uname='"&uname&"'")
conn.execute("insert into [cardno] (uname,khh,cardno,sname,moren) values('"&uname&"','"&khh&"','"&cardno&"','"&sname&"',"&moren&")")
%>{"status":"true","Word":"账户添加成功！","gourl":"/mcard43","fail":""}<%
end if
end if

'设置默认地址
if a="mraddressno" then
id=int(request("id"))
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if id="" or id=0 or email="" or int(userid)=0 then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("update [user_address] set IsDefault = 0 where userid='"&userid&"' and siteid="&siteid)
conn.Execute("update [user_address] set IsDefault = 1 where userid='"&userid&"' and id="&id&" and siteid="&siteid)
%>{"status":"true","Word":"设置默认地址成功！","gourl":"/user_address_list_<%=randStr(6,"NUMB")%>","fail":""}<%
end if
end if

'删除地址
if a="deladdressno" then
id=int(request("id"))
teh=chkteh()
if teh<>"" then email=SPLIT(teh,"&")(0)
userid=getuserid(email)
if id="" or id=0 or email="" or int(userid)=0 then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%else
conn.Execute("delete from [user_address] where userid='"&userid&"' and id="&id&" and siteid="&siteid)
%>{"status":"true","Word":"删除成功！","gourl":"/user_address_list_<%=randStr(6,"NUMB")%>","fail":""}<%
end if
end if

'修改登陆密码
if a="pass" then
opass=request("opass")
npass=request("npass")
vcode=request("vcode")
nbxfa=chkxfa()
sj=SPLIT(nbxfa,"&")(1)
uname=SPLIT(nbxfa,"&")(2)
if opass="" or npass="" or vcode="" or uname="" or sj="" or gsjc(sj,4)=false then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif pwdchk(uname,opass)=false then%>{"status":"fail","Word":"当前登陆密码错误！","fail":"true"}<%
elseif chkvcode(sj,vcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set pass = '"&npass&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/user4","fail":""}<%
end if
end if

'修改支付密码
if a="ppass" then
oppass=request("oppass")
nppass=request("nppass")
pvcode=request("pvcode")
nbxfa=chkxfa()
sj=SPLIT(nbxfa,"&")(1)
uname=SPLIT(nbxfa,"&")(2)
if oppass="" or nppass="" or pvcode="" or uname="" or sj="" or gsjc(sj,4)=false then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif ppwdchk(uname,oppass)=false then%>{"status":"fail","Word":"当前支付密码错误！","fail":"true"}<%
elseif chkvcode(sj,pvcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set ppass = '"&nppass&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/user4","fail":""}<%
end if
end if

'找回登陆密码
if a="fpass" then
uname=request("uname")
pwd=request("pwd")
vcode=request("vcode")
if uname="" or pwd="" or vcode="" or phone="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif gsjc(phone,4)=false then%>{"status":"fail","Word":"手机号码错误！","fail":"true"}<%
elseif userchk(uname,phone)=false then%>{"status":"fail","Word":"用户信息校验失败！","fail":"true"}<%
elseif chkvcode(phone,vcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set pass = '"&pwd&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！正在前往登陆","gourl":"/login","fail":""}<%
end if
end if

'找回支付密码
if a="fppass" then
uname=request("uname")
pwd=request("pwd")
vcode=request("vcode")
if uname="" or pwd="" or vcode="" or phone="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif gsjc(phone,4)=false then%>{"status":"fail","Word":"手机号码错误！","fail":"true"}<%
elseif userchk(uname,phone)=false then%>{"status":"fail","Word":"用户信息校验失败！","fail":"true"}<%
elseif chkvcode(phone,vcode,2)=false then%>{"status":"fail","Word":"验证码已失效！","fail":"true"}<%else
conn.Execute("update [userinfo] set ppass = '"&pwd&"' where uname='"&uname&"'")
%>{"status":"true","Word":"修改成功！","gourl":"/user4","fail":""}<%
end if
end if

'检查手机是否注册
if a="chkuser" then
sj=request("sj")
if sj="" then%>{"status":"fail","Word":"系统开小差了！","fail":"true"}<%
elseif gsjc(sj,4)=false then%>{"status":"fail","Word":"手机号码错误！","fail":"true"}<%
elseif sjchk(sj) then%>{"status":"fail","Word":"手机号码已被注册！","fail":"true"}<%
else%>{<%end if
end if

'检查验证码是否正确
if a="chkcode" then
code=request("code")
if UCase(session("code"))=UCase(code) then%>{"status":"fail","Word":"验证成功","fail":""}<%else%>{"status":"fail","Word":"验证失败","fail":"true"}<%
end if
end if

'获取省市区
if a="newareas" then
level=request("level")%>[{"province":"北京市","level":1,"isMunicipality":true},{"province":"天津市","level":1,"isMunicipality":true},{"province":"河北省","level":1},{"province":"吉林省","level":1},{"province":"上海市","level":1,"isMunicipality":true},{"province":"山西省","level":1},{"province":"内蒙古自治区","level":1},{"province":"辽宁省","level":1},{"province":"黑龙江省","level":1},{"province":"江苏省","level":1},{"province":"浙江省","level":1},{"province":"安徽省","level":1},{"province":"福建省","level":1},{"province":"江西省","level":1},{"province":"山东省","level":1},{"province":"河南省","level":1},{"province":"湖北省","level":1},{"province":"湖南省","level":1},{"province":"广东省","level":1},{"province":"海南省","level":1},{"province":"重庆市","level":1,"isMunicipality":true},{"province":"宁夏回族自治区","level":1},{"province":"澳门特别行政区","level":1},{"province":"广西壮族自治区","level":1},{"province":"四川省","level":1},{"province":"贵州省","level":1},{"province":"云南省","level":1},{"province":"西藏自治区","level":1},{"province":"陕西省","level":1},{"province":"甘肃省","level":1},{"province":"青海省","level":1},{"province":"新疆维吾尔自治区","level":1},{"province":"台湾省","level":1},{"province":"香港特别行政区","level":<%=level%>}]<%
end if

'用户中心收货地址
if a="u_address" and t=1 then%>[{"IDRec":"16903","fIDWebsite":"9707","IDUser":"88272","RecDetail":"{\"RecName\":\"\\u7f57\\u6842\\u6797\",\"RecProvince\":\"\\u5e7f\\u4e1c\\u7701\",\"RecCity\":\"\\u5e7f\\u5dde\\u5e02\",\"RecArea\":\"\\u767d\\u4e91\\u533a\",\"RecAddress\":\"\\u571f\\u5730\",\"RecMobile\":\"13800000000\",\"RecTel\":\"\",\"RecCode\":\"\"}","IsDefault":"0"}]<%end if

if a="addaddress" then
IDRec=trim(Request("IDRec"))
txtusername=trim(Request("RecName"))
txttelphone=trim(Request("RecTel"))
txtcellphone=trim(Request("RecMobile"))
RecProvince=trim(Request("RecProvince"))
RecCity=trim(Request("RecCity"))
RecArea=trim(Request("RecArea"))
country=RecProvince&"||"&RecCity&"||"&RecArea
txtAddress=trim(Request("RecAddress"))
txtPostcode=trim(Request("RecCode"))
IsDefault=Request("IsDefault")
if txtusername<>"" and txtcellphone<>"" and RecProvince<>"" and RecCity<>"" and RecArea<>"" and txtAddress<>"" then
Set rs = Server.CreateObject("ADODB.RecordSet")
if IDRec<>"" and int(IDRec)>0 then
rs.Open "select * from [user_address] where id="&int(IDRec)&" and siteid="&siteid,conn,1,2
else
rs.Open "select * from [user_address]",conn,1,2
rs.addnew
end if
rs("txtusername")=txtusername
rs("txttelphone")=txttelphone
rs("txtcellphone")=txtcellphone
rs("country")=country
rs("txtAddress")=txtAddress
rs("txtPostcode")=txtPostcode
if IsDefault="true" then
rs("IsDefault")=1
else
rs("IsDefault")=0
end if
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=Left(tdno&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(6,"NUMB"),9) '生成临时用户ID
Session("uid")=uid
Session("telephone")=txttelphone
Session("userno")=uid
Response.Cookies("nmw").Expires=DateAdd("m",60,now()) 
Response.Cookies("nmw")("token")=base64Encode(uid&"&"&uid&"&"&txttelphone&"&"&siteid)
end if
rs("userid")=uid
rs("siteid")=siteid
rs("atime")=now()
rs.update
rs.movelast
i_CurIDRec=rs("id")
rs.close
set rs=nothing
end if
%><%=i_CurIDRec%><%
end if

if a="ShopCartRecList" then
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
set rs=server.createobject("adodb.recordset")
exec="select * from [user_address] where siteid="&siteid&" and userid="&int(uid)&" order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then%>[<%
for i=1 to rssum
fgtxt=","
if i=rssum then fgtxt=""
if isnull(Session("IDRec")) or Session("IDRec")="" or Session("IDRec")="NaN" then
uaddid=0
else
uaddid=Session("IDRec")
end if
if Session("IDRec")<>"" then
if int(uaddid)=rs("id") then
IsDefault=1
else
IsDefault=0
end if
else
IsDefault=rs("IsDefault")
end if
%>{"IDRec":"<%=rs("id")%>","fIDWebsite":"9707","IDUser":"<%=uid%>","RecDetail":"{\"RecName\":\"\<%=tounicode(rs("txtusername"))%>\",\"RecProvince\":\"\<%=tounicode(split(rs("country"),"||")(0))%>\",\"RecCity\":\"\<%=tounicode(split(rs("country"),"||")(1))%>\",\"RecArea\":\"\<%=tounicode(split(rs("country"),"||")(2))%>\",\"RecAddress\":\"\<%=tounicode(rs("txtAddress"))%>\",\"RecMobile\":\"<%=rs("txtcellphone")%>\",\"RecTel\":\"<%=rs("txttelphone")%>\",\"RecCode\":\"<%=rs("txtPostcode")%>\"}","IsDefault":"<%=IsDefault%>"}<%=fgtxt%><%
rs.movenext
if rs.eof then exit for
next%>]<%
else%>[]<%
end if
rs.close
set rs=nothing
end if

if a="deladdress" then
IDRec=trim(Request("IDRec"))
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
conn.Execute("delete from [user_address] where userid='"&uid&"' and id="&int(IDRec)&" and siteid="&siteid)
%>1<%
end if

if a="setDefaultaddress" then
IDRec=trim(Request("IDRec"))
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
Session("IDRec")=""
conn.Execute("update [user_address] set IsDefault = 0 where userid='"&uid&"' and siteid="&siteid)
conn.Execute("update [user_address] set IsDefault = 1 where userid='"&uid&"' and id="&int(IDRec)&" and siteid="&siteid)%>1<%
end if

if a="kuaidiprice" then
IDRec=trim(Request("IDRec"))
IDShopCart=trim(Request("IDShopCart[]"))
Session("IDRec")=IDRec
if IDRec="NaN" or IDRec="" then%>{"Flag":-3,"Msg":"","Data":[]}<%elseif IDShopCart="NaN" or IDShopCart="" then%>{"Flag":-2,"Msg":"","Data":[]}<%else
%>{"Flag":-0,"Msg":"","Data":[]}<%end if
end if

if a="cheackOrderFinish" then
id=Request("id")
if isnumeric(id) then
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
ddh=getddh(id,5)
UserMoney=0
GiftPrice=0
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [member] where telephone='"&telephone&"' and siteid="&siteid
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
UserMoney=rs("UserMoney")
GiftPrice=rs("GiftPrice")
if GiftPrice="" or isnull(GiftPrice) then GiftPrice=0
end if
rs.close
set rs=nothing
conn.execute "update [member] set GiftPrice=GiftPrice+b.jifen from [member] a,[jifen] b where a.id=b.uid and b.zt<2 and ddh='"&ddh&"'"
conn.execute "update [jifen] set zt=2,ctime=getdate(),czr='系统',bz='用户已确认收货',fyue="&GiftPrice&",byue=jifen+"&GiftPrice&" where zt<2 and ddh='"&ddh&"'"
conn.execute "update [gouwuche] set stime=getdate(),yjzt=5 where yjzt<5 and ddh='"&ddh&"'"
conn.Execute("update [dingdan] set zt=5,etime=getdate() where id="&id&" and zt<5 and siteid="&siteid)%>{"flag":1,"msg":"确认收货完成！","date":[]}<%end if
end if

if a="cheackOrderCancel" then
id=Request("id")
if isnumeric(id) then
ddh=getddh(id,5)
conn.execute "update [member] set UserMoney=UserMoney+b.jine from [member] a,[dingdan] b where a.id=b.uid and b.zt=2 and (b.zflx=2 or b.zflx=3) and ddh='"&ddh&"'"
conn.execute "update [member] set GiftPrice=GiftPrice+b.jine2 from [member] a,[dingdan] b where a.id=b.uid and b.zt=2 and b.zflx=1 and ddh='"&ddh&"'"
conn.execute "update [member] set UserMoney=UserMoney+b.jine,GiftPrice=GiftPrice+b.jine2 from [member] a,[dingdan] b where a.id=b.uid and b.zt=2 and (b.zflx=7 or b.zflx=8) and ddh='"&ddh&"'"
conn.execute "update [jifen] set zt=3,ctime=getdate(),czr='系统',bz='用户已申请退款' where zt<2 and ddh='"&ddh&"'"
conn.execute "delete from [yonjin] where jsdh='"&ddh&"'"
conn.execute "update [gouwuche] set etime=getdate(),yjzt=4 where yjzt<4 and ddh='"&ddh&"'"
conn.Execute("update [dingdan] set zt=4,etime=getdate() where id="&id&" and zt=2 and siteid="&siteid)%>{"flag":1,"msg":"已退款完成！","date":[]}<%end if
end if

if a="closeOrder" then
id=Request("id")
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if isnumeric(id) then
if instr(cwadmin,"|"&uid&"|")>0 then
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.Open "select * from [dingdan] where id="&id,conn,1,2
if not(rs.bof and rs.eof) then
ddh=rs("ddh")
if rs("zt")<2 then conn.execute "update [jifen] set zt=3,bz='订单已作废' where ddh='"&ddh&"'"
if rs("zt")=2 or rs("zt")=3 then
conn.execute "update [member] set UserMoney=UserMoney+b.jine from [member] a,[dingdan] b where a.id=b.uid and (b.zt=2 or b.zt=3) and (b.zflx=2 or b.zflx=3) and ddh='"&ddh&"'"
conn.execute "update [member] set GiftPrice=GiftPrice+b.jine2 from [member] a,[dingdan] b where a.id=b.uid and (b.zt=2 or b.zt=3) and b.zflx=1 and ddh='"&ddh&"'"
conn.execute "update [member] set UserMoney=UserMoney+b.jine,GiftPrice=GiftPrice+b.jine2 from [member] a,[dingdan] b where a.id=b.uid and (b.zt=2 or b.zt=3) and (b.zflx=7 or b.zflx=8) and ddh='"&ddh&"'"
conn.execute "update [jifen] set zt=3,ctime=getdate(),czr='系统',bz='订单已作废退款' where ddh='"&ddh&"'"
conn.execute "delete from [yonjin] where jsdh='"&ddh&"'"
conn.execute "update [gouwuche] set etime=getdate(),yjzt=4 where yjzt<4 and ddh='"&ddh&"'"
rs("zt")=4
else
rs("zt")=7
end if
rs("etime")=now()
rs.update
end if
rs.close
set rs=nothing
else
conn.execute "update [dingdan] set zt=7,etime=getdate() where zt<2 and id="&id
end if%>{"flag":1,"msg":"订单作废成功！","date":[]}<%end if
end if

if a="SendOrderFinish" then
id=Request("id")
wlmc=trim(Request("wlmc[]"))
kddh=trim(Request("kddh[]"))
fuyan=trim(Request("fuyan"))
if wlmc<>"" and kddh<>"" then
conn.Execute("update [dingdan] set wlmc='"&wlmc&"',kddh='"&kddh&"',fuyan='"&fuyan&"',zt=3,stime=getdate() where id="&id&" and siteid="&siteid)%>{"flag":1,"msg":"订单发货完成！","date":[]}<%end if
end if

if a="cart_havepromotion" then
zje=0
znum=0
itemkeylist=request("itemkeylist[]")
if itemkeylist="" or isnull(itemkeylist) then
%>{"Price":<%=FormatNumber(zje,2,-1,-1,0)%>,"Coupon":null,"SelectNum":<%=znum%>}<%else
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
set rs=server.createobject("adodb.recordset")
exec="select * from [gouwuche] where siteid="&siteid&" and ddh is null and uid="&int(uid)&" and id in ("&itemkeylist&") order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
for i=1 to rssum
znum=znum+rs("sl")
zje=zje+rs("zj")
zje2=zje2+rs("zj2")
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if
%>{"Price":<%=FormatNumber(zje,2,-1,-1,0)%>,"Coupon":null,"SelectNum":<%=znum%>}<%
end if
end if

if a="cheackOrderDel" then
id=Request("id")
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if isnumeric(id) then
if instr(cwadmin,"|"&uid&"|")>0 then
ddh=getddh(id,5)
conn.execute "delete from [yonjin] where jsdh='"&ddh&"'"
conn.execute "delete from [gouwuche] where ddh='"&ddh&"'"
conn.execute "delete from [dingdan] where zt<5 and id="&id
conn.execute "update [jifen] set zt=3,bz='订单已删除' where ddh='"&ddh&"'"
else
ddh=getddh(id,2)
conn.execute "delete from [gouwuche] where ddh='"&ddh&"' and uid="&uid
conn.execute "delete from [dingdan] where zt<2 and id="&id&" and uid="&uid
end if%>{"flag":1,"msg":"订单删除成功！","date":[]}<%end if
end if

'资金处理
uid=0
xm=""
jine=0
if request("uid")<>"" then uid=int(request("uid"))
if request("xm")<>"" then xm=chkstr(request("xm"))
if request("jine")<>"" then jine=CCur(request("jine"))
wxzjdh=trim(request("zjdh"))
wxzjzt=trim(request("zjzt"))
'发起微信支付
if a="wxpay" and xm<>"" and jine>0 and wxzjdh<>"" and uid>0 then
skey=request("skey")
if Request.ServerVariables("HTTP_REFERER")="" and skey<>"zgxnnj" and skey<>"csnic" then
response.redirect "/"
response.end
end if
if Left(xm,1)="W" then
'充值处理
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.Open "select * from yonjin where uid="&int(uid)&" and lx=1 and zt=0 and jsdh='"&xm&"'",conn,1,2
if not(rs.bof and rs.eof) then
rs("czdh")=wxzjdh
rs("jine")=jine
rs("pay_id")=3
rs("atime")=now()
wxzjzt=rs("zt")
zjid=rs("id")
rs.update
else
rs.addnew
rs("uid")=int(uid)
rs("jsdh")=xm
rs("czdh")=wxzjdh
rs("jine")=jine
rs("pay_id")=3
rs("lx")=1
rs("atime")=now()
rs.update
rs.movelast
zjid=rs("id")
wxzjzt=0
end if
rs.close
set rs=nothing

else

'订单消费
Set rs = Server.CreateObject("ADODB.RecordSet")
rs.Open "select * from dingdan where uid="&int(uid)&" and zt<2 and ddh='"&xm&"'",conn,1,2
if not(rs.bof and rs.eof) then
rs("payddh")=wxzjdh
rs("payjine")=jine
rs("zflx")=3
rs("ptime")=now()
wxzjzt=rs("zt")
zjid=rs("id")
rs.update
else
rs.addnew
rs("uid")=int(uid)
rs("ddh")=ddh
rs("zflx")=3
rs("payddh")=wxzjdh
rs("payjine")=jine
rs("atime")=now()
rs("siteid")=siteid
rs.update
rs.movelast
zjid=rs("id")
wxzjzt=1
end if
rs.close
set rs=nothing

end if
%>{"uid":"<%=uid%>","zjid":"<%=zjid%>","zjkey":"<%=zjkey%>","wxzjdh":"<%=wxzjdh%>"}
<%end if

'支付成功更新
if a="zjgx" and wxzjzt<>"" and wxzjdh<>"" then
skey=request("skey")
if Request.ServerVariables("HTTP_REFERER")="" and skey<>"zgxnnj" and skey<>"csnic" then
response.redirect "/"
response.end
end if
'消费订单更新
set zjrs=server.createobject("adodb.recordset") 
zjsql="select * from dingdan where payddh='"&wxzjdh&"'"
zjrs.open zjsql,conn,1,3 
if not(zjrs.bof and zjrs.eof) then
ddh=zjrs("ddh")
if wxzjzt="SUCCESS" and zjrs("zt")<2 then
conn.execute "update [yonjin] set zt=1,pay_id=3,etime=getdate() where jsdh='"&ddh&"'" '更新消费记录生效
zjrs("zt")=2 '已付款状态
zjrs("ptime")=now() '付款成功时间
zjrs.update
end if
end if 
zjrs.close
set zjrs=nothing
'充值订单更新
set zjrs=server.createobject("adodb.recordset") 
zjsql="select * from yonjin where czdh='"&wxzjdh&"' and lx=1"
zjrs.open zjsql,conn,1,3 
if not(zjrs.bof and zjrs.eof) then
jsdh=zjrs("jsdh")
uid=zjrs("uid")
jine=zjrs("jine")
if wxzjzt="SUCCESS" and zjrs("zt")=0 then
conn.execute "update [member] set UserMoney=UserMoney+"&jine&" where id="&uid '更新用户余额
zjrs("zt")=1 '已付款状态
zjrs("etime")=now() '付款成功时间
zjrs.update
end if
end if 
zjrs.close
set zjrs=nothing
%>{"zjdh":"<%=wxzjdh%>","zjzt":"<%=wxzjzt%>","skey":"<%=skey%>"}
<%end if

'输出分类中的品牌
if a="brandcatidapi" then
catid=request("catid")
brandid=request("brandid")
if brandid="" then brandid=0
if catid="" then catid=0
if catid=0 then

else
catlist=getzcat(catid)
if catlist<>"" and isnull(catlist)=false then
zcatlist=SPLIT(catlist,",")
for z=1 to Ubound(zcatlist)
zcatsql=zcatsql&" or catid="&SPLIT(catlist,",")(z)
next
end if
StrWhere=" and (catidlist like '%|"&catid&"|%' or catid="&catid&")"
if zcatsql<>"" then StrWhere=" and (catidlist like '%|"&catid&"|%' or catid="&catid&zcatsql&")"
end if
set rs=server.createobject("adodb.recordset")
exec="select * from brand where hide=0"&StrWhere&" order by brandorder"	
rs.open exec,conn,1,1
if rs.recordcount>0 then
i=1%>[<%do while not rs.eof
if i=1 then%>{"brandID":<%=rs("id")%>,"brandName":"<%=rs("brand")%>"}<%else%>,{"brandID":<%=rs("id")%>,"brandName":"<%=rs("brand")%>"}<%end if
i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing%>]<%else%>[{"brandID":0,"brandName":"此分类下无品牌"}]<%end if
end if

'输出子分类
if a="selectcatidapi" then
catid=request("catid")
catidlist=request("catidlist")
if catid="" then catid=0
if catid>0 then
set rs=server.createobject("adodb.recordset")
exec="select * from [category] where hide=0 and ParentID="&catid&" order by categoryorder"	
rs.open exec,conn,1,1
if rs.recordcount>0 then
i=1%>[<%do while not rs.eof
if i=1 then%>{"CatID":<%=rs("id")%>,"CatName":"<%=rs("category")&rs("id")%>"}<%else%>,{"CatID":<%=rs("id")%>,"CatName":"<%=rs("category")&rs("id")%>"}<%end if
i=i+1	
rs.movenext
Loop
rs.close
set rs=nothing%>]<%else%>[{"CatID":0,"CatName":"已无子分类"}]<%
end if
else%>[{"CatID":0,"CatName":"已无子分类"}]<%
end if
end if

if a="site_user" then
islogin=false
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if uid>0 then islogin=true
if islogin=false then%>{"code":0,"data":{"cart":{"goods_count":0},"message":{"internal_count":"0"},"default_keywords":[{"keyword":"肥料","url":"plist.asp?act=0&amp;key=肥料"},{"keyword":"农机具","url":"plist.asp?act=0&amp;key=农机具"},{"keyword":"水果","url":"plist.asp?act=0&amp;key=水果"},{"keyword":"米面粮油","url":"plist.asp?act=0&amp;key=米面粮油"}],"hot_keywords":[{"id":"1","keyword":"农药","show_words":"农药","url":"/plist.asp?act=0&amp;key=农药"},{"id":"17","keyword":"化肥","show_words":"化肥","url":"/plist.asp?act=0&amp;key=化肥"}],"search_records":[<%=Session("keylist")%>],"show_keywords":{"id":"3","keyword":"绿色食品","show_words":"绿色食品","url":"/plist.asp?act=0&amp;key=绿色食品"},"site_id":1,"region_code":"61,01","site_change":"<!--站点 start-->\n<div class=\"SZY-SUBSITE\">\n\t\n\t\n\t\t<ul class=\"fl\">\n\t\t<li class=\"dorpdown\" id=\"city-choice\">\n\t\t\t<dt class=\"sc-icon\">\n\t\t\t\t<div class=\"sc-choie\">\n\t\t\t\t\t<i class=\"iconfont color\">&#xe6a7;<\/i>\n\t\t\t\t\t<span class=\"ui-areamini-text\" data-id=\"2\" title=\"\">总站&nbsp;&nbsp;&nbsp;<\/span>\n\t\t\t\t<\/div>\n                <div class=\"dd-spacer\"><\/div>\n\t\t\t<\/dt>\n\t\t\t<dd class=\"dorpdown-layer\">\n\t\t\t\t<div class=\"ui-areamini-content-wrap\" id=\"ui-content-wrap\">\n\t\t\t\t\t<!--当站点少的活，以dl下展示形式展示，如果展示多的话，以ul下的li展示形式展示-->\n\t\t\t\t\t\n\t\t\t\t\t<dl>\n\t\t\t\t\t\t<dt>站点<\/dt>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t<dd>\n\t\t\t\t\t\t\t<a href=\"\/NM\/trade\">内蒙分站<\/a>\n\t\t\t\t\t\t<\/dd><dd>\n\t\t\t\t\t\t\t<a href=\"\/SX\/trade\">陕西分站<\/a>\n\t\t\t\t\t\t<\/dd><dd>\n\t\t\t\t\t\t\t<a href=\"\/GD\/trade\">广东站<\/a>\n\t\t\t\t\t\t<\/dd><dd>\n\t\t\t\t\t\t\t<a href=\"\/FJ\/trade\">福建站<\/a>\n\t\t\t\t\t\t<\/dd>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t<dd>\n\t\t\t\t\t\t\t<a href=\"\/CN\/trade\">总站<\/a>\n\t\t\t\t\t\t<\/dd>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t<\/dl>\n\t\t\t\t\t\n\t\t\t\t<\/div>\n\t\t\t<\/dd>\n\t\t<\/li>\n\t<\/ul>\n\t\t\n<\/div>\n<!--站点 end-->"},"message":""}<%elseif islogin then%>{"code":0,"data":{"cart":{"goods_count":<%Set dfrs = Server.CreateObject("ADODB.RecordSet")
dfrs.Open "select * from [gouwuche] where uid="&uid&" and (ddh is null or ddh='') and siteid="&siteid,conn,1,1
response.write dfrs.recordcount
dfrs.Close
set dfrs=nothing%>},"message":{"internal_count":"1"},"default_keywords":[{"keyword":"肥料","url":"plist.asp?act=0&amp;key=肥料"},{"keyword":"农机具","url":"plist.asp?act=0&amp;key=农机具"},{"keyword":"水果","url":"plist.asp?act=0&amp;key=水果"},{"keyword":"米面粮油","url":"plist.asp?act=0&amp;key=米面粮油"}],"hot_keywords":[{"id":"1","keyword":"农药","show_words":"农药","url":"/plist.asp?act=0&amp;key=农药"},{"id":"17","keyword":"化肥","show_words":"化肥","url":"/plist.asp?act=0&amp;key=化肥"}],"search_records":[<%=Session("keylist")%>],"show_keywords":{"id":"15","keyword":"<%=Session("key")%>","show_words":"<%=Session("key")%>","url":"/plist.asp?act=0&amp;key=<%=Session("key")%>"},"site_id":1,"region_code":"61,01","site_change":"<!--站点 start-->\n<div class=\"SZY-SUBSITE\">\n\t\n\t\n\t\t<ul class=\"fl\">\n\t\t<li class=\"dorpdown\" id=\"city-choice\">\n\t\t\t<dt class=\"sc-icon\">\n\t\t\t\t<div class=\"sc-choie\">\n\t\t\t\t\t<i class=\"iconfont color\">&#xe6a7;<\/i>\n\t\t\t\t\t<span class=\"ui-areamini-text\" data-id=\"2\" title=\"\">总站&nbsp;&nbsp;&nbsp;<\/span>\n\t\t\t\t<\/div>\n                <div class=\"dd-spacer\"><\/div>\n\t\t\t<\/dt>\n\t\t\t<dd class=\"dorpdown-layer\">\n\t\t\t\t<div class=\"ui-areamini-content-wrap\" id=\"ui-content-wrap\">\n\t\t\t\t\t<!--当站点少的活，以dl下展示形式展示，如果展示多的话，以ul下的li展示形式展示-->\n\t\t\t\t\t\n\t\t\t\t\t<dl>\n\t\t\t\t\t\t<dt>站点<\/dt>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t<dd>\n\t\t\t\t\t\t\t<a href=\"\/NM\/trade\">内蒙分站<\/a>\n\t\t\t\t\t\t<\/dd><dd>\n\t\t\t\t\t\t\t<a href=\"\/SX\/trade\">陕西分站<\/a>\n\t\t\t\t\t\t<\/dd><dd>\n\t\t\t\t\t\t\t<a href=\"\/GD\/trade\">广东站<\/a>\n\t\t\t\t\t\t<\/dd><dd>\n\t\t\t\t\t\t\t<a href=\"\/FJ\/trade\">福建站<\/a>\n\t\t\t\t\t\t<\/dd>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t\t<dd>\n\t\t\t\t\t\t\t<a href=\"\/CN\/trade\">总站<\/a>\n\t\t\t\t\t\t<\/dd>\n\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t\t<\/dl>\n\t\t\t\t\t\n\t\t\t\t<\/div>\n\t\t\t<\/dd>\n\t\t<\/li>\n\t<\/ul>\n\t\t\n<\/div>\n<!--站点 end-->","user_name":"<%=telephone%>","headimg":"http:\/\/thirdwx.qlogo.cn\/mmopen\/vi_32\/GCiaODrDB8pNXtyYP54rb928AOyxtEoQU6ogtClvK2otsO5KciahJRTibWKv5RU1iabNFJBZMMaZwZPunLXkTFIY1w\/132","last_time":1532911704,"last_ip":"223.73.193.33","last_region_code":null,"user_rank":{"rank_id":"1","rank_name":"注册会员","rank_img":"http:\/\/images.zgnmzymyw.com\/user\/rank\/2017\/06\/29\/14987162908005.jpg","min_points":"0","max_points":"1","type":"0","is_special":"0"},"last_time_format":"2018-07-30 08:48:24"},"message":""}<%
end if
end if

if a="delete-recordapi" then
keylist=Session("keylist")
data=request("data")
key=SPLIT(keylist,",")(int(data))
keylist=Replace(keylist,","&key,"")
Session("keylist")=Replace(keylist,key&",","")%>{"code":0,"data":null,"message":""}<%
end if

if a="pcart" then
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if telephone="" or isnull(telephone) then
%>{"code":0,"data":"/login","message":"请先登陆!"}<%
Response.end
end if
d=replace(d,".html","")
if d="quick-buy" or d="add" then
goods_id=Request("goods_id")
pid=Request("pid")
num=Request("number")
sku_id=Request("sku_id[]")
if sku_id="" or isnull(sku_id) then sku_id="0"
'sku_id=int(getnumb(sku_id))
if pid="" then pid=goods_id
if pid<>"" then pid=int(pid)
if num<>"" then num=Cint(num)
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
end if
if pid<>"" and num<>"" then
scolors=Request("scolors")
ssizes=Request("ssizes")
set rs=server.createobject("adodb.recordset")
exec="select * from [product] where siteid="&siteid&" and id="&pid	
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
colors=rs("colors")
sizes=rs("sizes")
sklist=colors&"|"&sizes
if instr(sku_id,",")>0 then
sku_sm=split(sklist,"|")(int(split(sku_id,",")(0)))
sku_sm=sku_sm&"|"&split(sklist,"|")(int(split(sku_id,",")(1)))
else
sku_sm=split(sklist,"|")(int(sku_id))
end if
pname=rs("name")
price2=FormatNumber(rs("price2"),2,-1,-1,0)
price3=FormatNumber(rs("price3"),2,-1,-1,0)
jifen1=rs("jifen1")
jifen3=rs("jifen3")
ghsid=rs("ghsid")
kucun=rs("kucun")
Fanli=rs("Fanli")
xslx=rs("xslx")
end if
rs.close
set rs=nothing
if isnull(Fanli) or Fanli="" then
Fanli=getpubFanli(xslx)
else
Fanli="|"&Fanli&"|"
end if
shrlb=getshrlb(uid)
if kucun>0 then
if isgwc(pid,num,uid,sku_id) then
conn.Execute("update [gouwuche] set sl = sl+"&num&",dj="&price2&",dj2="&jifen3&",yh=0,yh2="&jifen1&",zj="&price2&"*("&num&"+sl),zj2="&jifen3&"*("&num&"+sl),cb="&price3&",zcb="&price3&"*("&num&"+sl),atime=getdate(),ghsid="&int(ghsid)&",sku_sm='"&sku_sm&"',ly=1,xslx="&xslx&",Fanli='"&Fanli&"',shrlb='"&shrlb&"' where ("&num&"+sl)>0 and pid="&pid&" and ddh is null and uid="&uid&" and sku_id='"&sku_id&"' and siteid="&siteid)
else
conn.execute("insert into [gouwuche] (pid,uid,sl,dj,dj2,yh,yh2,zj,zj2,ghsid,sku_sm,sku_id,ly,xslx,Fanli,shrlb,cb,zcb,siteid) values("&pid&","&uid&","&num&","&price2&","&jifen3&",0,"&jifen1&","&price2*num&","&jifen3*num&","&int(ghsid)&",'"&sku_sm&"','"&sku_id&"',1,"&xslx&",'"&Fanli&"','"&shrlb&"',"&price3&","&price3*num&","&siteid&")") 
end if
if d="quick-buy" then
dataurl="""/u_cart"""
else
dataurl="null"
end if%>{"code":0,"data":<%=dataurl%>,"message":"加入购物车成功"}<%
else%>{"code":-1,"data":null,"message":"商品库存不足"}<%
end if
end if

end if
end if

if a="goods_change-location" then%>{"code":0,"data":{"freight_fee":100,"freight_info":"运费：￥100.00","limit_sale":0,"goods_number":"0","free_list":[]},"message":""}<%
end if

if a="pgoods-comment" then%>{"code":0,"data":"\n<div class=\"evaluate\">\n\t<h3 class=\"color\">商品评价<\/h3>\n\t<div class=\"comment-mod\">\n\t\t<div class=\"comment-grade\">\n\t\t\t<div class=\"rate-score\">\n\t\t\t\t<h4>宝贝与描述相符<\/h4>\n\t\t\t\t<strong>5.00<\/strong>\n\t\t\t\t<p>\n\t\t\t\t\t<span class=\"score-value-no\">\n\t\t\t\t\t\t\n\t\t\t\t\t\t<em style='width: 100%;'><\/em>\n\t\t\t\t\t<\/span>\n\t\t\t\t<\/p>\n\t\t\t<\/div>\n\t\t\t<div class=\"rate-graph\">\n\t\t\t\t<div class=\"graph-scroller\">\n\t\t\t\t\t<span style='width: 100%;'>\n\t\t\t\t\t\t<em>\n\t\t\t\t\t\t\t5.00\n\t\t\t\t\t\t\t<i>▼<\/i>\n\t\t\t\t\t\t<\/em>\n\t\t\t\t\t<\/span>\n\t\t\t\t<\/div>\n\t\t\t\t<ul class=\"graph-desc\">\n\t\t\t\t\t<li>非常不满<\/li>\n\t\t\t\t\t<li>不满意<\/li>\n\t\t\t\t\t<li>一般<\/li>\n\t\t\t\t\t<li>满意<\/li>\n\t\t\t\t\t<li>非常满意<\/li>\n\t\t\t\t<\/ul>\n\t\t\t<\/div>\n\t\t\t<!--   -->\n\t\t<\/div>\n\t\t<div class=\"comment-type\">\n\t\t\t<ul class=\"tab-nav\">\n\t\t\t\t<li class=\"current\" data-type=\"0\">\n\t\t\t\t\t<i class=\"icon cur\"><\/i>\n\t\t\t\t\t全部\n\t\t\t\t<\/li>\n\t\t\t\t<li data-type=\"1\">\n\t\t\t\t\t<i class=\"icon\"><\/i>\n\t\t\t\t\t图片\n\t\t\t\t\t<em>（0）<\/em>\n\t\t\t\t<\/li>\n\t\t\t\t<li data-type=\"2\">\n\t\t\t\t\t<i class=\"icon\"><\/i>\n\t\t\t\t\t好评\n\t\t\t\t\t<em>（0）<\/em>\n\t\t\t\t<\/li>\n\t\t\t\t<li data-type=\"3\">\n\t\t\t\t\t<i class=\"icon\"><\/i>\n\t\t\t\t\t中评\n\t\t\t\t\t<em>（0）<\/em>\n\t\t\t\t<\/li>\n\t\t\t\t<li data-type=\"4\">\n\t\t\t\t\t<i class=\"icon\"><\/i>\n\t\t\t\t\t差评\n\t\t\t\t\t<em>（0）<\/em>\n\t\t\t\t<\/li>\n\t\t\t<\/ul>\n\t\t<\/div>\n\t\t<!-- 有评论的的展示形式 _star -->\n\t\t\n\t\t<div id=\"comment_content\">\n\t\t\t\n\t\t\t<div class=\"tip-box\">\n\t\t\t\t<img src=\"\/nong\/images\/noresult.png\" class=\"tip-icon\" \/>\n\t\t\t\t<div class=\"tip-text\">还没有任何评价哦<\/div>\n\t\t\t<\/div>\n\t\t\t<!-- -->\n\n\t\t<\/div>\n\t\t\n\t<\/div>\n<\/div>\n\n<link rel=\"stylesheet\" href=\"\/nong\/css\/highslide.css?v=20180702\"\/>\n<script src=\"\/nong\/js\/highslide-with-gallery.js?v=20180813\"><\/script>\n<script src=\"\/nong\/js\/jquery.tablelist.js?v=20180813\"><\/script>\n<script type=\"text\/javascript\">\n\t$().ready(function() {\n\t\t$(\"#evaluate_count\").html(\"累计评价(0)\");\n\t\t$(\"#evaluate_num\").html(\"0人评价\");\n\n\t});\n<\/script>\n<script type=\"text\/javascript\">\n\tvar tablelist = $(\".tablelist\").tablelist({\n\t\turl: '\/goods\/comment?sku_id=4652'\n\t});\n\n\t$(\".comment-type li\").click(function() {\n\t\tvar type = $(this).data(\"type\");\n\t\tvar target = $(this);\n\n\t\t$(\".comment-type\").find(\"li\").removeClass(\"current\");\n\t\t$(\".comment-type\").find(\"i\").removeClass(\"cur\");\n\t\t$(target).addClass(\"current\");\n\t\t$(target).children().addClass(\"cur\");\n\n\t\ttablelist.load({\n\t\t\ttype: type\n\t\t}, function(result) {\n\t\t\tif (result.code == 0) {\n\t\t\t\t$(\"#comment_content\").html(result.data);\n\t\t\t\t\/\/ 重新初始化\n\t\t\t\ttablelist = $(\".tablelist\").tablelist({\n\t\t\t\t\turl: '\/goods\/comment?sku_id=4652'\n\t\t\t\t});\n\t\t\t}\n\t\t});\n\t})\n<\/script>\n\n<script type=\"text\/javascript\">\n\t\/\/图片弹窗\n\ths.graphicsDir = '\/nong\/js\/graphics\/';\n\ths.align = 'center';\n\ths.transitions = ['expand', 'crossfade'];\n\ths.outlineType = 'rounded-white';\n\ths.fadeInOut = true;\n\n\ths.addSlideshow({\n\t\tinterval: 5000,\n\t\trepeat: false,\n\t\tuseControls: true,\n\t\tfixedControls: 'fit',\n\t\toverlayOptions: {\n\t\t\topacity: .75,\n\t\t\tposition: 'bottom center',\n\t\t\thideOnMouseOut: true\n\t\t}\n\t});\n<\/script>","message":""}<%
end if

if a="pgoods-sku" then%>{"code":0,"data":{"sku_id":"4652","goods_id":"3146","sku_name":"德国拜耳 露娜润 露娜森升级 香蕉斑点病白粉病农药杀菌剂100ml 100ml\/瓶","sku_image":"\/shop\/643\/gallery\/2017\/12\/15\/15133246532419.jpg","goods_price":"76.00","original_price":"76.00","market_price":"0.00","goods_number":"0","original_number":"99","spec_ids":["1729"],"is_enable":1,"goods_image":"\/shop\/643\/gallery\/2017\/12\/19\/15136627626686.jpg","shop_id":"643","goods_status":"1","goods_audit":"1","act_id":"0","order_act_id":"0","goods_moq":"1","user_discount":"0","freight_id":"272","unit_name":null,"is_supply":"0","show_price":"1","show_content":null,"button_content":null,"button_url":null,"start_price":"0.00","sales_model":"0","goods_mix":[],"market_price_format":"￥0.00","sku_images":[["http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133246532419.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_80,w_80","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133246532419.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_450,w_450","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133246532419.jpg"],["http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247556697.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_80,w_80","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247556697.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_450,w_450","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247556697.jpg"],["http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247642121.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_80,w_80","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247642121.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_450,w_450","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247642121.jpg"],["http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247695533.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_80,w_80","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247695533.jpg?x-oss-process=image\/resize,m_pad,limit_0,h_450,w_450","http:\/\/zhenbainong.oss-cn-beijing.aliyuncs.com\/images\/shop\/643\/gallery\/2017\/12\/15\/15133247695533.jpg"]],"spec_attr_value":"100ml\/瓶","gift_list":[],"purchase_num":0,"activity":null,"order_activity":null,"original_price_format":"￥76.00","goods_price_format":"￥76.00","rank_prices":null,"price_show":{"code":1},"buy_enable":{"code":1,"button_content":"请登录"}},"message":""}<%
end if

if a="pgoods-desc" then
pid=request("pid")
if pid="" then pid=0
if pid<>"" then pid=int(pid)
if pid>0 then
set rs=server.createobject("adodb.recordset")
exec="select * from [product] where siteid="&siteid&" and id="&pid	
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
pname=rs("name")
pic1=rs("pic1")
pic2=rs("pic2")
Descriptions=rs("Descriptions")
price1=rs("price1")
price2=FormatNumber(rs("price2"),2,-1,-1,0)
kdlist="<option value=\""3|"&tounicode("顺丰")&"\"">"&tounicode("顺丰快递")&"<\/option>"
ordercount=int(rs("ordercount"))
kucun=rs("kucun")
llsm=""'tounicode("包装箱内的商品之间加塞填充物，保证不破损，不串味，汁液不渗漏商品内包装材料全部使用PE（聚乙烯）保鲜膜，拒绝使用含有致癌物的PVC（聚氯乙烯）使用可插型密闭箱，运输途中全 程密闭，默认发顺丰快递，顺丰不到不发货，确保用户订购的商品新鲜到家。")
content=Replace(rs("content"),"/","\/")
content=Replace(content,Chr(34),"\"&Chr(34))
'content=Replace(content,chr(255),"\t")
content=Replace(content,vbcrlf,"\n")
end if
rs.close
set rs=nothing
else
content="整理中……"
end if%>{"code":0,"data":null,"message":"","pc_desc":"<%=content%>","mobile_desc":null,"desc_type":0,"need_load":0}<%end if

if a="payoutapi" then
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
jine=Request("amount")
sname=Request("sname")
khh=Request("khh")
khzh=Request("khzh")
bz=Request("bz")
ddh=Left("D"&Month(Now)&Day(Now)&Hour(Now)&Minute(Now)&Second(Now)&randStr(6,"NUMB"),13)
if jine="" or sname="" or khh="" or khzh="" then%>{"flag":0,"msg":"系统开小差了！","date":[]}<%
else
yue=getyue(uid)
if ccur(jine)<=ccur(yue) then
conn.execute "update [member] set UserMoney=UserMoney-"&ccur(jine)&" where id="&uid
conn.execute("insert into [tixian] (uid,ddh,fyue,jine,byue,sname,khh,khzh,bz,siteid) values("&uid&",'"&ddh&"',"&yue&","&-ccur(jine)&","&yue-ccur(jine)&",'"&sname&"','"&khh&"','"&khzh&"','"&bz&"',"&siteid&")")
conn.execute("insert into [yonjin] (uid,jsdh,fyue,jine,byue,lx,zt,etime,siteid) values("&uid&",'"&ddh&"',"&yue&","&-ccur(jine)&","&yue-ccur(jine)&",3,1,getdate(),"&siteid&")")
end if%>{"flag":1,"msg":"申请成功，请等待审核！","date":[]}<%end if
end if

'兑付处理
if a="fkcl" or a="yfk" or a="wfk" then
teh=chkadmin()
if teh<>"" then
czr=SPLIT(teh,"&")(0)
adminid=SPLIT(teh,"&")(5)
end if
id=request("id")
if id="" or isnull(id) then
id=0
else
id=int(id)
end if
if czr="" or isnull(czr) then
%>{"flag":0,"msg":"登陆超时，请重新登陆后再试！","date":[]}<%
Response.end
end if
end if
if a="fkcl" and id>0 and czr<>"" and adminid<>"" and instr(cwadmin,"|"&adminid&"|")>0 then%>{"flag":1,"msg":"处理中操作已完成！","date":[]}<%
conn.Execute("update [tixian] set zt=1,czr='"&czr&"',stime=getdate() where id="&id)
end if
if a="yfk" and id>0 and czr<>"" and adminid<>"" and instr(cwadmin,"|"&adminid&"|")>0 then%>{"flag":1,"msg":"已付款操作已完成！","date":[]}<%
conn.Execute("update [tixian] set zt=2,etime=getdate() where id="&id&" and czr='"&czr&"'")
end if
if a="wfk" and id>0 and czr<>"" and adminid<>"" and instr(cwadmin,"|"&adminid&"|")>0 then%>{"flag":1,"msg":"拒绝提现操作完成！","date":[]}<%
conn.Execute("update [tixian] set zt=3,etime=getdate() where id="&id&" and czr='"&czr&"'")
Set rs = Server.CreateObject( "ADODB.Recordset" )
sql="Select * from [tixian] where zt=3 and id="&id
rs.open sql,conn,1,1
if not (rs.bof and rs.eof) then
uid=rs("uid")
jine=rs("jine")
conn.execute "update [member] set UserMoney=UserMoney+"&ccur(abs(jine))&" where id="&uid
end if
rs.close
set rs=nothing
end if

'上下架
if a="sxj" then
id=request("id")
onsale=request("onsale")
if onsale="1" then conn.Execute("update [product] set onsale=0 where id="&id)
if onsale="0" then conn.Execute("update [product] set onsale=1 where id="&id)%>{"flag":1,"msg":"操作已完成！","date":[]}<%
end if

'购物车清单
if a="box-goods-list" then
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if telephone<>"" and uid<>"" then
set rs=server.createobject("adodb.recordset")
exec="select * from [gouwuche] where siteid="&siteid&" and (ddh is null or ddh='') and uid="&int(uid)&" order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
for i=1 to rssum
pname=""
pimg=""
price2=""
jifen3=""
jifen1=""
proinfo=getproinfo(rs("pid"))
if proinfo<>"" then
pname=SPLIT(proinfo&"||||||||","||")(0)
pimg=SPLIT(proinfo&"||||||||","||")(1)
price2=SPLIT(proinfo&"||||||||","||")(2)
jifen3=SPLIT(proinfo&"||||||||","||")(3)
jifen1=SPLIT(proinfo&"||||||||","||")(4)
end if
znum=znum+rs("sl")
zje=zje+(rs("sl")*rs("dj"))
plist=plist&"<li ><div class=\""p-img\""><a href=\""\/trade\/goods-"&rs("pid")&".html\"" target=\""_blank\""><img src=\"""&Replace(pimg,"/","\/")&"\"" width=\""50\"" height=\""50\"" alt=\""\""><\/a><\/div><div class=\""p-name\""><a href=\""\/trade\/goods-"&rs("pid")&".html\"" title=\"""&Replace(pname,"/","\/")&"\"" target=\""_blank\"">"&left(Replace(pname,"/","\/"),7)&"..<br>"&rs("sku_sm")&"<\/a><\/div><div class=\""p-detail\""><span class=\""p-price\""><strong class=\""second-color\"">￥"&gshjg(price2)&"<\/strong>\n\t\t\t\t\t×"&rs("sl")&"\n\t\t\t\t<\/span>\n\t\t\t\t<br>\n\t\t\t\t<a class=\""delete\"" href=\""javascript:void(0)\"" onClick=\""$.cart.remove('"&rs("id")&"')\"">删除<\/a>\n\t\t\t<\/div>\n\t\t<\/li>"
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if
end if
if rssum>0 then%>{"code":0,"data":["\n<div class=\"dropdown-title\">\n\t<h4 class=\"fl\">购物清单<\/h4>\n<\/div>\n<div class=\"dropdown-goods-list\">\n\t<ul><%=plist%><\/ul>\n<\/div>\n<div class=\"dropdown-footer clearfix\">\n\t<div class=\"p-total\">\n\t\t共\n\t\t<b class=\"second-color\"><%=znum%><\/b>\n\t\t件商品 共计\n\t\t<strong class=\"second-color\">￥<%=gshjg(zje)%><\/strong>\n\t<\/div>\n\t<a href=\"\/u_cart\" title=\"去购物车\" class=\"bg-color\">去购物车<\/a>\n<\/div>\n",""],"message":"","count":<%=znum%>,"amount":<%=gshjg(zje)%>}<%else
%>{"code":0,"data":["\n<!-- 购物车为空 -->\n<div class=\"cart-type\">\n\t<i class=\"cart-type-icon\"><\/i>\n\t<div class=\"cart-type-text\">\n\t\t您的购物车里什么都没有哦\n\t\t<br \/>\n\t\t<a class=\"color\" href=\"\/trade\/product-1.html\" title=\"再去看看吧\" target=\"_blank\">再去看看吧<\/a>\n\t<\/div>\n<\/div>\n","\n\t\t\t<div class=\"cart-panel-main\">\n\t\t\t\t<div class=\"cart-panel-content\">\n\t\t\t\t\t\n\t\t\t\t\t<!-- 没有商品的展示形式 _start -->\n\t\t\t\t\t<div class=\"tip-box\">\n\t\t\t\t\t\t<img src=\"\/images\/noresult.png\" class=\"tip-icon\" \/>\n\t\t\t\t\t\t<div class=\"tip-text\">\n\t\t\t\t\t\t\t您的购物车里什么都没有哦\n\t\t\t\t\t\t\t<br \/>\n\t\t\t\t\t\t\t<a class=\"color\" href=\"\/trade\/product-1.html\" title=\"再去看看吧\" target=\"_blank\">再去看看吧<\/a>\n\t\t\t\t\t\t<\/div>\n\t\t\t\t\t<\/div>\n\t\t\t\t\t<!-- 没有商品的展示形式 _end-->\n\t\t\t\t\t\n\t\t\t\t<\/div>\n\t\t\t<\/div>\n\t\t\t\n\t\t\t"],"message":"","count":0,"amount":0}<%end if
end if

if a="cart-remove" then
cartid=request("cart_ids")
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
if telephone<>"" and uid<>"" then
set rs=server.createobject("adodb.recordset")
exec="select * from [gouwuche] where siteid="&siteid&" and (ddh is null or ddh='') and uid="&int(uid)&" order by id desc"		
rs.open exec,conn,1,1
rssum=rs.recordcount
if rssum>0 then
for i=1 to rssum
znum=znum+rs("sl")
zje=zje+(rs("sl")*rs("dj"))
rs.movenext
if rs.eof then exit for
next
rs.close
set rs=nothing
end if
conn.execute "delete from [gouwuche] where ddh is null and uid="&uid&" and id='"&cartid&"' and siteid="&siteid
end if
%>{"code":0,"data":{"select_goods_number":1,"select_goods_amount":<%=gshjg(zje)%>,"select_goods_amount_format":"￥<%=gshjg(zje)%>","goods_number":<%=znum%>,"goods_price_format":"￥0.00","count":1,"goods_amount":200,"goods_price":"200.00","select_shop_amount":{"8":200},"shop_delivery_enable":{"8":1},"submit_enable":1},"message":"删除成功"}<%end if

'检查订单是否支付完成
if a="payfinishchk" then
id=request("id")
if id="" or isnull(id) then
id=0
else
id=int(id)
end if
lx=request("lx")
if lx="" or isnull(lx) then
lx=0
else
lx=int(lx)
end if
nmw=chknmw()
if nmw<>"" then
uid=SPLIT(nmw&"&&","&")(0)
userno=SPLIT(nmw&"&&","&")(1)
telephone=SPLIT(nmw&"&&","&")(2)
else
uid=0
end if
fail="true"
if id>0 and userno<>"" then
Set pchrs = Server.CreateObject( "ADODB.Recordset" )
if lx=0 then pchsql="Select * from [dingdan] where zt=2 and id="&id
if lx=1 then pchsql="Select * from [yonjin] where lx=1 and zt=1 and id="&id
pchrs.open pchsql,conn,1,1
if not (pchrs.bof and pchrs.eof) then
fail=""
end if
pchrs.close
set pchrs=nothing
if lx=0 then gourl="/orderDetail?act=show&order_id="&id
if lx=1 then gourl="/u_payrecord.php"
%>{"status":"true","Word":"","gourl":"<%=gourl%>","fail":"<%=fail%>"}<%
end if
end if
%>