<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
%>
<%
dim loadedval
if trim(request("btnsubmit"))="Add" then
	if trim(request("TxtUserName"))<>"" and trim(request("TxtUserPwd"))<>"" then
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		set cmdEdit=server.CreateObject("ADODB.Command")
		cmdEdit.ActiveConnection = con			
			with cmdEdit 				
				.CommandText = "SP_TBL_User_Access"
				.CommandType = adcmdStoredProc	
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"INSERT")
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,30,trim(request("TxtUserName")))
				.Parameters.Append .CreateParameter ("@MyUser_Pwd",advarchar,adparamInputOutput,30,trim(request("TxtUserPwd")))
				.Parameters.Append .CreateParameter ("@MyUser_Type",adInteger,adparamInputOutput,,trim(request("TxtType")))
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)						
				.Execute			
			end with
		loadedval = cmdEdit.Parameters("@MyResult")
		set cmdEdit = nothing
		con.close()
	else
		loadedval = 0
	end if
end if
%>
<html>
<head>
<title>Enter Applicant Id</title>
<script language="JavaScript">

function Validate()
{
  if (document.FrmUser.TxtUserName.value == "")
  {
    alert("Please enter User Name in the \"User Name\" field.");
    document.Frmcareers.TxtUserName.focus();
    return false;
  }

  if (document.FrmUser.TxtUserPwd.value == "")
  {
    alert("Please enter Password in the \"User Password\" field.");
    document.Frmcareers.TxtUserPwd.focus();
    return false;
  }
return true;
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
<table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 
 <tr>
    <td width="100%" bgcolor="#005563"><p align="center"><strong><big><font color="#FFFFFF">Add User Details</font></big></strong></td>
  </tr>
  <tr>
    <td width="100%"><p align="center"><font color='red'>
    <%if trim(loadedval)="0" then%>
		Enter Correct data
	<%elseif trim(loadedval)="1" then%>
		User data inserted successfully
	<%elseif trim(loadedval)="5" then%>
		User data already exists
	<%elseif trim(loadedval)="6" then%>
		All Users Cannot be deleted
    <%end if%>
    </font></p></td>
  </tr>
        <tr align="center">
          <td width="100%" height="21"><font face="verdana" size="2"><a href="Frm_SIS_User.asp"><font face="verdana" size="2"><b>Add</b></font></a> | <font face="verdana" size="2"><a href="Frm_SIS_View_Users.asp"><font face="verdana" size="2"><b>View</b></font></a></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21"><div align="right"><p><font face="verdana" size="2" color="#004080">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <b>Note</b> : Items marked </font><font color="#FF0000">*</font> <font face="verdana" size="2" color="#004080">are required</font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#D3E1DF"><div align="left"><p><big><font color="#804040"><strong>&nbsp;&nbsp;Login Details</strong></font></big></td>
        </tr>
        <form name="FrmUser" method="post" onsubmit="return Validate();">
        <tr align="center">
          <td width="100%" height="21"><div align="center"><center><table border="1" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
            <tr>
              <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">User Name</font><small><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
              <td width="79%" height="1"><input type="text" name="TxtUserName" size="30" maxlength="30" tabindex="1"></td>
            </tr>
            <tr>
              <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">User Password</font></td>
              <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
              <td width="79%" height="1"><input type="password" name="TxtUserPwd" size="30" maxlength="30" tabindex="1"></td>
            </tr>
            <tr>
              <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">User Type</font></td>
              <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
              <td width="79%" height="1"><select name="TxtType"><option value="1">Admin</option><option value="2" selected>User</option></select></td>
            </tr> 
             <tr>
              <td height="25" align="center" colspan="3"><font face="verdana" size="2" color="#004080"><input class="butn" type="submit" name="btnsubmit" value="Add"></font></td>
             </tr>            
          </table>
          </center></div></td>
        </tr> 
        </form>       
      </table>
      </center></div>
    </form>
    </td>
  </tr>
</table>
</td></tr></table>
</center></div>
</body>
</html>
