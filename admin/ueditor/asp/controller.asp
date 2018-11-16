<%@ LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><!--#include file="../../../conn.asp"--><!--#include file="../../../config.asp"-->
<%teh=chkadmin()
if teh<>"" then
admin=SPLIT(teh,"&")(0)
sname=SPLIT(teh,"&")(1)
atype=SPLIT(teh,"&")(2)
power=SPLIT(teh,"&")(3)
adminid=SPLIT(teh,"&")(5)
if adminid="" or isnull(adminid) then adminid=0
if atype="" or isnull(atype) then atype=0
if atype=1 then ttype="超级管理员"
if atype=2 then ttype="仓库管理员"
if atype=3 then ttype="业务员"
if atype=5 then ttype="财务"
end if
a=Replace(Request("a"),"?","")
if admin="" or isnull(admin) then
Response.Redirect("/admin/login")
Response.End
end if
    action = Request.Item("action")

    Session.Contents.Remove("ueditor_asp_uploadTemplateName")
    Session.Contents.Remove("ueditor_asp_base64Upload")
    Session.Contents.Remove("ueditor_asp_listTemplateName")


    Select Case action

        Case "config"
            Server.Execute("action_config.asp")

        Case "uploadimage"
            Session.Value("ueditor_asp_uploadTemplateName") = "image"
            Server.Execute("action_upload.asp")

        Case "uploadscrawl"
            Session.Value("ueditor_asp_uploadTemplateName") = "scrawl"
            Session.Value("base64Upload") = "scrawl.png"
            Server.Execute("action_upload.asp")

        Case "uploadvideo"
            Session.Value("ueditor_asp_uploadTemplateName") = "video"
            Server.Execute("action_upload.asp")

        Case "uploadfile"
            Session.Value("ueditor_asp_uploadTemplateName") = "file"
            Server.Execute("action_upload.asp")

        Case "listimage"
            Session.Value("ueditor_asp_listTemplateName") = "image"
            Server.Execute("action_list.asp")

        Case "listfile"
            Session.Value("ueditor_asp_listTemplateName") = "file"
            Server.Execute("action_list.asp")

        Case "catchimage"
            Server.Execute("action_crawler.asp")
    End Select

%>