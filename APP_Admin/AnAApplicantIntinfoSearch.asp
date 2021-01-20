<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--#include file="ASPIncludes/SiteFunctions.asp"-->
<!--#include file="PageContents.asp"-->
<%

If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
function fnchecked(val1,val2)
		if (strComp(val1,val2,0) = 0 ) then
			fnchecked= "checked"
		else
			fnchecked= ""
		end if
end function
'Response.write trim(lcase(request("butnvalue")))
'response.end
'''' update the status of the records that were selected for the check boxes
if trim(request("butnvalue"))<>"" then
		''' User Status = 1 -- pending
		''' User Status = 2 -- approved
		''' User Status = 3 -- Declined
		''' User Status = 5 -- Hold	
		
		dim Mystat, mystat1, insertval,userrank,userrank1,admstats
		userrank="0"
		userrank1="0"
	 admstats=1
	if trim(request("SelStatus")) <> "" then
	  admstats=trim(request("SelStatus"))
	else
	  admstats=1
	end if
	
		if trim(request("txtreason"))<>"" then
			mystat1 = trim(request("txtreason"))
		end if
	'Response.write trim(lcase(request("butnvalue")))
	'response.end
      	if trim(lcase(request("butnvalue")))="accept1" then
			Mystat = "Approve"
			'mystat1 = "Approved"
			mystat1=request("txtreason")
			userrank=0 'request("UserRank")
			insertval = 2
			sqlupdate="update TBL_SIS_Applications set User_Points="&trim(userrank)&" where Rec_ID="&trim(request("ID"))&""
		
			
	elseif trim(lcase(request("butnvalue")))="accept2" then
			Mystat = "Approve 2"
			mystat1 = "Approved"
			mystat1=request("txtreason")
			userrank1=request("UserRank1")
			sqlupdate="update TBL_SIS_Applications set User_Points_US="&trim(userrank1)&" where Rec_ID="&trim(request("ID"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="accept3" then
			mystat1=request("txtreason")
			sqlupdate="update TBL_SIS_Applications set admin_status =" & trim(request("SelStatus")) & "  where Rec_ID="&trim(request("ID"))&""
			insertval = 2
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
			'response.end
	elseif trim(lcase(request("butnvalue")))="high expectations" then
			mystat1="High Expectations " & request("txtreason")
			sqlupdate="update TBL_SIS_Applications set user_status =9  where Rec_ID="&trim(request("ID"))&""
			insertval = 9
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
			'response.end
	elseif trim(lcase(request("butnvalue")))="competitor" then
			mystat1="Competitor " & request("txtreason")
			sqlupdate="update TBL_SIS_Applications set user_status =10  where Rec_ID="&trim(request("ID"))&""
			insertval = 10
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
      	elseif trim(lcase(request("butnvalue")))="decline" then
			Mystat = "Decline"
			mystat1 = "Declined"
			userrank=0
			userrank1=0
			insertval = 3
			sqlupdate="update TBL_SIS_Applications set user_status =" & insertval & ",Reason_Update='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
	elseif trim(lcase(request("butnvalue")))="hold" then
			Mystat = "Hold"
			mystat1 = "Hold"
			insertval = 5
			userrank=0
			userrank1=0
			sqlupdate="update TBL_SIS_Applications set user_status =" & insertval & ",Reason_Update='" & mystat1 & "'  where Rec_ID="&trim(request("ID"))&""
			Response.write sqlupdate
			Response.end
      	end if
	
	
		dim recID
		recID = trim(request("ID"))
		''' call the stored procedure to insert data into the table
		
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		set cmdEdit=server.CreateObject("ADODB.Command")
		cmdEdit.ActiveConnection = con	
			with cmdEdit
				.CommandText = "SP_TBL_SIS_Applications"
				.CommandType = adcmdStoredProc	
				'Reason_Update=@MyReason_Update,
                'Date_Updated=@MyDate_Updated,
				'Updated_By=@MyUpdated_By,
				'User_Status=@MyUser_Status,
				'Admin_Status=@MyAdmin_Status
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
				.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,"Name")
				.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,"Address")
				.Parameters.Append .CreateParameter ("@MyUser_Age",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,20,"Phone")
				.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,50,"Email")
				.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,"PGEducation")
				.Parameters.Append .CreateParameter ("@MyYear_Passed",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,"stat")
				.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,"EmpStatus")
				.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,1000,"workExp")
				.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,"Spoken")
				.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,"Written")
				.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,"Windows")
				.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,"Keyboard")
				.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,"Word")
				.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,"Excel")
				.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,"Access")
				.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,500,"Skills")
				.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,50,trim(session("user_name")))
				.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,insertval)
				.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,mystat1)
				.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,admstats)
				.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,"post")
				.Parameters.Append .CreateParameter ("@MyPoints_Scored",advarchar,adparamInputOutput,4,userrank)
				.Parameters.Append .CreateParameter ("@MyPoints_Scored1",advarchar,adparamInputOutput,4,userrank1)
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
				'.Execute
			end with
	 'Response.write sqlupdate
	'Response.end
	'Response.write  trim(lcase(request("butnvalue"))) & request("UserRank") & "  7897897" & sqlupdate
	'	response.end
		'loadedval = cmdEdit.Parameters("@MyResult")
		
		set cmdEdit = nothing
		
		if sqlupdate<>"" then
			'response.write sqlupdate
			'response.end
			con.execute sqlupdate
		
		end if
		con.close()
		%>
		<script language="javascript">
			window.opener.location.href="Frm_SIS_ViewSearch.asp";
			//window.close();
		</script>
		<%
		dim x
		x = cint(Request("ID"))+1
		response.redirect ("AnAApplicantIntinfoSearch.asp?ID="&trim(Request("ID"))&"&SUB=1#callID1")
