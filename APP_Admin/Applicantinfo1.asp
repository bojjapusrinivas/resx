<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
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
		window.frmsis.action="applicantinfo.asp?ID="+recID+"&butnvalue="+actval;
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
	SQL = "SELECT * FROM TBL_SIS_Analysts where Rec_ID="&trim(Request("ID"))
else
	SQL = "SELECT * FROM TBL_SIS_Analysts where user_name like ('%"&trim(Request("candname"))&"%')"
end if
rs.OPEN SQL,con
If Not RS.EOF Then
Dim ID
ID=rs("Rec_ID")
DIM edu
edu= trim(rs("Education_PG"))
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
        <td width="100%" height="21" bgcolor="#000080"><p align="center"><big><font color="#FFFFFF"><strong><font class="mystyle">Applicant Information for the Post of Business Analyst</font></strong></font></big></td>
      </tr>
      <tr>
        <td width="100%" height="21"></td>
      </tr>
	 
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="0" cellpadding="0">
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
          <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Powerpoint Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs("Powerpoint_Skills")%></td>
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
        <td width="100%" height="0"></td>
      </tr>
    </table>
    </center></div></td>
  </tr>
</table>
</center></div>
<%SET rs=nothing
con.close()
Else %>
	<br><p align="center"><font color='red'><b>Please check, invalid Candidate ID given</b></font></p>
<% End If%>
</body>
</html>
