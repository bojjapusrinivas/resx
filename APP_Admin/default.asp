<html>
<head>
<title>Evaluation of Resumes for the post of Business Analayts</title>
<script language="JavaScript">

function Validate(theForm)
{
  if (theForm.Username.value == "")
  {
    alert("Please enter your Username in the \"Username\" field.");
    theForm.Username.focus();
    return (false);
  }

  if (theForm.Password.value == "")
  {
    alert("Please enter Your Password in the \"Password\" field.");
    theForm.Password.focus();
    return (false);
  }


return (true);
}

</script>
</head>
<link href="../globind.css" rel="stylesheet" type="text/css">
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<table width="100%" height="100%" align="center" border="0">			
<tr><td colspan="2" valign="top"><!--#include file="ASPIncludes/TopStrip.asp"--></td></tr>
<tr><td valign="top" align="center">
<table border="1" width="50%" cellspacing="0" cellpadding="0">
<tr><td align="center">
<%if trim(request("message"))="sesexp" then
	Response.Write ("<font color='red'>Session expired, please login again</font>")
elseif trim(request("message"))="invalid" then
	Response.Write ("<font color='red'>Invalid login</font>")
elseif trim(request("message"))="aut" then
	Response.Write ("<font color='red'><b>You have no permission to login.</b></font>")
end if%>
</td></tr>
</table>
<table border="1" width="50%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%"><form method="POST" action="checkuser.asp" align="center" onSubmit="return Validate(this)">
      <div align="center"><center><table border="0" width="100%" cellspacing="0" cellpadding="0" height="84">
        <tr>
          <td width="100%" bgcolor="#4169E1" height="21" colspan="3"><div align="center"><center><p><font
          color="#FFFFFF"><big><strong>BizAcumen Application Evaluation</strong></big></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" colspan="3"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" colspan="3"><div align="center"><center><p><font
          color="#004080"><small>Enter your Username &amp; Password to enter the Evaluation Process
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </small></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" colspan="3"></td>
        </tr>
        <tr align="center">
          <td width="34%" height="21" align="right"><div align="right"><p><strong><font
          color="#004080">Username</font></strong></td>
          <td width="4%" height="21" align="center"><strong><font color="#004080">:</font></strong></td>
          <td width="62%" height="21"><input type="text" name="Username" size="20" tabindex="1"></td>
        </tr>
        <tr align="center">
          <td width="34%" height="21" align="right"></td>
          <td width="4%" height="21" align="center"></td>
          <td width="62%" height="21"></td>
        </tr>
        <tr align="center">
          <td width="34%" height="21" align="right"><div align="right"><p><strong><font
          color="#004080">Password</font></strong></td>
          <td width="4%" height="21" align="center"><strong><font color="#004080">:</font></strong></td>
          <td width="62%" height="21"><input type="password" name="Password" size="20" tabindex="2"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" colspan="3"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" colspan="3"><div align="center"><center><p><input
          type="submit" value="Submit" name="B1" tabindex="3"></td>
        </tr>
      </table>
      </center></div>
    </form>
    </td>
  </tr>
</table>
</td></tr>
<tr><td valign="bottom">
<!--#include file="ASPIncludes/BottomStrip.asp"-->
</td></tr>
</table>
</center></div>
</body>
</html>
