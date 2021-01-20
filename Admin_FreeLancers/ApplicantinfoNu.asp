<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<!--#include file="../ASPIncludes/SiteFunctions.asp"-->

<%
'on error resume next
Response.Buffer=True
Response.ExpiresAbsolute=0

if trim(Request.ServerVariables("http_referer"))="" then
''	Response.Redirect ("Default.asp?message=sesexp")
end if
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
function fnchecked(val1,val2)
		if (strComp(val1,val2,0) = 0 ) then
			fnchecked= "checked"
		else
			fnchecked= ""
		end if
end function

'********************************************************************************'
'********************************************************************************'
'''************* CODE ADDED ON 30 MAY, 2008 TO SKIP DELETED RECORDS ''''''''''''''
'''############# Check to see if the user is not superadmin ############''''''''''
'********************************************************************************'
'********************************************************************************'
'Response.write request("ID")

If trim(request("ID"))<>"" then
  '''*** If User is not "superadmin" then don't show deleted records OR admin declined records to other users
'response.write (trim(lcase(session("user_name"))))
	
  If trim(lcase(session("user_name")))<>"superadmin" then
	'response.write ("hello")
	'response.end
	dim mysupSQL
	SET CONsup = SERVER.CREATEOBJECT("ADODB.Connection")
	SET rssup = SERVER.CREATEOBJECT("ADODB.RECORDSET")
	
	CONsup.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)
	mysupSQL = "select * from TBL_SIS_ApplicationsNaukri  where Rec_ID="&trim(request("ID"))&" and user_status=1"
	rssup.OPEN mysupSQL,CONsup
	If Not rssup.EOF Then
		dim ChkRecData, ChkUsr
		ChkRecData = trim(rssup("user_status"))
		ChkUsr = trim(rssup("updated_by"))		
			dim LCRecType
			LCRecType = ""
			LCRecType = trim(request("RecType"))
			if trim(lcase(LCRecType))="nxt" then
				NxtID = cint(request("ID"))+1
			elseif trim(lcase(LCRecType))="prev" then
				NxtID = cint(request("ID"))-1

			else
				NxtID = cint(request("ID"))+1
			end if
		'''''***** Don't show deleted (status=7) records''''''''''''''''''''
		if trim(ChkRecData)="7" then
			Response.Redirect ("ApplicantinfoNu.asp?ID="&NxtID&"&RecType="&LCRecType&"#callID1")
		end if

		'''''***** Don't show Admin release declined (status=8) records''''''''''''''''''''
		if trim(ChkRecData)="8" then
			Response.Redirect ("ApplicantinfoNu.asp?ID="&NxtID&"&RecType="&LCRecType&"#callID1")
		end if

		'''''***** Dont show admin declined (status=3) records''''''''''''''
		if (trim(ChkRecData)="3" and ChkUsr="superadmin") then			
			Response.Redirect ("ApplicantinfoNu.asp?ID="&NxtID&"&RecType="&LCRecType&"#callID1")
		end if
	End if
	SET rssup = nothing
	set CONsup = nothing
  End if
