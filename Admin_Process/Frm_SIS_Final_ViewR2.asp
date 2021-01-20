<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<!--#include file="ASPIncludes/SiteFunctions.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
'''actstat="&rsDisp("User_status")&"
'''stat=A
'''RecID="&rsDisp("Rec_id")&"
'''emailid="&rsDisp("User_Email")&"
if (trim(request("Flno"))<>"") then
	'''' update sent status
	
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	Set rsDisp1 =Server.CreateObject("ADODB.Recordset")
	rsDisp1.ActiveConnection = con
	
	rsDisp1.CursorType = 3
	usql2="select * from TBL_SIS_Applications where user_status=2 and Rec_id =" & trim(request("flNo")) & ""
	
	
	rsDisp1.Open usql2
	IF not rsDisp1.EOF THEN	
	Response.write request("flName")
	'response.end
	'Session("ttstr") =trim(rsDisp1("Rec_id")) & "::" & trim(rsDisp1("User_Name")) & "::" & trim(rsDisp1("User_Email")) & "::" &rsDisp1("User_Gender") & "::" & trim(replace(replace(rsDisp1("User_Address"),"#"," "),"&"," and ")) & "::" &trim(rsDisp1("User_City"))& "::" &trim(rsDisp1("User_Phone"))& "::" &trim(rsDisp1("User_Mobile"))& "::" & trim(rsDisp1("User_Age")) & "::" & trim(rsDisp1("Date_Created"))& "::A" &  "::" & trim(rsDisp1("Points_Scored")) &  "::" & trim(request("flName")) &  "::" & trim(rsDisp1("User_Password"))
	Response.write ("update TBL_SIS_Applications set user_points_us=" & trim(request("flName")) &" where user_status=2 and Rec_id =" & trim(request("flNo")) & "")
	Response.write ("Insert into Tbl_SIS_ApplicationsStatus values(" & trim(request("flNo")) & ",'Accept Stage 2 Approved by " & session("user_name") & "',getdate(),'" &  session("user_name") & "','" & trim(request("flName")) & "')")
	
	'response.end
	con.execute("update TBL_SIS_Applications set user_points_us=" & trim(request("flName")) &" where user_status=2 and Rec_id =" & trim(request("flNo")) & "")
	con.execute("Insert into Tbl_SIS_ApplicationsStatus values(" & trim(request("flNo")) & ",'Accept Stage 2 Approved by " & session("user_name") & "',getdate(),'" &  session("user_name") & "','" & trim(request("flName")) & "')")
	con.close()
	response.redirect("Frm_SIS_Final_ViewR2.asp")
	End If
End if

''''stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"

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
		window.frmsis.action="Frm_SIS_Final_ViewR2.asp";
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
		myWin = open("ApplicantinfoR2.asp?ID="+num ,"userwin","");

	}
