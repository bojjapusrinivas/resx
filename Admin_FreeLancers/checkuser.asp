<%@ LANGUAGE="VBScript" %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/Login_IP_Check.asp"-->
<%
DIM RSCheck
DIM SQL
SET RSCheck=SERVER.CREATEOBJECT("ADODB.RECORDSET")
con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
'''''response.write ("Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)) 			
''''''response.end
SQL = "SELECT * FROM TBL_User_Access where User_Name=" & "'" & trim(Request("Username")) & "'" & "and User_Pwd=" & "'" & trim(Request("Password")) & "'"
response.write (sql)
'response.end
RSCheck.OPEN SQL,con,1,2
If Not RSCheck.EOF Then
	session("user_name")=trim(Request("Username"))
	session("user_type")=trim(RSCheck("user_type"))	
	session("freelancer")="yes"
	session("UserCountry")=trim(RSCheck("User_Country"))
	set RSCheck=nothing
	con.close()
	dim CHK_USER_IPADD
	CHK_USER_IPADD = IPAddressCheck()
	if session("user_type") ="4" then
		 Response.redirect "Frm_SIS_Inner.asp"
	else
		''if ucase(trim(CHK_USER_IPADD))="YES" then
			if session("user_type") = "1" then
				 Response.redirect "Frm_SIS_Inner.asp"	
			elseif session("user_type") ="2" then
				 Response.redirect "Frm_SIS_Inner.asp"
			elseif session("user_type") ="3" then
				 Response.redirect "Frm_HydSIS_View_Freelancers.asp"
			
			elseif session("user_type") = "5" then
				 Response.redirect "Frm_SIS_Inner.asp"	
			end If
	''	else
	''			Response.redirect "default.asp?message=aut"
	''	end If
	End if

Else
	Response.redirect "default.asp?message=err"
End If
set RSCheck=nothing
con.close()
%>
