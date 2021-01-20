<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
if trim(request("BtnSubmit"))<>"" then
		''' call the stored procedure to insert data into the table
		''' User Status = 1 -- pending
		''' User Status = 2 -- approved
		''' User Status = 3 -- Declined
	UserRank = 0
	
	if trim(lcase(request("butnvalue")))="accept1" then
		Mystat = "Accept1"
		mystat1 = "Accept Stage 1"
		UserRank = trim(request("UserRank"))
		insertval = 2
	elseif trim(lcase(request("butnvalue")))="accept" then
		Mystat = "Approve"
		mystat1 = "Accept stage 2"
		UserRank = trim(request("UserRank"))
		insertval = 2
	elseif trim(lcase(request("butnvalue")))="decline" then
		Mystat = "Reject"
		mystat1 = "Rejected"
		insertval = 3
	elseif trim(lcase(request("butnvalue")))="delete" then
		Mystat = "delete"
		mystat1 = "Deleted"
		insertval = 4
      	end if
	if trim(request("txtreason"))<>"" then
		mystat1 = trim(request("txtreason")) & " : " & mystat1
	end if


	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmdEdit=server.CreateObject("ADODB.Command")
	'response.write (Trim(request("insertval")))
	'response.end
	cmdEdit.ActiveConnection = con			
			with cmdEdit 				
				.CommandText = "SP_TBL_SIS_Analysts"
				.CommandType = adcmdStoredProc	
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
				.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(Request("RecID")))
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,trim(request("Name")))
				.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,trim(request("Address")))
				.Parameters.Append .CreateParameter ("@MyUser_Age",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,trim(request("Phone")))
				.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,trim(request("Email")))
				.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,trim(PGEducation))
				.Parameters.Append .CreateParameter ("@MyYear_Passed",adInteger,adparamInputOutput,,1)
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
				.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,50,trim(session("user_name")))
				.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,Trim(request("insertval")))
				.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,Trim(request("txtreason")))
				.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
				.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,UserRank)
				.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,0)
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)

				.Execute			
			end with

		loadedval = cmdEdit.Parameters("@MyResult")
		set cmdEdit = nothing
		con.close()
		
		Response.Redirect ("FRM_SIS_View.asp?Message="&loadedval&"")
end if
%>
<html>
<head>
<title>SIS Analysts Evaluation</title>
<script language="JavaScript">

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
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<table width="100%" height="100%" align="center" border="0">			
	<tr><td colspan="2" valign="top"><!--#include file="../ASPIncludes_vizag/TopStrip.asp"--></td></tr>
	<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="../ASPIncludes_vizag/sideStrip.asp"--></td>
	<td valign="top" align="center">
	<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
		<tr><td height="10"></td></tr>
	</table> 
<%
	DIM conn
	DIM rs
	DIM SQL
	SET rs=SERVER.CREATEOBJECT("ADODB.RECORDSET")
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
	SQL = "SELECT * FROM TBL_SIS_Analysts where Rec_ID="&trim(Request("RecID"))
	rs.OPEN SQL,con
	If Not RS.EOF Then
	Dim ID
	ID=rs("Rec_ID")
	DIM edu
	edu= trim(rs("Education_PG"))