end if

%>
<html>
<head>
<title>View Applicant Details</title>
</head>
<script language="JavaScript">
function submitval(actval,recID)
{
	//alert ("hi");
	//var updateval;
	//updateval = confirm("Confirm, do you want this applicant status to "+actval);
	//if (updateval==true)
	//{
		window.frmsis.method="post";
		window.frmsis.action="AnAApplicantIntinfoSearch.asp?ID="+recID+"&butnvalue="+actval;
		window.frmsis.submit();
	//}	
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
Dim SQL1
SET rs=SERVER.CREATEOBJECT("ADODB.RECORDSET")
SET rs1=SERVER.CREATEOBJECT("ADODB.RECORDSET")

con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)
if trim(Request("ID"))<>"" then
	'SQL = "SELECT *,dbo.ReturnAppearedDetails(b.Rec_id) as appeared FROM TBL_SIS_Applications a ,Interview_Hyd_Details b  where a.Rec_id =b.Rec_id and testwriteupdate>='6/10/2007' and a.Rec_ID="&trim(Request("ID")) & ""
	'SQL = "SELECT *,dbo.ReturnAppearedDetails(b.Rec_id) as appeared FROM TBL_SIS_Applications a ,Interview_Hyd_Details b where a.Rec_id =b.Rec_id and a.Rec_ID="&trim(Request("ID")) & ""
	SQL = "SELECT *,dbo.ReturnAppearedHydDetails(a.Rec_id) as appeared FROM TBL_SIS_Applications a where  a.Rec_ID="&trim(Request("ID")) & ""
else
	'SQL = "SELECT *,dbo.ReturnAppearedDetails(Rec_id) as appeared FROM TBL_SIS_Applications where  user_name like ('%"&trim(Request("candname"))&"%')"
	SQL = "SELECT *,dbo.ReturnAppearedHydDetails(Rec_id) as appeared FROM TBL_SIS_Applications where  user_name like ('%"&trim(Request("candname"))&"%')"
end if
if trim(session("user_type"))="5" then
	if trim(Request("ID"))<>"" then
		SQL = "SELECT *,dbo.ReturnAppearedHydDetails(a.Rec_id) as appeared FROM TBL_SIS_Applications a where  a.Rec_ID="&trim(Request("ID")) &  " and (Reason_Update like ('RAG%') or Reason_Update like ('RSG%') or Reason_Update like ('N-20%') or Reason_Update like ('%raghu%'))"
	else
		SQL = "SELECT *,dbo.ReturnAppearedHydDetails(Rec_id) as appeared FROM TBL_SIS_Applications where  user_name like ('%"&trim(Request("candname"))&"%')  and (Reason_Update like ('RAG%') or Reason_Update like ('RSG%') or Reason_Update like ('N-20%') or Reason_Update like ('N-20%'))"
	end if

