
<% 
	Sub sendmail(fromwho,towho,subject,body)
		Dim mymail
		Set mymail = Server.CreateObject("CDO.Message")
		''Set MailConf = Server.CreateObject ("CDO.Configuration") 
		with mymail
			'.MailFormat = 0
			'.BodyFormat = 0
			''.ContentLocation = http://www.StrategyR.com/images
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "previews"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "chk4$"
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
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "previews"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "chk4$"
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
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "previews"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "chk4$"
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
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "previews"
			.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "chk4$"
          		.From = fromwho
			.TO = towho
			.Subject = subject
			.HTMLBody = body
			.AddAttachment filepath, 1
			.Send 
			End with
		set mymail = nothing
	End Sub


			Sub SendGodaddyMail(fromwho,towho,subject,body)
				sendUrl="http://schemas.microsoft.com/cdo/configuration/sendusing"
				smtpUrl="http://schemas.microsoft.com/cdo/configuration/smtpserver"
				
				
				' Set the mail server configuration
				Set objConfig=CreateObject("CDO.Configuration")
				objConfig.Fields.Item(sendUrl)=2 ' cdoSendUsingPort
				objConfig.Fields.Item(smtpUrl)="relay-hosting.secureserver.net"
				objConfig.Fields.Update
				
				
				' Create and send the mail
				Set objMail=CreateObject("CDO.Message")
				' Use the config object created above
				Set objMail.Configuration=objConfig
				objMail.From=fromwho ''"chv@gmail.com"
				objMail.ReplyTo="contactus@Bizacumen.com"
				objMail.To=towho '''"contactus@Bizacumen.com"
				objMail.Subject=subject 
				objMail.TextBody=body
				objMail.Send
			End Sub



	
 %>


