<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Welcome to SIS Infotech Analysts Test -- Admin</title>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<!--include file="../ASPIncludes/SendEmail.asp"-->
<!--#include file="../ASPIncludes/SiteFunctions.asp"-->

<%	'Response.Buffer = True
	'Response.ExpiresAbsolute = 0
	'dim mystr
	'mystr=""
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)
	Function selected(var1,var2)
		if (trim(var1) = trim(var2)) then
			selected= "Selected"
		end if
	end function
	if trim(Request.ServerVariables("http_referer"))="" then
	'	Response.Redirect "default.asp?login=sesout"
	end if
'	'' if session expired
	if trim(session("EmailID"))="" then
	'	Response.Redirect "default.asp?login=sesout"
	end if
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

FUNCTION SendFeedBackApplicants(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		'con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT * FROM TBL_SIS_FreeLancerNew WHERE Rec_id='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = con
		RSCheck1.CursorType = 3
		RSCheck1.OPEN(SQL) ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_email"))
			USRName =  trim(RSCheck1("user_name")) 
			'usrPwd= trim(RSCheck1("User_pwd")) 
		ELSE
			USREmailID = "enet.svcs@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing

		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>July 7, 2011</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please note there is a feedback file on your interface that is pending for submission from your side. A lot of time and effort of our quality team is spent on preparing feedbacks. We, therefore, request you to send back the re-edited version, after making all necessary modifications. Please make the required changes in the entire assignment and re-submit at the earliest for us to take the process further. Please refer the ‘Common Editorial Errors’ file on your interface for additional perspective.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thanks.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>enet.svcs@sisinfotech.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"


		Call sendemail1("Recruitment Coordinator<enet.svcs@sisinfotech.com>",USREmailID,"SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		
		call sendemail1("Recruitment Coordinator<" & USREmailID & ">","chv@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		''call sendemail1("Recruitment Coordinator<" & USREmailID & ">","hema@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
       
		
END Function

FUNCTION SendMailDeclain(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		'con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT * FROM TBL_SIS_FreeLancerNew WHERE Rec_id='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = con
		RSCheck1.CursorType = 3
		RSCheck1.OPEN(SQL) ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_email"))
			USRName =  trim(RSCheck1("user_name")) 
			'usrPwd= trim(RSCheck1("User_pwd")) 
		ELSE
			USREmailID = "enet.svcs@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing

		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>March 2, 2012</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for taking out time and applying online. Our recruitment and selection committee has carefully reviewed your application and feels that you will not be a right fit for the kind of profile we currently have for our 'work from home' team. We wish you good luck in all your future professional endeavors and thank you once again for your interest in working for SIS.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>enet.svcs@sisinfotech.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"


		Call sendemail1("Recruitment Coordinator<enet.svcs@sisinfotech.com>",USREmailID,"SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		
		call sendemail1("Recruitment Coordinator<" & USREmailID & ">","chv@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		''call sendemail1("Recruitment Coordinator<" & USREmailID & ">","hema@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
       '' call sendemail1("Recruitment Coordinator<" & USREmailID & ">","padmaja@sisinfotech.com ","SIS Infotech - Call Letter for Written Test",MessageBody1)
		'' call sendemail1("Recruitment Coordinator<" & USREmailID & ">","maha@sisinfotech.com ","SIS Infotech - Call Letter for Written Test",MessageBody1)
		''  call sendemail1( "Recruitment Coordinator<" & USREmailID & ">","mnraghu@sisinfotech.com","SIS Infotech - Call Letter for Written Test",MessageBody1)
		''call sendemail1(USREmailID,"sr@strategyr.com","SIS Infotech - Call Letter for Written Test",MessageBody1)
		
END Function


FUNCTION SendeNetBlore(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		'con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT * FROM TBL_SIS_ApplicationsNaukri WHERE Rec_id='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = con
		RSCheck1.CursorType = 3
		RSCheck1.OPEN(SQL) ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_email"))
			USRName =  trim(RSCheck1("user_name")) 
			'usrPwd= trim(RSCheck1("User_pwd")) 
		ELSE
			USREmailID = "enet.svcs@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing

		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>September 16, 2011</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We are pleased to inform that we have prescreened your application posted on the job portal, naukri.com. A preliminary screening shows that you satisfy our basic qualifications necessary for our ‘Work from Home’ team of content writers.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We invite you to join our 400+ external team of very satisfied writers working from home from all over India. Participants follow a simple set of editorial guidelines. We are recruiting graduates, post-graduates, executives, retired professionals, educated housewives, and others who possess excellent English expression and have access to a computer and the Internet. Proficiency with MS Word is essential. For further details and to apply, please visit us at <a href= 'http://www.sisinfotech.com/eNet' target='new'>http://www.sisinfotech.com/eNet</a>. Only online applications at the given web link are considered. Please do not send resumes as email attachments to any of our email IDs.</td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Screened applicants from online applications received on our website will receive an online test assignment that they will need to complete and submit. Selected candidates from the online test will be directly inducted in our ‘Work from Home’ team.</td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We look forward to your participation. On behalf of the entire team at SIS, let me wish you the very best in your pursuit of a suitable ‘work from home’ career. We hope that you'll find such a compelling and gratifying career with SIS. We invite you to visit us at <a href ='http://www.sisinfotech.com' target='new'>www.sisinfotech.com</a>. </td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "</table>"


		Call sendemail1("Recruitment Coordinator<hyd@sisinfotech.com>",USREmailID,"Work From Home Career Opportunity-SIS Infotech Pvt Ltd",MessageBody1)
		call sendemail1("Recruitment Coordinator<" & USREmailID & ">","chv@sisinfotech.com ","Work From Home Career Opportunity-SIS Infotech Pvt Ltd",MessageBody1)
		''call sendemail1("Recruitment Coordinator<" & USREmailID & ">","hema@sisinfotech.com ","Work From Home Career Opportunity-SIS Infotech Pvt Ltd",MessageBody1)
      
		
END FUNCTION


FUNCTION SendMailOVERWHELMING(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		'con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT * FROM TBL_SIS_FreeLancerNew WHERE Rec_id='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = con
		RSCheck1.CursorType = 3
		RSCheck1.OPEN(SQL) ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_email"))
			USRName =  trim(RSCheck1("user_name")) 
			'usrPwd= trim(RSCheck1("User_pwd")) 
		ELSE
			USREmailID = "enet.svcs@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing

		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>August 19, 2011</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We thank you for taking out time and applying online. The overwhelming response we have received from well-qualified candidates such as you from all over India has made this a time consuming process for us. We will get back to you with the status of your online application within the next one-week to 10 days. Please do not email us with queries in the interim, as we are not structured to provide interactive assistance at the early stage of recruitment and initiation. Your emails will only delay the process.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We genuinely appreciate your patience and thank you once again for your interest in working for SIS.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>enet.svcs@sisinfotech.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"


		Call sendemail1("Recruitment Coordinator<enet.svcs@sisinfotech.com>",USREmailID,"SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		call sendemail1("Recruitment Coordinator<" & USREmailID & ">","chv@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		''call sendemail1("Recruitment Coordinator<" & USREmailID & ">","hema@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
      
		
END FUNCTION


FUNCTION SendMailWait(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		'con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT * FROM TBL_SIS_FreeLancerNew WHERE Rec_id='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = con
		RSCheck1.CursorType = 3
		RSCheck1.OPEN(SQL) ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_alternateemail"))
			USRName =  trim(RSCheck1("user_name")) 
			'usrPwd= trim(RSCheck1("User_pwd")) 
		ELSE
			USREmailID = "enet.svcs@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing

		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>April 7, 2011</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for taking out time and applying online. We are pleased to select you to our Preliminary List of potential participants based on several parameters. However the overwhelming response we have received from well-qualified candidates such as you nationwide has slightly slowed down the process. Please do not email us with queries in the interim, as we are not structured to provide interactive assistance at the early stage of recruitment and initiation. Your emails will only delay the testing & initiation process. We genuinely appreciate your patience and thank you once again for your interest in working for SIS.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>enet.svcs@sisinfotech.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"


		Call sendemail1("Recruitment Coordinator<enet.svcs@sisinfotech.com>",USREmailID,"SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		call sendemail1("Recruitment Coordinator<" & USREmailID & ">","chv@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		'call sendemail1("Recruitment Coordinator<" & USREmailID & ">","aneesa@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
      ''call sendemail1("Recruitment Coordinator<" & USREmailID & ">","hema@sisinfotech.com ","SIS Infotech Pvt Ltd. – Online Application Status",MessageBody1)
		
END FUNCTION





''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''' update the status of the records that were selected for the check boxes''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
if trim(request("butnvalue"))<>"" then
	
	
	
	for each var in request.form
		if trim(var)<>"butnvalue" then
			response.write var & "="& request(var)&"<br>"
			''response.end
			dim recID
			
			recID = right(var,len(var)-3)
			''' UPDATE Table and send mail
		       '' con.open()
			''con.open() ''"Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
			'UpdateMailSent = "Update Tbl_SendMails set Email_Status='Y',Email_SentDate=Getdate() where UserId='"&trim(recID)&"'"
			
			'con.execute UpdateMailSent
			'con.close()
			'Response.write (trim(UpdateMailSent))
			'Response.end
			''' CALL Function''''
			''SendeNetBlore(trim(recID))
			SendMailDeclain(trim(recID))
			''SendMailOVERWHELMING(trim(recID))
			''SendFeedBackApplicants(trim(recID))
			''SendMailWait(trim(recID))
			
		end if
	next

Response.redirect("SendDeclainMail.asp")

end if


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''SEND mail when clicked on send email link on each record ''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF trim(request("num1mail"))<>"" then
	if isnumeric(trim(request("num1mail"))) then
		'''UPDATE Table Interview_Guraon_SelSlots for Mail_Sent status
		con.open()
		'UpdateMailSent = "Update Tbl_SendMails set Email_Status='Y',Email_SentDate=Getdate() where userID="&trim(request("num1mail"))&""
	        'response.write (UpdateMailSent )
		'response.end
		'con.execute UpdateMailSent
		con.close()
		''' CALL Function''''
		'''SendeNetBlore(trim(request("num1mail")))
		SendMailDeclain(trim(request("num1mail")))	
		''SendMailOVERWHELMING(trim(request("num1mail")))
		''SendFeedBackApplicants(trim(request("num1mail")))
		''SendMailWait(trim(request("num1mail")))
		
	end if
Response.redirect("SendDeclainMail.asp")

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
		window.frmreport.action="SendDeclainMail.asp";
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

if trim(request("btnsubmit")) = "Add Topic" then

set cmdEdit = server.CreateObject("ADODB.Command")
		cmdEdit.ActiveConnection = con
		with cmdEdit
				.CommandText = "SPTopicDetails"
				.CommandType = adcmdStoredProc
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"INSERT")
				.Parameters.Append .CreateParameter ("@MyTopicId",adInteger,adparamInputOutput,,0)
				.Parameters.Append .CreateParameter ("@MyTopicTitle",advarchar,adparamInputOutput,990,trim(Request("txtTopic")))
				.Parameters.Append .CreateParameter ("@MyTopicDate",adDATE,adparamInputOutput,40,trim(Request("TDate")))
				.Parameters.Append .CreateParameter ("@MyTopicStatus",adchar,adparamInputOutput,1,trim(Request("SelStatus")))
				.Parameters.Append .CreateParameter ("@MyTopicGivenby",advarchar,adparamInputOutput,45,trim(Request("TGivenby")))
				.Parameters.Append .CreateParameter ("@MyTestDate",adDATE,adparamInputOutput,20,trim(Request("TestDate")))
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
				.Execute 
		end with
		actval = cmdEdit.Parameters("@MyResult")
		set cmdEdit = nothing
		Response.Write actval & " return value"

end if
if trim(request("btnsubmit")) = "Update Topic" then
Response.Write trim(request("btnsubmit"))

end if

if trim(request("tid")) <> "" then
	
	dim topicid,topic,tdate,tgivenby,testdate,tstatus
	Set rsTopic =Server.CreateObject("ADODB.Recordset")
	rsTopic.ActiveConnection = DataSource
	rsTopic.CursorType = 3
	tsql="select * from TopicDetails where topicid=" & trim(request("tid"))
	rsTopic.Open tsql
	btnCap="Update Topic"
	IF not rsTopic.EOF THEN
		topicid=rsTopic("TopicId")
		topic=rsTopic("TopicTitle")
		tdate=rsTopic("TopicDate")
		tgivenby=rsTopic("TopicGivenby")
		testdate=rsTopic("TestDate")
		tstatus=rsTopic("TopicStatus")
	end if
else

btnCap="Add Topic"
end if


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
      Arial Helvetica sans-serif,,><B>SIS Infotech Pvt. Ltd,</B></FONT><BR><FONT face=Verdana, size=1 Arial Helvetica 
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
			</table>	<FORM action="Main.asp" name="frmreport" ID="frmreport">		
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
				rsDisp.ActiveConnection = con 'DataSource
				rsDisp.CursorType = 3
				'usql="SELECT * FROM TBL_SIS_FreeLancerNew WHERE (Date_Updated >= '3/10/2011') AND (User_Status = 3) ORDER BY Rec_ID"
				''usql="SELECT  * FROM TBL_SIS_FreeLancerNew WHERE (User_Status = 2) AND (Points_Scored1 = 7)"
				usql="SELECT   * FROM TBL_SIS_FreeLancerNew WHERE rec_id in (9950,9983,9943,9945,9949,9952,9953,9954,9956,9967,9985,9992,9986,9994,9987,9989,9995,9996,9999,10000,10001,10002,9966,9978,9946,9951,9976,9979,9990,9959)"
				'usql="SELECT * FROM TBL_SIS_FreeLancerNew WHERE (User_Status = 2) AND (Rec_ID > 2895) AND (Points_Scored1 < 8) ORDER BY rec_id"
			''usql="SELECT * FROM TBL_SIS_FreeLancerNew WHERE (User_Status = 3) AND (Rec_ID > 2895) AND (Points_Scored1 >= 7)  and date_updated >='03/23/2011'ORDER BY rec_id"
			''usql="SELECT  * FROM  TBL_SIS_FreeLancerNew WHERE Rec_ID IN (SELECT Rec_id FROM TBL_SIS_FreeLancerNew  WHERE (User_Status = 1) AND (Points_Scored = 0)) order by rec_id"
				'Response.Write usql
				rsDisp.Open usql
				
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
					'if trim(ucase(rsDisp("Email_Status")))="Y" then 
						 Response.write("--") 
					 ' else 
						Response.write("<input type=""checkbox"" checked   name=""chk"&rsDisp("Rec_id")&""">")  
					'end if
					 Response.write( "&nbsp;" & rsDisp("Rec_id")& "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("User_Name")& "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("User_Email")& "</font></td>")
					Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("User_phone")& "</font></td>")
					'Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;" & rsDisp("Father_Name")& "</font></td>")
					'if trim(ucase(rsDisp("Email_Status")))="Y" then
					'	Response.Write ("<td align='center'>Sent</td>")
				'	else
						Response.Write ("<td align='center'>No</td>") '<a href='javascript:OpenWin1("& rsDisp("Userid") &");'><font face='verdana' 'size='2'>Send mail</font></a>
				'	end if
					'Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;<input type=""checkbox"" name=""chk"&rsDisp("UserId")&""">" & "</font></td></tr>")
					'Response.Write("<td align='left'><font face='verdana' size='2'>&nbsp;<a href='Main.asp?tid=" & rsDisp("TopicId") & "&etype=edit'>Edit</a> | Delete</font></td></tr>")
					rsDisp.movenext
						i=i+1
					wend
					Response.Write ("<tr >")
					Response.Write ("<td colspan=7 align=left><input type=""submit"" name=""butnvalue"" value=""Send mail"" onclick=""javascript:submitval('Accept')""></td>")					
					Response.Write ("</tr>")
					Response.Write ("</table>")

					end if%>
					
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
<script language="javascript">
	function validatefrom()
	{
		alert("test:);
		var o;
		o = document.frmreport;
		if (o.txtANANo.value=="")
		{
			alert("ANA No cannot be empty.");
			o.txtANANo.focus();
			return false;
		}
		if (o.txtName.value=="")
		{
			alert("Name cannot be empty.");
			o.txtName.focus();
			return false;
		}
		if (o.txtEmail1.value=="")
		{
			alert("Email cannot be empty.");
			o.txtEmail1.focus();
			return false;
		}
		if (o.txtFname.value=="")
		{
			alert("Father Name cannot be empty.");
			o.txtFname.focus();
			return false;
		}
		if (o.txtPhone.value=="")
		{
			alert("Phone No cannot be empty.");
			o.txtPhone.focus();
			return false;
		}
		<%if reccount > 1 then%>
		return radio_button_checker();
		<%end if%>
			
		
	}


	</script>