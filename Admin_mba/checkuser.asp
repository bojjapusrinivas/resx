<%@ LANGUAGE="VBScript" %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<%

DIM RSCheck
DIM SQL
SET RSCheck=SERVER.CREATEOBJECT("ADODB.RECORDSET")
con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)
SQL = "SELECT * FROM TBL_User_Access where user_type<10 and User_Name=" & "'" & replace(trim(Request("Username")),"--","") & "'" & "and User_Pwd=" & "'" & Replace(trim(Request("Password")),"--","") & "'"
if (lcase(trim(Request("Username"))) ="jally") then
	Response.redirect "default.asp?message=aut"
end if

RSCheck.OPEN SQL,con,1,2
If Not RSCheck.EOF Then
	session("user_name")=trim(Request("Username"))
	session("user_type")=trim(RSCheck("user_type"))
	session("Display_Type")=trim(RSCheck("Display_Type"))
	set RSCheck=nothing
	con.close()
	Response.redirect "Frm_SIS_Inner.asp"
Else
	Response.redirect "default.asp?message=invalid"
End If
set RSCheck=nothing
con.close()
%>