end if
if trim(session("user_type"))="7" then

	if trim(Request("ID"))<>"" then
		SQL = "SELECT *,dbo.ReturnAppearedHydDetails(a.Rec_id) as appeared FROM TBL_SIS_Applications a where  a.Rec_ID="&trim(Request("ID")) &  " and (Reason_Update like ('URL%') )"
	else
		SQL = "SELECT *,dbo.ReturnAppearedHydDetails(Rec_id) as appeared FROM TBL_SIS_Applications where  user_name like ('%"&trim(Request("candname"))&"%')  and (Reason_Update like ('URL%'))"
	end if
end if
rs.OPEN SQL,con

''response.write sql
If Not RS.EOF Then
Dim ID
ID=rs("Rec_ID")
DIM edu
edu= trim(rs("Education_UG"))
edu = "UG:" & edu & "<br> PG:" & trim(rs("Education_PG"))
dim UsrStat,adminstat
if trim(rs("User_Status"))="1" then
	UsrStat = "Pending"
elseif trim(rs("User_Status"))="2" then
	UsrStat = "Approved"
elseif trim(rs("User_Status"))="3" then
	UsrStat = "Declined"
elseif trim(rs("User_Status"))="5" then
	UsrStat = "Hold"
elseif trim(rs("User_Status"))="9" then
	UsrStat = "High Expectations"  
elseif trim(rs("User_Status"))="10" then
	UsrStat = "Competitor"  
end if
if trim(rs("Admin_Status"))="1" then
	adminstat = ""
elseif trim(rs("Admin_Status"))="2" then
	adminstat = "Joined & Working"
elseif trim(rs("Admin_Status"))="3" then
	adminstat = "Joined & Left"
elseif trim(rs("Admin_Status"))="4" then
	adminstat = "Selected & Not Joined"
elseif trim(rs("Admin_Status"))="5" then
	adminstat = "Attended & Not Selected"
elseif trim(rs("Admin_Status"))="6" then
	adminstat = "Called but not attended"
end if


%>
<div align="center"><center>

<table border="0" width="90%" cellspacing="0" cellpadding="0" bordercolor="#000080" class=mystyle>
  <tr>
    <td width="100%">

	<%''******* check to see if user has an user_status=3 or user_status=8 and update_by='superadmin' donot display the record in the search ********
	'IF (trim(rs("user_status"))="3" and trim(lcase(rs("updated_by")))="superadmin") or (trim(rs("user_status"))="3" or (trim(rs("user_status"))="8" and trim(lcase(rs("updated_by")))="admin") or (trim(rs("user_status"))="3" and trim(lcase(rs("updated_by")))="superadmin") then
	%>
	<!--br><p align="center"><font color='red' size=3 face='times new roman'><b>End of Candidates List.</b></font></p-->
	</td></tr></table>
	<%'response.end
	'end if%>

	<div align="center"><center><table border="1" width="100%" 
    cellspacing="0" cellpadding="5">
	
      <tr>
        <td width="100%" height="21" bgcolor="#000080"><p align="center"><big><font color="#FFFFFF"><strong><font class="mystyle">Applicant Information for the Post of Business Analyst</font></strong></font></big></td>
      </tr>
      <tr>
        <td width="100%" height="5"></td>
      </tr>
	  <tr>
        <td width="100%"><font face="verdana" size="1" color="#804040"><b>Note :</b> Below this screen there are Accept, Decline and Hold buttons to change the status of the applicant.</font></td>
      </tr>
	  <tr>
        <td width="100%" height="5" align="right"><a href="#callID1"><b>Go to Bottom</b></a></td>
      </tr>
	 <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><strong>ANA NO :&nbsp;<%=rs("ANA_No")%></strong></font></big></td>
          </tr>
	
	<tr>
            <td width="100%"><big><!--<font face="verdana" size="2" color="#804040"><strong>TEST TOPIC :&nbsp;<br>1. POLLUTION IN BIG CITIES.<br>2. BUSINESS ETHICS.<br>3.Write about the changing socio-economic landscape of India’s top-tier metropolis.<br>4.SOCIAL DIMENSIONS OF INFORMATION TECHNOLOGY-->