function OpenAnaWin(num)
	{ 
		myWin = open("AnAApplicantinfo.asp?ID="+num+"#callID1" ,"userwin","width=780,top=5,left=5,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
		myWin = open("AnAApplicantinfo.asp?ID="+num+"#callID1" ,"userwin","");
		

	}
	function OpenSend(num)

	{ 
		if (document.frmsis['txt' + num].value == "")
		{
		//alert(document.frmsis['txt' + num].value);
		alert("Please enter new UserID.");
		document.frmsis['txt' + num].focus();
		//return false;
		}
		else
		{
		//alert("sure u want to send.");
		window.frmsis.method="post";
		window.frmsis.action="Frm_SIS_Final_ViewR2.asp?Flno=" + num + "&flName=" + document.frmsis['txt' + num].value;
		window.frmsis.submit();
		return true;
		//myWin = open("Approved_Applicantinfo_FreeLancers.asp?ID="+num+"#callID1" ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
		}
	}
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<form name="frmsis" method="post">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#9DC3F5" valign="top"><!--#include file="ASPIncludes/sideStrip.asp"--></td>
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
    <td width="100%" bgcolor="#3767A6"><p align="center"><strong><big><font color="#FFFFFF">All Viewed Requests <%=ttypName%></font></big></strong></td>
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
  <!--tr>
		<td align="center" width="95%" bgcolor="#ffffff" height="20"><!-font face="verdana" size="2"><a href="Frm_SIS_Final_ViewR2.asp?ttype=1"><font face="verdana" size="2"><b>Pending</b></font></a> |-> <font face="verdana" size="2"><a href="Frm_SIS_Final_ViewR2.asp?ttype=2"><font face="verdana" size="2"><b>Approved</b></font></a> <!-| <a href="Frm_SIS_Final_ViewR2.asp?ttype=3"><font face="verdana" size="2"><b>Declined</b></font></a->  | <a href="Frm_SIS_Final_ViewR2.asp?ttype=5"><font face="verdana" size="2"><b>Hold</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_Final_ViewR2.asp?ttype=4"><font face="verdana" size="2"><b>Sent</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=6"><font face="verdana" size="2"><b>Test Taken</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=9"><font face="verdana" size="2"><b>High Expectations</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=10"><font face="verdana" size="2"><b>Competitor</b></font></a>   | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=10"><font face="verdana" size="2"><b>Graduates</b></font></a> 
		<!- | <font face="verdana" size="2"><a href="Frm_SIS_Final_ViewR2.asp?ttype=0"><font face="verdana" size="2"><b>ALL</b></font></a-></td>
		</td>
	</tr-->

<%if trim(session("user_type"))="7" then%>
<!--tr><td align="left" width="95%" bgcolor="#ffffff" height="25">
&nbsp;&nbsp;<a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=2"><font face="verdana" size="2"><b>URL Download</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=3"><font face="verdana" size="2"><b>URL Packaging</b></font></a-->
<%elseif trim(session("user_type"))="5" and trim(request("ttype")) ="2" then%>
 <!--a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=4"><font face="verdana" size="2"><b>RAG</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=5"><font face="verdana" size="2"><b>RSG-I</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=6"><font face="verdana" size="2"><b>Search Engine Research Team(SERT)</b></font></a--> 
<%elseif trim(request("ttype")) ="2" then%>
	<!--a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=1"><font face="verdana" size="2"><b>R&A</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=2"><font face="verdana" size="2"><b>URL Download</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=3"><font face="verdana" size="2"><b>URL Packaging</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=4"><font face="verdana" size="2"><b>RAG</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=5"><font face="verdana" size="2"><b>RSG-I</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=6" title='N-20/SERT'><font face="verdana" size="2"><b>Search Engine Research</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=7"><font face="verdana" size="2"><b>DTP</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=8"><font face="verdana" size="2"><b>eNet</b></font></a> | <a href="Frm_SIS_Final_ViewR2.asp?ttype=2&ppost=12"><font face="verdana" size="2"><b>Gurgaon</b></font></a> <br>
	</td>
</tr-->
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
		   PostName=" and Reason_update like '%eNet%'"
		elseif trim(request("ppost"))="9" then	
		   PostName=" and Reason_update like '%High expectations%'"
		elseif trim(request("ppost"))="10" then	
		   PostName=" and Reason_update like '%graduate%'"
		elseif trim(request("ppost"))="12" then	
		   PostName=" and Reason_update like '%gurgaon%'"
		end if	
		if trim(TStat)="4"  then		
			usql1="select * from TBL_SIS_Applications where  Applicationfor='Hyderabad' and user_status=2  order by rec_id"
		elseif trim(TStat)="0"  then
			usql1="select * from TBL_SIS_Applications  order by Date_Created desc"  '14663
		elseif trim(TStat)="6"  then
			usql1="select * from TBL_SIS_Applications where ANA_No <> '' order by Date_Created desc"
		else
			usql1="select * from TBL_SIS_Applications where admin_status=1 and user_status="&TStat& PostName &" and ANA_no is null and user_status <> 8  order by rec_id"
		end if
		if trim(session("user_type"))="5" then
			'postname=" and ((Reason_Update like ('RAG%') or Reason_Update like ('RSG-I%') or Reason_Update like ('N-20%') or Reason_Update like ('SERT%')) or Reason_Update like '%padmaja%')"
			usql1="select * from TBL_SIS_Applications where admin_status=1 and  Applicationfor='Hyderabad' and user_status="&TStat& PostName &"   and ana_No is null order by rec_id"
			'Response.write usql1
			'response.end

                            if lcase(trim(session("user_name"))) ="raghu" then
                                      postname=" and Reason_Update like '%raghu%'"
			              usql1="select * from TBL_SIS_Applications where admin_status=1 and Applicationfor='Hyderabad' and user_status="&TStat& PostName &"   order by rec_id"
                            end if

		end if
		
		if trim(session("user_type"))="7" then
			''postname=" and (Reason_Update like ('URL%') or Reason_Update like '%maha%' )"
			usql1="select * from TBL_SIS_Applications where admin_status=1 and Applicationfor='Hyderabad' and user_status="&TStat& PostName &"  and user_status <> 8  and ana_No is null  order by rec_id"
			if trim(TStat)="6"  then
			 usql1="select * from TBL_SIS_Applications where admin_status=1 and Applicationfor='Hyderabad' and  ANA_No <> '' " & PostName &" and user_status <> 8  order by rec_id"
			end if
			'Response.write usql1
			'response.end
		end if
		'response.write usql1             
	'	usql1="select * from TBL_SIS_Applications where admin_status=1 and user_status=2 and Reason_update like '%R&A%' and ANA_no is null and user_status <> 8  order by rec_id"
		rsDisp.Open usql1
	'	response.write usql1
	'	response.end
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
				<a href="Frm_SIS_Final_ViewR2.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&ttype=<%=trim(request("ttype"))%>&ppost=<%=trim(request("ppost"))%>"><%=i%></a>			
				<% start = start+cint(rec_per_page)
				E = E+cint(rec_per_page)
			next  
		   	if cp >= 1 then
				Response.Write ("</td><td  align=right width='15%'><font size='2' face=verdana color=""blue""><b>Page :&nbsp;<b>"&Cp&"") 
			end if  
				Response.Write ("</td></tr></table>")
		end if 	
		if cp > 1 then		 	 
			 rsDisp.AbsolutePosition = Request.QueryString("Start")         
		END IF 
		Response.Write ("<tr bgcolor=#C5D9F3>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Option</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Main ID</font></th>")
			'''**Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			''Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
			'''**Response.Write ("<th><font face=""verdana"" size=""2"">Education</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Expected Salary</font></th>")
			'Response.Write ("<th><font face=""verdana"" size=""2"">Reason</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Rank-II</font></th>")
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
					'''**Response.Write ("<td align='left'><font face='verdana' size='2'>" & rsDisp("SurName") & " " &  rsDisp("User_Name") &"</font></td>")
					''Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					'''**Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Education_PG") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("ExpectedSalary") &"</font></td>")
					'Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Reason_Update") &"</font></td>")
					'Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_phone") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'><select name='txt" & rsDisp("Rec_id") & "' tabindex='1'>")%>
					<option value="7" <%=selected(rsDisp("user_points_us"),"7")%>>7</option>
					<option value="7.5" <%=selected(rsDisp("user_points_us"),"7.5")%>>7.5</option>
					<option value="8" <%=selected(rsDisp("user_points_us"),"8")%>>8</option>
					<option value="8.5" <%=selected(rsDisp("user_points_us"),"8.5")%>>8.5</option>
					<option value="9" <%=selected(rsDisp("user_points_us"),"9")%>>9</option>
					<option value="9.5" <%=selected(rsDisp("user_points_us"),"9.5")%>>9.5</option>
					<option value="10" <%=selected(rsDisp("user_points_us"),"10")%>>10</option>
					</select></font></td>
					<%'response.write trim(rsDisp("Admin_Status") & rsDisp("User_Status"))
					if trim(TStat)="0" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
					else

					  if trim(TStat)="6" then
						Response.Write ("<td align='center'><a href='javascript:OpenAnaWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")	
					  else
						if trim(rsDisp("Admin_Status"))="1" then
							if trim(rsDisp("User_Status"))="1" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
							elseif trim(rsDisp("User_Status"))="2" Then
								If trim(rsDisp("user_points_us"))<> "" Then
								  Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") 
								else
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a>") 
								
								Response.Write (" | <a href='javascript:OpenSend("& rsDisp("Rec_id") &");' onclick=""return confirm('Are you sure you want to Add Rank-II?')""><font face='verdana' size='2'>Add Rank-II</font></a></td>")
								End if
								'| <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="3" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") '| <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(rsDisp("User_Status"))="5" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="6" then
								Response.Write ("<td align='center'><a href='javascript:OpenAnaWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="9" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							elseif trim(TStat)="10" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=H&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Email</font></a></td>")
							end if
						else
							Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>") ' | <a href='Frm_SIS_Final_ViewR2.asp?actstat="&rsDisp("User_status")&"&stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Re-send Email</font></a></td>")
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
<!--#include file="ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>

</body>
</html>
