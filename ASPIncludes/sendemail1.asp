
<% 
	Sub sendmail(fromwho,towho,subject,body)
		Dim mymail
		Set mymail = Server.CreateObject("CDONTS.Newmail")
		with mymail
			.MailFormat = CdoMailFormatMIME
			.BodyFormat = CdoBodyFormatHTML	
			.ContentLocation = http://www.globind.com/images
          	.From = fromwho
			.TO = towho
			.Subject = subject
			.Body = body		
			.AttachFile "c:\RESEARCH_QUERIES.doc", "RESEARCH_QUERIES.doc", 1			
			.Send 
			End with
		set mymail = nothing
	End Sub
	
	Sub sendemail1(fromwho,towho,subject,body)
		Dim mymail
		Set mymail = Server.CreateObject("CDONTS.Newmail")
		with mymail
			.MailFormat = CdoMailFormatMIME
			.BodyFormat = CdoBodyFormatHTML	
			.ContentLocation = http://www.globind.com/images
          	.From = fromwho
			.TO = towho
			.Subject = subject
			.Body = body		
			.Send 
		End with
		set mymail = nothing
	End Sub
	''' to special.sales@globind.com
	Sub sendmailspecial(fromwho,towho,subject,body)
		Dim mymail1
		Set mymail1 = Server.CreateObject("CDONTS.Newmail")
		with mymail1
			.MailFormat = CdoMailFormatMIME
			.BodyFormat = CdoBodyFormatHTML	
			.ContentLocation = http://www.globind.com/images
          	.From = fromwho
			.TO = towho
			.Bcc = "Special.Sales@globind.com"
			.Subject = subject
			.Body = body		
			.Send 
			End with
		set mymail1 = nothing
	End Sub
 %>