<%if (trim(rs("ANA_No"))="ana1181") or (trim(rs("ANA_No"))="ana1268") or (trim(rs("ANA_No"))="ana1269") or (trim(rs("ANA_No"))="ana1315") or (trim(rs("ANA_No"))="ana1422") or (trim(rs("ANA_No"))="ana1435") or (trim(rs("ANA_No"))="ana1752") then %>
<!--WRITE ABOUT THE EVOLUTION OF TECHNOLOGY AND HOW IT IMPACTS EVERYDAY LIFE.-->

<%else%>
<!--INDIA 2020 - A SOCIO-ECONOMIC PROGNOSIS.-->
<%end if%>
</strong></font></big></td>
          </tr>

	<%'if trim(session("user_type")) ="4" or trim(session("user_type")) ="2" or trim(session("user_type")) ="5" or trim(session("user_type")) ="7" then%>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center>
        <table border="0" width="95%" cellspacing="0" cellpadding="0">
		   <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><strong>Post Applied for :&nbsp; <%=rs("Post_Applied")%></strong></font></big></td>
          </tr>
		  <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><strong>Application ID :&nbsp; <%=rs("Rec_ID")%></strong></font></big></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Application Date :&nbsp; <%=rs("Date_Created")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Application Status :&nbsp; <%=UsrStat%></font></td>
          </tr>
          <%'if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="3" or trim(rs("User_Status"))="5") then%>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;by :&nbsp; <%=rs("Updated_BY")%></font></td>
          </tr>
           <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040">Date <%=UsrStat%> :&nbsp; <%=rs("Date_Updated")%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><%=UsrStat%>&nbsp;Reason:&nbsp; <%=rs("Reason_Update")%></font></td>
          </tr>
          <%'end if%>
</table>
        </center></div></td>
      </tr>
        
      <tr align="center">
        <td width="100%" height="21" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Contact Information</strong></font></big></td>
      </tr>
      <tr align="center">
        <td width="100%" height="21"><div align="center"><center><table border="0" width="95%" cellspacing="2" cellpadding="0"><tr><td width="80%">
        <table border="0" width="95%" cellspacing="2" cellpadding="0">
	  <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080" nowrap>Recruiting Location</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("Location")%></td>
          </tr>
          <tr>
            <td width="17%" height="1" align="left"><font face="verdana" size="2" color="#004080">Name & Surname</font></td>
            <td width="4%" align="center" height="1"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="1"><font face="verdana" size="2" color="#004080"><%=rs("user_Name")%>&nbsp;&nbsp;<%=rs("surName")%></td>
          </tr>
	  <tr>
            <td width="17%" height="25" align="left"><font face="verdana" size="2" color="#004080">Age</font></td>
            <td width="4%" align="center" height="25"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%" height="25"><font face="verdana" size="2" color="#008080"><%=rs("user_Age")%></td>
          </tr>
	<%'if session("user_name")="aneesa" or trim(session("user_type")) ="4" or trim(session("user_type")) ="5" or trim(session("user_type")) ="7" then %>
          <tr>
            <td width="17%" align="left"><font face="verdana" size="2" color="#004080">Address</font></td>
            <td width="4%" align="center"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="79%"><font face="verdana" size="2" color="#008080"><%=rs("user_Address")%></td>
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
	<%'end if%>
 </table></td><td width="20%"><img src="test_files/<%=rs("Rec_ID")%>.jpg"></td></table>
        </center></div></td>
      </tr>
	<%end if%>
       
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
	<%'if trim(session("user_type")) ="4" or trim(session("user_type")) ="5"  then%>
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
	</table>
        </center></div></td>
      </tr>
		<%'end if%>
          <!--tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Microsoft Powerpoint Skills</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%'=rs("Powerpoint_Skills")%></td>
          </tr-->
        
      <tr align="center">
        <td width="100%" height="10"></td>
      </tr>
      
      	<%'if trim(session("user_type")) ="4" or trim(session("user_type")) ="1" or trim(session("user_type")) ="5" then%>
	<tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
         Special Skills &amp; Qualifications (Writeup at the time of applying)</strong></font></big></td></a>
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
	<%'end if%>

<%SQL1 = "SELECT * FROM Interview_Hyd_Details where  Rec_ID="&trim(rs("Rec_ID")) & ""
'response.write sql1
rs1.OPEN SQL1,con
''response.write sql1
If Not RS1.EOF Then

