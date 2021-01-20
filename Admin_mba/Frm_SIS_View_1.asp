<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<%

If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if

response.write ("for test")
''response.end


FUNCTION SendMailNoSlotSelectionBiz(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
	'	response.write sql
		'response.end
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "careers@bizacumen.com"	
			USRName = "BizUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>May 4, 2018</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Greetings from BizAcumen Research!</b></td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We are pleased to inform you that you have been selected for interview and a simple written test on the strength of your online application. There are numerous opportunities for experienced professionals as well as fresh graduates at BizAcumen Research. We recruit professionals from diverse educational background to bring new perspectives and enrich our teams. We are looking for young and energetic people with a passion and flair for English writing to fill our research analyst and senior analyst positions in our research and analysis team.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>The position involves managing business research reports, content development, industry analysis, and company analysis, among numerous other market research related responsibilities. </td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We realize the importance of planning, and hence would like you to choose the time and the date of your liking. </td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Dates: Any of the following dates based on your convenience:</b></td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2' color='#800000'><b>May 9, 2018 (Wednesday)</b></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2' color='#800000'><b>May 10, 2018 (Thursday)</b></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2' color='#800000'><b>May 11, 2018 (Friday)</b></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Time: <font color='#800000'>Between 10:00 A.M. and 4:00 P.M.</font></b></td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Test Venue/Location:</b> BizAcumen Research Pvt., Ltd., Technovation, Opp: Oyster Swimming Pool, Road No.13, Banjara Hills, Hyderabad-500034, Telangana State.<br><b>Phone: <b>040-23332999<br><b>Landmark: </b>Lane beside Kairali Spa (Road No. 1, Banjara Hills)<br>Please visit http://www.bizacumen.com/Contactus.asp for route map</td></tr>"
	    MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
	
	
		    

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Please bring copies of the following documents on the interview day.</b> <font color='#FF3A00'>You will be registered for the interview only upon providing the requested documents.</font></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>1. Detailed Resume,<br>2. Latest Passport Size Photograph, and <br>3. Photostat copy of Photo ID Proof (Valid Documents: Passport / Driving License / Voters ID Card / PAN Card / Savings Bank Account / Telephone Bill /Aadhaar Card)</b><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>You can also guide us to individuals who are exceptionally good in professional business writing among your friends or colleagues. If you or your friend/colleague is an experienced professional and is looking for a change but are not sure if our position suits their experience level or caliber, we invite your friend/colleague to apply online (http://www.bizacumen.com/careers)regardless. We are a growing company and are always on the lookout for exceptional talent for future needs.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The interview includes a short introduction by applicants. In addition you will be required to pass a written test that comprises an essay on general topics, followed by an editorial exercise that involves re-writing a short market related write-up in your best possible business English. As we are very serious about recruiting the right candidate, it may take us about a week to assess all applicants. Subsequently, we will contact you via email with our decision.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>BizAcumen Research is a leading content generation and management company. Our team of experienced professionals is dedicated to world-class market research content. We offer a very rewarding career for a chosen few who desire to work in a challenging, intellectually stimulating and world-class paperless research environment. We nurture your aspirations to innovate, excel and accomplish. If you are self-motivated, intense, independent and willing to work with other like-minded individuals, you will find BizAcumen to be a perfect fit.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We look forward to meeting you.</td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Parthasaradhi Reddy B</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2' color='#00007D'><b>BizAcumen Research Pvt., Ltd. </b></td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>careers@bizacumen.com</td></tr>" 
     
 		MessageBody1 = MessageBody1 & "</table>"

	''response.write MessageBody1
	''response.end
		call SendGodaddyMail("careers@bizacumen.com",USREmailID,"BizAcumen Interview Call",MessageBody1)
		''' call sendemail1(USREmailID,"srinivas@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		call SendGodaddyMail(USREmailID,"chv@bizAcumen.com","BizAcumen Interview Call",MessageBody1)
	'''	call SendGodaddyMail(USREmailID,"careers@bizacumen.com","BizAcumen Interview Call",MessageBody1)
      ''  call SendGodaddyMail(USREmailID,"partha@bizacumen.com","BizAcumen Interview Call",MessageBody1)
		''call sendemail1(USREmailID,"aneesa@sisinfotech.com","BizAcumen Interview Call",MessageBody1)

		
END FUNCTION


FUNCTION SendMailNoSlotSelectionBizSERT(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
	'	response.write sql
		'response.end
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "careers@bizacumen.com"	
			USRName = "BizUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>May 4, 2018</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We are pleased to inform you that you have cleared the first round of elimination, and have been selected for an interview and a simple written test at our premises on the strength of your online application.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>The position involves research report design and administration; data reviews, analysis, and reporting; reviews of news events; preparation of analysis; and other related tasks that support the research process. Initial training is provided as per the aptitude, knowledge-level, training needs, and learning style of the individual. More would be explained to you once you start your training/probation with us.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Dates: Any of the following dates based on your convenience:</b></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>November 24 (Thursday)<br>November 25 (Friday)</b></td></tr>"
	    MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>TIME: Between 10:00 A.M. and 4:00 P.M</b></td></tr>"
	    MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Test Venue/Location:</b> BizAcumen Research Pvt., Ltd., Technovation, Opp: Oyster Swimming Pool, Road No.13, Banjara Hills, Hyderabad-500034, Telangana State.<br><b>Phone: <b>040-23332999<br><b>Landmark: </b>Lane beside Kairali Spa (Road No. 1, Banjara Hills)</td></tr>"
	    MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>You are requested to be on time for the interview on whatever date and time you choose. <b>Please bring copies of the following documents on the interview day.</b> You will be registered for the interview only upon providing the requested documents.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>1. Detailed Resume,<br>2. Latest Passport Size Photograph, and<br>3. Photostat copy of Photo ID Proof (Valid Documents: Passport / Driving License / Voters ID Card / PAN Card / Savings Bank Account / Telephone Bill /Aadhaar Card)</b><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The interview includes a short introduction by applicants. In addition you will be required to pass a written test that comprises an essay on general topics in the best possible business English. As we are very serious about recruiting the right candidate, it may take us about a week to assess all applicants. Subsequently, we will contact you via email with our decision.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>BizAcumen Research is a leading content generation and management company. Our team of experienced professionals is dedicated to world-class market research content. We offer a very rewarding career for a chosen few who desire to work in a challenging, intellectually stimulating and world-class paperless research environment. We nurture your aspirations to innovate, excel and accomplish. If you are self-motivated, intense, independent and willing to work with other like-minded individuals, you will find BizAcumen to be a perfect fit.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We look forward to meeting you.</td></tr>"

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Mr. Parthasaradhi</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>BizAcumen Research Pvt., Ltd. </b></td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>careers@bizacumen.com</td></tr>" 
     
 		MessageBody1 = MessageBody1 & "</table>"

	''response.write MessageBody1
	''response.end
		call SendGodaddyMail("careers@bizacumen.com",USREmailID,"BizAcumen Interview Call",MessageBody1)
		''' call sendemail1(USREmailID,"srinivas@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		call SendGodaddyMail(USREmailID,"chv@bizAcumen.com","BizAcumen Interview Call",MessageBody1)
		''call SendGodaddyMail(USREmailID,"partha@bizacumen.com","BizAcumen Interview Call",MessageBody1)
              ''   call sendemail1(USREmailID,"hema@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
		''call sendemail1(USREmailID,"aneesa@sisinfotech.com","BizAcumen Interview Call",MessageBody1)

		
END FUNCTION


FUNCTION SendMailRejectionBiz(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
	'	response.write sql
		'response.end
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "careers@bizacumen.com"	
			USRName = "BizUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>March 17, 2016</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for applying for a job position at BizAcumen Research. Although your application and interview were good, you could not clear the written test. Parameters considered during test assessment include, but are not limited to, idea consolidation; organized documentation of analyses; language expression and usage of proper business terminology; idea presentation; analysis and creative reporting of facts and news; and effective usage of grammar and composition, among others.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We appreciate your interest in working for BizAcumen Research and the time expended by you in attending the written test and interview at our premises. We hope there may be other employment opportunities of interest to you in the future.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Wish you good luck in all your future endeavors.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator, Research</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Pvt., Ltd. </td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>careers@bizacumen.com</td></tr>"   
 		MessageBody1 = MessageBody1 & "</table>"

	''response.write MessageBody1
	''response.end
		call SendGodaddyMail("careers@bizacumen.com",USREmailID,"Letter from BizAcumen",MessageBody1)
		
		call SendGodaddyMail(USREmailID,"chv@bizAcumen.com","Letter from BizAcumen",MessageBody1)
		''call SendGodaddyMail(USREmailID,"partha@bizacumen.com","Letter from BizAcumen",MessageBody1)
            
		

		
END FUNCTION



FUNCTION IgnoreMail (recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT * FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where b.user_email = a.User_Email and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("user_email"))
			USRName = trim(RSCheck1("user_name"))
		ELSE
			USREmailID = "gurgaon@sisinfotech.com"	
			USRName = "SISUser"		
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please ignore our interview slot email sent to you on June 27, 2009. The particular mail was a test mail to assess our on-going automation process of recruitment and training at SIS. We appreciate your help in fine-tuning our recruitment process. Kindly do NOT respond to our previous interview slot email or this mail. </td></tr>"	

		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thanks for your cooperation. Have a nice day!</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Regards,</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator</td></tr>"	             
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'call SendGodaddyMail("careers@bizacumen.com",USREmailID,"BizAcumen Feedback",MessageBody1)
		''call SendGodaddyMail(USREmailID,"chv@bizAcumen.com","BizAcumen Feedback",MessageBody1)
		'call SendGodaddyMail(USREmailID,"partha@bizacumen.com","BizAcumen Feedback",MessageBody1)		
		
END FUNCTION

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''' update the status of the records that were selected for the check boxes''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
if trim(request("butnvalue"))<>"" then
	
	for each var in request.form
		if trim(var)<>"butnvalue" then
			''response.write var & "="& request(var)&"<br>"
			dim recID
			recID = right(var,len(var)-3)
			''' UPDATE Table and send mail
		
			con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
			UpdateMailSent = "Update Interview_Hyd_SelSlots set Mail_Sent='Y' where Rec_ID="&trim(recID)&""
			con.execute UpdateMailSent
			con.close()
			''' CALL Function''''
		''	SendMailNoSlotSelectionSIS(trim(recID))
		SendMailNoSlotSelectionBiz(trim(recID))
	''''''''''''''''''	SendMailNoSlotSelectionBizSERT(trim(recID))
		''	SendMailRejectionBiz(trim(recID))
		end if
	next
Response.redirect("Frm_SIS_View_1.asp")

end if

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''SEND mail when clicked on send email link on each record ''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
IF trim(request("num1mail"))<>"" then
	if isnumeric(trim(request("num1mail"))) then
		'''UPDATE Table Interview_Guraon_SelSlots for Mail_Sent status
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		UpdateMailSent = "Update Interview_Hyd_SelSlots set Mail_Sent='Y' where Rec_ID="&trim(request("num1mail"))&""
		''response.write UpdateMailSent
		
		con.execute UpdateMailSent
		con.close()
		''' CALL Function''''
	''''	SendMailNoSlotSelectionSIS(trim(request("num1mail")))	
	SendMailNoSlotSelectionBiz(trim(request("num1mail")))
		''''''''''''''	SendMailNoSlotSelectionBizSERT(trim(request("num1mail")))
		''	SendMailRejectionBiz(trim(request("num1mail")))	
	end if

END IF
%>

<html>
<head>
<title>View Analysts Data</title>
<script language="JavaScript">
function submitval(actval)
{
	var updateval;
	updateval = confirm("Confirm, Do you want to send email.");
	if (updateval==true)
	{
		window.frmsis.method="post";
		window.frmsis.action="Frm_SIS_View_1.asp";
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

function OpenWin1(num)
{
		window.frmsis.method="post";
		window.frmsis.action="Frm_SIS_View_1.asp?num1mail="+num;
		window.frmsis.submit();
}
</script>

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
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">Interview Details [<%=ttype%>]</font></big></strong></td>
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
		rec_per_page=50
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
		if trim(session("user_type"))="1" then
			if trim(request("candname"))<>"" then		
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and user_name like ('%"&trim(Request("candname"))&"%') order by rec_id"
			else
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and User_Status=11 and a.rec_id>=998 order by a.rec_id"
			end if
	
		else
			if trim(request("candname"))<>"" then
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and user_name like ('%"&trim(Request("candname"))&"%') and user_status=11 order by rec_id"
			else
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and User_Status=11 and a.rec_id>=998  order by a.rec_id"
			end if
		end if
	'''''''usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and a.rec_id>=998 order by a.rec_id"
		'''response.write usql1
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
				<a href="Frm_SIS_View_1.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&candname=<%=trim(request("candname"))%>&ttype=<%=ttype1%>"><%=i%></a>			
				<% start = start+cint(rec_per_page)
				E = E+cint(rec_per_page)
			next  
		   	if cp >= 1 then
				Response.Write ("</td><td  align=right width='30%'><font size='2' face=verdana color=""blue""><b>Page :&nbsp;<b>"&Cp&"") 
			end if  
				Response.Write ("</td></tr></table>")
		end if 	
		if cp > 1 then		 	 
			 rsDisp.AbsolutePosition = Request.QueryString("Start")
		END IF 
		Response.Write ("<tr>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Option</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Sl. No</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
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
					if trim(ucase(rsDisp("mail_sent")))="Y" then
						Response.Write ("<td align='center'>-Sent-</td>")
					else
						Response.Write ("<td align='center'><input type=""checkbox"" checked name=""chk"&rsDisp("Rec_id")&"""></td>")
					end if
					Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>"& no &"</font></a></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Education_PG") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Date_Created") &"</font></td>")
					if trim(ucase(rsDisp("mail_sent")))="Y" then
						Response.Write ("<td align='center'>Sent</td>")
					else
						Response.Write ("<td align='center'><a href='javascript:OpenWin1("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>Send mail</font></a></td>")
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
		Response.Write ("<tr bgcolor='white'>")
				Response.Write ("<td colspan=7 align=left><input type=""submit"" name=""butnvalue"" value=""Send mail"" onclick=""javascript:submitval('Accept')""></td>")					
		Response.Write ("</tr>")
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