End if

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''*********** nEW cODE eND *************''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'''' update the status of the records that were selected for the check boxes
if trim(lcase(request("butnvalue")))="tgurgaon" then
	
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	sqltrfupdate="update TBL_SIS_ApplicationsNaukri  set Applicationfor='Gurgaon' where rec_id =" & trim(request("ID"))
	con.execute(sqltrfupdate)
	set cmdEdit=server.CreateObject("ADODB.Command")
	cmdEdit.ActiveConnection = con	
	with cmdEdit
		.CommandText = "SP_TrfHyd_To_Gurgaon"
		.CommandType = adcmdStoredProc	
		.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
		.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInput,,trim(request("ID")))
		.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
		''.Execute
	end with
	If Err.Number <> 0 then
		HandleError Err.Description
		Error.Clear
	End If

	'loadedval = cmdEdit.Parameters("@MyResult")		
	set cmdEdit = nothing
	
Response.write (" Transfering the " & trim(request("ID")) & " Candidate to gurgaon ....." )
'response.end
	con.close()

response.write("<script language=""Javascript"">") 
response.write("alert('Transfered to Gurgaon Successfully.'")
'response.write("window.close();") 
response.write("</script>") 

%>

<script type='text/javascript'>
	window.opener.location.href="Frm_SIS_View.asp";
	alert("Transfered to Gurgaon Successfully.");
	window.close();
</script>
<%End if

if trim(request("butnvalue"))<>"" then 
		''' User Status = 1 -- pending
		''' User Status = 2 -- approved
		''' User Status = 3 -- Declined
		''' User Status = 5 -- Hold	
		
		dim Mystat, mystat1, insertval,userrank,userrank1
		userrank="0"
		userrank1="0"

      	if trim(lcase(request("butnvalue")))="accept1" then
			
			Mystat = "Approve"
			'mystat1 = "Approved"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("optionsgroup1"))&" "&trim(request("txtreason"))
			else
			         mystat1 = trim(request("optionsgroup1"))&" "&trim(Mystat)
			end if
			userrank=request("UserRank")
			insertval = 2
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set User_Points="&trim(userrank)&",Date_Updated=getdate() ,Reason_Update='" & mystat1 & "',Updated_By='" & session("user_name") & "', user_status=2,Applicant_Status=2 where Rec_ID="&trim(request("ID"))&""
			
	elseif trim(lcase(request("butnvalue")))="accept2" then
			Mystat = "Approve 2"
			'mystat1 = "Approved"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("optionsgroup1"))&" "&trim(request("txtreason"))
				else
			        mystat1 = trim(request("optionsgroup1"))&" "&trim(Mystat)
			end if
			userrank1=request("UserRank1")
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set User_Points_US="&trim(userrank1)&" , user_status=2,Applicant_Status=2 where Rec_ID="&trim(request("ID"))&""
			insertval = 2
		'Response.write  trim(lcase(request("butnvalue"))) & request("UserRank") & " " & userrank1
		'response.end
	elseif trim(lcase(request("butnvalue")))="high expectations" then
			mystat1="High Expectations " & request("txtreason")
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set user_status =9,Reason_Update='" & mystat1 & "',Applicant_Status=9,Applicant_Remarks='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
			insertval = 9
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
			'response.end
	elseif trim(lcase(request("butnvalue")))="competitor" then
			mystat1="Competitor " & request("txtreason")
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set user_status =10,Reason_Update='" & mystat1 & "',Applicant_Status=10,Applicant_Remarks='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
			insertval = 10
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
      	elseif trim(lcase(request("butnvalue")))="decline" then
			Mystat = "Decline"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("optionsgroup1"))&" "&trim(request("txtreason"))
			else
			      mystat1 = trim(request("optionsgroup1"))&" "&trim(Mystat)
			end if
			userrank=0
			userrank1=0
			insertval = 3
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set user_status =3,Date_Updated=getdate() ,Reason_Update='" & mystat1 & "',Applicant_Status=3,Applicant_Remarks='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
	elseif trim(lcase(request("butnvalue")))="hold" then
			Mystat = "Hold"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("optionsgroup1"))&" "&trim(request("txtreason"))
				else
			        mystat1 = trim(request("optionsgroup1"))&" "&trim(Mystat)
			end if
			insertval = 5
			userrank=0
			userrank1=0
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set user_status =5,Reason_Update='" & mystat1 & "',Applicant_Status=5,Applicant_Remarks='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
	elseif trim(lcase(request("butnvalue")))="delete" then
			Mystat = "Delete"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("optionsgroup1"))&" "&trim(request("txtreason"))
		            else
			         mystat1 = trim(request("optionsgroup1"))&" "&trim(Mystat)
			end if
			insertval = 7
			userrank=0
			userrank1=0
			sqlupdate="update TBL_SIS_ApplicationsNaukri  set User_status="& insertval &" ,Date_Updated=getdate() , Reason_Update='" & mystat1 & "',Updated_By='" & session("user_name") & "',Applicant_Status=" & insertval & ",Applicant_Remarks='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
      	end if
		if trim(request("txtreason"))<>"" then
			mystat1 = trim(request("optionsgroup1"))&" "&trim(request("txtreason"))
		else
			mystat1 = trim(request("optionsgroup1"))&" "&trim(Mystat)
		end if
	
		
		dim recID
		recID = trim(request("ID"))
		''' call the stored procedure to insert data into the table
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		if trim(sqlupdate)="" then
			
			
			set cmdEdit=server.CreateObject("ADODB.Command")
			cmdEdit.ActiveConnection = con	
			with cmdEdit
				.CommandText = "SPTBL_SIS_ApplicationsNaukri "
				.CommandType = adcmdStoredProc	
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
				.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,"Name")
				.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,"Address")
				.Parameters.Append .CreateParameter ("@MyUser_Age",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,"Phone")
				.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,"Email")
				.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,"PGEducation")
				.Parameters.Append .CreateParameter ("@MyYear_Passed",adInteger,adparamInputOutput,,1)
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
				.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,"Skills")
				.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,50,trim(session("user_name")))
				.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,insertval)
				.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,mystat1)
				.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
				.Parameters.Append .CreateParameter ("@MyPoints_Scored",advarchar,adparamInputOutput,4,userrank)
				.Parameters.Append .CreateParameter ("@MyPoints_Scored1",advarchar,adparamInputOutput,4,userrank1)
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
				'.Execute
			end with
			loadedval = cmdEdit.Parameters("@MyResult")		
			set cmdEdit = nothing

		end if


		if sqlupdate<>"" then
			'response.write sqlupdate
			'response.end
			con.execute sqlupdate
		
		end if
		con.close()
		%>
		<script language="javascript">
			window.opener.location.href="Frm_SIS_View.asp";
			//window.close();
		</script>
		<%
		dim x
		x = cint(Request("ID"))+1
		response.redirect ("ApplicantinfoNu.asp?ID="&trim(x)&"&SUB=1#callID1")