%>
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">Welcome to SIS Infotech Evaluation Process</font></big></strong></td>
  </tr>
  <tr>
    <td width="100%"><div align="center"><center><table border="0" width="100%" cellspacing="0" cellpadding="0" bordercolor="#73AEBD" height="187">
      <tr>
        <td width="100%" height="10"></td>
      </tr> 
      <%
      dim Mystat, mystat1, insertval
      if trim(request("stat"))="A" then
			Mystat = "Approve"
			mystat1 = "Approving"
			insertval = 2
      elseif trim(request("stat"))="D" then
			Mystat = "Decline"
			mystat1 = "Declining"
			insertval = 3
	  elseif trim(request("stat"))="H" then
			Mystat = "Hold"
			mystat1 = "Holding"
			insertval = 5
      end if
      %>     
      <tr align="center">
		  <td width="100%" height="21" bgcolor="#D3E1DF"><p align="left"><big><font color="#804040"><strong>&nbsp;&nbsp;Evaluation Process for <%=mystat1%>&nbsp;<%=trim(rs("user_name"))%></strong></font></big></td>
	  </tr>
      <tr>
        <td width="100%" height="10"></td>
      </tr>
      
     <tr align="center">
		  <td width="100%" height="21"><div align="center"><center>
		  <form name="frmstat" method="post">
		  <table border="0" width="95%" cellspacing="0" cellpadding="0">
		    <tr>
		      <td width="40%" height="1" align="left"><font color="#004080">Reason for <%=mystat1%></font></td>
		      <td width="4%" align="center" height="1"><font color="#004080"><strong>:</strong></font></td>
		      <td width="59%" height="1"><textarea id="txtreason" name="txtreason"></textarea></td>
		    </tr>
		    <tr>
				<input type="hidden" name="RecID" value="<%=trim(Request("RecID"))%>">
				<input type="hidden" name="insertval" value="<%=trim(insertval)%>">		     
		      <td width="79%" colspan="3"><input type="submit" name="BtnSubmit" Value="<%=Mystat%>"></td>
		    </tr>
		  </table>
		  </form>
		</td>
      </tr>
      <tr><td width="100%" >
		
				<div align="center"><center>

				<table border="0" width="100%" cellspacing="0" cellpadding="0" bordercolor="#005563" class=mystyle>
				  <tr>
				    <td width="100%"><div align="center"><center><table border="0" width="100%"
				    cellspacing="0" cellpadding="5">
				      <tr>
				        <td width="100%" height="21" bgcolor="#73AEBF"><p align="center"><big><font
				        color="#FFFFFF"><strong><font class="mystyle">Applicant Information for the Post of <%=rs("Post_Applied")%></font></strong></font></big></td>
				      </tr>
				      <tr>
				        <td width="100%" height="21"></td>
				      </tr>
				      <tr align="center">
				        <td width="100%" height="21"><div align="center">
						<center><table border="0" width="95%" cellspacing="0" cellpadding="3">
				          <tr>
				            <td width="30%"><big><font color="#804040"><strong>ID :&nbsp; <%=rs("Rec_ID")%></strong></font></big></td>
				            <td width="70%"><big><font color="#804040"><strong>Application Date :&nbsp; <%=rs("Date_Created")%> </strong></font></big></td>
				          </tr>						  
				        </table>
				        </center></div></td>
				      </tr>
				      <tr align="center">
				        <td width="100%" height="21" bgcolor="#D3E1DF"><p align="left"><big><font color="#804040"><strong>&nbsp;&nbsp;
				        Contact Information</strong></font></big></td>
				      </tr>
				      <tr align="center">
				        <td width="100%" height="21"><div align="center"><center><table border="0" width="95%"
				        cellspacing="0" cellpadding="0">
				          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Name</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("user_Name")%></td>
          </tr>
          <tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">Address</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("user_Address")%></td>
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
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Email</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("user_Email")%></td>
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
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Access Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Access_Skills")%>
</td>
          </tr>
         
        </table>
        </center></div></td>
      </tr>
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      <tr align="center">
        <td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Special Skills &amp; Qualifications</strong></font></big></td>
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
				        <td width="100%" height="0"><form method="post" action="Submitstatus.asp" name="Status">
							<% Response.write("<input name='ID' type='hidden' value='" & ID & "'>") %>         
				        </form>
				        </td>
				      </tr>
				      <tr align="center">
				        <td width="100%" height="0"></td>
				      </tr>
				    </table>
				    </center></div></td>
				  </tr>
				</table>
				</center></div>				
      </td></tr>
      <tr>
        <td width="100%" height="21"></td>
      </tr>
    </table>
    </center></div></td>
  </tr>
</table>
</td></tr>
<%SET rs=nothing
con.close()
Else %>
	<p align="center">Please check the ID </p>
<% End If%>
<tr><td colspan="2">
<!--#include file="../ASPIncludes_vizag/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
