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


''''stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"
if (trim(request("Flno"))<>"") then
	'''' update sent status
	
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	Set rsDisp1 =Server.CreateObject("ADODB.Recordset")
	rsDisp1.ActiveConnection = con
	
	rsDisp1.CursorType = 3
	usql2="select * from TBL_SIS_FreeLancernew where user_status=2 and Rec_id =" & trim(request("flNo")) & ""
	
	
	rsDisp1.Open usql2
	IF not rsDisp1.EOF THEN	
	Response.write request("flName")
	'response.end
	'Session("ttstr") =trim(rsDisp1("Rec_id")) & "::" & trim(rsDisp1("User_Name")) & "::" & trim(rsDisp1("User_Email")) & "::" &rsDisp1("User_Gender") & "::" & trim(replace(replace(rsDisp1("User_Address"),"#"," "),"&"," and ")) & "::" &trim(rsDisp1("User_City"))& "::" &trim(rsDisp1("User_Phone"))& "::" &trim(rsDisp1("User_Mobile"))& "::" & trim(rsDisp1("User_Age")) & "::" & trim(rsDisp1("Date_Created"))& "::A" &  "::" & trim(rsDisp1("Points_Scored")) &  "::" & trim(request("flName")) &  "::" & trim(rsDisp1("User_Password"))
	con.execute("update TBL_SIS_FreeLancerNew set Points_Scored1=" & trim(request("flName")) &",Reason_Update='Accept Stage 2 Approved by " & session("user_name") & "',Date_Updated=getdate() where user_status=2 and Rec_id =" & trim(request("flNo")) & "")
	con.close()
	response.redirect("Frm_SIS_Final_Rank.asp")
	%>
	<%'Response.Redirect ("http://202.65.148.18/assignments/admin/addinguser.asp?ttstr=" & Session("ttstr"))
	'Response.write session("ttstr")
	'Response.end
	'con3.open "Provider="&drivertype&";data source=202.65.148.18;uid=sa;pwd=sanjose09$;initial catalog=eNet_Assignments"  
	'set cmdEdit=server.CreateObject("ADODB.Command")
	'cmdEdit.ActiveConnection = con3			
	'	with cmdEdit 				
	'		.CommandText = "TBL_user_master_SP"
	'		.CommandType = adcmdStoredProc	
	'		.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATEADM")
	'		.Parameters.Append .CreateParameter ("@MyUserID",adInteger,adparamInputOutput,,1)
	'		.Parameters.Append .CreateParameter ("@MyUser_RefID",adInteger,adparamInputOutput,,trim(rsDisp1("Rec_id")))
	'		.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,100,trim(rsDisp1("User_Name")))
	'		.Parameters.Append .CreateParameter ("@MyEmailId",advarchar,adparamInputOutput,50,trim(rsDisp1("User_Email")))
	'		.Parameters.Append .CreateParameter ("@MyGender",advarchar,adparamInputOutput,10,rsDisp1("User_Gender"))
	'		.Parameters.Append .CreateParameter ("@MyAddress",advarchar,adparamInputOutput,500,trim(rsDisp1("User_Address")))
	'		.Parameters.Append .CreateParameter ("@MyCity",advarchar,adparamInputOutput,30,trim(rsDisp1("User_City")))
	'		.Parameters.Append .CreateParameter ("@MyTelephone",advarchar,adparamInputOutput,20,trim(rsDisp1("User_Phone")))
	'		.Parameters.Append .CreateParameter ("@MyMobile",advarchar,adparamInputOutput,20,trim(rsDisp1("User_Mobile")))
	'		.Parameters.Append .CreateParameter ("@MyUser_Age",advarchar,adparamInputOutput,50,trim(rsDisp1("User_Age")))
	'		.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,trim(rsDisp1("Date_Created")))
	'		.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,2)
	'		.Parameters.Append .CreateParameter ("@MyUser_Points",adInteger,adparamInputOutput,,0)
	'		.Parameters.Append .CreateParameter ("@MyUsername",advarchar,adparamInputOutput,20,trim(request("flName")))
	'		.Parameters.Append .CreateParameter ("@MyUser_pwd",advarchar,adparamInputOutput,20,trim(rsDisp1("User_Password")))
	'		.Parameters.Append .CreateParameter ("@MyQuality_Flag",adInteger,adparamInputOutput,,1)
	'		.Parameters.Append .CreateParameter ("@MyReliable_flag",adInteger,adparamInputOutput,,1)
	'		.Parameters.Append .CreateParameter ("@MyUser_Type",adInteger,adparamInputOutput,,1)
	'		.Parameters.Append .CreateParameter ("@MyUser_Pool",adInteger,adparamInputOutput,,1)
	'		.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
	'		.Execute
	'	end with
	'loadedval = trim(cmdEdit.Parameters("@MyResult"))
	'set cmdEdit = nothing
	
	end if
	
	'Response.Redirect ("Frm_SIS_Final_Send_ECs.asp?Message="&loadedval&"")
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
		myWin = open("Applicantinfo_FinalRanks.asp?ID="+num+"#callID1" ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes,resizable=yes");
	}
