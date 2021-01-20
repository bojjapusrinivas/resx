<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
%>
<html>
<head>
<title>Enter Applicant Id</title>
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
<tr><td colspan="2" valign="top"><!--#include file="ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td width="15%" height="100%" height="100%"  bgcolor="#73AEBD" valign="top"><!--#include file="ASPIncludes/sideStrip.asp"--></td>
<td valign="top" align="center">
<table border="0" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0"> 
<tr><td height="10"></td></tr>
</table> 
<table border="1" width="75%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">Search SIS Infotech Evaluation Process</font></big></strong></td>
  </tr>
  <tr>
    <td width="100%"><div align="center"><center><table border="0" width="80%" cellspacing="0" cellpadding="0" bordercolor="#73AEBD" height="187">
      <tr>
        <td width="100%" height="21"></td>
      </tr>
      <tr>
        <td width="100%" height="21"></td>
      </tr>
      <tr>
        <td width="100%" height="40"><p align="justify"><font color="#804040"><strong>Welcome to the Evaluation Process. Please type in the Candiadate ID in the box given below and press
        Enter.</strong></font></td>
      </tr>
      <tr>
        <td width="100%" height="21"></td>
      </tr>
      <tr>
        <td width="100%" height="21"></td>
      </tr>
      <tr>
        <td width="100%" height="21"><form method="POST" action="Applicantinfo.asp" target="_new" onSubmit="return Validate(this)">
          <div align="center"><center><p><font color="#004080"><strong>Candidate ID :</strong></font>&nbsp;&nbsp;
          <input type="text" name="ID" size="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Enter" name="Btn1"></p>
          </center></div>
        </form>
        </td>
      </tr>
      <tr>
        <td width="100%" height="21"><form method="POST" action="Frm_sis_view.asp" id=form2 name=form2>
          <div align="center"><center><p><font color="#004080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Candidate Name :</strong></font>&nbsp;&nbsp;
          <input type="text" name="candname" size="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Enter" name="Btn2"></p>
          </center></div>
        </form>
        </td>
      </tr>
	<tr>
        <td width="100%" height="21"><form method="POST" action="Frm_sis_view.asp" id=form3 name=form3>
          <div align="center"><center><p><font color="#004080"><strong>Candidate Special Skills :</strong></font>&nbsp;&nbsp;
          <input type="text" name="candDesc" size="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Enter" name="Btn3"></p>
          </center></div>
        </form>
        </td>
      </tr>
      <tr>
        <td width="100%" height="21"></td>
      </tr>
    </table>
    </center></div></td>
  </tr>
</table>
</td></tr>
<tr><td colspan="2">
<!--#include file="ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
