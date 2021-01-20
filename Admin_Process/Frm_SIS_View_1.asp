<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<%

If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if


FUNCTION SendMail(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "hyd@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>November 11, 2010</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for completing our online application. We are pleased to inform you that you have cleared our preliminary screening process. As part of our further evaluation process, we invite you to attend an interview and written test at our Hyderabad office (3rd Floor).</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for completing our online application. We are pleased to inform you that you have cleared our preliminary screening process. As part of our further evaluation process, we invite you to attend an interview and written test at our Hyderabad office.</td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We had sent a mail a few days back inviting you to attend an Interview/Written Test scheduled on August 28, 2010. Assuming that the mail might not have reached you the first time or might have gone into spam/junk folder, we have rescheduled another Interview/Test for you this Friday (September 03, 2010).</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please select your time slot for November 15 (Monday) or November 16, 2010 (Tuesday) interviews. Simply click on the link below and enter your given email address to view open time slots.</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td width='15%'><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td><font face='verdana' size='2'>Path:</td><td><font face='verdana' size='2'><a href='http://www.sisinfotech.com/HyderabadTest' target='_new'>http://www.sisinfotech.com/HyderabadTest</td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td><font face='verdana' size='2'>Path:</td><td><font face='verdana' size='2'><a href='http://www.sisinfotech.com/HydGraduateTest' target='_new'>http://www.sisinfotech.com/HydGraduateTest</td></tr>"
                MessageBody1 = MessageBody1 & "<tr><td><font face='verdana' size='2'>Email ID:</td><td><font face='verdana' size='2'>"&USREmailID&"</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>VENUE/LOCATION: SIS INFOTECH (P) LTD., FLOORS 3 & 4, LAXMI CYBER CENTER, ROAD NO. 12, BANJARA HILLS, HYDERABAD – 34, ANDHRA PRADESH. PHONE – 040-23301174</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>We request you to be present at the facility on time!</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The on-site test/interview will be less than 2 hours duration and candidates will be tested for their proficiency in English language. Candidates appearing for the written test are further interviewed on the same day. Selected candidates will be informed of their selection within a week after the test date through e-mail.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Please bring a copy of your resume, latest passport size photograph and a photo ID proof (Passport copy <u>or</u> driving license copy <u>or</u> voters ID card copy <u>or</u> PAN card copy <u>or</u> bank statement <u>or</u> telephone bill) along with you on the test date compulsorily. <b>Please note that you will be registered for the interview/test only upon providing the required documents.</b></p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Once again, let me thank you for your interest and look forward to your participation. On behalf of the entire team at SIS, let me wish you the very best in your pursuit of a suitable career. We hope that you'll find such a compelling and gratifying career with SIS.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>For directions to our Hyderabad office, additional details about our company, and frequently asked questions about the interview process, <a href='http://www.sisinfotech.com/faqs.asp' target='_new'>click here</a>.<br> We invite you to visit us at <a href='http://www.sisinfotech.com' target='_new'>www.sisinfotech.com</a>. Thank you.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Wishing you all the very best, </td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>hyd@sisinfotech.com  </td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		 call sendemail1("hyd@sisinfotech.com",USREmailID,"SIS Infotech Interview Call",MessageBody1)
		' call sendemail1(USREmailID,"srinivas@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		  call sendemail1(USREmailID,"chv@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
		'' call sendemail1(USREmailID,"aneesa@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
		''call sendemail1(USREmailID,"sr@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		
END FUNCTION



FUNCTION SendMailNoSlotSelectionBiz(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "hyderabad@bizacumen.com"	
			USRName = "BizUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>July 13, 2015</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We acknowledge the receipt of and thank you for your application for a job position at BizAcumen Research. Taking the recruitment and selection process further, we are pleased to inform that you have cleared the first round of elimination and have been selected to appear for a written test and interview at our premises. BizAcumen Research Pvt., Ltd. is a reputed KPO with clients in Europe and the United States. Join our team of professionals who provide world-class content to the most reputed publishers worldwide.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Date: July 16, 2015 (Thursday) </b></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Time: 10:00 AM to 04:00 PM based on your convenience.</b></td></tr>"
		
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><b>Test Venue/Location:</b> BizAcumen Research Pvt., Ltd., 4th Floor, Laxmi Cyber Center, Opposite Sitara Grand Hotel, Road No. 12, Banjara Hills (Phone: 040-23332999).</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>The written test/interview will be completed in about 2 to 3 hours. Primary aim of the written test is to evaluate each candidate's proficiency in written English. The interview process involves an objective review of education, talent, ability, and personality of each candidate. Selected candidates will be sent an EMAIL within five (5) working days after the test date.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>1. Detailed Resume,<br>2. Latest Passport Size Photograph, and <br>3. Photo ID Proof (Copy of Passport or Driving License or Voters ID Card or PAN Card or Savings Bank Account or Telephone Bill or Aadhar Card) - please carry a photocopy.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The written test/interview will be completed in about 2 to 3 hours. Primary aim of the written test is to evaluate each candidate's proficiency in written English. The interview process involves an objective review of education, talent, ability, and personality of each candidate. Selected candidates will be sent an EMAIL within five (5) working days after the test date.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify><b>Job Description</b><br>Please note the job profile involves research report design and administration; data reviews, analysis, and reporting; reviews of news events; preparation of analysis; and other related tasks that support the research process. Initial training is provided as per the aptitude, knowledge-level, training needs, and learning style of the individual. More would be explained to you once you start your probation with us.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>We invite you to visit our website <a href='http://www.BizAcumen.com' target='_new'>www.BizAcumen.com</a> to know more about us and the job profile. We look forward to meeting you.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Wishing you good luck!</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator, Research</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Pvt., Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>hyderabad@bizacumen.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	call SendGodaddyMail("hyderabad@bizacumen.com",USREmailID,"BizAcumen Interview Call",MessageBody1)
	
		call SendGodaddyMail(USREmailID,"chv@BizAcumen.com","BizAcumen Interview Call",MessageBody1)
              ''   call sendemail1(USREmailID,"hema@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
	''''call SendGodaddyMail(USREmailID,"partha@BizAcumen.com","BizAcumen Interview Call",MessageBody1)
		
END FUNCTION

FUNCTION SendMailNoSlotBizCampus(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "hyderabad@bizacumen.com"	
			USRName = "BizUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>March 24, 2014</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>We acknowledge receipt of and thank you for your application for a job position at BizAcumen Research. Taking the recruitment and selection process further, we are pleased to inform that you have cleared the first round of elimination and have been selected to appear for a written test and interview at our premises. You are requested to come for a test and interview on <b>March 26 (Wednesday)</b>.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please be present at <b>10:00 AM</b> at our premises located at <b>4th Floor, Laxmi Cyber Center, Opposite Sitara Grand Hotel, Road No. 12, Banjara Hills</b> (Phone: 040-23332999).</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>You are requested to be on time for the interview. <b>Please bring the following documents on the test/interview day</b>. You will be registered for the written test/interview only upon providing the requested documents.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>1. Detailed Resume,<br>2. Latest Passport Size Photograph, and<br>3. Copy of Photo ID Proof (Photocopy of Passport or Driving License or Voters ID Card or PAN Card or Savings Bank Account or Telephone Bill or Aadhar Card)</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The written test/interview will be completed in about 2 to 3 hours. Primary aim of the written test is to evaluate each candidate's proficiency in written English. The interview process involves an objective review of education, talent, ability, and personality of each candidate. Selected candidates will be sent an EMAIL within five (5) working days after the test date.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>We invite you to visit <a href='http://www.BizAcumen.com' target='_new'>www.BizAcumen.com</a> to know more about us. We thank you for your interest in working for BizAcumen Research and look forward to meeting you.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Wishing you good luck!</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator, Research</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>BizAcumen Research Pvt., Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>careers@bizacumen.com</td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''	call SendGodaddyMail("careers@bizacumen.com",USREmailID,"BizAcumen Interview Call",MessageBody1)
	
		call SendGodaddyMail(USREmailID,"chv@BizAcumen.com","BizAcumen Interview Call",MessageBody1)
              ''   call sendemail1(USREmailID,"hema@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
	''	call SendGodaddyMail("careers@bizacumen.com","partha@BizAcumen.com","BizAcumen Interview Call",MessageBody1)
		
END FUNCTION

FUNCTION SendMailNoSlotSelection(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "hyd@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>May 30, 2012</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for taking out time and applying online. Taking the recruitment and selection process further, we invite you to attend an interview and written test at our Hyderabad office either on June 04 (Monday) OR June 05, 2012 (Tuesday) based on your convenience. The written test forms the primary basis of your selection in SIS.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>TEST DATE: <b>: JUNE 04, 2012 (MONDAY) AND JUNE 05, 2012 (TUESDAY)</b></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>TEST TIME: <b>4:00 PM</b></td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>VENUE/LOCATION: SIS INFOTECH (P) LTD., LAXMI CYBER CENTER, OPPOSITE SITARA GRAND HOTEL, ROAD NO. 12, BANJARA HILLS, HYDERABAD–34, ANDHRA PRADESH. PHONE:040-23301174</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Please be present at the THIRD FLOOR security desk on time!</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The written test/interview will be less than 2 hours duration and candidates will be tested for their proficiency in written English. Candidates appearing for the written test are further interviewed on the same day. Selected candidates will be sent an EMAIL within 3-4 working days after the written test date.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Please bring a copy of your resume, latest passport size photograph and a photo ID proof (Copy of Passport <u>or</u> Driving License <u>or</u> Voters ID Card <u>or</u> PAN Card <u>or</u> Savings Bank Account <u>or</u> Telephone Bill <u>or</u> Aadhar Card) along with you on the test date compulsorily. <b>Please note that you will be registered for the written test/interview only upon providing the mentioned documents.</b></p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Once again, let me thank you for your interest in working for SIS and look forward to your participation. On behalf of the entire team at SIS, let me wish you the very best in your pursuit of a suitable career. We hope that you'll find such a compelling and gratifying career with SIS.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>For directions to our Hyderabad office and frequently asked questions about the testing and interview processes, please <a href='http://www.sisinfotech.com/faqs.asp' target='_new'>click here</a>. We invite you to visit <a href='http://www.sisinfotech.com' target='_new'>www.sisinfotech.com</a> to know more about us.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Best Regards,</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>hyd@sisinfotech.com </td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		call sendemail1("hyd@sisinfotech.com",USREmailID,"SIS Infotech Interview Call",MessageBody1)
		' call sendemail1(USREmailID,"srinivas@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		call sendemail1(USREmailID,"chv@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
              ''   call sendemail1(USREmailID,"hema@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
		''call sendemail1(USREmailID,"aneesa@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
		
END FUNCTION


FUNCTION SendMail1(recID1)

		SET RSCheck1 = SERVER.CREATEOBJECT("ADODB.RECORDSET")
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname) 
		
		SQL = "SELECT *,a.user_email as USREmailID  FROM Interview_Hyd_SelSlots a, TBL_SIS_Applications b where (b.user_email = a.User_Email or b.User_AlternateEmail=a.User_Email) and b.Rec_ID=a.Rec_ID and a.rec_id="& trim(recID1) &""
		RSCheck1.OPEN SQL,con,1,2
		If Not RSCheck1.EOF Then
			USREmailID = trim(RSCheck1("USREmailID"))
			USRName = trim(RSCheck1("surname")) & " " &  trim(RSCheck1("user_name")) 
		ELSE
			USREmailID = "hyd@sisinfotech.com"	
			USRName = "SISUser :"& trim(recID1)	
		end if
		SET RSCheck1=nothing
		con.close()
		'''''''''''''''''''''''''SEND EMAIL CODE STRING''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		MessageBody1 = MessageBody1 & "<table width='55%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>May 10, 2010</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Dear "&USRName&",</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Thank you for completing our online application. A preliminary screening shows that you satisfy our basic qualifications necessary for offering you a written test. We are pleased to invite you to attend an interview and written test at our Hyderabad office.</td></tr>"
        MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Please select your time slot for May 15, 2009 (Saturday) interviews. Simply click on the link below and enter your email address to view open time slots.</td></tr>"
                ''MessageBody1 = MessageBody1 & "<tr><td width='15%'><font face='verdana' size='2'>&nbsp;</td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td><font face='verdana' size='2'>Path:</td><td><font face='verdana' size='2'><a href='http://www.sisinfotech.com/HyderabadTest' target='_new'>http://www.sisinfotech.com/HyderabadTest</td></tr>"
                ''MessageBody1 = MessageBody1 & "<tr><td><font face='verdana' size='2'>Email ID:</td><td><font face='verdana' size='2'>"&USREmailID&"</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>TEST DATE: May 15, 2010 (THURSDAY)</td></tr>"
       	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>TEST TIME: 3.00 PM</td></tr>"
       	MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>VENUE/LOCATION: SIS INFOTECH (P) LTD., FLOORS 3 & 4, LAXMI CYBER CENTER, ROAD NO. 12, BANJARA HILLS, HYDERABAD – 34, ANDHRA PRADESH. PHONE – 040-23301174</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>We request you to be present at the facility on time!</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>The on-site test/interview will be less than 2 hours duration and candidates will be tested for their proficiency in English language. You will be given a topic and asked to write about it. Candidates appearing for the written test are further interviewed on the same day. Successful candidates will be informed of their selection within a week after the test date through e-mail. Please bring a copy of your resume and a latest passport size photograph along with you on the test date compulsorily.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'><p align=justify>Once again, let me thank you for your interest and look forward to your participation. On behalf of the entire team at SIS, let me wish you the very best in your pursuit of a suitable career. We hope that you'll find such a compelling and gratifying career with SIS.</p></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>For directions to our Hyderabad office, additional details about our company,and frequently asked questions about the interview process, <a href='http://www.sisinfotech.com/faqs.asp' target='_new'>click here</a>.<br>We invite you to visit us at <a href='http://www.sisinfotech.com' target='_new'>www.sisinfotech.com</a>. Thank you.</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Wishing you all the very best, </td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>Recruitment Coordinator</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>SIS Infotech Pvt. Ltd.</td></tr>"
 		MessageBody1 = MessageBody1 & "<tr><td colspan=2><font face='verdana' size='2'>hyd@sisinfotech.com  </td></tr>"               
 		MessageBody1 = MessageBody1 & "</table>"

		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		''''  call sendemail1("hyd@sisinfotech.com  ",USREmailID,"SIS Infotech Interview Call",MessageBody1)
		' call sendemail1(USREmailID,"srinivas@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		  call sendemail1(USREmailID,"chv@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)
                 call sendemail1(USREmailID,"hema@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		''call sendemail1(USREmailID,"sr@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		
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
		'call sendemail1("gurgaon@sisinfotech.com",USREmailID,"SIS Infotech Interview Call",MessageBody1)
		'call sendemail1(USREmailID,"srinivas@strategyr.com","SIS Infotech Interview Call",MessageBody1)
		'call sendemail1(USREmailID,"nagamani@sisinfotech.com","SIS Infotech Interview Call",MessageBody1)		
		
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
			''SendMailNoSlotSelection(trim(recID))
			 SendMailNoSlotSelectionBiz(trim(recID))
			'' SendMailNoSlotBizCampus(trim(recID))
			SendMailNoSlotSelectionBiz(trim(recID))

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
		con.execute UpdateMailSent
		con.close()
		''' CALL Function''''
		SendMailNoSlotSelectionBiz(trim(request("num1mail")))
		''SendMailNoSlotSelection(trim(request("num1mail")))	
	''	SendMailNoSlotBizCampus(trim(request("num1mail")))	
		''SendMailNoSlotBizCampus(trim(request("num1mail")))
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
<link href="../globind.css" rel="stylesheet" type="text/css">
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
			if (trim(request("candname"))<>"") then		
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and user_name like ('%"&trim(Request("candname"))&"%') order by rec_id"
			else
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and User_Status=11  order by a.rec_id"
			end if
		else
			if trim(request("candname"))<>"" then
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and user_name like ('%"&trim(Request("candname"))&"%') and user_status=11 order by rec_id"
			else
				usql1="select * from TBL_SIS_Applications a, Interview_Hyd_SelSlots b where b.Rec_ID=a.Rec_ID and User_Status=11 order by a.rec_id"
			end if
		end if
		''response.write usql1
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