function OpenWin1(num)
	{ 
		myWin = open("Approved_Applicantinfo_FreeLancers2.asp?ID="+num+"#callID1" ,"userwin","width=780,height=550,status=no,toolbar=no,menubar=no,scrollbars=yes");
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
		window.frmsis.action="Frm_SIS_Final_Rank.asp?Flno=" + num + "&flName=" + document.frmsis['txt' + num].value;
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
<tr><td colspan="2" valign="top"><!--#include file="aspincludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="aspincludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font  face='verdana' size='2' color="#FFFFFF">Assign Final Ranks-II to Freelancers Requests</font></big></strong></td>
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
		'con.close
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
		Set rsDisp =Server.CreateObject("ADODB.Recordset")
		rsDisp.ActiveConnection = con
		rsDisp.CursorType = 3
		rsDisp.PageSize = cint(rec_per_page)
		if trim(request("vtype"))="p" then
				usql1="select *,isnull(points_scored1,0) as chkPoints from TBL_SIS_FreeLancernew where user_status="&TStat&" and Rec_id <=2895 order by points_scored1, rec_id" 'rec_id"  ' Points_Scored1 desc,
		else
		''usql1="select *,isnull(points_scored1,0) as chkPoints from TBL_SIS_FreeLancernew where  user_status="&TStat&"  and updated_by not like '%" & session("user_name") &"%' order by points_scored1, Rec_id" 'rec_id"   'Points_Scored1 desc,
		usql1="select *,isnull(points_scored1,0) as chkPoints from TBL_SIS_FreeLancernew where  user_status="&TStat&"  order by points_scored1, Rec_id" 'rec_id"   'Points_Scored1 desc,
		end if
		''response.write trim(usql1) & " for testing"
		''response.end
		
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
				<a href="Frm_SIS_Final_Rank.asp?Start=<%=Start%>&amp;E=<%=E%>&amp;Cp=<%=i%>&ttype=<%=trim(request("ttype"))%>&vtype=<%=trim(request("vtype"))%>"><%=i%></a>			
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
			''Response.Write ("<th><font face=""verdana"" size=""2"">User Name</font></th>")
			''Response.Write ("<th><font face=""verdana"" size=""2"">Email ID</font></th>")
			'Response.Write ("<th><font face=""verdana"" size=""2"">Rank1</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">Rank-II</font></th>")
			Response.Write ("<th><font face=""verdana"" size=""2"">City</font></th>")
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
					UsrStat = "<font color='red'>Rejected</font>"
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
					''Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Name") &"</font></td>")
					''Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("User_Email") &"</font></td>")
					'Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Points_Scored1") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'><select name='txt" & rsDisp("Rec_id") & "' tabindex='1'>")%>
		<option value="7" <%=selected(rsDisp("Points_Scored1"),"7")%>>7</option>
		<option value="7.5" <%=selected(rsDisp("Points_Scored1"),"7.5")%>>7.5</option>
		<option value="8" <%=selected(rsDisp("Points_Scored1"),"8")%>>8</option>
		<option value="8.5" <%=selected(rsDisp("Points_Scored1"),"8.5")%>>8.5</option>
		<option value="9" <%=selected(rsDisp("Points_Scored1"),"9")%>>9</option>
		<option value="9.5" <%=selected(rsDisp("Points_Scored1"),"9.5")%>>9.5</option>
		<option value="10" <%=selected(rsDisp("Points_Scored1"),"10")%>>10</option>
		</select></font></td>
					<%Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("user_city") &"</font></td>")
					Response.Write ("<td align='center'><font face='verdana' size='2'>"& rsDisp("Date_Updated") &"</font></td>")
					if trim(TStat)="0" then
						Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
					else
						if trim(rsDisp("Admin_Status"))="1" then
							if trim(rsDisp("User_Status"))="1" then
								Response.Write ("<td align='center'><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=A&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Accept</font></a> | <a href='FRM_SIS_Evaluation.asp?stat=D&RecID="&rsDisp("Rec_id")&"&emailid="&rsDisp("User_Email")&"'><font face='verdana' size='2'>Decline</font></a></td>")
							elseif trim(rsDisp("User_Status"))="2" Then
								If trim(rsDisp("chkPoints"))= "0" then ' Or  Trim((rsDisp("Points_Scored1"))) = "" then
								Response.Write ("<td align='center' nowrap><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a> | <a href='javascript:OpenSend("& rsDisp("Rec_id") &");' onclick=""return confirm('Are you sure you want to Add Rank-II?')""><font face='verdana' size='2'>Add Rank-II</font></a></td>")
								Else
								Response.Write ("<td align='center' nowrap><a href='javascript:OpenWin("& rsDisp("Rec_id") &");'><font face='verdana' size='2'>View</font></a></td>")
								End if
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
