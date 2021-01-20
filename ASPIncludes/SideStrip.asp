<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="white">
<%if session("user_name")<>"" then%>
<tr>
  <td align="center" bgcolor="#005563"><font face=verdana size=2 color="#ffffff"><b><%=session("user_name")%>
   [<%if trim(session("user_type"))="1" then Response.Write ("Administrator") else Response.Write ("User") end if%>]
  </b></font></td>
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<%end if%>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="white">


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
<%if trim(session("editor"))="yes" then%>
<tr>
  <td height="20" colspan="4" bgcolor="#73AEBF"><font size=1 color=white face=verdana>&nbsp;<b>Editors &raquo;</b></font></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View.asp" class="buthm">Editors Requests</a></td>  
</tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View.asp" class="buthm">Editors Viewed</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<%elseif trim(session("qcteam"))="yes" then%>
<tr>
  <td height="20" colspan="4" bgcolor="#73AEBF"><font size=1 color=white face=verdana>&nbsp;<b>QCTeams &raquo;</b></font></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View.asp" class="buthm">QCTeams Requests</a></td>  
</tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View.asp" class="buthm">QCTeams Viewed</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<%elseif trim(session("dtp"))="yes" then%>
<tr>
  <td height="20" colspan="4" bgcolor="#73AEBF"><font size=1 color=white face=verdana>&nbsp;<b>DTP &raquo;</b></font></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View.asp" class="buthm">DTP Requests</a></td>  
</tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View.asp" class="buthm">DTP Viewed</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<%elseif trim(session("content"))="yes" then%>
<tr>
  <td height="20" colspan="4" bgcolor="#73AEBF"><font size=1 color=white face=verdana>&nbsp;<b>Content &raquo;</b></font></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View.asp" class="buthm">Content Requests</a></td>  
</tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View.asp" class="buthm">Content Viewed</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<%elseif trim(session("freelancer"))="yes" then%>
<tr>
  <td height="20" colspan="4" bgcolor="#73AEBF"><font size=1 color=white face=verdana>&nbsp;<b>FreeLancers &raquo;</b></font></td>
</tr> 
 <tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_View_FreeLancers.asp" class="buthm">Pending Requests</a></td>  
</tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_View_FreeLancers.asp" class="buthm">FreeLancer Viewed</a></td>  
</tr>
</tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_checked_FreeLancers.asp" class="buthm">Total Checked</a></td>  
</tr>

<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_Print_FreeLancers.asp" class="buthm">Print Final</a></td>  
</tr-->
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <!--td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td-->  
  <td colspan="2" valign="middle"><a href="frm_App_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<%if trim(session("user_type"))<>"1" then%>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_Final_Send_ECs.asp" class="buthm">Add to Assignment</a></td>  
</tr>
<%End if%>
<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_Final_AddRank.asp" class="buthm">Add Rank - I</a></td>  
</tr-->
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_Final_Rank.asp" class="buthm">Add Rank - II</a></td>  
</tr>

<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_ViewAllNu.asp" class="buthm">Pending Naukri Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_Final_ViewNu.asp" class="buthm">Viewed Naukri Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<%else%>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_sis_inner.asp" class="buthm">Help</a></td>
  <td width="1" rowspan="22" bgcolor="#217789"></td> 
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"><font size=1 color=white face=verdana></font></td>

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
  <td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td>  
</tr>
<!--tr>
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
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<%end if%>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
 <tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_SIS_Logout.asp" class="buthm">Logout</a><br><%'=trim(session("user_type"))%></td>  
</tr>
 
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
</table>