<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<!--#include file="../ASPIncludes_vizag/SendEmail.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
'''' update the status of the records that were selected for the check boxes
response.write trim(request("butnvalue"))
''response.end
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
	elseif trim(lcase(request("butnvalue")))="gurgaon" then
			Mystat = "Gurgaon"
			mystat1 = "Gurgaon Approve " '&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="pune" then
			Mystat = "Pune"
			mystat1 = "Pune Approve " '&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="mumbai" then
			Mystat = "Mumbai"
			mystat1 = "Mumbai Approve " '&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="chennai" then
			Mystat = "Chennai"
			mystat1 = "Chennai Approve " '&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="coimbatore" then
			Mystat = "Coimbatore"
			mystat1 = "Coimbatore Approve " '&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="bangalore" then
			Mystat = "Bangalore"
			mystat1 = "Bangalore Approve " '&trim(session("user_name"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="r&a" then
			Mystat = "R&A"
			mystat1 = "R&A Approve " '&trim(session("user_name"))&""
			insertval = 2
      	elseif trim(lcase(request("butnvalue")))="decline" then
			Mystat = "Decline"
			mystat1 = "Declining by "&trim(session("user_name"))&""
			insertval = 3
	elseif trim(lcase(request("butnvalue")))="hold" then
			Mystat = "Hold"
			mystat1 = "Hold by "&trim(session("user_name"))&""
			insertval = 5
      	end if

	''for each var in request.form
		'if trim(var)<>"butnvalue" then butnvalue
		
			''response.write var & "="& request(var)&"<br>"
			dim recID
			''recID = right(var,len(var)-3)
				''' call the stored procedure to insert data into the table
		'response.write "update TBL_SIS_ApplicationsNaukri set user_status=" & insertval & ",updated_by='" & trim(session("user_name")) & "', Reason_Update='" & mystat1 & "' where Rec_id in (" & request("chk") & ")"
		'response.end
	''''''	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	''''''	set cmdEdit=server.CreateObject("ADODB.Command")
		''con.execute("update TBL_SIS_ApplicationsNaukri set user_status=" & insertval & ",updated_by='" & trim(session("user_name")) & "', Reason_Update='" & mystat1 & "' where Rec_id =" & recID)
	''''''	con.execute("update TBL_SIS_ApplicationsNaukri set user_status=" & insertval & ",updated_by='" & trim(session("user_name")) & "', Reason_Update='" & mystat1 & "' where Rec_id in (" & request("chk") & ")")

		'cmdEdit.ActiveConnection = con	
		'	with cmdEdit
		'		.CommandText = "SP_TBL_SIS_Applications"
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
		''''con.close()
		''end if
	''next
response.redirect("frm_sis_viewAllNu.asp")
end If

FUNCTION SendMailWFHOption(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "select * from TBL_SIS_ApplicationsNaukri where  rec_id="& trim(recID1) &""

		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_email"))
			''USREmailID = trim(RSCheck1("User_AlternateEmail"))
			USRName = trim(RSCheck1("user_name"))
		ELSE
			USREmailID = "hyd@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)		
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>June 3, 2013</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</font></td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>With reference to your application on the job portal, naukri.com, we are pleased to inform that we have prescreened your application. As part of our next phase of the recruitment initiative for our work from home team, please click on the link <a href='http://www.workez.net' target='new'>http://www.workez.net</a> and fill in our online application. Please do not send email attachments. Only online applications at the given web link are considered. Selected candidates screened from the online applications will be intimated through email.</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd. is a 21-year old global company providing business research and editorial services to leading publishers worldwide. Over the past 8 years, our 300+team of writers work from the comfort of their homes and consistently deliver the highest quality content. While working closely with our 600+ strong in-house team, they have enjoyed a quality lifestyle away from the daily grime of urban commute, stress and exposure to elements</font></td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We look forward to your online application for us to take the recruitment process further. On behalf of the entire team at SIS, let me wish you the very best in your pursuit of a suitable work from home career. We hope that you’ll find such a compelling and gratifying career with SIS. </font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</font></td></tr>"

		
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment & Selection Team</font></td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</font></td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>hyd@sisinfotech.com</font></td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		call sendemail1("hyd@sisinfotech.com",USREmailID,"SIS Infotech Work from Home Option",MessageBody1)

		call sendemail1(USREmailID,"chv@sisinfotech.com","SIS Infotech Work from Home Option",MessageBody1)
	''	call sendemail1(USREmailID,"siva@sisinfotech.com","SIS Infotech Work from Home Option",MessageBody1)

	''	call sendemail1(USREmailID,"Aneesa@sisinfotech.com","BizAcumen Interview Call",MessageBody1)
	''	call sendemail1(USREmailID,"hema@sisinfotech.com","BizAcumen Interview Call",MessageBody1)
		
END Function

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''' update the status of the records that were selected for the check boxes''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

