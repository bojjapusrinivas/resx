<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SiteFunctions.asp"-->

<%
Response.Buffer=True
Response.ExpiresAbsolute=0

if trim(Request.ServerVariables("http_referer"))="" then
''	Response.Redirect ("Default.asp?message=sesexp")
end if
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if

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
	mysupSQL = "select * from TBL_SIS_Applications where Rec_ID="&trim(request("ID"))&""
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
			Response.Redirect ("ApplicantinfoHyderabad.asp?ID="&NxtID&"&RecType="&LCRecType&"#callID1")
		end if
		'''''***** Dont show admin declined (status=3) records''''''''''''''
		if (trim(ChkRecData)="3" and ChkUsr="superadmin") then			
			Response.Redirect ("ApplicantinfoHyderabad.asp?ID="&NxtID&"&RecType="&LCRecType&"#callID1")
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
				mystat1 = trim(request("txtreason"))
			else
				mystat1 = trim(Mystat)
			end if
			userrank=request("UserRank")
			insertval = 2
			sqlupdate="update TBL_SIS_Applications set User_Points="&trim(userrank)&" , user_status=2 where Rec_ID="&trim(request("ID"))&""
	elseif trim(lcase(request("butnvalue")))="release" then
			Mystat = "Release"
			'mystat1 = "Approved"
			mystat1=request("txtreason")
			userrank=request("UserRank11")& ""
			insertval = 1
			sqlupdate="update TBL_SIS_Applications set user_status=1 where Rec_ID="&trim(request("ID"))&""
	elseif trim(lcase(request("butnvalue")))="block" then
			Mystat = "check"
			'mystat1 = "Approved"
			mystat1=request("txtreason")
			userrank=request("UserRank11")& ""
			insertval = 81
			sqlupdate="update TBL_SIS_Applications set user_status=8 where Rec_ID="&trim(request("ID"))&""
			
	elseif trim(lcase(request("butnvalue")))="accept2" then
			Mystat = "Approve 2"
			'mystat1 = "Approved"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("txtreason"))
			else
				mystat1 = trim(Mystat)
			end if
			userrank1=request("UserRank1")
			sqlupdate="update TBL_SIS_Applications set User_Points_US="&trim(userrank1)&" , user_status=2 where Rec_ID="&trim(request("ID"))&""
			insertval = 2
		'Response.write  trim(lcase(request("butnvalue"))) & request("UserRank") & " " & userrank1
		'response.end
      	elseif trim(lcase(request("butnvalue")))="decline" then
			Mystat = "Decline"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("txtreason"))
			else
				mystat1 = trim(Mystat)
			end if
			userrank=0
			userrank1=0
			insertval = 3
			sqlupdate=""
	elseif trim(lcase(request("butnvalue")))="hold" then
			Mystat = "Hold"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("txtreason"))
			else
				mystat1 = trim(Mystat)
			end if
			insertval = 5
			userrank=0
			userrank1=0
			sqlupdate=""
	elseif trim(lcase(request("butnvalue")))="delete" then
			Mystat = "Delete"
			if trim(request("txtreason"))<>"" then
				mystat1 = trim(request("txtreason"))
			else
				mystat1 = trim(Mystat)
			end if
			insertval = 7
			userrank=0
			userrank1=0
			sqlupdate="update TBL_SIS_Applications set User_status="& insertval &" and Reason_Update='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
      	end if
		if trim(request("txtreason"))<>"" then
			mystat1 = trim(request("txtreason"))
		else
			mystat1 = trim(Mystat)
		end if
	
		
		dim recID
		recID = trim(request("ID"))
		''' call the stored procedure to insert data into the table
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		if trim(sqlupdate)="" then
			
			
			set cmdEdit=server.CreateObject("ADODB.Command")
			cmdEdit.ActiveConnection = con	
			with cmdEdit
				.CommandText = "SP_TBL_SIS_Applications"
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
				''.Execute
			end with
			'loadedval = cmdEdit.Parameters("@MyResult")		
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
		response.redirect ("ApplicantInfoHyderabad.asp?ID="&trim(x)&"&SUB=1#callID1")
end if
%>
<html>
<head>
<title>View Applicant Details</title>
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
		window.frmsis.action="applicantinfoHyderabad.asp?ID="+recID+"&butnvalue="+actval;
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
	'SQL = "SELECT * FROM TBL_SIS_Applications where applicationfor='Hyderabad' and  Rec_id > 474 and Rec_ID="&trim(Request("ID"))
	SQL = "SELECT * FROM TBL_SIS_Applications where (applicationfor='Hyderabad' or applicationfor ='Bizacumen') and location ='Hyderabad' and  Rec_ID="&trim(Request("ID"))