%>
 	<tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
       Interview Details</strong></font></big></td></a>
      </tr>	
	<tr align="center">
        <td width="100%" height="1"><div align="center"><center>
        <table border="0" width="98%" bordercolor="#800000" cellspacing="0" cellpadding="3">
          <tr>
            <td width="36%" height="21" valign="top"><font face="verdana" size="2" color="#004080">Interviewer</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Interviewewer")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Personality</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Personality")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21" valign="top"><font face="verdana" size="2" color="#004080">Family background</font></td>
            <td width="5%" align="center" height="21" valign="top"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("AboutFamily")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Resident of</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Residentof")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Spoken English</font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("SpokenEnglish")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Dress Code </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("DressCode")%>
	    </td>
          </tr>
	   <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Experience Company </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Company")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Years </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Years")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21"><font face="verdana" size="2" color="#004080">Salary </font></td>
            <td width="5%" align="center" height="21"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Salary")%>
	    </td>
          </tr>
	  <tr>
            <td width="36%" height="21" valign="top"><font face="verdana" size="2" color="#004080">Other Info</font></td>
            <td width="5%" align="center" height="21" valign="top"><font face="verdana" size="2" color="#004080"><strong>:</strong></font></td>
            <td width="59%" height="21"><font face="verdana" size="2" color="#008080"><%=rs1("Otherinfo")%>
	    </td>
          </tr>
        </table>
        </center></div></td>
      </tr>
  <%end if

%>
      <tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Online Written Test Write-up</strong></font></big></td></a>
      </tr>
     <tr>
            <td width="100%"><big><font face="verdana" size="2" color="#804040"><!--strong>TEST TOPIC :&nbsp;</strong-->

<%if (trim(rs("ANA_No"))="ana1181") or (trim(rs("ANA_No"))="ana1268") or (trim(rs("ANA_No"))="ana1269") or (trim(rs("ANA_No"))="ana1315") or (trim(rs("ANA_No"))="ana1422") or (trim(rs("ANA_No"))="ana1435") or (trim(rs("ANA_No"))="ana1752") then %>
<!--WRITE ABOUT THE EVOLUTION OF TECHNOLOGY AND HOW IT IMPACTS EVERYDAY LIFE.-->

<%else%>
<!--INDIA 2020 - A SOCIO-ECONOMIC PROGNOSIS.-->
<%end if

%>
</font></big></td>
          </tr>
	<tr align="center">
        <td width="100%" height="1"><div align="center"><center>
        <table border="1" width="98%" bordercolor="#800000" cellspacing="0" cellpadding="3">
          <tr>
            <!--td width="100%"><font face="verdana" size="2" color="#008080"><%'=rs("TestWriteup")%></td-->
	    <td width="100%"><font face="verdana" size="2" color="#008080"><%'=ReturnPageContent(trim(rs("ANA_No")),1)%></td>
          </tr>
        </table>
        </center></div></td>
      </tr>
	<tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Special Skills/Online Application Write-up</strong></font></big></td></a>
      </tr>

	<!--tr align="center">
        <td width="100%" height="1"><div align="center"><center>
        <table border="1" width="98%" bordercolor="#800000" cellspacing="0" cellpadding="3">
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#008080"><%'=rs("TestWriteup")%></td>
          </tr>
        </table>
        </center></div></td>
      </tr-->

	 <tr align="center">
        <td width="100%" height="0" border=""><form method="post" action="AnAApplicantIntinfoSearch.asp" name="frmsis">
<tr align="center">
        <td width="100%" height="1">
		<table width="98%" cellspacing="0" cellpadding="3">

       <tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Written Test & Selection Status:</strong></font></big></td></a>
      </tr>
	<%

If Not RS1.EOF Then%>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Appeared/Not Appeared :</font><font face="verdana" size="2" color="#008080"><%if trim(rs1("Profile")) <>"" then Response.write("Appeared") else Response.write(" Not Appeared ") end if%></font></td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Resume & Photograph :</font><font face="verdana" size="2" color="#008080"><%if trim(rs1("Profile")) <>"" then Response.write(trim(rs1("Profile"))) else Response.write(" ") end if%></font></td>
          </tr>
	<%end if