end if

%>
<html>
<head>
<title>View Naukri Applicant Details</title>
</head>
<script language="JavaScript">
function submitval(actval,recID)
{
	//alert ("hi");
	//var updateval;
	//updateval = confirm("Confirm, do you want this applicant status to "+actval);
	//if (updateval==true)
	//{
		window.frmsis.method="post";
		window.frmsis.action="applicantinfoNu.asp?ID="+recID+"&butnvalue="+actval;
		window.frmsis.submit();
	//}	
}
</script>
<style>
	.mystyle
	{
		font-size:10px;
		font-family:arial;		
	}
</style>
<body>
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
DIM conn
DIM rs
DIM SQL
SET rs=SERVER.CREATEOBJECT("ADODB.RECORDSET")

con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)
if trim(Request("ID"))<>"" then
	
	SQL = "SELECT * FROM TBL_SIS_ApplicationsNaukri  where Rec_ID="&trim(Request("ID")) & " and user_status = 1 "
elseif trim(Request("candname"))<>"" then 
	SQL = "SELECT * FROM TBL_SIS_ApplicationsNaukri  where user_name like ('%"&trim(Request("candname"))&"%') and user_status <> 8"
else
	'SQL = "SELECT * FROM TBL_SIS_ApplicationsNaukri  where Rec_id > 474 and user_name like ('%"&trim(Request("candname"))&"%')"
	SQL = "SELECT * FROM TBL_SIS_ApplicationsNaukri  where user_name like ('%"&trim(Request("candname"))&"%') and user_status <> 8"
end if
rs.OPEN SQL,con
If Not RS.EOF Then
Dim ID
ID=rs("Rec_ID")
DIM edu
edu= trim(rs("PG_Course"))
dim UsrStat,adminstat
if trim(rs("User_Status"))="1" then
	UsrStat = "Pending"
elseif trim(rs("User_Status"))="2" then
	UsrStat = "Approved"
elseif trim(rs("User_Status"))="3" then
	UsrStat = "Declined"
elseif trim(rs("User_Status"))="5" then
	UsrStat = "Hold"