else
	'SQL = "SELECT * FROM TBL_SIS_Applications where applicationfor='Hyderabad' and  Rec_id > 474 and user_name like ('%"&trim(Request("candname"))&"%')"
	SQL = "SELECT * FROM TBL_SIS_Applications where (applicationfor='Hyderabad' or applicationfor ='Bizacumen')and location ='Hyderabad' and  user_name like ('%"&trim(Request("candname"))&"%')"
end if
rs.OPEN SQL,con
If Not RS.EOF Then
Dim ID
ID=rs("Rec_ID")
DIM edu
edu= trim(rs("Education_UG"))
edu = "UG:" & edu & "<br> PG:" & trim(rs("Education_PG"))
dim UsrStat,adminstat
if trim(rs("User_Status"))="0" then
	UsrStat = "To be Released"
elseif trim(rs("User_Status"))="1" then
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
        <td width="100%" height="21" bgcolor="#000080"><p align="center"><big><font color="#FFFFFF"><strong><font class="mystyle">Applicant Information for the Post of Business Analyst</font></strong></font></big></td>
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
		  <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;Applied in:&nbsp; <%=rs("applicationfor")%></font></td>
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
        <td width="100%" height="21" bgcolor="#87CEFA"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Contact Information</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="2" cellpadding="0">
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Name & Surname</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("user_Name")%>&nbsp;<%=rs("surName")%></td>
          </tr>
	  <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Age</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("user_Age")%></td>
          </tr>
	 <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Gender</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("User_Gender")%></td>
          </tr>
		 <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Marital status</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("Marital_status")%></td>
          </tr>  
	<%if trim(session("user_type")) ="4" or trim(session("user_type")) ="0" then%>
	 
	 <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Name & Occupation</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1">

			<%  
				strname="Father's Name:" & rs("Fathers_Name")
				strnames= Split(strname,"##")
				strOnames=  Split(rs("fathers_occupation"),"##")
				''response.write strFNames(0)
				'response.write strname
			
			%>
			 <table border="1" width="95%" cellspacing="1" cellpadding="2">
			 <tr bgcolor="#87CEFA">
            <td width="17%" height="1" align="center"><font face="verdana" size="2" color="#004080"><b>Father</b></font></td>  <td width="17%" height="1" align="center"><font face="verdana" size="2" color="#004080"><b>Mother</b></font></td>
				  <td width="17%" height="1" align="center"><font face="verdana" size="2" color="#004080"><b>Spouse </font></td>
					  <td width="17%" height="1" align="center"><font face="verdana" size="2" color="#004080"><b>Sibiling</b></font></td>
			</tr>
          <tr >
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=Replace(strnames(0) ,"Father's Name:","")%></font></td>  <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=Replace(strnames(1),"Mother`s Name:","") %></font></td>
				  <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=Replace(strnames(2) ,"Spouse Name: ","")%></font></td>
					  <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=Replace(strnames(3) ,"Sibiling`s Name: ","")%></font></td>
			</tr>
			
			<tr >
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=strOnames(0)%></font></td>  <td width="17%" height="1" align="left"><font face='verdana' size='2' color='#008080'> <%=Replace(strOnames(1),"Mother`s Occupation:","")%></font></td>
				  <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=Replace(strOnames(2),"Spouse Occupation:","")%></font></td>
			  <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#008080"><%=Replace(strOnames(3),"Sibiling`s Occupation: ","")%></font></td>
			</tr>
			
			</table>
<%''	response.end%>
         <!--<font face="verdana" size="2" color="#008080"><%=Replace(Replace(rs("Fathers_Name"),"##", "  "),"Mother`s Name:","<font face='verdana' size='2' color='#004080'><b>&nbsp; & &nbsp;</b> Mother's Name:</font>")%>--></td>
          </tr>
		 <!-- <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080"> Occupation</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("fathers_occupation")%></td>
          </tr>-->
          <tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">PresentAddress</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("Permanent_Address")%></td>
          </tr>
           <tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">Permanent Address</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("user_Address")%></td>
          </tr>
	
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Phone</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("user_Phone")%></td>
          </tr>
          <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Email</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("user_Email")%></td>
          </tr>
	  <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Alternate Email</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("User_AlternateEmail")%></td>
          </tr>
	<%end if%>
        </table>
        </center></div></td>
      </tr>

      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21" bgcolor="#87CEFA"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Education</strong></font></big> </td>
      </tr>
      <tr align="center">
        <td width="109%" height="21"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
		<tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">AMCAT Test Percentile</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("AMCATPercentile")%></td>
          </tr>
		 <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Degree</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=edu%></td>
          </tr>
          <tr>
            <td width="28%" height="25"><font face="verdana" size="2" color="#004080">Year Passed Last Degree </font></td>
            <td width="2%" height="25" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("Year_passed")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
      <tr>
        <td width="100%" height="10"></td>
      </tr>
      <tr>
        <td width="100%" height="10" bgcolor="#87CEFA"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp; Employment</strong></font></big></td>
      </tr>
      <tr>
        <td width="100%" height="10"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Currently Employed</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("Emp_Status")%></td>
          </tr>
	   <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Current Salary</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("CurrentSalary")%></td>
          </tr>
	  <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Expected Salary</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("ExpectedSalary")%></td>
          </tr>
          <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">Employment Status</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=rs("Emp_Type")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21" bgcolor="#87CEFA"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;&nbsp;
        Work Experience</strong></font></big> <font face="verdana" size="2" color="#004080"><small>(To be verified prior
        to employment)</small></font></td>
      </tr>
      <tr align="center">
        <td width="100%" height="6"><div align="center"><center><table border="0" width="95%" cellspacing="0">
			<TR><TD><font face="verdana" size="2" color="#008080"><%=rs("Work_Experience")%></TD></TR>
        </table>
        </center></div></td>
      </tr>
