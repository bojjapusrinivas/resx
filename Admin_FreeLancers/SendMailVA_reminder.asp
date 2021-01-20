<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Welcome to BizAcumen Research Analysts Test -- Admin</title>

<!--#include file="ASPIncludes/DBopen.asp"-->bizacumen
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<!--#include file="ASPIncludes/SiteFunctions.asp"-->

<%

	Function selected(var1,var2)
		if (trim(var1) = trim(var2)) then
			selected= "Selected"
		end if
	end function

	
con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
dim reccount
Sub sendemail1(fromwho,towho,subject,body)
		Dim mymail
		Set mymail = Server.CreateObject("CDO.Message")
		
		with mymail
			'.MailFormat = 0
			'.BodyFormat = 0	
			''.ContentLocation = http://www.StrategyR.com/images
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "sender"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "destination369$"
			''.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "previews"
			''.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "chk4$"
          		.From = fromwho
			.TO = towho
			.Subject = subject
			.HTMLBody = body
			
			.Send 
		End with
		set mymail = nothing
	End Sub



FUNCTION VirtualAssistantInvitiationMailReminder(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		''con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *  FROM Tbl_SendMails where userid='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = con
		RSCheck1.CursorType = 3
		RSCheck1.OPEN SQL   ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("EmailId"))
			USRName =  trim(RSCheck1("Name")) 
			'userid=trim(RSCheck1("UserName")) 
			'usrPwd= trim(RSCheck1("UserPassword")) 
		ELSE
		''	USREmailID = "enet.svcs@bizacumen.com"	
		''	USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		''MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>" & FormatDateTime(date,1) & "</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We would like to thank you for successfully clearing the online application stage of our 'work from home' recruitment. We sent you a job invitation email few weeks back and are yet to receive a favorable response from you. As we are eager to move forward with the next stage of the selection process, we are reaching you once again as we don't want you to miss this opportunity.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>The job profile for virtual assistant requires compiling and re-arranging information as per prescribed electronic format from company websites and checking/verification of completed work for accuracy and elimination of data integrity issues. We provide the required digital platform and free online training on how to complete the 'Company Website Extraction' process. Compensation range from Rs.15,000 to Rs.20,000 per month. If this is something that interests you, please let us know your decision by responding to this mail at the earliest confirming your willingness to proceed further.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Have a great rest of the day, and we hope to hear back from you sooner than later.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Siva KV,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Pvt., Ltd.</td></tr>" 
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>careers@bizacumen.com</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2></td></tr>" 
 		MessageBody1 = MessageBody1 & "</table>"

	''		Response.write MessageBody1
	''	Response.end
		call SendGodaddyMail("careers@bizacumen.com",USREmailID,"BizAcumen Research - Job Invitation",MessageBody1)	
	''''	call SendGodaddyMail("careers@bizacumen.com","aneesa@bizacumen.com ","BizAcumen Research - Job Invitation",MessageBody1)
		call SendGodaddyMail("" & USREmailID & "","chv@bizacumen.com ","BizAcumen Research - Job Invitation",MessageBody1)
	''	call SendGodaddyMail("" & USREmailID & "","kolchelmesiva@gmail.com ","BizAcumen Research - Job Invitation",MessageBody1)
	
      ''  call sendemail1("Recruitment Coordinator<" & USREmailID & ">","hema@bizacumen.com ","BizAcumen Research - Job Invitation",MessageBody1)
	
		''call sendemail1(USREmailID,"Recruitment Coordinator<careers@bizacumen.com","BizAcumen Research - Job Invitation",MessageBody1)
		
END FUNCTION





	
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''' update the status of the records that were selected for the check boxes''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

if trim(request("submit"))<>"" then
	
	dim recID
	
	
	for each var in request.form
		if trim(var)<>"submit" then
			
			
			
			recID = right(var,len(var)-3)
		'	response.write var & "="& len(var)&"<br>" & request("chk1")  & " <br>"
		''	response.write recID
		''	response.end
			

			''' UPDATE Table and send mail
		
			UpdateMailSent = "Update Tbl_SendMails set Email_Status='Y',Email_SentDate=Getdate() where UserId='"&trim(recID)&"'"
		  ''  response.write UpdateMailSent
		'''	'response.end
		con.execute UpdateMailSent
		'''	con.close()
			set RSCheck1 = Server.CreateObject("ADODB.Recordset")
			SQL = "SELECT *  FROM Tbl_SendMails where userid='"& trim(recID) &"'"
		''	response.write SQL	

			RSCheck1.OPEN SQL, con 
		
			If Not RSCheck1.EOF Then
				USREmailID = trim(RSCheck1("EmailId"))
				USRName =  trim(RSCheck1("Name")) 
				userid=trim(RSCheck1("UserName")) 
				usrPwd= trim(RSCheck1("UserPassword")) 
			ELSE
				USREmailID = "enet.svcs@bizacumen.com"	
				USRName = "SISUser :"& trim(recID)	
			end if
			SET RSCheck1=nothing
			

			response.write " Mail Sent to " & trim(recID) & "  " & USREmailID & "<br>"
		'''''	SendInvitationmail(trim(recID))
			VirtualAssistantInvitiationMailReminder(trim(recID))
			
	''	call SendGodaddyMail("enet.svcs@bizacumen.com",USREmailID,"Assignment Invitation - BizAcumen Research","MessageBody2")
	''		SendTestAssignmentmail (trim(recID))
	
		end if
		''	response.write "test11"
		''	response.end
	next