end if
%>
<div align="center"><center>

<table border="1" width="90%" cellspacing="0" cellpadding="0" bordercolor="#000080" class=mystyle>
  <tr>
    <td width="100%"><div align="center"><center><table border="0" width="100%"
    cellspacing="0" cellpadding="5">
      <tr>
        <td width="100%" height="21" bgcolor="#3767A6"><p align="center"><big><font color="#FFFFFF"><strong><font class="mystyle">Applicant Information for the Post of Business Analyst</font></strong></font></big></td>
      </tr>
      <tr>
        <td width="100%" height="5"></td>
      </tr>
	  <tr>
        <td width="100%"><font face="verdana" size="1" color="#804040"><b>Note :</b> Below this screen there are Accept, Decline and Hold buttons to change the status of the applicant.</font></td>
      </tr>
	  <tr>
        <td width="100%" height="5" align="right"><a href="#callID1"><b>Go to Bottom</b></a></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="0" cellpadding="0">
		   <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><strong>Post Applied for :&nbsp; <%=rs("Post_Applied")%></strong></font></big></td>
          </tr>
		  <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><strong>Application ID :&nbsp; <%=rs("Rec_ID")%></strong></font></big></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Application Date :&nbsp; <%=rs("Date_Created")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Application Status :&nbsp; <%=UsrStat%></font></td>
          </tr>
          <%if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="3" or trim(rs("User_Status"))="5") then%>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;by :&nbsp; <%=rs("Updated_BY")%></font></td>
          </tr>
           <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Date <%=UsrStat%> :&nbsp; <%=rs("Date_Updated")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;Reason:&nbsp; <%=rs("Reason_Update")%></font></td>
          </tr>
          <%end if%>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21" bgcolor="#9DC3F5"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Contact Information</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="2" cellpadding="0">
	  <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Recruiting Location</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("Location")%></td>
          </tr>
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Name </font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("user_Name")%> </td>
          </tr>
	  <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Gender</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("Gender")%> </td>
          </tr>
	  <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Age - Data of Birth</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=DateDiff("yyyy",rs("DateofBirth"),date)
