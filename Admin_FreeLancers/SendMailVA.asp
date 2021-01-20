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


FUNCTION SendMaileNetUrlChange(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		''con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *  FROM Tbl_SendMails where userid='"& trim(recID1) &"'"
		RSCheck1.ActiveConnection = DataSource
		RSCheck1.CursorType = 3
		RSCheck1.OPEN SQL   ',con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("EmailId"))
			USRName =  trim(RSCheck1("Name")) 
			'usrPwd= trim(RSCheck1("User_pwd")) 
		ELSE
			USREmailID = "enet.svcs@bizacumen.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>November 29, 2012</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>This is to inform you that going forwards you would be able to access your regular assignments at the following link, <b>http://115.112.122.36/externalcontractor</b></td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please note that this change would be implemented with immediate effect.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>The user-name and password and other coordinates would remain the same. </td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thanks for your cooperation and interest in working with us.  </td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Pvt. Ltd.</td></tr>" 
 		MessageBody1 = MessageBody1 & "</table>"


		Call sendemail1("eNet Coordinator<enet.svcs@bizacumen.com>",USREmailID,"eNet URL change",MessageBody1)
		' ''call sendemail1("gurgaon@bizacumen.com",USREmailID,"bizacumen - Call Letter for Written Test",MessageBody1)
		call sendemail1("eNet Coordinator<" & USREmailID & ">","chv@bizacumen.com ","eNet URL change",MessageBody1)
    	
END FUNCTION

 


FUNCTION SendInvitationmail(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	''	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 	   
		SQL = "SELECT *  FROM Tbl_SendMails where userid='"& trim(recID1) &"'"
		''RSCheck1.ActiveConnection = con
		''RSCheck1.CursorType = 3
		RSCheck1.OPEN SQL,con
		'	response.write SQL & "333"
		'response.end
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("EmailId"))
			USRName =  trim(RSCheck1("Name")) 
		''	userid=trim(RSCheck1("UserName")) 
		''	usrPwd= trim(RSCheck1("UserPassword")) 
		ELSE
		''	USREmailID = "hyd@bizacumen.com"	
		''	USRName = "SISUser :"& trim(recID1)	
		end If
		
		SET RSCheck1=nothing
		MessageBody1 = MessageBody1 & "<table width='75%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
	''	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>November 27, 2019</td></tr>"
	''	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		

		'''---------------------------for Ex Employees sending mails Comment below 3 lines


		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We are currently looking to hire virtual assistants (online web researchers) and selected your resume from the thousands of applicants that applied for the work from home option from our company. From what we have seen in your resume, you have all the attributes for a successful web researcher. </td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>The job profile we are offering requires compiling and re-arranging information as per prescribed electronic format from company websites and checking/verification of completed work for accuracy and elimination of data integrity issues. We provide the required digital platform and free online training in Web Research. Compensation range from Rs.15,000 to Rs.20,000 per month.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We would love to know your decision regarding this employment opportunity to take the selection process further.  Please send us an email to <font color='blue'>careers@bizacumen.com</font> with subject as <b>'eNet - WDA'</b>. Subject of the email is mandatory to segregate your email from other recruitment emails. </td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>We thank you for your interest in our company and will appreciate an early response.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SivaPrasad KV,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><font color='blue'>Recruitment Coordinator</font></td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><font color='blue'>BizAcumen Research Pvt., Ltd.</font></td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><font color='blue'>careers@bizacumen.com</font></td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"
	''	response.write MessageBody1
	''	response.end
		 call SendGodaddyMail("careers@bizacumen.com",USREmailID,"Employment Invitation -  BizAcumen Research",MessageBody1)	
	''	 call sendemail1("careers@bizacumen.com",USREmailID,"Assignment Invitation - BizAcumen Research",MessageBody1)	
	''	 call sendemail1("" & USREmailID & ">","chv@bizacumen.com ","Assignment Invitation - BizAcumen Research",MessageBody1)
     	 call SendGodaddyMail("" & USREmailID & "","chv@bizacumen.com ","Employment Invitation -  BizAcumen Research",MessageBody1)

	
END Function




FUNCTION SendTestAssignmentmail(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	''	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		   
		SQL = "SELECT *  FROM Tbl_SendMails where userid='"& trim(recID1) &"'"
	
		''RSCheck1.ActiveConnection = con
		
		''RSCheck1.CursorType = 3
		RSCheck1.OPEN SQL,con
		'	response.write SQL & "333"
		'response.end
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("EmailId"))
			USRName =  trim(RSCheck1("Name")) 
			userid=trim(RSCheck1("UserName")) 
			usrPwd= trim(RSCheck1("UserPassword")) 
		ELSE
		''	USREmailID = "hyd@bizacumen.com"	
		''	USRName = "SISUser :"& trim(recID1)	
		end If
		
		SET RSCheck1=nothing
		MessageBody1 = MessageBody1 & "<table width='75%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
	''	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>November 27, 2019</td></tr>"
	''	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
''''''' for sending Live assignments
'''''''''''''''''		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for opting for the 'work from home' option from SIS. We are pleased to inform you that you have cleared our preliminary screening process. As part of our evaluation process, we sent you an online test assignment in August last week along with the link, username and password. But since you were not able to access/view/receive the interface/mail, we are sending you a live assignment for which you are given a maximum of six (6) days for the submission. Please note that submissions beyond 6 days will not be entertained. The network automatically disqualifies all assignments received after 6 days. </td></tr>"
'''''''''''	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"

		'''---------------------------for Ex Employees sending mails Comment below 3 lines


		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for your interest in the 'Work from Home' position at BizAcumen. We would like to invite you to complete a simple written assignment as part of our selection process. If you perform satisfactorily in the brief online test, we will start you immediately with a live assignment. You would be paid for the live assignment regardless of your selection for the position.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please find below some instructions to help you complete the test assignment. The assignment is designed to evaluate your written skills and help us understand your style of business writing. Please send the completed assignment back to us within 4 days. The platform automatically disqualifies all assignments received after 4 days.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Step 1: Click on the web link <a href='http://183.82.102.108/bizassignments'>http://183.82.102.108/bizassignments</a> (in case the web link is not working, please copy the URL into your web browser to access the interface) </td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Step 2: Please enter the given below user ID and password.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>User ID:</b> "& userid & "</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Password:</b> "  & usrPwd & "</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Upon login, the eNet Test interface will display Important Guidelines, Samples, Assignments, Plagiarism, Messages, and Logout links. Please click on the 'Assignments' button to view and subsequently download your test assignment. The 'Guidelines' clearly communicates how the online testing platform operates.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please use the 'Messages' option on the platform mentioning your User ID to communicate with us. Do not provide name, address, phone number and other such details in the test assignment or subject of mail or anywhere else on the platform. In case of any problem with the functioning of the platform, please write to enet.svcs@bizacumen.com. As we do not actively monitor this e-mail address, use the 'Messages' option on your interface as much as possible.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Click on the 'Plagiarism' button to follow the given guidelines for using the 'Plagiarism Tool'. Usage of this option is mandatory for all completed assignments.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>All of us at BizAcumen thank you for your interest and look forward to your participation. Wish you good luck.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SivaPrasad KV,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Private Limited</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>enet.svcs@bizacumen.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"
		'response.write MessageBody1
		'response.end
		 call SendGodaddyMail("enet.svcs@bizacumen.com",USREmailID,"Assignment Invitation - BizAcumen Research",MessageBody1)	
		 call sendemail1("enet.svcs@bizacumen.com",USREmailID,"Assignment Invitation - BizAcumen Research",MessageBody1)	
		 call sendemail1("" & USREmailID & ">","chv@bizacumen.com ","Assignment Invitation - BizAcumen Research",MessageBody1)
     	 call SendGodaddyMail("" & USREmailID & ">","chv@bizacumen.com ","Assignment Invitation - BizAcumen Research",MessageBody1)
	


	
END Function








FUNCTION VirtualAssistantInvitiationMail(recID1)

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
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We thank you for your application for Virtual Assistant (Work from Home), indicating interest in being part of our company. From what we have seen in your resume, you have the required attributes for a successful web researcher. The job profile we are offering requires compiling and re-arranging information as per prescribed electronic format from company websites and checking/verification of completed work for accuracy and elimination of data integrity issues. We provide the required digital platform and free online training in Web Research. Compensation depends solely based on your productivity and work quality.  You can earn INR 15,000 to INR 20,000 monthly.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please reply to this email expressing your willingness for us to send you an email regarding the training and onboarding process in the next few days. Please keep checking your inbox and spam folder.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Siva KV,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>eNet Services Coordinator,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Pvt., Ltd.</td></tr>" 
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>careers@bizacumen.com</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2></td></tr>" 
 		MessageBody1 = MessageBody1 & "</table>"

	''		Response.write MessageBody1
	''	Response.end
		call SendGodaddyMail("careers@bizacumen.com",USREmailID,"BizAcumen Research - Job Invitation",MessageBody1)	
	''	call SendGodaddyMail("careers@bizacumen.com","aneesa@bizacumen.com ","BizAcumen Research - Job Invitation",MessageBody1)
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
			VirtualAssistantInvitiationMail(trim(recID))
			
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
	''''''	VirtualAssistantInvitiationMail(trim(request("num1mail")))
		VirtualAssistantInvitiationMail(trim(request("num1mail")))
	'''	SendMaileNetDecline75(trim(request("num1mail")))
	'''	SendMaileNetUrlChange(trim(request("num1mail")))
	'''''	SendMailSpecSloteBizAcumen(trim(request("num1mail")))
		
		''SendMail(trim(request("num1mail")))
		''SendMailNaukriPerManager(trim(request("num1mail")))
	end if
response.redirect("SendMailVA.asp")
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
		window.frmreport.action="SendMailVA.asp";
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
