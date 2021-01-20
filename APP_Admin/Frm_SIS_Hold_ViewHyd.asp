<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if

IF trim(session("user_type"))<>"0" THEN
	Response.write ("Not a Authorized User!")
	Response.end
END IF
'''actstat="&rsDisp("User_status")&"
'''stat=A
'''RecID="&rsDisp("Rec_id")&"
'''emailid="&rsDisp("User_Email")&"
if trim(request("stat")) = "A" then
 '' response.write trim(request("stat"))
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmdEdit=server.CreateObject("ADODB.Command")
	response.write "update TBL_SIS_Applications set user_status=1 where Rec_id =" & trim(request("recID"))
	con.execute("update TBL_SIS_Applications set user_status=1 where Rec_id =" & trim(request("recID")))
	con.close()
	''response.end()
	response.redirect("frm_sis_hold_viewHyd.asp?ttype=8")	
end if

for each var in request.form
	if trim(var)<>"butnvalue" then
		'response.write var & "="& request(var)&"<br>"
		dim recID
		recID = right(var,len(var)-3)
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			'''' update sent status
			con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
			set cmdEdit=server.CreateObject("ADODB.Command")
			cmdEdit.ActiveConnection = con			
				with cmdEdit 				
					.CommandText = "SP_TBL_SIS_Applications"
					.CommandType = adcmdStoredProc	
					.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATEADM")
					.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
					.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,trim(request("Name")))
					.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,trim(request("Address")))
					.Parameters.Append .CreateParameter ("@MyUser_Age",advarchar,adparamInputOutput,50,1)
					.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,trim(request("Phone")))
					.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,trim(request("Email")))
					.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,trim(PGEducation))
					.Parameters.Append .CreateParameter ("@MyYear_Passed",advarchar,adparamInputOutput,50,1)
					.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,trim(request("CurrentEmp")))
					.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,trim(request("EmpStatus")))				
					.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,1000,trim(workExp))
					.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,trim(request("Spoken")))
					.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,trim(request("Written")))
					.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,trim(request("Windows")))
					.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,trim(request("Keyboard")))
					.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,trim(request("Word")))
					.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,trim(request("Excel")))
					.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,trim(request("Access")))
					'.Parameters.Append .CreateParameter ("@MyPowerpoint_Skills",advarchar,adparamInputOutput,10,trim(request("Powerpoint")))
					.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,trim(request("Skills")))
					.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
					.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
					.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,10,trim(session("username")))
					.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,4)
					.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,null)
					.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,2)
					.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
					.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,UserRank)
					.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
					''.Execute
				end with
			loadedval = trim(cmdEdit.Parameters("@MyResult"))
			set cmdEdit = nothing
			
			Set rsDisp =Server.CreateObject("ADODB.Recordset")
			rsDisp.ActiveConnection = con
			rsDisp.CursorType = 3
			usql1="select * from TBL_SIS_Applications where rec_id = "&trim(recID)&""
			rsDisp.open usql1
			if not rsDisp.eof then
				useremail = rsDisp("User_Email")
				actstat = rsDisp("User_Status")
				userName=rsDisp("User_Name")
			end if
			set rsDisp=nothing
			
			
			dim fromemailID
			''TOemailID = "careers@sisinfotech.com"
			TOemailID = "chvsrinivas@sisinfotech.com"
			''fromemailID = "chvsrinivas@sisinfotech.com"
		
			''if loadedval=1 then
				'''send mail to users
				dim mysubject
				''useremail = trim(request("emailid"))
				mysubject=""
				mysubject = mysubject & "<font face='verdana' size='2'>Dear " & userName & ",<br></font><br>"
				''mysubject = mysubject & "<font face='verdana' size='2'>Dear Applicant,<br></font><br>"
				''if trim(actstat)="2" then
					'mysubject = mysubject & "<font face='verdana' size='2'>Dated : "&now()&"<br><br></font>"
					mysubject = mysubject & "<font face='verdana' size='2'>Thank you for completing our online application. We're pleased to inform you that you are one of our short-listed candidates. Please advise your latest salary from the most recent employer. Please also indicate your expected compensation. Our compensation model is flexible and based exclusively on caliber, quality and efficiency of your writing skill. Although your previous experience helps us in making an initial assessment and offers some guidance in our recruitment process, we base our compensation only on the quality and efficiency of your work. <br><br>Please email us the required details ASAP. We will be finalizing our lists on Monday and would like to hear from you by Sunday evening. Thank you.<br><br></font>"
				''else
					''mysubject = mysubject & "<font face='verdana' size='2'>''Your application has been Declined for furthur processing.<br><br></font>"
				''end if
				mysubject = mysubject & "<font face='verdana' size='2'><br>Best regards,<br><br>Aneesa Afreen<br>Chief Manager, Research & Analysis Group<br>SIS Infotech Pvt. Ltd.<br>aneesa@sisinfotech.com</font><br>"
				'response.write useremail  & "="& request(var)&"<br>" & loadedval
				'response.end
				Set mymail = Server.CreateObject("CDO.Message")
				with mymail			
          				.From = "aneesa@sisinfotech.com" 
					'.To="afreen@strategyr.com,sujatha@strategyr.com,arcot.balraj@sisinfotech.com,arumilli@strategyr.com,sundaram@strategyr.com" 
					 .TO = useremail
					.Subject = "Communication from SIS Infotech Pvt. Ltd."
					.HTMLBody = mysubject    '"<pre>" & request("txtbody") & "</pre>"
					.Send 
				End with
				set mymail = nothing 
				con.execute("update TBL_SIS_Applications set User_Status=8,Date_Updated=getdate(), Reason_Update=Reason_Update + ' Mail Sent ' where Rec_ID=" & trim(recID))
				''call sendemail1(TOemailID,useremail,"Your SIS Infotech Application details",mysubject)	
				'response.write (toemailid & " - " & useremail & ",Your SIS Infotech Application details," & mysubject)
			'' End if
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			con.close()
			end if