%> - <%=rs("DateofBirth")%></td>
          </tr>
	<%if trim(session("user_type")) ="1" or trim(session("user_type")) ="4" or  trim(session("user_type")) ="5" or  trim(session("user_type")) ="7" then%>
	 
	  <tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">Address</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("user_Address")%></td>
          </tr>
          
	
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Phone</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("user_Phone")%><br><%=rs("user_PhoneRes")%></td>
          </tr>
          <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Email</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("user_Email")%></td>
          </tr>
	 
	<%end if%>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21" bgcolor="#9DC3F5"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Education</strong></font></big> </td>
      </tr>
      <tr align="center">
        <td width="109%" height="21"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">UG Degree/Institute</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=edu%>&nbsp;<%=rs("UGSpecialization")%>&nbsp;/&nbsp;<%=rs("UG_Institute")%></td>
          </tr>
          <tr>
            <td width="28%" height="25"><font face="verdana" size="2" color="#004080">PG Degree /Institute</font></td>
            <td width="2%" height="25" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("PG_Course")%>&nbsp;/&nbsp;<%=rs("PGSpecialization")%>&nbsp;<%=rs("PG_Institute")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
      <tr>
        <td width="100%" height="10"></td>
      </tr>
      <tr>
        <td width="100%" height="10" bgcolor="#9DC3F5"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp; Employment/Work Experience</strong></font></big></td>
      </tr>
      <tr>
        <td width="100%" height="10"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Current Employer</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("Current_Employer")%></td>
          </tr>
	   <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Current Annual Salary</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("AnnualSalary")%></td>
          </tr>
	  <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Designation</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("Current_Designation")%></td>
          </tr>
          <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Total Experience</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("TotalExperience")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
     
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="2" bgcolor="#9DC3F5"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Self Assessment</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="2"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%" height="19"><font face="verdana" size="2" color="#004080">Functional Area</font></td>
            <td width="2%" align="center" height="19"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="70%" height="19"><font face="verdana" size="2" color="#008080"><%=rs("FunctionalArea")%></td>
          </tr>
          <tr>
            <td width="28%" height="21"><font face="verdana" size="2" color="#004080">Key Skills</font></td>
            <td width="2%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="70%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Key_Skills")%></td>
          </tr>
          <tr>
            <td width="28%" height="21"><font face="verdana" size="2" color="#004080">Resume Title </font></td>
            <td width="2%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="70%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("ResumeTitle")%></td>
          </tr>
          
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
	<form method="post" action="Approved_ApplicantInfo_FreeLancers.asp" name="frmsis">
      </tr>
	<tr align="center">
        <td width="100%" height="1">
		<table width="98%" cellspacing="0" cellpadding="3">
	 <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Give Reason if any :</font> <textarea id="txtreason" name="txtreason"></textarea></td>
          </tr>
      
	   <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="URL Download" Selected >URL Download&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="URL Packaging" >URL Packaging&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="RAG" >RAG&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="RSG-I" >RSG-I&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="SERT" >Search Engine Research&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="R&A" >R&A&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="DTP" >DTP&nbsp;&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="eNet" >eNet&nbsp;&nbsp;&nbsp;

		<!--INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="Gurgaon" >Gurgaon&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="Pune" >Pune&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="Mumbai" >Mumbai&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="Chennai" >Chennai&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="Coimbatore" >Coimbatore&nbsp;&nbsp;
		<INPUT Type="radio" id="optionsgroup1" name="optionsgroup1" value="Bangalore" >Bangalore&nbsp;&nbsp; -->
		</td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Rank1 :</font> <select name="UserRank">
		<option value="7" <%=selected(trim(rs("User_Points")),"7")%>>7</option>
		<option value="7.5" <%=selected(rs("User_Points"),"7.5")%>>7.5</option>
		<option value="8" <%=selected(rs("User_Points"),"8")%>>8</option>
		<option value="8.5" <%=selected(rs("User_Points"),"8.5")%>>8.5</option>
		<option value="9" <%=selected(rs("User_Points"),"9")%>>9</option>
		<option value="9.5" <%=selected(rs("User_Points"),"9.5")%>>9.5</option>
		<option value="10" <%=selected(rs("User_Points"),"10")%>>10</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%if trim(session("user_type")) ="4" then%>
		<font face="verdana" size="2" color="#004080">RR Rank2 :</font> <select name="UserRank1">
		<option value="7" <%=selected(rs("User_Points_US"),"7")%>>7</option>
		<option value="7.5" <%=selected(rs("User_Points_US"),"7.5")%>>7.5</option>
		<option value="8" <%=selected(rs("User_Points_US"),"8")%>>8</option>
		<option value="8.5" <%=selected(rs("User_Points_US"),"8.5")%>>8.5</option>
		<option value="9" <%=selected(rs("User_Points_US"),"9")%>>9</option>
		<option value="9.5" <%=selected(rs("User_Points_US"),"9.5")%>>9.5</option>
		<option value="10" <%=selected(rs("User_Points_US"),"10")%>>10</option>
		</select>
	<%end if%>
</td>
          </tr>
	<input type="hidden" name="txtemail" value="<%=trim(rs("user_Email"))%>">
	<input type="hidden" name="txtName" value="<%=trim(rs("user_Name"))%>">
	
        </table>
		</td>
      </tr>
