<!--#include file="ASPIncludes/DBopen.asp"-->
<%

DIM RSCheck
DIM SQL
SET RSCheck=SERVER.CREATEOBJECT("ADODB.RECORDSET")
con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) & "; Encrypt=False;Packet Size=4096"

SQL = "SELECT * FROM TBL_User_Access where User_Name=" & "'" & replace(trim(Request("Username")),"--","") & "'" & "and User_Pwd=" & "'" & Replace(trim(Request("Password")),"--","") & "' and user_type=0"
if (lcase(trim(Request("Username"))) ="jally") then
	Response.redirect "default.asp?message=aut"
end if


RSCheck.OPEN SQL,con,1,2
If Not RSCheck.EOF Then
	session("user_name")=trim(Request("Username"))
	session("user_type")=trim(RSCheck("user_type"))
	set RSCheck=nothing
	con.close()
	Response.redirect "Frm_Biz_view.asp"
Else
	Response.redirect "default.asp?message=invalid"
End If
set RSCheck=nothing
con.close()
%>