next

''''stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"
if (trim(request("stat"))<>"" and trim(request("emailid"))<>"") then
	'''' update sent status
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmdEdit=server.CreateObject("ADODB.Command")
	cmdEdit.ActiveConnection = con			
		with cmdEdit 				
			.CommandText = "SP_TBL_SIS_Applications"
			.CommandType = adcmdStoredProc	
			.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATEADM")
			.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(Request("RecID")))
			.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,trim(request("Name")))
			.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,trim(request("Address")))
			.Parameters.Append .CreateParameter ("@MyUser_Age",advarchar,adparamInputOutput,50,1)
			.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,trim(request("Phone")))
			.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,trim(request("Email")))
			.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,trim(PGEducation))
			.Parameters.Append .CreateParameter ("@MyYear_Passed",advarchar,adparamInputOutput,50,1)
			.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,trim(request("CurrentEmp")))
			.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,trim(request("EmpStatus")))				
			.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,1000,trim(workExp))
			.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,trim(request("Spoken")))
			.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,trim(request("Written")))
			.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,trim(request("Windows")))
			.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,trim(request("Keyboard")))
			.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,trim(request("Word")))
			.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,trim(request("Excel")))
			.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,trim(request("Access")))
			'.Parameters.Append .CreateParameter ("@MyPowerpoint_Skills",advarchar,adparamInputOutput,10,trim(request("Powerpoint")))
			.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,trim(request("Skills")))
			.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
			.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
			.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,10,trim(session("username")))
			.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,4)
			.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,null)
			.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,2)
			.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
			.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
			.Execute
		end with
	loadedval = trim(cmdEdit.Parameters("@MyResult"))
	set cmdEdit = nothing
	con.close()
	
	TOemailID = "careers@sisinfotech.com"
	useremail = trim(request("emailid"))
	''fromemailID = "srinivas@sisinfotech.com"
	if loadedval=2 then
		'''send mail to users
		''useremail = trim(request("emailid"))
		mysubject=""
		mysubject = mysubject & "<font face='verdana' size='2'>Dear,<br></font><br>"
		if (trim(request("actstat"))="2" or trim(request("actstat"))="5") then
			mysubject = mysubject & "<font face='verdana' size='2'>Dated : "&now()&"<br><br></font>"
			mysubject = mysubject & "<font face='verdana' size='2'>We are pleased to inform you that your application has been approved for a written test. We will get back to you ASAP with date and time of written test to the same email ID.<br><br></font>"
		else
			mysubject = mysubject & "<font face='verdana' size='2'>Your application has been Declined for furthur processing. Thanks for the interest showed for SIS Infotech Pvt. Ltd. Wish you successful career<br><br></font>"
		end if
		mysubject = mysubject & "<font face='verdana' size='2'><br>Sincerely,<br><br>SIS Infotech Pvt. Ltd.<br></font><br>"
		call sendemail1(TOemailID,useremail,"Your SIS Infotech Application details",mysubject)	
	 End if
	Response.Redirect ("FRM_SIS_final_View.asp?Message="&loadedval&"")
End if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>View Analysts Data</title>
<script language="JavaScript">
function submitval(actval)
{
	var updateval;
	updateval = confirm("Do you want to update the status to "+actval);
	//alert(updateval );
	if (updateval)
	{
	
		window.frmsis.method="post";
		window.frmsis.action="frm_sis_Final_view.asp";
		window.frmsis.submit();
		return true;
	}	
	else
	{
		//alert(updateval );
		return false;
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
		myWin = open("ApplicantInfo.asp?ID="+num ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes");
	}
function OpenAnaWin(num)
	{ 
		myWin = open("AnAApplicantinfo.asp?ID="+num+"#callID1" ,"userwin","width=780,top=5,left=5,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes");
	}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<form name="frmsis" method="post">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="ASPIncludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">Hyderabad Blocked Requests</font></big></strong></td>
  </tr>
  <tr><td colspan="9" bgcolor="#f0e5dd"><font size='1' face=verdana>
	<b>Note :</b><br>1. Click on <b>View</b> link to view the complete data of the user.
	<br>2. Click on <b>Email</b> link to send email to the individual user.
	<br>3. Select the check box in the <b>Option</b> and click on the send email button given below to send mail to the selected users.
	</font></td></tr>
  <tr>
    <td width="100%" bgcolor="#ffffff"><p align="center"><font color='red'>
    <%if trim(request("message"))="2" then%>
		Email Sent Successfully
    <%end if%>
    </font></p></td>
  </tr>
	<%	dim TStat
  	TStat = trim(ucase(request("ttype")))
  	if trim(TStat)="" then
  		TStat = "2"
  	end if
  	%>
  <tr>
		<td align="center" width="95%" bgcolor="#ffffff"><!--font face="verdana" size="2"><a href="Frm_SIS_Final_View.asp?ttype=1"><font face="verdana" size="2"><b>Pending</b></font></a> |--> <!--font face="verdana" size="2"><a href="Frm_SIS_Final_View.asp?ttype=2"><font face="verdana" size="2"><b>Approved</b></font></a> | <a href="Frm_SIS_Final_View.asp?ttype=3"><font face="verdana" size="2"><b>Declined</b></font></a>  | <a href="Frm_SIS_Final_View.asp?ttype=5"><font face="verdana" size="2"><b>Hold</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_View.asp?ttype=8"><font face="verdana" size="2"><b>Email Sent</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_View.asp?ttype=4"><font face="verdana" size="2"><b>Phase-I</b></font></a-->
		<%if trim(session("user_type"))="4" then%>
		<!-- | <a href="Frm_SIS_Final_View.asp?ttype=6"><font face="verdana" size="2"><b>Test Taken</b></font></a> | <a href="Frm_SIS_Final_View.asp?ttype=9"><font face="verdana" size="2"><b>Block</b></font></a> -->
		<%end if%><!-- | <font face="verdana" size="2"><a href="Frm_SIS_Final_View.asp?ttype=0"><font face="verdana" size="2"><b>ALL</b></font></a--></td>
		</td>
	</tr>
  <tr>
    <td width="100%"><div align="center"><center>
    <table align="center" width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#f0e5dd" style="border-collapse:collapse;">
	<tr>
		<td colspan="9">
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
	
    	if trim(TStat)="4"  then		
			usql1="select * from TBL_SIS_Applications  order by rec_id"
		elseif trim(TStat)="0"  then
			usql1="select * from TBL_SIS_Applications order by Date_Created desc"
		elseif trim(TStat)="6"  then
			usql1="select * from TBL_SIS_Applications where ANA_No <> ''  order by Rec_id"
		elseif trim(TStat)="2"  then
			usql1="select * from TBL_SIS_Applications where user_status="&TStat&"  order by rec_id"
		else
			usql1="select * from TBL_SIS_Applications where user_status="&TStat&"  order by rec_id"
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
				<a href="Frm_SIS_Hold_ViewHyd.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&ttype=<%=trim(request("ttype"))%>"><%=i%></a>			
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
			Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Date Created</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Reason</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">update By</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">location</font></th>")
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
				elseif trim(rsDisp("User_Status"))="8" then
					UsrStat = "<font color='blue'>Blocked</font>"
				elseif trim(rsDisp("User_Status"))="4" then
					UsrStat = "<font color='blue'>Block</font>"
				end if
				Response.Write ("<tr bgcolor='white'>")					
					if (trim(rsDisp("User_Status"))="2" or trim(rsDisp("User_Status"))="3" or trim(rsDisp("User_Status"))="5") then
						if trim(rsDisp("Admin_Status"))="1" then
							Response.Write ("<td align='center'><input type=""checkbox"" name=""chk"&rsDisp("Rec_id")&"""></td>")
						else
							Response.Write ("<td align='center'>sent</td>")
						end if
					else
						Response.Write ("<td align='center'>--</td>")
					end if
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Rec_id") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Date_Created") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Reason_Update") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Updated_BY") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("location") &"</font></td>")
					if trim(TStat)="0" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
					else

					  if trim(TStat)="6" then
						Response.Write ("<td align='center'><a href='javascript:OpenAnaWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")	
					  else
						if trim(rsDisp("Admin_Status"))="1" then
							if trim(rsDisp("User_Status"))="1" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
							elseif trim(rsDisp("User_Status"))="2" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") '| <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="3" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") '| <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="5" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="6" then
								Response.Write ("<td align='center'><a href='javascript:OpenAnaWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="8" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='Frm_SIS_Hold_ViewHyd.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Release</font></a></td>") '| <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							end if
						else
							Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='FRM_SIS_Final_View.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Re-send Email</font></a></td>")
						end if
					  end if
					end if
				Response.Write ("</tr>")
				j=j+1
				no=no+1
				rowcount=rowcount+1
			rsDisp.MoveNext 
			wend
		else
			Response.Write ("<tr bgcolor='white'>")
					Response.Write ("<td colspan=8 align=center><font face='verdana' size='2' color='red'>-- No Records Found --</font></td>")					
			Response.Write ("</tr>")
		End if
		set rsDisp=nothing
		con.close()
		if (TStat = "2" or TStat = "3" or TStat = "5") then
			Response.Write ("<tr bgcolor='white'>")
				Response.Write ("<td colspan=8 align=left><input type=""button"" name=""butnvalue"" value=""Send mail"" onclick=""javascript:submitval('send mail')""></td>")					
			Response.Write ("</tr>")
		''elseif (TStat = "1") then
		''	Response.Write ("<tr bgcolor='white'>")
		''		Response.Write ("<td colspan=8 align=left><input type=""submit"" name=""butnvalue"" value=""Accept"" onclick=""javascript:submitval('Accept')"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Decline"" onclick=""javascript:submitval('Decline');"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold');""></td>")
		''	Response.Write ("</tr>")
		end if
		%>
	</table>
    </center></div></td>
  </tr>
</table></form>
</td></tr>
<tr><td colspan="2">
<!--#include file="ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>

</body>
</html>
