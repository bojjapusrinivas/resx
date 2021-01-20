<html>
<head>
<!--#include file="ASPIncludes/SendEmail.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>External Contractor Interface : SIS Infotech Private Limited</title>

<script language="javascript">
	var frmname="form1";
	'var valstr=new Array(["txtemailid","checknumalphaspacehyand","50"],["password","checkalphaspace","20"]);
	'var onform=new Array(["txtemailid","User ID"]);
	var optfields=new Array("address2");
</script>
<%
Dim varhBody
varhbody="Dated :" & Day(now()) & "/" & Month(now()) & "/" & Year(now()) &  "<Br><br>Dear " & Trim(request("aname")) & ",<br><br>Thank you for your interest in our company. We regret to inform you that our Recruitment and Selection Department has not approved your candidature. We wish you good luck in all your future professional endeavors.<br><br>"

varhbody=varhbody & "Regards,<br>BizAcumen Recruitment Committee<br>"
IF TRIM(request("btnsubmit"))="Send Mail" Then
  If Trim(request("txtemailid"))<>"" and trim(request("txtbody")) <>  "" then
    Dim mymail
			
  

		
			 //Response.write(trim(request("txtbody")))
			 //Response.end
		Set mymail = Server.CreateObject("CDO.Message")
	call SendGodaddyMail("hyderabad@BizAcumen.com",trim(request("txtemailid")),"BizAcumen Application Status",trim(request("txtbody")))
		
		Response.Write("<p align='center'><font color='green'>Mail sent successfully.</font></p>")
		
    Else
      Response.Write("emailid can not be left blank.")
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
                  <td height="25px" bgcolor="#002E57" style="padding-left:10px " align="left"><span class="style1">:: Forget Password &raquo;</span></td>
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
                      <td width="76%"><input type="text" size="40" name="txtemailid" maxlength="100" width=150px; value=<%Response.write(Trim(request("mid")))%>></td>
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
                          <td width="90%"><a href="javascript:if(confirm('Close window?'))window.close()">Close</a>&nbsp;&nbsp;<input type="submit" name="btnsubmit" value="Send Mail" class="submitbut" onclick="return validatefrm();"></td>
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
