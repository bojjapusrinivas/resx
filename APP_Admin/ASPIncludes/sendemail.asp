
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
 %>