%>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Give Reason if any :</font> <textarea id="txtreason" name="txtreason"><%=rs("Reason_Update")%></textarea></td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">Key Board Skills :</font> <select name="KeyBoardRank" disabled>
		
		<option value="1" <%=selected(trim(rs("TestKeyBord_Skills")),"1")%> >1</option>
		<option value="2" <%=selected(rs("TestKeyBord_Skills"),"2")%>>2</option>
		<option value="3" <%=selected(rs("TestKeyBord_Skills"),"3")%>>3</option>
		<option value="4" <%=selected(rs("TestKeyBord_Skills"),"4")%>>4</option>
		<option value="5" <%=selected(rs("TestKeyBord_Skills"),"5")%>>5</option>
		<option value="6" <%=selected(rs("TestKeyBord_Skills"),"6")%>>6</option>
		<option value="6.5" <%=selected(rs("TestKeyBord_Skills"),"6.5")%>>6.5</option>
		<option value="7" <%=selected((rs("TestKeyBord_Skills")),"7")%>>7</option>
		<option value="7.5" <%=selected((rs("TestKeyBord_Skills")),"7.5")%>>7.5</option>
		<option value="8" <%=selected(rs("TestKeyBord_Skills"),"8")%>>8</option>
		<option value="8.5" <%=selected(rs("TestKeyBord_Skills"),"8.5")%>>8.5</option>
		<option value="9" <%=selected(rs("TestKeyBord_Skills"),"9")%>>9</option>
		<option value="10" <%=selected(rs("TestKeyBord_Skills"),"10")%>>10</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#004080">IGMs Rank1 :</font>
<% 'Response.write isnull(trim(rs("User_Points"))) 
if (isnull(trim(rs("User_Points")))=true and trim(rs("User_Status"))="2") then%> <select name="UserRank">
		<option value="1" <%=selected(trim(rs("User_Points")),"1")%>>1</option>
		<option value="1.5" <%=selected(rs("User_Points"),"1.5")%>>1.5</option>
		<option value="2" <%=selected(rs("User_Points"),"2")%>>2</option>
		<option value="2.5" <%=selected(rs("User_Points"),"2.5")%>>2.5</option>
		<option value="3" <%=selected(rs("User_Points"),"3")%>>3</option>
		<option value="3.5" <%=selected(rs("User_Points"),"3.5")%>>3.5</option>
		<option value="4" <%=selected(trim(rs("User_Points")),"4")%>>4</option>
		<option value="4.5" <%=selected(rs("User_Points"),"4.5")%>>4.5</option>
		<option value="5" <%=selected(rs("User_Points"),"5")%>>5</option>
		<option value="5.5" <%=selected(rs("User_Points"),"5.5")%>>5.5</option>
		<option value="6" <%=selected(rs("User_Points"),"6")%>>6</option>
		<option value="6.5" <%=selected(rs("User_Points"),"6.5")%>>6.5</option>
		<option value="7" <%=selected(trim(rs("User_Points")),"7")%>>7</option>
		<option value="7.5" <%=selected(rs("User_Points"),"7.5")%>>7.5</option>
		<option value="8" <%=selected(rs("User_Points"),"8")%>>8</option>
		<option value="8.5" <%=selected(rs("User_Points"),"8.5")%>>8.5</option>
		<option value="9" <%=selected(rs("User_Points"),"9")%>>9</option>
		<option value="9.5" <%=selected(rs("User_Points"),"9.5")%>>9.5</option>
		<option value="10" <%=selected(rs("User_Points"),"10")%>>10</option>
		</select>