<tr align="center">
        <td width="100%" height="6"><div align="center"><center><table border="0" width="95%" cellspacing="0">
			<TR><TD><font face="verdana" size="2" color="#008080"><b>Tasks Performed:</b><br><%=rs("Tasks_performed")%></TD></TR>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="2" bgcolor="#87CEFA"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Self Assessment</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="2"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
          <tr>
            <td width="36%" height="19"><font face="verdana" size="2" color="#004080">Spoken English Skills</font></td>
            <td width="5%" align="center" height="19"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="19"><font face="verdana" size="2" color="#008080"><%=rs("Spoken_English")%></td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Written English Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Written_Skills")%></td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#804040"><strong>Computer Skills</strong></font></td>
            <td width="5%" align="center" height="21"></td>
            <td width="59%" height="21"></td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Windows Functions &amp; Environment</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Windows_Skills")%></td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Keyboard Skills(Typing &amp; Mouse)</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Keyboard_Skills")%></td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Word Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Word_Skills")%>
</td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Excel Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Excel_Skills")%></td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Access Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Access_Skills")%>
</td>
          </tr>
          <!--tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Powerpoint Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%'=rs("Powerpoint_Skills")%></td>
          </tr-->
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#87CEFA"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Special Skills &amp; Qualifications</strong></font></big></td></a>
      </tr>
      <tr align="center">
        <td width="100%" height="1"><div align="center"><center>
        <table border="1" width="98%" bordercolor="#800000" cellspacing="0" cellpadding="3">
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#008080"><%=rs("Special_Skills")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
	 <tr align="center">
        <td width="100%" height="0" border=""><form method="post" action="Approved_ApplicantInfo_FreeLancers.asp" name="frmsis">
<tr align="center">
        <td width="100%" height="1">
		<table width="98%" cellspacing="0" cellpadding="3">
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Give Reason if any :</font> <textarea id="txtreason" name="txtreason"></textarea></td>
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
	<input type="hidden" name="txtemail" value="<%=trim(rs("User_Email"))%>">
	<input type="hidden" name="txtName" value="<%=trim(rs("user_Name"))%>">
	
        </table>
		</td>
      </tr>
<%if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="3" or trim(rs("User_Status"))="4" or trim(rs("User_Status"))="6" or trim(rs("User_Status"))="5") then%>
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
			
		if trim(session("user_type")) ="4" then
			if trim(rs("User_Status"))="0" then
				Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Release"" onclick=""javascript:submitval('release','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Block"" onclick=""javascript:submitval('Block','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;</td>")	
			else
				Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept Stage 1"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Accept Stage 2"" onclick=""javascript:submitval('Accept2','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Delete"" onclick=""javascript:submitval('Delete','"&rs("Rec_ID")&"');""></td>")	
			end if
		else
			Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept Stage 1"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');""></td>")	
		end if					
		Response.Write ("</tr>")
			dim MYValID,MYValID1
			MYValID = cint(Request("ID"))+1
			MYValID1 = cint(Request("ID"))-1
			%>         
        </form>
        </td>
      </tr>
	  <tr>
        <td width="100%"><big><font face="verdana" size="2" color="blue"><strong>Application :&nbsp; <%=rs("Rec_ID")%> : <%=rs("user_Name")%> : <%=edu%></strong></font></big></td>
      </tr>
	
      <tr align="center">
        <td width="100%" height="0" align="right">
		<table width="100%"><tr>
		<td align="left">
		<%if MYValID1 > 0 then%>
			<a href="ApplicantinfoHyderabad.asp?ID=<%=trim(MYValID1)%>&RecType=prev#callID1"><b> &laquo; Previous  </b></a></td>
		<%end if%>
			<td align="right"><a href="ApplicantinfoHyderabad.asp?ID=<%=trim(MYValID)%>&RecType=nxt#callID1"><b> Next &raquo; </b></a></td>
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
		
		<a href="ApplicantinfoHyderabad.asp?ID=<%=trim(MYVID)%>#callID1"><b> &laquo; Previous </b></a>
		
      </p>
<% End If%>
</body>
</html>
