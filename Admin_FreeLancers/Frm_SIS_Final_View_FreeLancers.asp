<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
'''actstat="&rsDisp("User_status")&"
'''stat=A
'''RecID="&rsDisp("Rec_id")&"
'''emailid="&rsDisp("User_Email")&"
for each var in request.form
	if trim(var)<>"butnvalue" then
		response.write var & "="& request(var)&"<br>"
		dim recID
		recID = right(var,len(var)-3)
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			'''' update sent status
			con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
			set cmdEdit=server.CreateObject("ADODB.Command")
			cmdEdit.ActiveConnection = con			
				with cmdEdit 				
					.CommandText = "SPTBL_SIS_FreeLancer_New"
					.CommandType = adcmdStoredProc	
						.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
						.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
						.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,"Name")
						.Parameters.Append .CreateParameter ("@MyUser_Gender",advarchar,adparamInputOutput,10,"Gender")
						.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,"Address")
						.Parameters.Append .CreateParameter ("@MyUser_City",advarchar,adparamInputOutput,10,"City")
						.Parameters.Append .CreateParameter ("@MyUser_Age",adInteger,adparamInputOutput,,1)
						.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,"Phone")
						.Parameters.Append .CreateParameter ("@MyUser_Mobile",advarchar,adparamInputOutput,20,"mobile")
						.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,"Email")
						.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,"PGEducation")
						.Parameters.Append .CreateParameter ("@MyEducation_Graduate",advarchar,adparamInputOutput,500,"UGEducation")
						.Parameters.Append .CreateParameter ("@MyYear_Passed",adInteger,adparamInputOutput,,1)
						.Parameters.Append .CreateParameter ("@MyMarital_Status",advarchar,adparamInputOutput,10,"Status")				
						.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,"stat")
						.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,"EmpStatus")
						.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,1000,"workExp")
						.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,"Spoken")
						.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,"Written")
						.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,"Windows")
						.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,"Keyboard")
						.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,"Word")
						.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,"Excel")
						.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,"Access")
						.Parameters.Append .CreateParameter ("@MyPowerpoint_Skills",advarchar,adparamInputOutput,10,"Powerpoint")
						.Parameters.Append .CreateParameter ("@MyHours_Per_Week",adInteger,adparamInputOutput,,1)
						.Parameters.Append .CreateParameter ("@MyOwn_Computer",advarchar,adparamInputOutput,10,"Computer")
						.Parameters.Append .CreateParameter ("@MyInternet_Access",advarchar,adparamInputOutput,10,"Internet")

						.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
						.Parameters.Append .CreateParameter ("@@MyDate_Updated",adDate,adparamInputOutput,8,now())
						.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,10,trim(session("username")))
						.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,4)
						.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,null)
						.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,2)
						.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"fREElANCER")
						.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
					.Execute
				end with
			loadedval = trim(cmdEdit.Parameters("@MyResult"))
			set cmdEdit = nothing
			
			Set rsDisp =Server.CreateObject("ADODB.Recordset")
			rsDisp.ActiveConnection = con
			rsDisp.CursorType = 3
			usql1="select * from TBL_SIS_FreeLancernew where rec_id = "&trim(recID)&""
			rsDisp.open usql1
			if not rsDisp.eof then
				useremail = rsDisp("User_Email")
				actstat = rsDisp("User_Status")
			end if
			set rsDisp=nothing
			con.close()
			dim fromemailID
			TOemailID = "careers@sisinfotech.com"
			''fromemailID = "srinivas@sisinfotech.com"
			if loadedval=2 then
				'''send mail to users
				dim mysubject
				useremail = trim(request("emailid"))
				mysubject=""
				mysubject = mysubject & "<font face='verdana' size='2'>Dear,<br></font><br>"
				if trim(actstat)="2" then
					mysubject = mysubject & "<font face='verdana' size='2'>Dated : "&now()&"<br><br></font>"
					mysubject = mysubject & "<font face='verdana' size='2'>We are pleased to inform you that your application has been approved for a written test<br><br></font>"
				else
					mysubject = mysubject & "<font face='verdana' size='2'>Your application has been Declined for furthur processing.<br><br></font>"
				end if
				mysubject = mysubject & "<font face='verdana' size='2'><br>Sincerely,<br><br>SIS Infotech Pvt. LTD.<br></font><br>"
				''call sendemail1(TOemailID,useremail,"Your SIS Infotech Application details",mysubject)	
			 End if
				'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			end if
