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
<table border="1" width="98%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">SIS Adminstration help Page</font></big></strong></td>
  </tr>   
</table><br>
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
<tr><td bgcolor="#f0e5dd"><font size='2' face=verdana>
	<b>Note :</b><br>1. Click on <b>Pending Requests</b> link on the left strip to view the applications which are pending.
	<br>2. Click on <b>Viewed Requests</b> link to see the applications which were already been checked and made to Accepted, Declined or Hold status.
	<br>3. Click on <b>Search Requests</b> link to search an application with a particular ID or Name.
	</font></td></tr>
</td></tr>
</table>
<tr><td colspan="2">
<!--#include file="ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
