<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SendEmail.asp"-->
<!--#include file="ASPIncludes/SiteFunctions.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
'''' update the status of the records that were selected for the check boxes
'for each var in request.form
'	response.write var & "=" & request(var) &"<br>"
'next
if trim(request("butnvalue"))<>"" then
	''' User Status = 1 -- pending
	''' User Status = 2 -- Accept stage 1
	''' User Status = 3 -- Declined
	''' User Status = 4 -- deleted
	''' User Status = 5 -- Accept stage 1
	dim Mystat, mystat1, insertval,MessageBody1,UserRank
	MessageBody1 = ""
	UserRank = 0
	'response.write (trim(request("txtemail")))
	'response.end
      	if trim(lcase(request("butnvalue")))="accept" then
		Mystat = "Accept1"
		mystat1 = "Accept Stage 1"
		UserRank = trim(request("UserRank"))
		insertval = 2
		'' send a mail to user for the accept done

		MessageBody1 = MessageBody1 & "<table width='98%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		''MessageBody1 = MessageBody1 & "<tr><td width='100%'>&nbsp;</td><td>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Dear "&request("txtName")&",</font></b><br><br></td></tr>"
		'MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>We thank you for responding to our advertisement for the position of External Writers. We are pleased to select you to our Preliminary List of potential participants based on several parameters. We will soon initiate the evaluation process where you will receive our <b>Competency & Placement Assignment</b>. This assignment will help us decide whether your candidature fits our Research & Analysis Program or not. The initial test assignment will be given to you within the next 1 (one) week. Please visit us after 1 (one) week by using your personal email ID as the ‘Login ID’ and the password entered by you in the application form. <br><br></td></tr>"										     
	        MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>We thank you for responding to our advertisement for the position of External Writers. We are pleased to select you to our Preliminary List of potential participants based on several parameters. We will soon initiate the evaluation process where you will receive our <b>Competency & Placement Assignment</b>. This assignment will help us decide whether your candidature fits our Research & Analysis Program or not. The initial test assignment will be given to you. <!--Please visit us after 1 (one) week by using your personal email ID as the ‘Login ID’ and the password entered by you in the application form.--> <br><br></td></tr>"										     
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Thank you once again for your interest in working with us. We look forward to taking the process further. Please do not forget to check for the test assignment by visiting us after 1 (one) week.  Have a nice day!<br><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Regards, <br><br></td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Coordinator, eNet Services</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>SIS Infotech Private Limited</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'><a href='mailto:enet.svcs@sisinfotech.com'>enet.svcs@sisinfotech.com</a></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'><a href='http://www.sisinfotech.com'>www.sisinfotech.com</a></td></tr>"
		MessageBody1 = MessageBody1 & "</table>"
	        ''call sendemail1("careers@sisinfotech.com",trim(request("txtemail")),"SISInfotech application status",MessageBody1)	

      	elseif trim(lcase(request("butnvalue")))="decline" then
		Mystat = "Reject"
		mystat1 = "Rejected"
		insertval = 3
		'' send a mail to user for the Rejection done
		MessageBody1 = MessageBody1 & "<table width='98%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		''MessageBody1 = MessageBody1 & "<tr><td width='100%'>&nbsp;</td><td>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Dear "&request("txtName")&",</font></b><br><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Thank you for taking out the time to apply online for the position of External Writers. We have carefully considered your application and regret to inform you that your candidature does not form a fit with our present requirements. <br><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>We wish you good luck in all your future professional endeavors and thank you once again for your interest in working with us.<br><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Regards, <br><br></td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Coordinator, eNet Services</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>SIS Infotech Private Limited</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'><a href='mailto:enet.svcs@sisinfotech.com'>enet.svcs@sisinfotech.com</a></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'><a href='http://www.sisinfotech.com'>www.sisinfotech.com</a></td></tr>"
		MessageBody1 = MessageBody1 & "</table>"
	        ''call sendemail1("careers@sisinfotech.com",trim(request("txtemail")),"SISInfotech application status",MessageBody1)	
	elseif trim(lcase(request("butnvalue")))="delete" then
		Mystat = "delete"
		mystat1 = "deleted"
		insertval = 4
	elseif trim(lcase(request("butnvalue")))="hold" then
		Mystat = "hold"
		mystat1 = "hold"
		insertval = 6
	elseif trim(lcase(request("butnvalue")))="fully approved" then
		Mystat = "Accept2"
		mystat1 = "Accept Stage 2"
		insertval = 5
		UserRank = trim(request("UserRank"))
		insertval = 2
		
		'' send a mail to user for the accept done
		MessageBody1 = MessageBody1 & "<table width='98%'  bordercolor='#c0c0c0' align=left cellpadding=1 cellspacing=0 border=0  style='border-collapse:collapse;'>"
		''MessageBody1 = MessageBody1 & "<tr><td width='100%'>&nbsp;</td><td>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Dear "&request("txtName")&",</font></b><br><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>We thank you for responding to our advertisement for the position of External Writers. We are pleased to select you to our Preliminary List of potential participants based on several parameters. We will soon initiate the evaluation process where you will receive our Competency & Placement Assignment. This assignment will help us decide whether your candidature fits our Research & Analysis Program or not. The initial test assignment will be given to you within the next 1 (one) week. Please visit us after 1 (one) week by using your personal email ID as the ‘Login ID’ and the password entered by you in the application form. <br><br></td></tr>"										     
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Thank you once again for your interest in working with us. We look forward to taking the process further. Please do not forget to check for the test assignment by visiting us after 1 (one) week.  Have a nice day!<br><br></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Regards, <br><br></td></tr>"
		''MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>&nbsp;</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>Coordinator, eNet Services</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'>SIS Infotech Private Limited</td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'><a href='mailto:enet.svcs@sisinfotech.com'>enet.svcs@sisinfotech.com</a></td></tr>"
		MessageBody1 = MessageBody1 & "<tr><td ><font face='arial' size='2'><a href='http://www.sisinfotech.com'>www.sisinfotech.com</a></td></tr>"
		MessageBody1 = MessageBody1 & "</table>"
	        ''call sendemail1("careers@sisinfotech.com",trim(request("txtemail")),"SISInfotech application status",MessageBody1)	

      	end if
	
	
	if trim(request("txtreason"))<>"" then
		mystat1 = trim(request("txtreason"))
	end if
		dim recID
		recID = trim(request("ID"))
		''' call the stored procedure to insert data into the table		
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
				.Parameters.Append .CreateParameter ("@MyUser_Password",advarchar,adparamInputOutput,50,"password")
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
				.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,"Skills")
				.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,50,trim(session("user_name")))
				.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,insertval)
				.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,mystat1)
				.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"fREElANCER")
				.Parameters.Append .CreateParameter ("@MyPublications_Read",advarchar,adparamInputOutput,5000,"publications")	
     				.Parameters.Append .CreateParameter ("@MySpend_Time_Internet",advarchar,adparamInputOutput,100,"Online")	
     				.Parameters.Append .CreateParameter ("@MySee_Advertisement",advarchar,adparamInputOutput,100,"myADVT")	
			     	.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,UserRank)	

				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
				.Execute			
			end with
		loadedval = cmdEdit.Parameters("@MyResult")
		set cmdEdit = nothing
		con.close()
		%>
		<script language="javascript">
			window.opener.location.href="Frm_SIS_View.asp";
			//window.close();
		</script>
		<%
		dim x
		x = cint(Request("ID"))+1
		response.redirect ("ApplicantInfo_FreeLancers.asp?ID="&trim(x)&"&SUB=1#callID1")
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
	var updateval;
	updateval = confirm("Confirm, do you want this applicant status to "+actval);
	if (updateval==true)
	{
		window.frmsis.method="post";
		window.frmsis.action="applicantinfo_FreeLancers.asp?ID="+recID+"&butnvalue="+actval;
		window.frmsis.submit();
	}	
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
	SQL = "SELECT * FROM TBL_SIS_FreeLancernew where Rec_ID="&trim(Request("ID"))
else
	SQL = "SELECT * FROM TBL_SIS_FreeLancernew where user_name like ('%"&trim(Request("candname"))&"%')"
end if
rs.OPEN SQL,con
If Not RS.EOF Then
Dim ID
ID=rs("Rec_ID")
DIM edu, edu1
edu= trim(rs("Education_PG"))
edu1 = trim(rs("Education_Graduate"))
dim UsrStat,adminstat,UsrStat2
if trim(rs("User_Status"))="1" then
	UsrStat = "Pending"
	UsrStat1 = "Pending"
elseif trim(rs("User_Status"))="2" then
	UsrStat = "Accepted"
	UsrStat1 = "Accept Stage 1"
elseif trim(rs("User_Status"))="3" then
	UsrStat = "Declined"
	UsrStat1 = "Declined"
elseif trim(rs("User_Status"))="4" then
	UsrStat = "Deleted"
	UsrStat1 = "Deleted"		
elseif trim(rs("User_Status"))="5" then
	UsrStat = "Accepted"
	UsrStat1 = "Accept Stage 2"
elseif trim(rs("User_Status"))="6" then
	UsrStat = "Hold"
	UsrStat1 = "Hold"		
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
        <td width="100%" height="5"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="0" cellpadding="0">
	<tr align="center">
        <td width="100%" height="0" align="right">
		<table width="100%"><tr>
		<td align="left"><a href="ApplicantInfo_FreeLancers.asp?ID=<%=cint(trim(request("ID")))-1%>#callID1"><b> &laquo; Previous  </b></a></td>
		<td align="right"><a href="ApplicantInfo_FreeLancers.asp?ID=<%=cint(trim(request("ID")))+1%>#callID1"><b> Next &raquo; </b></a></td>
		</tr></table>
		</td>
        </tr>
		  <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><strong>Application ID :&nbsp; <%=rs("Rec_ID")%></strong></font></big></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Application Date :&nbsp; <%=rs("Date_Created")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Application Status :&nbsp; <%=UsrStat1%></font></td>
          </tr>
          <%if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="3"  or trim(rs("User_Status"))="4" or trim(rs("User_Status"))="5") then%>
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
        <td width="100%" height="21" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Contact Information</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="2" cellpadding="0">
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Name</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("user_Name")%></td>
          </tr>
	<tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Gender</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("user_Gender")%></td>
          </tr>
          <tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">Address</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("user_Address")%></td>
          </tr>
	<tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">City</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("user_city")%></td>
          </tr>
          <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Age</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("user_Age")%></td>
          </tr>
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Phone</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("user_Phone")%></td>
          </tr>
	  <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Mobile</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("user_mobile")%></td>
          </tr>
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Email</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("user_Email")%></td>
          </tr>
	  <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Alternate Email</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("user_AlternateEmail")%></td>
          </tr>
	  <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Father's Name</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#008080"><%=rs("Fathers_Name")%>&nbsp;&nbsp;&nbsp;Occupation: <%=rs("Fathers_Occupation")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Education</strong></font></big> </td>
      </tr>
      <tr align="center">
        <td width="109%" height="21"><div align="center"><center><table border="0" width="95%"
        cellspacing="0" cellpadding="0">
          <tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">PG Degree</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=edu%></td>
          </tr>
	<tr>
            <td width="28%"><font face="verdana" size="2" color="#004080">UG Degree</font></td>
            <td width="2%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="77%"><font face="verdana" size="2" color="#008080"><%=trim(rs("Education_Graduate"))%></td>
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
        <td width="100%" height="10" bgcolor="#D3E1DF"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp; Employment</strong></font></big></td>
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
        <td width="100%" height="21" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;&nbsp;
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
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="2" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
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
          <!--tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Access Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%'=rs("Access_Skills")%>
</td>
          </tr>
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Powerpoint Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%'=rs("Powerpoint_Skills")%></td>
          </tr-->

	
	<tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Do you have a computer ?</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Own_Computer")%></td>
          </tr>
	<tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Do you have internet access ?</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Internet_Access")%></td>
          </tr>	
	</table>
        </center></div></td>
      </tr>
	<tr align="center">
        <td width="100%" height="2" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        More about yourself</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="2"><div align="center"><center><table border="0" width="95%" cellspacing="0" cellpadding="0">
	<tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Hours per 7-day week </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Hours_Per_Week")%> Hours/Week</td>
          </tr>
	<tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">kind of publications  </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Publications_Read")%></td>
          </tr>
	<tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">spend time on the Internet  </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Spend_Time_Internet")%></td>
          </tr>
	<tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">How did you come to know about the ‘work from home’ option from SIS? </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("See_Advertisement")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Please tell us about yourself, your family, interests, special skills, hobbies, and anything that would enable us to know more about you as a person. Please limit to 7000 characters. The following write-up submitted by you will be one of the key bases of our recruitment and selection process. 
	<font color="#FF0000"><small>*</small></font><br><font color=red>You are requested NOT to paste your resume in the following box. Pasting your resume here will automatically disqualify you from our recruitment process.</font>
	</strong></font></big></td></a>
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
        <td width="100%" height="0" border=""><form method="post" action="ApplicantInfo_FreeLancers.asp" name="frmsis">
<tr align="center">
        <td width="100%" height="1">
		<table width="98%" cellspacing="0" cellpadding="3">
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Give Reason if any :</font> <textarea id="txtreason" name="txtreason"><%=rs("reason_update")%></textarea></td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Rank1 :</font> <select name="UserRank">
		<option value="7">7</option>
		<option value="7.5">7.5</option>
		<option value="8">8</option>
		<option value="8.5">8.5</option>
		<option value="9">9</option>
		<option value="9.5">9.5</option>
		<option value="10">10</option>
		</select></td>
          </tr>
	<input type="hidden" name="txtemail" value="<%=trim(rs("User_Email"))%>">
	<input type="hidden" name="txtName" value="<%=trim(rs("user_Name"))%>">
	
        </table>
		</td>
      </tr>
<%if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="3" or trim(rs("User_Status"))="4" or trim(rs("User_Status"))="5"  or trim(rs("User_Status"))="6") then%>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Status :&nbsp; <%=UsrStat1%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;by :&nbsp; <%=rs("Updated_BY")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Date <%=UsrStat%> :&nbsp; <%=rs("Date_Updated")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;Reason:&nbsp; <%=rs("Reason_Update")%></font></td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Rank1:&nbsp; <%=rs("Points_Scored")%></font></td>
          </tr>
      <%end if%>
			<%
			Response.Write ("<tr bgcolor='white' align=""center"">")
				Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept Stage 1"" onclick=""javascript:submitval('Accept','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Delete"" onclick=""javascript:submitval('Delete','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('hold','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Accept Stage 2"" onclick=""javascript:submitval('Approved fully','"&rs("Rec_ID")&"');""></td>")					
			Response.Write ("</tr>")
dim MYValID,MYValID1
			MYValID = cint(Request("ID"))+1
			MYValID1 = cint(Request("ID"))-1
			%>         
        </form>
        </td>
      </tr>
	  <tr>
        <td width="100%"><big><font face="verdana" size="2" color="blue"><strong>Application :&nbsp; <%=rs("Rec_ID")%> : <%=rs("user_Name")%> : <%=edu%>(PG),<%=edu1%>(UG)</strong></font></big></td>
      </tr>
	
      <tr align="center">
        <td width="100%" height="0" align="right">
		<table width="100%"><tr>
		<td align="left"><a href="ApplicantInfo_FreeLancers.asp?ID=<%=trim(MYValID1)%>#callID1"><b> &laquo; Previous  </b></a></td>
		<td align="right"><a href="ApplicantInfo_FreeLancers.asp?ID=<%=trim(MYValID)%>#callID1"><b> Next &raquo; </b></a></td>
		</tr></table>
		</td>
      </tr>
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
		MYVID1 = cint(Request("ID"))+1
		if MYVID1=1 then%>
			<a href="ApplicantInfo_FreeLancers.asp?ID=<%=trim(MYVID1)%>#callID1"><b> Next &raquo;</b></a>
		<%else%>
        	<a href="ApplicantInfo_FreeLancers.asp?ID=<%=trim(MYVID)%>#callID1"><b> &laquo; Previous </b></a>
		<%end if%>
      </p>
<% End If%>
</body>
</html>