next

''''stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"
if (trim(request("stat"))<>"" and trim(request("emailid"))<>"") then
	'''' update sent status
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmdEdit=server.CreateObject("ADODB.Command")
	cmdEdit.ActiveConnection = con			
		with cmdEdit 				
			.CommandText = "SP_TBL_SIS_FreeLancer_New"
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
			.Parameters.Append .CreateParameter ("@MyPowerpoint_Skills",advarchar,adparamInputOutput,10,trim(request("Powerpoint")))
			.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,trim(request("Skills")))
			.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
			.Parameters.Append .CreateParameter ("@@MyDate_Updated",adDate,adparamInputOutput,8,now())
			.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,10,trim(session("username")))
			.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,4)
			.Parameters.Append .CreateParameter ("@@MyReason_Update",advarchar,adparamInputOutput,500,null)
			.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,2)
			.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
			.Execute
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
		''call sendemail1(TOemailID,useremail,"Your SIS Infotech Application details",mysubject)	
	 End if
	Response.Redirect ("Frm_SIS_Final_View_FreeLancers.asp?Message="&loadedval&"")
End if
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
		window.frmsis.action="Frm_SIS_Final_View_FreeLancers.asp";
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
		myWin = open("Approved_Applicantinfo_FreeLancers.asp?ID="+num+"#callID1" ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
	}