if trim(request("butnvalue"))="Send mail" then

	for each var in request.form
		if trim(var)<>"butnvalue" then
			''response.write var & "="& request(var)&"<br>"
			'dim recID
			''recID = right(var,len(var)-3)
			''' UPDATE Table and send mail
		
			con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
			UpdateMailSent = "Update TBL_SIS_ApplicationsNaukri set user_status=11, reason_update='WFH eNet Mail sent on " & Date & "' where Rec_ID="&trim(recID)&""
			response.write updatemailsent
			response.end
			con.execute UpdateMailSent
			con.close()
			''' CALL Function''''
					''SendMailDirectSlotSelection(trim(recID))
					''SendMailReSchedule(trim(recID))
		SendMailWFHOption(trim(recID))
				''	SendMailNaukriSIS(trim(recID))
			''''''''''	SendNaukriDelhiMail(trim(recID))
		''	SendMail(trim(recID))
		end if
	next
Response.redirect("Frm_SIS_ViewAllNu.asp")
end if

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''SEND mail when clicked on send email link on each record ''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF trim(request("num1mail"))<>"" then
	if isnumeric(trim(request("num1mail"))) then
		'''UPDATE Table Interview_Naukri_SelSlots for Mail_Sent status
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		UpdateMailSent = "Update TBL_SIS_ApplicationsNaukri set user_status=11, reason_update='WFH eNet Mail sent on " & Date & "' where Rec_ID="&trim(request("num1mail"))&""
		response.write updatemailsent
		''response.End
		

		con.execute UpdateMailSent
	''	response.write updatemailsent
		con.close()
		''' CALL Function''''
				''SendMailDirectSlotSelection(trim(request("num1mail")))	
				''SendMailReSchedule(trim(request("num1mail")))
		SendMailWFHOption(trim(request("num1mail")))
			''	SendMailNaukriSIS(trim(request("num1mail")))
		''''''''''''	SendNaukriDelhiMail(trim(request("num1mail")))	
		''SendMail(trim(request("num1mail")))	
	end if
  Response.redirect("Frm_SIS_ViewAllNu.asp")
END IF
%>

<html>
<head>
<title>View Analysts Data</title>
<script language="JavaScript">
function submitvalMail(actval)
{
	var updateval;
	updateval = confirm("Confirm, Do you want this applicant status to "+actval);
	if (updateval==true)
	{
		window.frmsis.method="post";
		window.frmsis.action="frm_sis_viewAllNu.asp";
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
		myWin = open("ApplicantinfoNu.asp?ID="+num+"#callID1" ,"userwin","width=780,top=5,left=5,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes");
	}
	function OpenWin1(num)
{
		window.frmsis.method="post";
		window.frmsis.action="Frm_SIS_ViewAllNu.asp?num1mail="+num;
		window.frmsis.submit();
}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="../ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#9DC3F5" valign="top"><!--#include file="../ASPIncludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#3767A6" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
 <%if trim(request("ttype"))="" then
	ttype = "All"
	ttype1 = ""
  else
    ttype = trim(request("ttype"))
	ttype1 = trim(request("ttype"))
  end if%>
<table border="1" width="95%" bordercolor="#3767A6" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#3767A6"><p align="center"><strong><big><font color="#FFFFFF">Naukri Pending Requests [<%=ttype%>]</font></big></strong></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#3767A6"><p align="center"><font color='red'>
    <%if trim(request("message"))="2" then%>
		Status Updated successfully
    <%end if%>
    </font></p></td>
  </tr>
<script language=javascript src="eAssign.js"></script>
  <form name="frmsis" method="post">
  <tr>
    <td width="100%"><div align="center"><center>
    <table align="center" width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#C5D9F3" style="border-collapse:collapse;">
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
		rec_per_page=30
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
		if (trim(session("user_type"))="1" or trim(session("user_type"))="4") then
			if trim(request("candname"))<>"" then		
				usql1="select * from TBL_SIS_ApplicationsNaukri where  user_name like ('%"&trim(Request("candname"))&"%') order by rec_id"
			elseif trim(request("candPhone"))<>"" then 
				usql1="select * from TBL_SIS_ApplicationsNaukri where  user_phone like ('%"&trim(Request("candPhone"))&"%') order by rec_id"
			else
				usql1="select * from TBL_SIS_ApplicationsNaukri where  User_Status=1  order by Location"
			end if
		else
			if trim(request("candname"))<>"" then
				usql1="select * from TBL_SIS_ApplicationsNaukri where  user_name like ('%"&trim(Request("candname"))&"%')  and user_status=1 order by rec_id" 'and post_applied like '%Graduates%'
			elseif trim(request("candPhone"))<>"" then 
				usql1="select * from TBL_SIS_ApplicationsNaukri where  user_phone like ('%"&trim(Request("candPhone"))&"%')  order by rec_id" 'and post_applied like '%Graduates%'
			else
				usql1="select * from TBL_SIS_ApplicationsNaukri where  User_Status=1 order by Location" 'and post_applied like '%Graduates%'
			end if
		end if
		response.write usql1
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
				<a href="Frm_SIS_ViewAllNu.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&candname=<%=trim(request("candname"))%>&ttype=<%=ttype1%>"><%=i%></a>			
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
			Response.Write ("<th><font face=""verdana"" size=""2"">PG Course</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Application</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Location Applied</font></th>")
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
						'Response.Write ("<td align='center'><input type=""checkbox"" value=""chk"&rsDisp("Rec_id")&"" name=""chk"&rsDisp("Rec_id")&"""></td>")
						Response.Write ("<td align='center'><input type='checkbox' value='"&rsDisp("Rec_id")&"' name='chk"&rsDisp("Rec_id")&"'></td>")
					else
						Response.Write ("<td align='center'>--</td>")
					end if
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Rec_id") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") & "</font></td>")
					''Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("PG_Course") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Applicationfor") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Location") &"</font></td>")
					if trim(rsDisp("User_Status"))="1" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> ")
						Response.Write (" | <a href='javascript:OpenWin1("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>Send mail</font></a></td>")
						'|  '<a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Hold</font></a></td>")
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
	        Response.write("<tr><td colspan=8 align='left'> &nbsp;&nbsp;<b>[ </b><a style='cursor:hand;' onclick='fnUserCheckAll();'>Check All</a> <b>]</b>&nbsp;&nbsp;<b>[</b> <a style='cursor:hand;' onclick='fnUserClearAll();'>Clear All</a> <b>]</b></td></tr>")
		Response.Write ("<tr bgcolor='white'>")
		   Response.Write ("<td colspan=8 align=left><input type=""submit"" name=""butnvalue"" value=""Send mail"" onclick=""javascript:submitvalMail('sendmail')"">")	
			Response.Write ("&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Delete"" onclick=""javascript:submitval('Delete')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Gurgaon"" onclick=""javascript:submitval('Gurgaon')"">&nbsp;&nbsp;&nbsp;<!--input type=""submit"" name=""butnvalue"" value=""Pune"" onclick=""javascript:submitval('Pune')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Mumbai"" onclick=""javascript:submitval('Mumbai')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Chennai"" onclick=""javascript:submitval('Chennai')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Coimbatore"" onclick=""javascript:submitval('Coimbatore')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Bangalore"" onclick=""javascript:submitval('Bangalore')"">&nbsp;&nbsp;&nbsp;--><input type=""submit"" name=""butnvalue"" value=""R&A"" onclick=""javascript:submitval('R&A')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""eNet"" onclick=""javascript:submitval('eNet')""></td>")		
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
<!--#include file="../ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
