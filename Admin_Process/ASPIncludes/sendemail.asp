
<% 
	Sub sendmail(fromwho,towho,subject,body)
		Dim mymail
		Set mymail = Server.CreateObject("CDO.Message")
		''Set MailConf = Server.CreateObject ("CDO.Configuration") 
		with mymail
			'.MailFormat = 0
			'.BodyFormat = 0
			''.ContentLocation = http://www.StrategyR.com/images
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "sender"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "destination369$"
          	.From = fromwho
			.TO = towho
			.Subject = subject
			.HTMLBody = body
			''.AddAttachment "c:\RESEARCH_QUERIES.doc", "RESEARCH_QUERIES.doc", 1
			.Send 
			End with
		set mymail = nothing
	End Sub
	
	Sub sendemail1(fromwho,towho,subject,body)
	   
		Dim mymail
		Set mymail = Server.CreateObject("CDO.Message")
		with mymail
			'.MailFormat = 0
			'.BodyFormat = 0	
			''.ContentLocation = http://www.StrategyR.com/images
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")="25, 80, 3535, 587"
			''.Configuration.Fields.Item("cdoSMTPServer")="mail.strategyr.com"
             .Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "25, 80, 3535, 587"
			''.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "sender"
			''.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "destination369$"
			.Configuration.Fields.Update
          	.From = fromwho
			.TO = towho
			.Subject = subject
			.HTMLBody = body
			
			.Send 

		
		End with
		set mymail = nothing
	End Sub
	''' to special.sales@StrategyR.com
	Sub sendmailspecial(fromwho,towho,subject,body)
		Dim mymail1
		Set mymail1 = Server.CreateObject("CDO.Message")
		with mymail1
			'.MailFormat = 0
			'.BodyFormat = 0	
			''.ContentLocation = http://www.StrategyR.com/images
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "sender"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "destination369$"
          	.From = fromwho
			.TO = towho
			''.Bcc = "Special.Sales@StrategyR.com"
			.Subject = subject
			.HTMLBody = body		
			.Send 
			End with
		set mymail1 = nothing
	End Sub

	Sub sendmailAttach(fromwho,towho,subject,body,filepath)
		Dim mymail
		Set mymail = Server.CreateObject("CDO.Message")
		''Set MailConf = Server.CreateObject ("CDO.Configuration") 
		with mymail
			'.MailFormat = 0
			'.BodyFormat = 0
			''.ContentLocation = http://www.StrategyR.com/images
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "sender"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "destination369$"
          		.From = fromwho
			.TO = towho
			.Subject = subject
			.HTMLBody = body
			.AddAttachment filepath, 1
			.Send 
			End with
		set mymail = nothing
	End Sub

	''.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "previews"
	''.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "chk4$"

   Sub SendCDOGodaddyMail(fromwho,towho,subject,body)

		Const cdoSendUsingPickup = 1 
		Const cdoSendUsingPort = 2 'Must use this to use Delivery Notification
		Const cdoAnonymous = 0
		Const cdoBasic = 1 ' clear text
		Const cdoNTLM = 2 'NTLM
		'Delivery Status Notifications
		Const cdoDSNDefault = 0 'None
		Const cdoDSNNever = 1 'None
		Const cdoDSNFailure = 2 'Failure
		Const cdoDSNSuccess = 4 'Success
		Const cdoDSNDelay = 8 'Delay
		Const cdoDSNSuccessFailOrDelay = 14 'Success, failure or delay

		set objMsg = CreateObject("CDO.Message")
		set objConf = CreateObject("CDO.Configuration")

		Set objFlds = objConf.Fields
		With objFlds
		  .Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = cdoSendUsingPort
		  .Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "mail.strategyr.com"
		  .Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = cdoBasic
		  .Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "sender"
		  .Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "sender"
		  .Update
		End With

		strBody = "This is a sample message." & vbCRLF
		strBody = strBody & "It was sent using CDO." & vbCRLF

		With objMsg
		  Set .Configuration = objConf
		  .To = towho 
		  .From = fromwho
		  .Subject = subject
		  .HTMLBody = body
		   'use .HTMLBody to send HTML email.
		  ''.Addattachment "c:\temp\Scripty.zip"
		 '' .Fields("urn:schemas:mailheader:disposition-notification-to") = "me@my.com"
		 '' .Fields("urn:schemas:mailheader:return-receipt-to") = "me@my.com" 
		  .DSNOptions = cdoDSNSuccessFailOrDelay
		  .Fields.update
			
		  .Send
		End With

  End Sub

Sub SendGodaddyMail(fromwho,towho,subject,body)

	sendUrl="http://schemas.microsoft.com/cdo/configuration/sendusing"
	smtpUrl="http://schemas.microsoft.com/cdo/configuration/smtpserver"


	''''Set the mail server configuration
	Set objConfig=CreateObject("CDO.Configuration")
	objConfig.Fields.Item(sendUrl)=2 ''' cdoSendUsingPort
	objConfig.Fields.Item(smtpUrl)="relay-hosting.secureserver.net"
	objConfig.Fields.Update

 
	''''Create and send the mail
	Set objMail=CreateObject("CDO.Message")

 	''	response.write body
	''	response.end
	''''Use the config object created above
	Set objMail.Configuration=objConfig
	objMail.From=fromwho      	'' "sender@coolexample.com"
	''objMail.ReplyTo="sender@coolexample.com"
	objMail.To= towho 		''"recipient@coolexample.com"
	objMail.Subject= subject   	''"subject"
	objMail.HTMLBody=body		''"body"

	objMail.Send

End Sub
 %>


