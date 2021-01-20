<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="white">
<%if session("user_name")<>"" then%>
<tr>
  <td align="center" bgcolor="#4169E1"><font face=verdana size=2 color="#ffffff"><b><%=session("user_name")%>
   [<%if trim(session("user_type"))="4" or trim(session("user_type"))="0" then 
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

<% 
if trim(session("user_type"))="4" or trim(session("user_type"))="0" then%>
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
  <td colspan="2" valign="middle"><a href="frm_biz_View.asp" class="buthm">BizAcumen (To Release)</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr--> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_Biz_View.asp" class="buthm">Hyderabad (To Release)</a></td>  
</tr>
<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewGurgaon.asp" class="buthm">Gurgaon (To Release)</a></td>  
</tr-->
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_Biz_VieweNet.asp" class="buthm">eNet (To Release)</a></td>  
</tr>
<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
 <tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewPending.asp" class="buthm">Pending Requests</a></td>  
</tr>
<tr-->
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_biz_Final_View.asp" class="buthm">Viewed Requests</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_App_Search.asp" class="buthm">Search Requests</a></td>  
<!--td colspan="2" valign="middle"><a href="frm_sis_Search.asp" class="buthm">Search Requests</a></td-->
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_eNet_Search.asp" class="buthm">Search eNet Requests</a></td>  
</tr>

<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif"  border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_biz_Final_ViewDecline.asp" class="buthm">Declined Requests</a></td>  
</tr-->

<%end if%>
<%if trim(session("user_type"))="5" then%>
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
<!--tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr> 
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewATN.asp" class="buthm">Test Evaluation</a></td>  
</tr-->
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>
<tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="Frm_SIS_ViewATN_DONE.asp" class="buthm">Done</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"></td>
</tr>

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
 <tr>
  <td height="21" width="8"></td>
  <td valign="middle" width="17"><img src="../Images/bulleta.gif" border="0"></td>
  <td colspan="2" valign="middle"><a href="frm_SIS_Logout.asp" class="buthm">Logout</a></td>  
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#73AEBF"><%'=trim(session("user_type"))%></td>
</tr> 
</table>