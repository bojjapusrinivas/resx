<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<!--#include file="../ASPIncludes_vizag/SendEmail.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
'''actstat="&rsDisp("User_status")&"
'''stat=A
'''RecID="&rsDisp("Rec_id")&"
'''emailid="&rsDisp("User_Email")&"
if trim(request("butnvalue"))<>"" then
for each var in request.form
	if trim(var)<>"butnvalue" then
		response.write var & "="& request(var)&"<br>"
		dim recID
		recID = right(var,len(var)-3)
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			'''' update sent status
			con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
			set cmdEdit=server.CreateObject("ADODB.Command")
			response.write ("update TBL_SIS_ApplicationsNaukri set user_status=4,Reason_Update='deleted by "&trim(session("user_name")) & "' where Rec_id =" & recID)
			'response.end
			con.execute("update TBL_SIS_ApplicationsNaukri set user_status=4,Reason_Update='deleted by "&trim(session("user_name")) & "' where Rec_id =" & recID)
			'cmdEdit.ActiveConnection = con			
			'	with cmdEdit 				
			'		.CommandText = "SP_TBL_SIS_Applications"
			'		.CommandType = adcmdStoredProc	
			'		.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATEADM")
			'		.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
			'		.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,trim(request("Name")))
			'		.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,trim(request("Address")))
			'		.Parameters.Append .CreateParameter ("@MyUser_Age",advarchar,adparamInputOutput,50,1)
			'		.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,trim(request("Phone")))
			'		.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,trim(request("Email")))
			'		.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,trim(PGEducation))
			'		.Parameters.Append .CreateParameter ("@MyYear_Passed",advarchar,adparamInputOutput,50,1)
			'		.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,trim(request("CurrentEmp")))
			'		.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,trim(request("EmpStatus")))				
			'		.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,1000,trim(workExp))
			'		.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,trim(request("Spoken")))
			'		.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,trim(request("Written")))
			'		.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,trim(request("Windows")))
			'		.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,trim(request("Keyboard")))
			'		.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,trim(request("Word")))
			'		.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,trim(request("Excel")))
			'		.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,trim(request("Access")))
			'		'.Parameters.Append .CreateParameter ("@MyPowerpoint_Skills",advarchar,adparamInputOutput,10,trim(request("Powerpoint")))
			'		.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,trim(request("Skills")))
			'		.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
			'		.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
			'		.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,10,trim(session("username")))
			'		.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,4)
			'		.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,null)
			'		.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,2)
			''		.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
			'		.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,UserRank)
			'		.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
			'		.Execute
			'	end with
			'loadedval = trim(cmdEdit.Parameters("@MyResult"))
			'set cmdEdit = nothing
			
			'Set rsDisp =Server.CreateObject("ADODB.Recordset")
			'rsDisp.ActiveConnection = con
			'rsDisp.CursorType = 3
			'usql1="select * from TBL_SIS_Applications where rec_id = "&trim(recID)&""
			'rsDisp.open usql1
			'if not rsDisp.eof then
			'	useremail = rsDisp("User_Email")
			'	actstat = rsDisp("User_Status")
			'end if
			'set rsDisp=nothing
			con.close()
			'dim fromemailID
			'TOemailID = "careers@sisinfotech.com"
			''fromemailID = "srinivas@sisinfotech.com"
			'if loadedval=2 then
			'	'''send mail to users
			'	dim mysubject
			'	useremail = trim(request("emailid"))
			'	mysubject=""
			'	mysubject = mysubject & "<font face='verdana' size='2'>Dear,<br></font><br>"
			'	if trim(actstat)="2" then
			'		mysubject = mysubject & "<font face='verdana' size='2'>Dated : "&now()&"<br><br></font>"
			'		mysubject = mysubject & "<font face='verdana' size='2'>We are pleased to inform you that your application has been approved for a written test<br><br></font>"
			'	else
			'		mysubject = mysubject & "<font face='verdana' size='2'>Your application has been Declined for furthur processing.<br><br></font>"
			'	end if
			'	mysubject = mysubject & "<font face='verdana' size='2'><br>Sincerely,<br><br>SIS Infotech Pvt. LTD.<br></font><br>"
			'	call sendemail1(TOemailID,useremail,"Your SIS Infotech Application details",mysubject)	
			 'End if
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			end if
next
Response.Redirect ("Frm_SIS_Final_ViewNu.asp?Message="&loadedval&"")
end if
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
			''.Execute
		end with
	loadedval = trim(cmdEdit.Parameters("@MyResult"))
	set cmdEdit = nothing
	con.close()
	
	TOemailID = "careers@sisinfotech.com"
	useremail = trim(request("emailid"))
	''fromemailID = "srinivas@sisinfotech.com"
	if loadedval=2 then
		'''send mail to users
		useremail = trim(request("emailid"))
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
	Response.Redirect ("Frm_SIS_Final_ViewNu.asp?Message="&loadedval&"")
End If

 Function PCase(byVal string)
	Dim Tmp, Word, Tmp1, Tmp2, firstCt, a, sentence, c, i
	If IsNull(string) Then
		PCase = Null
		Exit Function
	Else
		string = CStr( string )
	End If
	a = Split( string, vbCrLf )
	c = UBound(a)
	i = 0
	For each sentence in a
		Tmp = Trim( sentence )
		Tmp = split( sentence, " " )
		For Each Word In Tmp
			Word = Trim( Word )
			Tmp1 = UCase( Left( Word, 1 ) )
			Tmp2 = LCase( Mid(  Word, 2 ) )
			PCase = PCase & Tmp1 & tmp2 & " "
		Next
		PCase = Left( PCase, Len(PCase) - 1 )
		If i = c then
		Else
			PCase = PCase & vbCrLf
		End If
		i = i + 1
	Next
End Function

%>
<html>
<head>
<title>View Analysts Data</title>
<script language="JavaScript">
function submitval(actval)
{
	var updateval;
	updateval = confirm("Do you want to update the status to "+actval);
	if (updateval==true)
	{
		window.frmsis.method="post";
		window.frmsis.action="Frm_SIS_Final_ViewNu.asp";
		window.frmsis.submit();
		return true;
	}	
	else
	{
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
		//myWin = open("ApplicantInfo.asp?ID="+num ,"userwin","width=780,height=550,status=no,toolbar=no,resizable=yes,menubar=no,scrollbars=yes");
		myWin = open("ApplicantInfo.asp?ID="+num ,"userwin","");
			//AnAApplicantIntinfoSearch.asp
		myWin = open("AnAApplicantIntinfoSearchNu.asp?ID="+num ,"userwin","");

	}
function OpenAnaWin(num)
	{ 
		myWin = open("AnAApplicantinfo.asp?ID="+num+"#callID1" ,"userwin","width=780,top=5,left=5,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
		myWin = open("AnAApplicantinfo.asp?ID="+num+"#callID1" ,"userwin","");
		

	}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<form name="frmsis" method="post">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="../ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#9DC3F5" valign="top"><!--#include file="../ASPIncludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
<%ttypName="(Approved)"
if trim(request("ttype")) ="2" then
ttypName="(Approved)"
elseif trim(request("ttype")) ="3" then
ttypName="(Declined)"
elseif trim(request("ttype")) ="5" then
ttypName="(Hold)"
elseif trim(request("ttype")) ="6" then
ttypName="(Test Taken)"
elseif trim(request("ttype")) ="9" then
ttypName="(High Expectations)"
elseif trim(request("ttype")) ="10" then
ttypName="(Competitor)"
end if%>
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#3767A6"><p align="center"><strong><big><font color="#FFFFFF">All Naukri Viewed Requests <%=ttypName%></font></big></strong></td>
  </tr>
  <tr><td colspan="7" bgcolor="#C5D9F3"><font size='1' face=verdana>
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

<%if trim(session("user_type"))="10" then%>

<%else%>

         <!--tr>
		<td align="center" width="95%" bgcolor="#ffffff" height="20"><font face="verdana" size="2"><a href="Frm_SIS_Final_ViewNu.asp?ttype=2"><font face="verdana" size="2"><b>Approved</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=5"><font face="verdana" size="2"><b>Hold</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_ViewNu.asp?ttype=4"><font face="verdana" size="2"><b>Sent</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=6"><font face="verdana" size="2"><b>Test Taken</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=9"><font face="verdana" size="2"><b>High Expectations</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=10"><font face="verdana" size="2"><b>Competitor</b></font></a> 
		</td>
		
	</tr-->

<tr><td align="left" width="95%" bgcolor="#ffffff" height="25">

<%if trim(session("user_type"))="7" then%>
	<!-- <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=15"><font face="verdana" size="2"><b>Graduates</b></font></a> | &nbsp;&nbsp;<a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=2"><font face="verdana" size="2"><b>URL Download</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=3"><font face="verdana" size="2"><b>URL Packaging</b></font></a>-->
<%elseif trim(session("user_type"))="5" and trim(request("ttype")) ="2" then%>
<!--  <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=1"><font face="verdana" size="2"><b>R&A</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=15"><font face="verdana" size="2"><b>Graduates</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=4"><font face="verdana" size="2"><b>RAG</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=5"><font face="verdana" size="2"><b>RSG-I</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=6"><font face="verdana" size="2"><b>Search Engine Research Team(SERT)</b></font></a> -->
<%elseif trim(request("ttype")) ="2" then%>
<!-- 	<a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=1"><font face="verdana" size="2"><b>R&A</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=15"><font face="verdana" size="2"><b>Graduates</b></font></a>| <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=16"><font face="verdana" size="2"><b>eNet</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=2"><font face="verdana" size="2"><b>URL Download</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=3"><font face="verdana" size="2"><b>URL Packaging</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=4"><font face="verdana" size="2"><b>RAG</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=5"><font face="verdana" size="2"><b>RSG-I</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=6" title='N-20/SERT'><font face="verdana" size="2"><b>Search Engine Research</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=7"><font face="verdana" size="2"><b>DTP</b></font></a> |  -->
<%end if%>

 <!--  <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=8"><font face="verdana" size="2"><b>Gurgaon</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=9"><font face="verdana" size="2"><b>Pune</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=10"><font face="verdana" size="2"><b>Mumbai</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=11"><font face="verdana" size="2"><b>Chennai</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=12"><font face="verdana" size="2"><b>Coimbatore</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=13"><font face="verdana" size="2"><b>Bangalore</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=14"><font face="verdana" size="2"><b>Video Editing</b></font></a> | <a href="Frm_SIS_Final_ViewNu.asp?ttype=2&ppost=17"><font face="verdana" size="2"><b>Personal Managers-Gurgaon</b></font></a>-->

</td>
</tr>
<%end if%>

  <tr>
    <td width="100%"><div align="center"><center>
    <table align="center" width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#f0e5dd" style="border-collapse:collapse;">
	<tr>
		<td colspan="8">
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
		if trim(request("ppost"))="1" then
		   PostName=" and Reason_update like '%R&A%'"
		elseif trim(request("ppost"))="2" then	
		   'PostName=" and post_applied='Quality Control Team'"   
		   PostName=" and Reason_update like '%URL Download%'"
		elseif trim(request("ppost"))="3" then	
		   PostName=" and Reason_update like '%URL Packaging%'"   
		   'PostName=" and post_applied='Content Development'"
		elseif trim(request("ppost"))="4" then	
		  ' PostName=" and post_applied='Data Entry'"
		  PostName=" and Reason_update like '%RAG%'" 
		elseif trim(request("ppost"))="5" then	
		  ' PostName=" and post_applied='Desktop Publications'" 
		   PostName=" and Reason_update like '%RSG-I%'" 
		elseif trim(request("ppost"))="6" then	
		   PostName=" and (Reason_update like ('%N-20%') or (Reason_update like ('%SERT%')))"
		elseif trim(request("ppost"))="7" then	
		   PostName=" and Reason_update like '%DTP%'"
		elseif trim(request("ppost"))="8" then	
		   PostName=" and Reason_update like '%Gurgaon%'"
		elseif trim(request("ppost"))="9" then	
		   PostName=" and Reason_update like '%Pune%'"
		elseif trim(request("ppost"))="10" then	
		   PostName=" and Reason_update like '%Mumbai%'"
		elseif trim(request("ppost"))="11" then	
		   PostName=" and Reason_update like '%Chennai%'"
		elseif trim(request("ppost"))="12" then	
		   PostName=" and Reason_update like '%Coimbatore%'"
		elseif trim(request("ppost"))="13" then	
		   PostName=" and Reason_update like '%Bangalore%'"
		elseif trim(request("ppost"))="14" then	
		   PostName=" and Reason_update like '%video editing%'"
		elseif trim(request("ppost"))="15" then	
		   PostName=" and Reason_update like '%Graduate%'"
		elseif trim(request("ppost"))="16" then	
		   PostName=" and Reason_update like '%eNet%'"
		elseif trim(request("ppost"))="17" then	
		   PostName=" and Reason_update like '%Personnel Manager%'"
		end if	
		if trim(TStat)="4"  then		
			usql1="select * from TBL_SIS_ApplicationsNaukri where  Applicationfor='Hyderabad' and user_status=2  and Reason_update like '%eNet%' and rec_id >12772 order by Reason_Update"
		elseif trim(TStat)="0"  then
			usql1="select * from TBL_SIS_ApplicationsNaukri where  Reason_update like '%eNet%' and rec_id >12772  order by Reason_Update"  '9541
		elseif trim(TStat)="6"  then
			usql1="select * from TBL_SIS_ApplicationsNaukri where  Reason_update like '%eNet%' and rec_id >12772  order by Reason_Update"
		else
			usql1="select * from TBL_SIS_ApplicationsNaukri where admin_status=1 and user_status="&TStat& PostName &"  and Reason_update like '%eNet%' and user_status <> 8 and rec_id >12772  order by Reason_Update"
		end if

	if trim(session("user_type"))="5" then
			'postname=" and ((Reason_Update like ('RAG%') or Reason_Update like ('RSG-I%') or Reason_Update like ('N-20%') or Reason_Update like ('SERT%')) or Reason_Update like '%padmaja%')"
			'usql1="select * from TBL_SIS_ApplicationsNaukri where admin_status=1 and  Applicationfor='Hyderabad' and user_status="&TStat& PostName &"  and ana_No is null order by rec_id"
			usql1="select * from TBL_SIS_ApplicationsNaukri where admin_status=1  and user_status="&TStat& PostName &" and rec_id >12772   order by Reason_Update"
			'Response.write usql1
			'response.end

                            if lcase(trim(session("user_name"))) ="raghu" then
                                      postname=" and Reason_Update like '%raghu%'"
			              usql1="select * from TBL_SIS_ApplicationsNaukri where admin_status=1 and Applicationfor='Hyderabad' and user_status="&TStat& PostName &" and rec_id >12772  order by Reason_Update"
                            end if

		end if
		
		if trim(session("user_type"))="7" then
			''postname=" and (Reason_Update like ('URL%') or Reason_Update like '%maha%' )"
			usql1="select * from TBL_SIS_ApplicationsNaukri where admin_status=1  and user_status="&TStat& PostName &"  and user_status <> 8 and rec_id >12772  order by Reason_Update"
			if trim(TStat)="6"  then
			 usql1="select * from TBL_SIS_ApplicationsNaukri where admin_status=1  " & PostName &" and user_status <> 8 and rec_id >12772  order by Reason_Update"
			end if
			'Response.write usql1
			'response.end
		end if
		'response.write usql1
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
				<a href="Frm_SIS_Final_ViewNu.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&ttype=<%=trim(request("ttype"))%>&ppost=<%=trim(request("ppost"))%>"><%=i%></a>			
				<% start = start+cint(rec_per_page)
				E = E+cint(rec_per_page)
			next  
		   	if cp >= 1 then
				Response.Write ("</td><td  align=right width='15%'><font size='2' face=verdana color=""blue""><b>Page :&nbsp;<b>"&Cp&"") 
			end if  
				Response.Write ("</td></tr></table>")
		end if 	
		IF not rsDisp.EOF THEN	
		if cp > 1 then		 	 
			 rsDisp.AbsolutePosition = Request.QueryString("Start")         
		END IF 
		Response.Write ("<tr bgcolor=#C5D9F3>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Option</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Main ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			''Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Post</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Expected Salary</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Reason</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Phone</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Options</font></th>")
		Response.Write ("</tr>")
		''IF not rsDisp.EOF THEN					
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
					Response.Write ("<td align='left'><font face='verdana' size='2'>"  & PCase(rsDisp("User_Name")) &"</font></td>")
					''Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("post_applied") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("annualSalary") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Reason_Update") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("user_phone") &"</font></td>")
					'response.write trim(rsDisp("Admin_Status") & rsDisp("User_Status"))
					if trim(TStat)="0" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
					else

					  if trim(TStat)="6" then
						Response.Write ("<td align='center'><a href='javascript:OpenAnaWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")	
					  else
						if trim(rsDisp("Admin_Status"))="1" then
							if trim(rsDisp("User_Status"))="1" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
							elseif trim(rsDisp("User_Status"))="2" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") '| <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="3" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") '| <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="5" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="6" then
								Response.Write ("<td align='center'><a href='javascript:OpenAnaWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="9" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="10" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							end if
						else
							Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewNu.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Re-send Email</font></a></td>")
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
		if session("user_type") =4  then
			Response.Write ("<tr bgcolor='white'>")
			Response.Write ("<td colspan=8 align=left><input type=""submit"" name=""butnvalue"" value=""Delete"" onclick=""javascript:submitval('Delete')""></td>")		
			Response.Write ("</tr>")
		end if
		if session("user_type") =4 or session("user_type") =5 or session("user_type") =7 then
		''	Response.Write ("<tr bgcolor='white'>")
		''		Response.Write ("<td colspan=8 align=left>&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Decline"" onclick=""javascript:submitval('Decline');"">&nbsp;&nbsp;&nbsp;<input type=""submit"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold');""></td>")
		''	Response.Write ("</tr>")
		end if
		if (TStat = "2" or TStat = "3" or TStat = "1") then
			Response.Write ("<tr bgcolor='white'>")
				'Response.Write ("<td colspan=8 align=left><input type=""submit"" name=""butnvalue"" value=""Send mail"" onclick=""javascript:submitval('send mail')""></td>")					
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
<!--#include file="../ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>

</body>
</html>
