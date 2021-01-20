<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="white">
<%if session("user_name")<>"" then%>
<tr>
  <td align="center" bgcolor="#005563"><font face=verdana size=2 color="#ffffff"><b><%=session("user_name")%>
   [<%if trim(session("user_type"))="4" then 
	Response.Write ("Administrator") 
    elseif trim(session("user_type"))="2" then 
	Response.Write ("IGMs")
   else Response.Write ("User") 
   end if%>]
  </b></font></td>
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<%end if%>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="white">

<%if trim(session("user_type"))="4"  then%>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_inner.asp" class="buthm">Help</a></td>
  <td width="1" rowspan="15" bgcolor="#217789"></td>
</tr>

<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 

 <tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View.asp" class="buthm">Pending Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View.asp" class="buthm">Viewed Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_Final_ViewDecline.asp" class="buthm">Declined Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>

<%end if%>
<%'' for Padmaja and Maha logins only

if trim(session("user_type"))="5" or trim(session("user_type"))="7" then%>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_inner.asp" class="buthm">Help</a></td>
  <td width="1" rowspan="15" bgcolor="#217789"></td>
</tr>

<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 

 <!--tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View.asp" class="buthm">Pending Requests</a></td>  
</tr-->
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View.asp" class="buthm">Viewed Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<%end if%>

<%if trim(session("user_type")) <>"2" then%>

<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="RegistrationSlots.asp" class="buthm">Add Registrations</a></td>  
</tr>

<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewSelSlotsInt.asp" class="buthm">Add Interviews</a></td>  
</tr-->

<%end if%>

<%if trim(session("user_type"))="6" then%>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_Final_Decline.asp" class="buthm">Declined</a></td>
  <td width="1" rowspan="15" bgcolor="#217789"></td>
</tr>

<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_Final_GurDecline.asp" class="buthm">Gurgaon Declined</a></td>
  <td width="1" rowspan="15" bgcolor="#217789"></td>
</tr>
 <tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<%end if%>
<%if trim(session("user_type"))="1" then%>

<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_User.asp" class="buthm">Add User</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr-->
<%end if%> 
<%if trim(session("user_type"))="4" or trim(session("user_type"))="1" then%>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_View_1.asp" class="buthm">Interview Send Mails</a></td>  
</tr>

<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewSelectedSlots.asp" class="buthm">View Selected Slots</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<!--tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_View_1Nu.asp" class="buthm">Interview Naukri Send Mails</a></td>  
</tr>

<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewSelectedSlotsNu.asp" class="buthm">View Naukri Selected Slots</a></td>  
</tr-->

<%end if%>
<%if session("user_name")="raghu" then%>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="RegistrationSlots.asp" class="buthm">Add Registrations</a></td>  
</tr>


<%else%>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewATN.asp" class="buthm">Test Evaluation</a></td>  
</tr>
<!--tr>
  <td 
height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewATNNu.asp" class="buthm">Naukri Test Evaluation</a></td>  
</tr-->
<tr>
  <td 
height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewSelSlotsInt.asp" class="buthm">Add Interviews</a></td>  
</tr>
<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr bgcolor="#ffff4b">
  <td height="21" width="8" bgcolor="#ffff4b"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewSelSlotsIntNu.asp" class="buthm">Add Naukri Interviews</a></td>  
</tr-->
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<%end if%>




 <tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_SIS_Logout.asp" class="buthm">Logout</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"><%'=trim(session("user_type"))%></td>
</tr> 
</table>