function OpenWin1(num)
	{ 
		myWin = open("Approved_Applicantinfo_FreeLancers2.asp?ID="+num+"#callID1" ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
	}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<form name="frmsis" method="post">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="aspincludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="aspincludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font  face='verdana' size='2' color="#FFFFFF">Viewed Freelancers Requests</font></big></strong></td>
  </tr>
  <tr><td colspan="7" bgcolor="#f0e5dd"><font size='1' face=verdana>
	<b>Note :</b><br>1. Click on <b>View</b> link to view the complete data of the user.
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
  <tr>
		<td align="center" width="95%" bgcolor="#ffffff"><!--font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=1"><font face="verdana" size="2"><b>Pending</b></font></a> |--> [<font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=2"><font face="verdana" size="2"><b>Accept Stage</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=2&vtype=p"><font face="verdana" size="2"><b>Prv</b></font></a>] | [<a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=3"><font face="verdana" size="2"><b>Rejected</b></font></a>  | <font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=3&vtype=p"><font face="verdana" size="2"><b>Prv</b></font></a>] <!--| [<a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=4"><font face="verdana" size="2"><b>Deleted</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=4&vtype=p"><font face="verdana" size="2"><b>Prv</b></font></a>]--> | [<a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=6"><font face="verdana" size="2"><b>Hold</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=6&vtype=p"><font face="verdana" size="2"><b>Prv</b></font></a>]</td>
			<!--<font face="verdana" size="2"><a href="Frm_SIS_Final_View_FreeLancers.asp?ttype=5"><font face="verdana" size="2"><b>Accept Stage 2</b></font></>-->
		</td>
	</tr>
  <tr>
    <td width="100%"><div align="center"><center>
    <table align="center" width="100%" border="1" bordercolor="black" cellpadding="2" cellspacing="2" bgcolor="#f0e5dd" style="border-collapse:collapse;">
	<tr>
		<td colspan="9">
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
		if trim(request("vtype"))="p" then
				usql1="select * from TBL_SIS_FreeLancernew where user_status="&TStat&" and Rec_id <=3470 order by Points_Scored desc,rec_id"
		else
		  if trim(TStat) = "2" then
		     ' usql1="select * from TBL_SIS_FreeLancernew where (user_status="&TStat&" or user_status=5) and Rec_id >3470 order by Points_Scored desc,rec_id"
			usql1="select * from TBL_SIS_FreeLancernew where (user_status="&TStat&" ) and Rec_id >0 order by Points_Scored desc,rec_id"
		  elseif trim(TStat) = "3" then
		   usql1="select * from TBL_SIS_FreeLancernew where user_status="&TStat&" and Rec_id >0 order by Points_Scored desc,rec_id"
		  else
		   usql1="select * from TBL_SIS_FreeLancernew where user_status="&TStat&"  and Rec_id >0 order by Points_Scored desc,rec_id"
		  end if
		end if
	''	response.write usql1
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
				<a href="Frm_SIS_Final_View_FreeLancers.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&ttype=<%=trim(request("ttype"))%>&vtype=<%=trim(request("vtype"))%>"><%=i%></a>			
				<% start = start+cint(rec_per_page)
				E = E+cint(rec_per_page)
			next  
		   	if cp >= 1 then
				Response.Write ("</td><td  align=right width='10%'><font size='2' face=verdana color=""blue""><b>Page :&nbsp;<b>"&Cp&"") 
			end if  
				Response.Write ("</td></tr></table>")
		end if 	
		if cp > 1 then		 	 
			 rsDisp.AbsolutePosition = Request.QueryString("Start")         
		END IF 
		Response.Write ("<tr>")
			Response.Write ("<th><font face=""verdana"" size=""2"">S.No</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Main ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Rank1</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Rank2</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Status</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Date By</font></th>")
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
					UsrStat = "<font color='green'>Accept stage 1</font>"
				elseif trim(rsDisp("User_Status"))="3" then
					UsrStat = "<font color='red'>Rejected by " &  rsDisp("updated_by") & "</font>" 
				elseif trim(rsDisp("User_Status"))="4" then
					UsrStat = "<font color='blue'>Deleted</font>"
				elseif trim(rsDisp("User_Status"))="5" then
					UsrStat = "<font color='blue'>Accept stage 2</font>"
				elseif trim(rsDisp("User_Status"))="6" then
					UsrStat = "<font color='blue'>Hold</font>"
				end if
				Response.Write ("<tr bgcolor='white'>")					
					'if (trim(rsDisp("User_Status"))="2" or trim(rsDisp("User_Status"))="3" or trim(rsDisp("User_Status"))="5") then
					'	if trim(rsDisp("Admin_Status"))="1" then
					'		Response.Write ("<td align='center'><input type=""checkbox"" name=""chk"&rsDisp("Rec_id")&"""></td>")
					'	else
					'		Response.Write ("<td align='center'>sent</td>")
					'	end if
					'else
					'	Response.Write ("<td align='center'>--</td>")
					'end if
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& no &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Rec_id") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Points_Scored") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Points_Scored1") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& UsrStat &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Date_Updated") &"</font></td>")
					if trim(TStat)="0" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
					else
						if trim(rsDisp("Admin_Status"))="1" then
							if trim(rsDisp("User_Status"))="1" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
							elseif trim(rsDisp("User_Status"))="2" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> </td>")
							elseif trim(rsDisp("User_Status"))="3" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> </td>")
							elseif trim(rsDisp("User_Status"))="4" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> </td>")
							elseif trim(rsDisp("User_Status"))="6" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> </td>")
							
							elseif trim(rsDisp("User_Status"))="5" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin1("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> <!--| <a href='Frm_SIS_Final_View_FreeLancers.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a--></td>")
							end if
						else
							Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='Frm_SIS_Final_View_FreeLancers.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Re-send Email</font></a></td>")
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
					Response.Write ("<td colspan=9 align=center><font face='verdana' size='2' color='red'>-- No Records Found --</font></td>")					
			Response.Write ("</tr>")
		End if
		set rsDisp=nothing
		con.close()
		'if (TStat = "2" or TStat = "3" or TStat = "5") then
			'Response.Write ("<tr bgcolor='white'>")
				'Response.Write ("<td colspan=9 align=left><input type=""submit"" name=""butnvalue"" value=""Send mail"" onclick=""javascript:submitval('send mail')""></td>")					
			'Response.Write ("</tr>")		
		'end if
		%>
	</table>
    </center></div></td>
  </tr>
</table></form>
</td></tr>
<tr><td colspan="2">
<!--#include file="aspincludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>

</body>
</html>
