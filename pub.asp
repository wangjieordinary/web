<%Function getexpressname(express) '通过绑定邮箱获得用户编号
Set gpnrs = Server.CreateObject( "ADODB.Recordset" )
gpnsql="Select * from [express] where id="&int(express)&" and siteid="&siteid
gpnrs.open gpnsql,conn,1,1
if not (gpnrs.bof and gpnrs.eof) then
getexpressname=gpnrs("txtexpressname")
else
getexpressname=""
end if
gpnrs.close
set gpnrs=nothing
End Function

function getNum(str) '提取字串符中的数字
dim re 
set re=new RegExp 
re.pattern="\D" 
re.global=true 
getNum = re.replace(str, "") 
end function

Function RemoveHTML(strHTML)
Dim objRegExp, Match, Matches
Set objRegExp = New Regexp
objRegExp.IgnoreCase = True
objRegExp.Global = True
objRegExp.Pattern = "<.+?>"
Set Matches = objRegExp.Execute(strHTML)
For Each Match in Matches
strHtml=Replace(strHTML,Match.value,"")
Next
RemoveHTML=strHTML
Set objRegExp = Nothing
End Function

Function CnSubString(orgStr, length)
   Dim orgLen, tmpLen, i
   orgLen = Len(orgStr)
   tmpLen = 0
   IF orgLen >= 1 Then
    For i = 1 to orgLen
     IF ASC(Mid(orgStr, i, 1)) < 0 or ASC(Mid(orgStr, i, 1)) >255 Then
      tmpLen = tmpLen + 2
     Else
      tmpLen = tmpLen + 1
     End IF
     IF tmpLen >= length Then
      CnSubString = Left(orgStr, i)
      Exit Function
     End IF
    Next
   Else
    CnSubString = Empty
   End IF
End Function

Function CnLen(orgStr)
   Dim orgLen, tmpLen, i
   orgLen = Len(orgStr)
   tmpLen = 0
   For i = 1 to orgLen
     IF ASC(Mid(orgStr, i, 1)) < 0 or ASC(Mid(orgStr, i, 1)) >255 Then
    tmpLen = tmpLen + 2
     Else
    tmpLen = tmpLen + 1
     End IF
   Next
   CnLen = tmpLen
End Function

Function CnCutString(orgStr, length, fill)
   IF CnLen(orgStr) > length*2 Then
    CnCutString = CnSubString(orgStr, length*2) & fill
   Else
    CnCutString = orgStr
   End IF
End Function

Function getchannel(sid)
if int(sid)=3 then getchannel="news"
if int(sid)=4 then getchannel="help"
if int(sid)=5 then getchannel="eagr"
if int(sid)=6 then getchannel="food"
if int(sid)=7 then getchannel="law"
if int(sid)=8 then getchannel="prore"
if int(sid)=9 then getchannel="afair"
if int(sid)=10 then getchannel="proco"
End Function

function tounicode(str) '中文转unicode
    tounicode=""
    dim i
    for i=1 to len(str)
    'asc函数：返回字符串的第一个字母对应的ANSI字符代码
        'AscW函数：返回每一个GB编码文字的Unicode字符代码
        'hex函数：返回表示十六进制数字值的字符串
        tounicode=tounicode & "\u" & LCase(Right("0000" & Cstr(hex(AscW(mid(str,i,1)))),4))
    next
end function
'\u51cc\u9648\u4eae\u535a\u5ba2
function unicodeto(str) 'unicode转中文
    str=replace(str,"\u","")
    unicodeto=""
    dim i
    for i=1 to len(str) step 4
    'cint函数：将Variant类型强制转换成int类型
        'chr函数：返回数值对应的ANSI编码字符
        'ChrW函数：返回数值对应的Unicode编码字符
        unicodeto=unicodeto & ChrW(cint("&H" & mid(str,i,4)))
    next
end function

function cutStr(str,strlen) 
 If str = "" Then 
 cutStr = "" 'cutStr函数异常：字符串为" 
 exit function 
 End If 
'------------来源长度检查 
 If  strlen = "" Then 
 cutStr = "" 'cutStr函数异常：长度未指" 
 exit function 
 End If  
 If  CInt(strlen) = 0 Then 
 cutStr = "" 'cutStr函数异常：长度为0"
 exit function 
 End If  
'----------检测来源字符长度 
 dim l,t,c,i 
 l=len(str) 
 t=0 
'----------循环截取字符 
if l>0 then
 for i=1 to l 
 c=Abs(Asc(Mid(str,i,1))) 
 '------判断是否汉字 
 if c>255 then 
 t=t+2 
 else 
 t=t+1 
 end If 
 '------判断是否到达指定长度 
 if t>=strlen then 
 cutStr=left(str,i)&".." 
 exit for 
 else 
 cutStr=str 
 end if 
 next 
 cutStr=replace(cutStr,chr(10),"") 
end if
end function

Function GetKey(HTML,Start,Last)  '取两字符中间的字符
filearray=split(HTML,Start) 
filearray2=split(filearray(1),Last) 
GetKey=filearray2(0) 
End Function
%>