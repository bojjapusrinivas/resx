<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
%>
<%
'' delete the record
dim loadedval
loadedval = 0
if trim(request("RecID"))<>"" then
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		set cmdEdit=server.CreateObject("ADODB.Command")
		cmdEdit.ActiveConnection = con			
			with cmdEdit 				
				.CommandText = "SP_TBL_User_Access"
				.CommandType = adcmdStoredProc	
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"DELETE")
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,30,trim(request("RecID")))
				.Parameters.Append .CreateParameter ("@MyUser_Pwd",advarchar,adparamInputOutput,30,"pwd")
				.Parameters.Append .CreateParameter ("@MyUser_Type",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)						
				.Execute			
			end with
		loadedval = cmdEdit.Parameters("@MyResult")
		set cmdEdit = nothing
		con.close()
end if
%>
<html>
<head>
<title>View Analysts Data</title>
<script language="JavaScript">
function Validate(theForm)
{
  if (theForm.ID.value == "")
  {
    alert("Please Enter Candidate ID in the \"Candidate ID\" field.");
    theForm.ID.focus();
    return (false);
  }

return (true);
}
function OpenWin(num)
	{ 
		myWin = open("ApplicantInfo.asp?ID="+num ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
	}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="../ASPIncludes_vizag/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="../ASPIncludes_vizag/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
  <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">View Users</font></big></strong></td>
  </tr>
  <tr align="center">
          <td width="100%" height="21"><font face="verdana" size="2"><a href="Frm_SIS_User.asp"><font face="verdana" size="2"><b>Add</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_View_Users.asp"><font face="verdana" size="2"><b>View</b></font></a></td>
        </tr>
  <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><font color='red'>
    <%if trim(loadedval)="4" then%>
		Record Deleted successfully
    <%end if%>
    </font></p></td>
  </tr>
  <tr>
    <td width="100%"><div align="center"><center>
    <table align="center" width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#f0e5dd" style="border-collapse:collapse;">
	<tr>
		<td colspan="6">
		<%	
		dim rec_per_page
		rec_per_page = 10
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
		Set rsDisp =Server.CreateObject("ADODB.Recordset")
		rsDisp.ActiveConnection = con
		rsDisp.CursorType = 3
		rsDisp.PageSize = cint(rec_per_page)
		usql1="select * from TBL_User_Access order by User_Name desc"
		rsDisp.Open usql1
		''paging
		'rsDisp.movefirst
		rowcount = 0
		Start = 1
		E = cint(rec_per_page)
		i = rsDisp.RecordCount
		p = i
		if i>cint(rec_per_page) then
			Response.Write ("<table width='100%' style='border-collapse:collapse'><tr bgcolor='white'><td><font face=verdana size=2 color=""blue""><b>Pages:")
			for i=1 to rsDisp.PageCount%>			
				<a href="frm_sis_view_users.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&ttype=<%=trim(ucase(request("ttype")))%>"><%=i%></a>			
				<% start = start+cint(rec_per_page)
				E = E+cint(rec_per_page)
			next  
		   	if cp >= 1 then
				Response.Write ("</td><td  align=right width='50%'><font size='2' face=verdana color=""blue""><b>Page :&nbsp;<b>"&Cp&"") 
			end if  
				Response.Write ("</td></tr></table>")
		end if 	
		if cp > 1 then		 	 
			 rsDisp.AbsolutePosition = Request.QueryString("Start")         
		END IF 
		Response.Write ("<tr>")
			Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Password</font></th>")					
			Response.Write ("<th><font face=""verdana"" size=""2"">User Type</font></th>")	
			Response.Write ("<th><font face=""verdana"" size=""2"">Options</font></th>")
		Response.Write ("</tr>")
		IF not rsDisp.EOF THEN					
			j=1
			no = trim(Request.QueryString("Start"))
			if no = "" then
				no = 1
			else
				no = no
			end if	
			startEdit=no
			while not rsDisp.EOF and rowcount<rsDisp.PageSize
				dim UsrStat
				if trim(rsDisp("User_Type"))="1" then
					UsrStat = "Administrator"
				elseif trim(rsDisp("User_Type"))="2" then
					UsrStat = "User"							
				end if
				Response.Write ("<tr bgcolor='white'>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Pwd") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& UsrStat &"</font></td>")
					Response.Write ("<td align='center'><a href='FRM_SIS_View_Users.asp?RecID="&trim(rsDisp("User_Name"))&"'><font face='verdana' size='2'>Delete</font></a> </td>")
				Response.Write ("</tr>")
				j=j+1
				no=no+1
				rowcount=rowcount+1
			rsDisp.MoveNext 
			wend
		else
			Response.Write ("<tr bgcolor='white'>")
					Response.Write ("<td colspan=6 align=center><font face='verdana' size='2' color='red'>-- No Records Found --</font></td>")					
			Response.Write ("</tr>")
		End if
		set rsDisp=nothing
		con.close()
		%>
	</table>
    </center></div></td>
  </tr>
</table>
</td></tr>
<tr><td colspan="2">
<!--#include file="../ASPIncludes_vizag/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
