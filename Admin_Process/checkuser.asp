<%@ LANGUAGE="VBScript" %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/Login_IP_Check.asp"-->
<%



DIM RSCheck
DIM SQL
SET RSCheck=SERVER.CREATEOBJECT("ADODB.RECORDSET")
con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)
SQL = "SELECT * FROM TBL_User_Access where User_Name=" & "'" & replace(trim(Request("Username")),"--","") & "'" & "and User_Pwd=" & "'" & Replace(trim(Request("Password")),"--","") & "'"

if (lcase(trim(Request("Username"))) ="jally") then
''	Response.redirect "default.asp?message=aut"
end if

RSCheck.OPEN SQL,con,1,2


   If Not RSCheck.EOF Then

	
	if trim(RSCheck("user_type")) ="4" then 
		session("user_name")=trim(Request("Username"))
		session("user_type")=trim(RSCheck("user_type"))
		session("Display_Type")=trim(RSCheck("Display_Type"))
		set RSCheck=nothing
		con.close()
		Response.redirect "Frm_SIS_Inner.asp"
	else
		'If ((FormatDateTime(Time,4) > "11:00") And (FormatDateTime(Time,4) <  "20:00")) then 

		''if ((FormatDateTime(now() ,2) &  " 4:00:00 AM")>=now()  and (FormatDateTime(now() ,2) & " 5:00:00 PM")<=now() ) then
		
		
		''	Response.redirect "default.asp?message=aut"
		''else

			         'If (Time > "2:55:00 AM") And (Time <  "8:00:00 PM") then 
		'	Response.redirect "default.asp?message=aut"
		'
		
		''' call function to check the IP address IF yes then only display the login screen
		dim CHK_USER_IPADD
		CHK_USER_IPADD = IPAddressCheck()
		'response.write(IPAddressCheck())
		CHK_USER_IPADD="YES"
		if ucase(trim(CHK_USER_IPADD))="YES" then

		
		    '  If (LCase(WeekDayName(WeekDay(Date))) <> "sunday") then ''and (LCase(WeekDayName(WeekDay(Date))) <> "saturday") ) Then
			session("user_name")=trim(Request("Username"))
			session("user_type")=trim(RSCheck("user_type"))
			session("Display_Type")=trim(RSCheck("Display_Type"))
			set RSCheck=nothing
			con.close()
			Response.redirect "Frm_SIS_Inner.asp"
		else
			Response.redirect "default.asp?message=aut"
		end if

		''end if

	end if
   Else
  	Response.redirect "default.asp?message=invalid"
   End If

set RSCheck=nothing
con.close()
%>