''	con.close()

'Response.Redirect("SendMails.asp")
'response.end
end if

''Response.write trim(request("num1mail"))
''Response.end

''	'	response.write UpdateMailSent
''		'	response.end
''		'	Response.write (trim(UpdateMailSent))
''			'Response.end
''			''' CALL Function''''
''			''SendMailSpecTime(trim(recID))
''				
''	''	VirtualAssistantInvitiationMail(trim(recID))	
''		''''	SendMaileNetDecline75(trim(recID))	
''		'''''	SendMailSpecSloteBizAcumen(trim(recID))	
''		''SendMaileNetUrlChange(trim(recID))	
''			''SendTestAssignmentmailCandidateswholostID(trim(recID))
''			'SendMail(trim(recID))1/28/2013
''			''SendMailNaukriPerManager(trim(recID))
''


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''SEND mail when clicked on send email link on each record ''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF trim(request("num1mail"))<>"" then
	if isnumeric(trim(request("num1mail"))) then
		'''UPDATE Table Interview_Guraon_SelSlots for Mail_Sent status
		con.open()
		UpdateMailSent = "Update Tbl_SendMails set Email_Status='Y',Email_SentDate=Getdate() where userID="&trim(request("num1mail"))&""
	        'response.write (UpdateMailSent )
		'response.end
		con.execute UpdateMailSent
	''	con.close()
		''' CALL Function''''
		''SendMailSpecTime(trim(request("num1mail")))
		''SendTestAssignmentmailCandidateswholostID(trim(recID))
	''''''	VirtualAssistantInvitiationMailReminder(trim(request("num1mail")))
		VirtualAssistantInvitiationMailReminder(trim(request("num1mail")))
	'''	SendMaileNetDecline75(trim(request("num1mail")))
	'''	SendMaileNetUrlChange(trim(request("num1mail")))
	'''''	SendMailSpecSloteBizAcumen(trim(request("num1mail")))
		
		''SendMail(trim(request("num1mail")))
		''SendMailNaukriPerManager(trim(request("num1mail")))
	end if
response.redirect("SendMailVA_reminder.asp")
END IF

%>
<script language="javascript">
	
function submitval(actval)
{
	var updateval;
	updateval = confirm("Confirm, Do you want to send email.");
	if (updateval==true)
	{
		window.frmreport.method="post";
		window.frmreport.action="SendMailVA_reminder.asp";
		window.frmreport.submit();
	}	
}

function OpenWin1(num)

{
		alert(num);
		window.frmreport.method="post";
		window.frmreport.action="UserDetails.asp?num1mail="+num;
		window.frmreport.submit();
}	


function radio_button_checker()
{
// set var radio_choice to false
var radio_choice = false;

// Loop from zero to the one minus the number of radio button selections
for (counter = 0; counter < frmreport.optTopic.length; counter++)
{
// If a radio button has been selected it will return true
// (If not it will return false)
if (frmreport.optTopic[counter].checked)
radio_choice = true; 
}

if (!radio_choice)
{
// If there were no selections made display an alert box 
alert("Please select a test topic.")
return (false);
}
return (true);
}

</script>
<%dim tsql,btnCap

				


%>
</HEAD><body  topmargin=0 leftmargin=0 bottommargin=0 rightmargin=0>
<table width="100%" height="100%" align="center" border="0"  style="border-collapse:collapse;" style="FILTER: progid:DXImageTransform.Microsoft.Gradient (GradientType=0,StartColorStr='#ffffff',EndColorStr='#6480A6')">	
 <TR bgColor=#ebf3fb height="90" >
    <TD   width="378" bgColor=#ebf3fb> &nbsp;&nbsp;&nbsp;</TD>
    <TD width=200 bgColor=#ebf3fb>&nbsp;</TD>
    <TD width=63 bgColor=#ebf3fb>
      <P><IMG src="PCILOGO.gif"><SPAN 
      style="FONT-SIZE: 12px; FONT-FAMILY: Verdana"></SPAN></P></TD>
    <TD width=297 bgColor=#ebf3fb><FONT face=Verdana, color=#3c7faf size=2 
      Arial Helvetica sans-serif,,><B>BizAcumen Research Pvt. Ltd,</B></FONT><BR><FONT face=Verdana, size=1 Arial Helvetica 
      sans-serif,># 8-2-682, Floors: 3 & 4,<br>Road# 12,Banjara Hills<BR>Hyderabad-500034, 
      <BR>Phone: 23301174</FONT></TD></TR>
  <TR bgColor=#3c7faf>
    <TD colSpan=4 height=6></TD>
 </TR>
  <TR >
    <TD colSpan=4 height=20></TD>
 </TR>

