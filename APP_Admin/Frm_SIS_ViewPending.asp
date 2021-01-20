<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
'''' update the status of the records that were selected for the check boxes
if trim(request("butnvalue"))<>"" then
		''' User Status = 1 -- pending
		''' User Status = 2 -- approved
		''' User Status = 3 -- Declined
		''' User Status = 4 -- Deleted
		''' User Status = 5 -- Hold		
		dim Mystat, mystat1, insertval
      	if trim(lcase(request("butnvalue")))="accept" then
			Mystat = "Approve"
			mystat1 = "Approving by "&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="delete" then
			Mystat = "delete"
			mystat1 = "deleted by "&trim(session("user_name"))&""
			insertval = 4
      	elseif trim(lcase(request("butnvalue")))="decline" then
			Mystat = "Decline"
			mystat1 = "Declining by "&trim(session("user_name"))&""
			insertval = 3
	elseif trim(lcase(request("butnvalue")))="hold" then
			Mystat = "Hold"
			mystat1 = "Hold by "&trim(session("user_name"))&""
			insertval = 5
      	end if

	for each var in request.form
		if trim(var)<>"butnvalue" then
			''response.write var & "="& request(var)&"<br>"
			dim recID
			recID = right(var,len(var)-3)
				''' call the stored procedure to insert data into the table
		'response.write request("butnvalue") & recID
		'response.end
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		set cmdEdit=server.CreateObject("ADODB.Command")
		con.execute("update TBL_SIS_Analysts set user_status=" & insertval & ",Reason_Update='" & mystat1 & "' where Rec_id =" & recID)

		'cmdEdit.ActiveConnection = con	
		'	with cmdEdit
		'		.CommandText = "SP_TBL_SIS_Analysts"
		'		.CommandType = adcmdStoredProc	
		'		'Reason_Update=@MyReason_Update,
                ''Date_Updated=@MyDate_Updated,
		'		'Updated_By=@MyUpdated_By,
		'		'User_Status=@MyUser_Status,
		'		'Admin_Status=@MyAdmin_Status
		'		.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
		'		.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
		'		.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,"Name")
		'		.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,"Address")
		'		.Parameters.Append .CreateParameter ("@MyUser_Age",adInteger,adparamInputOutput,,1)
		'		.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,"Phone")
		'		.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,"Email")
		'		.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,"PGEducation")
		'		.Parameters.Append .CreateParameter ("@MyYear_Passed",adInteger,adparamInputOutput,,1)
		'		.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,"stat")
		'		.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,"EmpStatus")
		'		.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,1000,"workExp")
		'		.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,"Spoken")
		'		.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,"Written")
		'		.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,"Windows")
		'		.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,"Keyboard")
		'		.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,"Word")
		'		.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,"Excel")
		'		.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,"Access")
		'		
		'		.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,"Skills")
		'		.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
		'		.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
		'		.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,50,trim(session("user_name")))
		'		.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,insertval)
		'		.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,mystat1)
		'		.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,1)
		'		.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
		'		.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,7)
		'		.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
		'		.Execute			
		'	end with
		'loadedval = cmdEdit.Parameters("@MyResult")
		'set cmdEdit = nothing
		con.close()
		end if
	next
response.redirect("frm_sis_view.asp")
end if
%>

<html>
<head>
<title>View Analysts Data</title>
<script language="JavaScript">
function submitval(actval)
{
	var updateval;
	updateval = confirm("Confirm, Do you want this applicant status to "+actval);
	if (updateval==true)
	{
		window.frmsis.method="post";
		window.frmsis.action="frm_sis_view.asp";
		window.frmsis.submit();
	}	
}
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
		myWin = open("ApplicantInfo.asp?ID="+num+"#callID1" ,"userwin","width=780,top=5,left=5,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
	}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="ASPIncludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
 <%if trim(request("ttype"))="" then
	ttype = "All"
	ttype1 = ""
  else
    ttype = trim(request("ttype"))
	ttype1 = trim(request("ttype"))
  end if%>
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">Pending Requests [<%=ttype%>]</font></big></strong></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><font color='red'>
    <%if trim(request("message"))="2" then%>
		Status Updated successfully
    <%end if%>
    </font></p></td>
  </tr>
  <form name="frmsis" method="post">
  <tr>
    <td width="100%"><div align="center"><center>
    <table align="center" width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#f0e5dd" style="border-collapse:collapse;">
	<tr><td colspan="7"><font size='1' face=verdana>
	<b>Note :</b><br>1. This section will have only pending applications, for approved applications click on "Viewed Requests" link on left strip.
	<br>2. Click on <b>View</b> link to view the complete data of the user and change the status of the individual applicant.
	<br>3. Click on <b>Accept</b>, <b>Decline</b> or <b>Hold</b> link to change the status of the individual applicant.
	<br>4. Select the check box in the <b>Option</b> and click on the button given below to change the status of the selected applicants.
	</font></td></tr>
	<tr>
		<td colspan="7">
		<%	
		''add data to database
		  '' for paging
		dim k,rec_per_page
		rec_per_page=20
		Dim Cp,rowcount,i
			cp=Request.QueryString("Cp")
			EforEdit=Request.QueryString("E")
		if cp="" then
			cp=1
			EforEdit=cint(rec_per_page)
		end if 
		cpForEdit=cp
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
		Set rsDisp =Server.CreateObject("ADODB.Recordset")
		rsDisp.ActiveConnection = con
		rsDisp.CursorType = 3
		rsDisp.PageSize = cint(rec_per_page)
		if (trim(session("user_type"))="0") then ''  or trim(session("user_type"))="4") then
			if trim(request("candname"))<>"" then		
				usql1="select * from TBL_SIS_Analysts where rec_id>474 and user_name like ('%"&trim(Request("candname"))&"%') order by rec_id"
			else
				usql1="select * from TBL_SIS_Analysts where User_Status=1 and rec_id>474 order by rec_id"
			end if
		else
			if trim(request("candname"))<>"" then
				usql1="select * from TBL_SIS_Analysts where rec_id>474 and user_name like ('%"&trim(Request("candname"))&"%') and user_status=1 order by rec_id"
			else
				usql1="select * from TBL_SIS_Analysts where User_Status=1 and rec_id>474 order by rec_id"
			end if
		end if
		'response.write usql1
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
				<a href="Frm_SIS_View.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&candname=<%=trim(request("candname"))%>&ttype=<%=ttype1%>"><%=i%></a>			
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
			Response.Write ("<th><font face=""verdana"" size=""2"">Option</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Main ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			''Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Post</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Degree</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Date Applied</font></th>")
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
				if trim(rsDisp("User_Status"))="1" then
					UsrStat = "<font color='black'>Pending</font>"
				elseif trim(rsDisp("User_Status"))="2" then
					UsrStat = "<font color='green'>Approved</font>"
				elseif trim(rsDisp("User_Status"))="3" then
					UsrStat = "<font color='red'>Declined</font>"
				elseif trim(rsDisp("User_Status"))="5" then
					UsrStat = "<font color='blue'>Hold</font>"
				end if
				Response.Write ("<tr bgcolor='white'>")
					if trim(rsDisp("User_Status"))="1" then
						Response.Write ("<td align='center'><input type=""checkbox"" name=""chk"&rsDisp("Rec_id")&"""></td>")
					else
						Response.Write ("<td align='center'>--</td>")
					end if
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Rec_id") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") &"</font></td>")
					''Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Post_Applied") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Education_PG") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Date_Created") &"</font></td>")
					if trim(rsDisp("User_Status"))="0" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Release</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Hold</font></a></td>")
					else
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>")
					end if
				Response.Write ("</tr>")
				j=j+1
				no=no+1
				rowcount=rowcount+1
			rsDisp.MoveNext
			wend
		else
			Response.Write ("<tr bgcolor='white'>")
					Response.Write ("<td colspan=7 align=center><font face='verdana' size='2' color='red'>-- No Records Found --</font></td>")					
			Response.Write ("</tr>")
		End if
		set rsDisp=nothing
		con.close()
		if session("user_type") =4 then
		Response.Write ("<tr bgcolor='white'>")
	
			Response.Write ("<td colspan=8 align=left><input type=""submit"" name=""butnvalue"" value=""Delete"" onclick=""javascript:submitval('Delete')""></td>")		
			'Response.Write ("<td colspan=7 align=left><input type=""submit"" name=""butnvalue"" value=""Accept"" onclick=""javascript:submitval('Accept')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Decline"" onclick=""javascript:submitval('Decline');"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold');""></td>")					
		Response.Write ("</tr>")
		end if
		%>
	</table>
    </center></div></td>
  </tr>
  </form>
</table><br>
</td></tr>
<tr><td colspan="2">
<!--#include file="ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
