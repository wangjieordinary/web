<%Dim scriptCtrl
Function parseJSON(str)
If Not IsObject(scriptCtrl) Then
Set scriptCtrl = Server.CreateObject("MSScriptControl.ScriptControl")
scriptCtrl.Language = "JScript"
scriptCtrl.AddCode "Array.prototype.get = function(x) { return this[x]; }; var result = null;"
End If
scriptCtrl.ExecuteStatement "result = " & str & ";"
Set parseJSON = scriptCtrl.CodeObject.result
End Function%>