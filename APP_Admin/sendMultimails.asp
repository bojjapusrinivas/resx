<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>External Contractor Interface : SIS Infotech Private Limited</title>
<LINK href="../aspincludes/gsbr.css" type="text/css" rel="stylesheet">
<SCRIPT  src="../ASPIncludes/validations_new.js"></SCRIPT>
<script language="javascript">
	var frmname="form1";
	//var valstr=new Array(["txtemailid","checknumalphaspacehyand","50"],["password","checkalphaspace","20"]);
	//var onform=new Array(["txtemailid","User ID"]);
	//var optfields=new Array("address2");
</script>
<%
Dim varhBody
varhbody="Dear Applicant," & ctrlf & "Please find below the user ID and password:<br><br>User ID: <b>" & Trim(request("txtuserid")) & "</b><br>Password: <b>" & Trim(request("txtpassword")) & "</b><br><br>Thank You,<br>Coordinator."
IF TRIM(request("btnsubmit"))="Send Password" Then
  If Trim(request("txtemailid"))<>"" and trim(request("txtbody")) <>  "" then
    Dim mymail
	
  ' varhbody="Dear Coordinater,<br><br>Login Details to view<br><br>URL:  http://202.65.148.18/assignments</b><br>User ID : <b>" & Trim(request("txtuserid")) & "</b><br>Password : <b>" & Trim(request("txtpassword")) & "</b><br>(Please note down URL, User ID and Password) <br>In case if you have any problems with your interface, you can send your queries through this e-mail ID enet.svcs@sisinfotech.com. Please note that this ID is to be used ONLY if there is a problem with the interface and not for other purposes.<br><br>" 

 '  varhbody=varhbody&"We wish you luck and look forward to your participation as an active member of the external network.<br><br>Thank you.<br><br>Regards,<br>SIS Recruitment Committee."
	
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  			
		Set rsDisp =Server.CreateObject("ADODB.Recordset")
		rsDisp.ActiveConnection = con
		rsDisp.CursorType = 3
		rsDisp.Open "Select * from emaildetails where id > 4671"
		IF not rsDisp.EOF THEN
		   while not rsDisp.EOF
		Set mymail = Server.CreateObject("CDO.Message")
		with mymail			
			
          		.From = """Global Industry Analysts, Inc.""<splpromo@strategyr.com>"
			.TO = Trim(rsDisp("email"))
			.Subject = "Seasons Greetings from GIA"
			.HTMLBody = "Dear " & rsDisp("Name") &"<br><br>" & request("txtbody") & ""
			.Send 
		End with
		set mymail = nothing 
		  Response.Write("<font color='green'>Mail sent to " & rsDisp("Name") & " successfully.</font><br>")
		   rsDisp.MoveNext
	           wend
	 	end if
		
		
    Else
      Response.Write("UserId,Password,emailid can not be left blank.")
    End if
End if
%>
</head>
<body>
<table width="100%" height="96%" border="0" cellpadding="0" cellspacing="0">  
  <!--include file="ASPIncludes/TopStrip.htm"-->	
  <tr>
    <td valign="top" align="center" >
	<br><br>		
	<!--Code Start-->	
	<!--form design code end here-->
	<form name="form1" method="post" >
	<table border="0" align="center">
				<tr><td height="1"><font style="COLOR: red; FONT-FAMILY: Verdana, Arial, Helvetica; FONT-SIZE: 8pt; FONT-WEIGHT: bold; text-decoration:none">
				<%IF TRIM(request("login"))="fail" then%>
					Check User ID or Password is incorrect.
				<%elseIF TRIM(request("login"))="sesout" then%>
					Your Session has expired, please login again.
				<%elseIF TRIM(request("login"))="block" then%>
					This login has been blocked. Please contact External Coordinator by email for further details.	
				<%elseIF TRIM(request("login"))="nodata" then%>
					This password has been de-activated. Please contact External Coordinator by email for further details.			
				<%end if%>
				</font></td></tr>
	</table><br>
	<table width="60%"  border="0" cellspacing="1" cellpadding="0" bgcolor="#002E57">
            <tr>
              <td bgcolor="#FFFFFF">
			  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="25px" bgcolor="#002E57" style="padding-left:10px " align="left"><font color="white">:: Send Bulk Mails &raquo;</font></td>
                </tr>
                <tr>
                  <td style="padding-top:20px ">
				  <table width="100%"  border="0" cellspacing="0" cellpadding="0">				  
                    <!--tr>
                      <td width="20%" align="right" style="padding-right:5px " height="21px">User ID</td>
                      <td width="4%">:</td>
                      <td width="76%"><input type="text" name="txtuserid" maxlength="50" value="<%=session("EID")%>"></td>
                    </tr>
		            <tr>
                      <td width="20%" align="right" style="padding-right:5px " height="21px">Password</td>
                      <td width="4%">:</td>
                      <td width="76%"><input type="text" name="txtpassword" maxlength="50"></td>
                    </tr-->
					 <tr>
                      <td width="20%" align="right" style="padding-right:5px " height="21px">Email</td>
                      <td width="4%">:</td>
                      <td width="76%"><input type="text" name="txtemailid" maxlength="60"></td>
                    </tr>   
                   
		   <tr>
                      <td width="20%" align="right" style="padding-right:5px " height="21px" valign="top">Body</td>
                      <td width="4%" valign="top">:</td>
                      <td width="76%"><Textarea name="txtbody" rows="10" cols="60"><%=varhbody%></textarea></td>
                    </tr>   
                    <tr>
                      <td  height="40px" colspan="3">
					  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="34%">&nbsp;</td>
                          <td width="90%"><input type="submit" name="btnsubmit" value="Send Password" class="submitbut" onclick="return validatefrm();"></td>
                        </tr>
                   	  </table></td>
                   </tr>
                  </table>		
				  </td>
                </tr>
              </table></td>
            </tr>
	   
          </table>
	<!--TR><TD valign="top" align="center"><img src="images/sankranti_logo_final.gif" border=0></TD></TR--> 	
	</form>
	<!--Code End-->
	</td>
  </tr>
	
  <!--include file="ASPIncludes/BottomStrip.htm"-->
</table>
</body>
</html>