<%else
Response.write trim(rs("User_Points"))
end if%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%if trim(session("user_type")) ="4" then%>
		<font face="verdana" size="2" color="#004080">RR Rank2 :</font> <select name="UserRank1">
		<option value="1" <%=selected(trim(rs("User_Points_US")),"1")%>>1</option>
		<option value="1.5" <%=selected(rs("User_Points_US"),"1.5")%>>1.5</option>
		<option value="2" <%=selected(rs("User_Points_US"),"2")%>>2</option>
		<option value="2.5" <%=selected(rs("User_Points_US"),"2.5")%>>2.5</option>
		<option value="3" <%=selected(rs("User_Points_US"),"3")%>>3</option>
		<option value="3.5" <%=selected(rs("User_Points_US"),"3.5")%>>3.5</option>
		<option value="4" <%=selected(trim(rs("User_Points_US")),"4")%>>4</option>
		<option value="4.5" <%=selected(rs("User_Points_US"),"4.5")%>>4.5</option>
		<option value="5" <%=selected(rs("User_Points_US"),"5")%>>5</option>
		<option value="5.5" <%=selected(rs("User_Points_US"),"5.5")%>>5.5</option>
		<option value="6" <%=selected(rs("User_Points_US"),"6")%>>6</option>
		<option value="6.5" <%=selected(rs("User_Points_US"),"6.5")%>>6.5</option>
		<option value="7" <%=selected(rs("User_Points_US"),"7")%>>7</option>
		<option value="7.5" <%=selected(rs("User_Points_US"),"7.5")%>>7.5</option>
		<option value="8" <%=selected(rs("User_Points_US"),"8")%>>8</option>
		<option value="8.5" <%=selected(rs("User_Points_US"),"8.5")%>>8.5</option>
		<option value="9" <%=selected(rs("User_Points_US"),"9")%>>9</option>
		<option value="9.5" <%=selected(rs("User_Points_US"),"9.5")%>>9.5</option>
		<option value="10" <%=selected(rs("User_Points_US"),"10")%>>10</option>
		</select>
	<%end if%>
</td>
          </tr>
	<input type="hidden" name="txtemail" value="<%=trim(rs("User_Email"))%>">
	<input type="hidden" name="txtName" value="<%=trim(rs("user_Name"))%>">
	
        </table>
		</td>
      </tr>
<%if (trim(rs("User_Status"))="2" or trim(rs("User_Status"))="3" or trim(rs("User_Status"))="4" or trim(rs("User_Status"))="6" or trim(rs("User_Status"))="5" or trim(rs("User_Status"))="8") then%>
	<!--tr align="center">
        <td width="100%" height="1">
		<table width="98%" cellspacing="0" cellpadding="3">	  
		<tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b>Status</b> :&nbsp; <%=UsrStat1%></font></td>
          </tr>
          <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b><%=UsrStat%>&nbsp;by</b> :&nbsp; <%=rs("Updated_BY")%></font></td>
          </tr>
           <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b>Date <%=UsrStat%></b> :&nbsp; <%=rs("Date_Updated")%></font></td>
          </tr-->
	<%if trim(session("user_type")) ="4" then%>
          <!--tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b><%=UsrStat%>&nbsp;Reason</b>:&nbsp; <%=rs("Reason_Update")%></font></td>
          </tr>
	  <tr>
            <td width="100%"><font face="verdana" size="2" color="#804040"><b>IGMs Rank</b>:&nbsp; <%=rs("User_Points")%>&nbsp;&nbsp;<b>RR Rank</b>:&nbsp; <%=rs("User_Points_US")%></font></td>
          </tr-->
	<%end if%>
	
      <%end if%>
	
<tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Candidate Status:</strong></font></big> <input type="button" name="butnvalue" value="Admin Status" onclick="javascript:submitval('Accept3','<%=rs("Rec_ID")%>')"></td></a>
      </tr>
    <tr><td>

              <font face="verdana" size="2" color="#004080">
		&nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio"  value="6" <%=fnchecked(trim(rs("Admin_Status")),"6")%> >Called but not attended &nbsp;&nbsp;<br>
	        &nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="5" <%=fnchecked(trim(rs("Admin_Status")),"5")%>>Attended & Not Selected &nbsp;&nbsp;<br>
		&nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="4" <%=fnchecked(trim(rs("Admin_Status")),"4")%>>Selected & Not Joined  &nbsp;&nbsp;<br>
                &nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="3" <%=fnchecked(trim(rs("Admin_Status")),"3")%>>Joined & Left  &nbsp;&nbsp;<br>
		&nbsp;&nbsp;<INPUT name="SelStatus" id="SelStatus" type="radio" value="2" <%=fnchecked(trim(rs("Admin_Status")),"2")%>>Joined & Working &nbsp;&nbsp;<br>
            </font>
                  

    </td></tr>