<%if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="1" or trim(rs("User_Status"))="4" or trim(rs("User_Status"))="6" or trim(rs("User_Status"))="5") then%>
	<tr align="center">
        <td width="100%" height="1">
		<table width="98%" cellspacing="0" cellpadding="3">	  
		<tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b>Status</b> :&nbsp; <%=UsrStat1%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b><%=UsrStat%>&nbsp;by</b> :&nbsp; <%=rs("Updated_BY")%></font></td>
          </tr>
           <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b>Date <%=UsrStat%></b> :&nbsp; <%=rs("Date_Updated")%></font></td>
          </tr>
	<%if trim(session("user_type")) ="4" then%>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b><%=UsrStat%>&nbsp;Reason</b>:&nbsp; <%=rs("Reason_Update")%></font></td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b>Rank1</b>:&nbsp; <%=rs("User_Points")%>&nbsp;&nbsp;<b>Rank2</b>:&nbsp; <%=rs("User_Points_US")%></font></td>
          </tr>
	<%end if%>
	</table>
	</td></tr>
      <%end if%>
		<%
		Response.Write ("<tr bgcolor='white' align=""center"">")
			
		if trim(session("user_type")) ="4"   then
			'if trim(rs("Updated_BY"))<>"superadmin" then
			Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept Stage 1"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Accept Stage 2"" onclick=""javascript:submitval('Accept2','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Transfer Gurgaon"" onclick=""javascript:submitval('TGurgaon','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""High Expectations"" onclick=""javascript:submitval('High Expectations','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Competitor"" onclick=""javascript:submitval('Competitor','"&rs("Rec_ID")&"');""></td>")	
			'end if
				'<input type=""button"" name=""butnvalue"" value=""Delete"" onclick=""javascript:submitval('Delete','"&rs("Rec_ID")&"');""
		else
			'if trim(rs("Updated_BY"))<>"superadmin" then
			Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept Stage 1"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Transfer Gurgaon"" onclick=""javascript:submitval('TGurgaon','"&rs("Rec_ID")&"')""></td>")	
			'end if
		end if					
		Response.Write ("</tr>")
			dim MYValID,MYValID1
			MYValID = cint(Request("ID"))+1
			MYValID1 = cint(Request("ID"))-1
			%>         
        </form>
        </td>
      </tr>
	<tr><td>

              <font face="verdana" size="2" color="#004080">
		&nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio"  value="6" <%=fnchecked(trim(rs("Admin_Status")),"6")%> >Called but not attended &nbsp;&nbsp;<br>
	        &nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="5" <%=fnchecked(trim(rs("Admin_Status")),"5")%>>Attended & Not Selected &nbsp;&nbsp;<br>
		&nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="4" <%=fnchecked(trim(rs("Admin_Status")),"4")%>>Selected & Not Joined  &nbsp;&nbsp;<br>
                &nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="3" <%=fnchecked(trim(rs("Admin_Status")),"3")%>>Joined & Left  &nbsp;&nbsp;<br>
		&nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="2" <%=fnchecked(trim(rs("Admin_Status")),"2")%>>Joined & Working &nbsp;&nbsp;<br>
            </font>
                  

    </td></tr>
	  <tr>
        <td width="100%"><big><font face="verdana" size="2" color="blue"><strong>Application :&nbsp; <%=rs("Rec_ID")%> : <%=rs("user_Name")%> : <%=edu%></strong></font></big></td>
      </tr>
	
      <tr align="center">
        <td width="100%" height="0" align="right">
		<table width="100%"><tr>
		<td align="left">
		<%if MYValID1 > 0 then%>
			<!--a href="ApplicantInfo.asp?ID=<%=trim(MYValID1)%>&RecType=prev#callID1"><b> &laquo; Previous  </b></a--></td>
		<%end if%>
			<td align="right"><!--a href="ApplicantInfo.asp?ID=<%=trim(MYValID)%>&RecType=nxt#callID1"><b> Next &raquo; </b></a--></td>
		</tr></table>
		</td>
      </tr>
<tr><td align="center"><b><A class=bodylink href="javascript:window.close()"><b>Close Window</b></A></b></td></tr>
    </table>
    </center></div></td>
  </tr>
</table>
</center></div>
<%SET rs=nothing
con.close()
Else %>
	<br><p align="center"><font color='red'><b>End of Candidates List</b></font></p>
	<br><p align="left">
		<%
		dim MYVID,MYVID1
		MYVID = cint(Request("ID"))-1
		MYVID1 = cint(Request("ID"))+1%>
		
		<a href="ApplicantinfoNu.asp?ID=<%=trim(MYVID)%>#callID1"><b> &laquo; Previous </b></a>
		
      </p>
<% End If%>
</body>
</html>