<tr><td  colSpan=4 valign="top"><!--include file="header.htm"--></td></tr>
<tr>
	<td valign="top" colSpan=4>
			<table width="95%" align="center">			
			<tr>
				<td align="left" height="5"></td>
			</tr>	
		
			</table>	<FORM  name="frmreport" ID="frmreport">		
			<table width="98%" align="center" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#C9D3E0" style="border-collapse:collapse;">			
				<tr>
					<td align="center" bgcolor="#4D5E80" colspan="2"><font face="verdana" size="2" color="white"><b>Mails Sending Screen </b></td>
				</tr>
				<tr>
					<td align="center" height="20" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td align="right" height="20" colspan="2">&nbsp;<!--a href="UserDetails.asp">Send Mails</a-->&nbsp;&nbsp;|&nbsp;&nbsp;</td>
				</tr>
				<!--tr>
					<td align="center" height="20" colspan="2">&nbsp;<b>View User PSP Send Mails</b></td>
				</tr-->
				<tr>
					<td align="center" height="20" colspan="2">&nbsp;</td>
				</tr>
               
				<tr>
					<td align="center" height="20" colspan="2">
	
					<%



				Set rsDisp =Server.CreateObject("ADODB.Recordset")
			''	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
				rsDisp.ActiveConnection = con
				rsDisp.CursorType = 3
			
			'''	usql="select * from Tbl_SendMails where user_status='N'"
				usql="select * from Tbl_SendMails where user_status='Y'"
			'	response.write (usql)
			'	response.end
				rsDisp.Open usql
			'	response.write (usql)
			'	response.end
				reccount= rsdisp.RecordCount 
				i = 1
				%>	
				
					<%IF not rsDisp.EOF THEN
					Response.Write ("<table width='98%' bgcolor='#C9D3E0' bordercolor='#000000' cellpadding=0 cellspacing=0 border=1 style='border-collapse:collapse' align='center'><tr bgcolor='#4D5E80'>")
					Response.Write ("<th><font face=""verdana"" size=""2"" color=""#ffffff"">S.No</font></th>")
					Response.Write ("<th><font face=""verdana"" size=""2"" color=""#ffffff"">ANA No</font></th>")
					Response.Write ("<th><font face=""verdana"" size=""2"" color=""#ffffff"">User Name</font></th>")
					Response.Write ("<th><font face=""verdana"" size=""2"" color=""#ffffff"">Email</font></th>")
					Response.Write ("<th><font face=""verdana"" size=""2"" color=""#ffffff"">Phone</font></th>")
					'Response.Write ("<th><font face=""verdana"" size=""2"">Father Name</font></th>")
					Response.Write ("<th><font face=""verdana"" size=""2"">Email Status</font></th>")
					Response.Write ("</tr>")
				  while not rsDisp.EOF and rowcount<rsDisp.PageSize
				  
					Response.Write("<tr bgcolor=" & tdcolr & "><td align='center'><font face='verdana' size='2'>" & i & "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>") 
					if trim(ucase(rsDisp("Email_Status")))="Y" then 
						 Response.write("--") 
					  else 
						Response.write("<input type=""checkbox""  name=""chk"&rsDisp("UserId")&""">")  
					end if
					 Response.write( "&nbsp;" & rsDisp("UserId")& "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("Name")& "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("EmailId")& "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("Telephone")& "</font></td>")
					'Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("Father_Name")& "</font></td>")
					if trim(ucase(rsDisp("Email_Status")))="Y" then
						Response.Write ("<td align='center'>Sent</td>")
					else
						Response.Write ("<td align='center'>No</td>") '<a href='javascript:OpenWin1("& rsDisp("Userid") &");'><font face='verdana' size='2'>Send mail</font></a>
					end if
					'Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;<input type=""checkbox"" name=""chk"&rsDisp("UserId")&""">" & "</font></td></tr>")
					'Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;<a href='Main.asp?tid=" & rsDisp("TopicId") & "&etype=edit'>Edit</a> | Delete</font></td></tr>")
					rsDisp.movenext
						i=i+1
					wend
					Response.Write ("<tr >")
					Response.Write ("<td colspan=7 align=left><input type=""submit"" name=""submit"" value=""Send mail"" onclick=""javascript:submitval('Accept')""></td>")					
					Response.Write ("</tr>")
					Response.Write ("</table>")
					  
					end If
					  con.close()
					%>
					
					&nbsp;</td>
				</tr>
					
					</td>
				</tr>	
				<tr>
					<td align="center" height="20" colspan="2">&nbsp;</td>
				</tr>
				
					
					<tr>
					<td  vAlign="top" align="right" colspan="2">
					
					
					</TD>
								</TR>
				
				<tr>
					<td align="center" height="20" colspan="2">&nbsp;</td>
				</tr>	
				<tr>
					<td align="center" height="20" colspan="2">&nbsp;</td>
				</tr>
			</table></form><br>
		</td>
		</tr>
	<tr><td  valign="bottom"><!--include file="bottom.htm"--></td></tr>
</table>
</BODY>
</HTML>