<tr align="center">
        <a name="callID1"><td width="100%" height="1" bgcolor="#D3E1DF"><p align="left"><big><font face="verdana" size="2" color="#804040"><strong>&nbsp;&nbsp;
        Selection Decision: </strong></font></big></td></a>
      </tr>	<!--tr><td>

              <font face="verdana" size="2" color="#004080">
		&nbsp;&nbsp;<INPUT name="SelDeci" id="SelDeci" type="radio" value=1 >Hire &nbsp;&nbsp;<br>
	        &nbsp;&nbsp;<INPUT name="SelDeci" id="SelDeci" type="radio" value=2 >Do Not Hire &nbsp;&nbsp;<br>
		&nbsp;&nbsp;<INPUT name="SelDeci" id="SelDeci" type="radio" value=3 >Hold &nbsp;&nbsp;<br>
		
            </font>
                  

    </td></tr-->
		<% 
		Response.Write ("<tr bgcolor='white' align=""center"">")
			
		if trim(session("user_type")) = "4"  then
			'if (isnull(trim(rs("User_Points")))=true and trim(rs("User_Status"))="2") then
			Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""RR Accept"" onclick=""javascript:submitval('Accept2','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""High Expectations"" onclick=""javascript:submitval('High Expectations','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Competitor"" onclick=""javascript:submitval('Competitor','"&rs("Rec_ID")&"');""></td>")	
			'end if
		elseif  trim(session("user_type")) = "5" then
			Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');""></td>")	
		else
			'Response.write (trim(session("user_type")) & "   jkljjkljljljljljlj")
			if (isnull(trim(rs("User_Points")))=true) and trim(rs("User_Status"))="2" or trim(rs("User_Status"))="5" then

			Response.Write ("<td colspan=7 align=left><input type=""button"" name=""butnvalue"" value=""Accept"" onclick=""javascript:submitval('Accept1','"&rs("Rec_ID")&"')"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Reject"" onclick=""javascript:submitval('Decline','"&rs("Rec_ID")&"');"">&nbsp;&nbsp;&nbsp;<input type=""button"" name=""butnvalue"" value=""Hold"" onclick=""javascript:submitval('Hold','"&rs("Rec_ID")&"');""></td>")	
			end if
		

		end if					
		Response.Write ("</tr>")
			dim MYValID,MYValID1
			MYValID = cint(Request("ID"))+1
			MYValID1 = cint(Request("ID"))-1
			%>         
        </form>
        
    <%if trim(session("user_type")) ="4" or trim(session("user_type")) ="5" then%>
      
	  <tr>
        <td width="100%"><big><font face="verdana" size="2" color="blue"><strong>Application :&nbsp; <%=rs("Rec_ID")%> : <%=rs("user_Name")%> : <%=edu%></strong></font></big></td>
      </tr>
	
      <!--tr align="center">
        <td width="100%" height="0" align="right">
		<table width="100%"><tr>
		<td align="left">
		<%'if MYValID1 > 474 then%>
		<a href="anaApplicantInfo.asp?ID=<%'=trim(MYValID1)%>#callID1"><b> &laquo; Previous  </b></a></td>
		<%'end if%>
		<td align="right"><a href="anaApplicantInfo.asp?ID=<%'=trim(MYValID)%>#callID1"><b> Next &raquo; </b></a></td>
		</tr></table>
		</td>
      </tr-->
	<%END IF%>
	
<tr><td align="center"><b><A class=bodylink href="javascript:window.close()"><b>Close Window</b></A></b></td></tr>
    </table>
</table>
	</td></tr>
    </center></div></td>
  </tr>
</table>
</center></div>
<%SET rs=nothing
Set rs1=nothing
con.close()
'Else %>
	<!--br><p align="center"><font color='red'><b>End of Candidates List</b></font></p-->
	<br><p align="left">
		<%
		dim MYVID,MYVID1
		MYVID = cdbl(Request("ID"))-1
		MYVID1 = cdbl(Request("ID"))+1
		if MYVID1 > 474 then%>
			<!--a href="anaApplicantInfo.asp?ID=<%'=trim(MYVID1)%>#callID1"><b> Next &raquo;</b></a-->
		<%elseif MYVID > 474 then %>
        	<!--a href="anaApplicantInfo.asp?ID=<%'=trim(MYVID)%>#callID1"><b> &laquo; Previous </b></a-->
		<%end if%>
      </p>
<%' End If%>
</body>
</html>
