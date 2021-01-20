
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<%
	'if trim(Request.ServerVariables("http_referer"))="" then
	'	Response.Redirect "default.htm"
	'end if
%>
<html>
<head>
<title>Welcome to BizAcumen :: Work from Home Online Appication </title>
<%
if trim(request("BtnSubmit"))="Submit" then	
	''' add the record to database table tbl_sis_analysts
	''' add code to access the Stored Procedure 	
	if cint(len(trim(request("Skills"))))>7000 then%>
		<table border="1" width="90%" bgcolor="white"  align="center" cellspacing="0" cellpadding="0" bordercolor="#73AEBF">
		<tr>
          <td width="100%" height="21"  bgcolor="#73AEBF" align="left"><div align="left"><center><p><font
          color="#FFFFFF"><strong>Error giving Data</strong></font></td>
        </tr>
		<tr>
		<td width="100%" align="center"><font face=verdana size='2' color='red'>Check the data given cannot be more than 7000 charaters or 200 words</font></td></tr>
		<tr><td width="100%"  align="center"><input type="button" onclick="javascript:history.back();" name="btnback" value="Back"></td></tr>
		</table>
		<%Response.End 
	end if	
	dim workExp, UGEducation, PostApplied , PGEducation
	workExp = ""	
	UGEducation = ""
	PGEducation = ""
	for i = 1 to 3
		if trim(request("Company"&i&""))<>"" then
			workExp = workExp & "Year :"& trim(Request("Year"&i&"")) & " Company : "& trim(Request("Company"&i&"")) & " Location : "& trim(Request("Location"&i&"")) & "<br>"
		end if
	next
		
	if trim(PostApplied)="" then
		'''PostApplied = "as applicable"
		PostApplied = "FreeLancer"
	end if
	'''' Under Graduation Degree
	if trim(request("BCom"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " & trim(request("BCom"))
		else
			UGEducation = trim(request("BCom"))
		end if
	end if
	if trim(request("BCA"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " & trim(request("BCA"))
		else
			UGEducation = trim(request("BCA"))
		end if
	end if
	if trim(request("BSC"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " &  trim(request("BSC"))
		else
			UGEducation = trim(request("BSC"))
		end if
	end if
	if trim(request("BTech"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " &  trim(request("BTech"))
		else
			UGEducation = trim(request("BTech"))
		end if
	end if	
	if trim(request("BA"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " &  trim(request("BA"))
		else
			UGEducation = trim(request("BA"))
		end if
	end if
	if trim(request("Degree"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & " :: Others :: " & trim(request("UGDegree"))
		else
			UGEducation = "Others :: " & trim(request("UGDegree"))
		end if
	end if
	''' Post Graduation Degree
	if trim(request("MBA"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " & trim(request("MBA"))
		else
			PGEducation = trim(request("MBA"))
		end if
	end if
	if trim(request("PGDBA"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("PGDBA"))
		else
			PGEducation = trim(request("PGDBA"))
		end if
	end if
	if trim(request("PGDBM"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("PGDBM"))
		else
			PGEducation = trim(request("PGDBM"))
		end if
	end if
	if trim(request("MA"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("MA"))
		else
			PGEducation = trim(request("MA"))
		end if
	end if
	if trim(request("MCA"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("MCA"))
		else
			PGEducation = trim(request("MCA"))
		end if
	end if
	if trim(request("MCOM"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("MCOM"))
		else
			PGEducation = trim(request("MCOM"))
		end if
	end if
	if trim(request("Degree"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & " :: Others :: " & trim(request("Degree"))
		else
			PGEducation = "Others :: " & trim(request("Degree"))
		end if
	end if
	
	''' check to see if data is empty
	if trim(workExp)="" then
		workExp = "No Experience"
	end if
	if trim(UGEducation)="" then
		UGEducation = "No UG Degree Specified"
	end if
	if trim(PGEducation)="" then
		PGEducation = "No PG Degree Specified"
	end if
	''' check
	if trim(request("YearPassed"))="" then
		YearPassed = 0
	else
		YearPassed = trim(request("YearPassed"))
	end if
	''' age
	if trim(request("Age"))="" then
		usrAge = 0
	else
		usrAge = trim(request("Age"))
	end if
	'''name="Advertisement" name="othersadvt"
	dim myADVT
	myADVT = trim(request("Advertisement"))	
	if trim(myADVT)<>"" then
		if trim(request("othersadvt"))<>"" then
			myADVT = myADVT & "," & trim(request("othersadvt"))		
		end if
	else
		if trim(request("othersadvt"))<>"" then
			myADVT = trim(request("othersadvt"))
		end if
	End if
	''response.write (request("publications"))
	''response.end
	''' call the stored procedure to insert data into the table
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	'response.write "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmdEdit=server.CreateObject("ADODB.Command")
	cmdEdit.ActiveConnection = con
			with cmdEdit
				.CommandText = "SPTBL_SIS_FreeLancerNew"
				.CommandType = adcmdStoredProc
 
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"INSERT")
				.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,trim(request("Name")))
				.Parameters.Append .CreateParameter ("@MyUser_Gender",advarchar,adparamInputOutput,10,trim(request("Gender")))
				.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,trim(request("Address")))
				.Parameters.Append .CreateParameter ("@MyUser_City",advarchar,adparamInputOutput,20,trim(request("City")))
				.Parameters.Append .CreateParameter ("@MyUser_Age",advarchar,adparamInputOutput,50,usrAge)
				.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInputOutput,100,trim(request("Phone")))
				.Parameters.Append .CreateParameter ("@MyUser_Mobile",advarchar,adparamInputOutput,100,trim(request("mobile")))
				.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInputOutput,75,trim(request("Email")))
				.Parameters.Append .CreateParameter ("@MyUser_Password",advarchar,adparamInputOutput,15,trim(request("Password")))
				.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInputOutput,500,trim(PGEducation))
				.Parameters.Append .CreateParameter ("@MyEducation_Graduate",advarchar,adparamInputOutput,500,trim(UGEducation))
				.Parameters.Append .CreateParameter ("@MyYear_Passed",advarchar,adparamInputOutput,50,trim(YearPassed))

				.Parameters.Append .CreateParameter ("@MyMarital_Status",advarchar,adparamInputOutput,10,trim(request("MaritalStatus")))				
				.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInputOutput,5,trim(request("CurrentEmp")))
				.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInputOutput,20,trim(request("EmpStatus")))				
				.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInputOutput,7900,trim(workExp))
				.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInputOutput,10,trim(request("Spoken")))
				.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInputOutput,10,trim(request("Written")))
				.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInputOutput,10,trim(request("Windows")))
				.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInputOutput,10,trim(request("Keyboard")))
				.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInputOutput,10,trim(request("Word")))
				.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInputOutput,10,trim(request("Excel")))
				.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInputOutput,10,trim(request("Access")))
				.Parameters.Append .CreateParameter ("@MyPowerpoint_Skills",advarchar,adparamInputOutput,10,trim(request("Powerpoint")))

				.Parameters.Append .CreateParameter ("@MyHours_Per_Week",adInteger,adparamInputOutput,,trim(request("workhours")))
				.Parameters.Append .CreateParameter ("@MyOwn_Computer",advarchar,adparamInputOutput,10,trim(request("Computer")))
				.Parameters.Append .CreateParameter ("@MyInternet_Access",advarchar,adparamInputOutput,10,trim(request("Internet")))
				
				.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInputOutput,7900,trim(request("Skills")))
				.Parameters.Append .CreateParameter ("@MyDate_Created",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyDate_Updated",adDate,adparamInputOutput,8,now())
				.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInputOutput,10,"Admin")
				.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInputOutput,,0)
				.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInputOutput,500,null)
				.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInputOutput,,1)
				.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInputOutput,500,trim(PostApplied))
				.Parameters.Append .CreateParameter ("@MyPublications_Read",advarchar,adparamInputOutput,5000,trim(request("publications")))	
     				.Parameters.Append .CreateParameter ("@MySpend_Time_Internet",advarchar,adparamInputOutput,100,trim(request("Online")))	
     				.Parameters.Append .CreateParameter ("@MySee_Advertisement",advarchar,adparamInputOutput,200,trim(myADVT))	
			     	.Parameters.Append .CreateParameter ("@MyPoints_Scored",addouble,adparamInputOutput,,0)	
				.Parameters.Append .CreateParameter ("@MyUser_AlternateEmail",advarchar,adparamInputOutput,75,trim(request("AltEmail")))
				.Parameters.Append .CreateParameter ("@MyFathers_Name",advarchar,adparamInputOutput,75,trim(request("FatherName")))
				.Parameters.Append .CreateParameter ("@MyFathers_Occupation",advarchar,adparamInputOutput,150,trim(request("Fatheroccupation")))

				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
				.Execute
			end with
		loadedval = cmdEdit.Parameters("@MyResult")
response.write loadedval
response.end
		set cmdEdit = nothing
		con.close()
		Response.Redirect ("Frm_FLSubmitInfo.asp?acttype="&loadedval&"&name="&trim(request("Name"))&"")
end if
%>
<script language="JavaScript">

function checkWordLen(obj){
var wordLen = 500; // Minimum word length

var len = obj.value.split(/[\s]+/);
if(len.length > wordLen){
//alert("You cannot reached minimum "+wordLen+" words in this text area.");
obj.oldValue = obj.value!=obj.oldValue?obj.value:obj.oldValue;
obj.value = obj.oldValue?obj.oldValue:"";
return false;
}
return true;
}

function Validate()
{ 

if ((document.Frmcareers.Name.value == "") || ((mytrim(document.Frmcareers.Name).length) <=0))
  {
    alert("Please enter your Name in the \"Name\" field.");
    document.Frmcareers.Name.focus();
    return (false);
  }
if ((document.Frmcareers.Address.value == "") || ((mytrim(document.Frmcareers.Address).length) <=0))
  {
    alert("Please enter your Name in the \"Address\" field.");
    document.Frmcareers.Address.focus();
    return (false);
  }

	
 if ((document.Frmcareers.city.value == "") || ((mytrim(document.Frmcareers.city).length) <=0))
  {
    alert("Please enter city in the \"City\" field.");
    document.Frmcareers.city.focus();
    return (false);
  }
if (isNumber(document.Frmcareers.Age.value) == false)
  {
	alert("Please enter numeric value in the \"Age\" field.");
    document.Frmcareers.Age.focus();
    return (false);
  }
  if (document.Frmcareers.Age.value == "")
  {
    alert("Please enter your Age in the \"Age\" field.");
    document.Frmcareers.Age.focus();
    return (false);
  }

  if ( (parseInt(document.Frmcareers.Age.value) < 20) ||  (parseInt(document.Frmcareers.Age.value) > 80) )
{
	alert("Please enter your Age between 20 to 80.");
	document.Frmcareers.Age.focus();
	return(false);
}
function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}
//alert (isNumber(document.Frmcareers.Phone.value));
if (isNumber(document.Frmcareers.Phone.value) == false)
  {
	
    alert("Please enter numeric value in the \"phone\" field.");
    document.Frmcareers.Phone.focus();
    return (false);
  
  }

 if ((document.Frmcareers.Phone.value == "") || ((mytrim(document.Frmcareers.Phone).length) <11))
  { 
    alert("Please enter Your phone number in the \"phone\" field.");
    document.Frmcareers.Phone.focus();
    return (false);
  }
  
 if (isNumber(document.Frmcareers.mobile.value) == false)
  {
	
    alert("Please enter numeric value in the \"mobile\" field.");
    document.Frmcareers.mobile.focus();
    return (false);
  
  }
if ((document.Frmcareers.mobile.value == "") || ((mytrim(document.Frmcareers.mobile).length) < 10))
  { 
    alert("Please enter Your mobile number in the \"mobile\" field.");
    document.Frmcareers.mobile.focus();
    return (false);
  }

  
 if ((document.Frmcareers.Email.value == "") || ((mytrim(document.Frmcareers.Email).length) <=0))
 {
    alert("Please enter Your E-Mail in the \"Email\" field.");
    document.Frmcareers.Email.focus();
    return (false);
  }

            
  if (document.Frmcareers.Email.value != "") 
  { 
   apos=document.Frmcareers.Email.value.indexOf("@"); 
   dotpos=document.Frmcareers.Email.value.lastIndexOf(".");
   lastpos=document.Frmcareers.Email.value.length-1;
   if (apos<1 || dotpos-apos<2 || lastpos-dotpos>3) 
   {
    alert("Please fill in a valid E-Mail Address in the \"Email \" Field !!");                                       
    document.Frmcareers.Email.focus();
    return (false);
   }                               
  }
if ((document.Frmcareers.AltEmail.value == "") || ((mytrim(document.Frmcareers.AltEmail).length) <=0))
 {
    alert("Please enter Your Alternate E-Mail in the \" Alternate Email\" field.");
    document.Frmcareers.AltEmail.focus();
    return (false);
  }

   if (document.Frmcareers.AltEmail.value != "") 
  { 
   apos=document.Frmcareers.AltEmail.value.indexOf("@"); 
   dotpos=document.Frmcareers.AltEmail.value.lastIndexOf(".");
   lastpos=document.Frmcareers.AltEmail.value.length-1;
   if (apos<1 || dotpos-apos<2 || lastpos-dotpos>3) 
   {
    alert("Please fill in a valid Alternate E-Mail Address in the \"Alternate Email \" Field !!");                                       
    document.Frmcareers.AltEmail.focus();
    return (false);
   }                               
  }

  if (document.Frmcareers.FatherName.value == "")
  {
    alert("Please enter your Father`s Name in the \"Father`s Name\" field.");
    document.Frmcareers.FatherName.focus();
    return (false);
  }
   if (document.Frmcareers.Fatheroccupation.value == "")
  {
    alert("Please enter your Father`s Occupation in the \"Father`s Occupation\" field.");
    document.Frmcareers.Fatheroccupation.focus();
    return (false);
  }


 // if ((document.Frmcareers.Password.value == "") || ((mytrim(document.Frmcareers.Password).length) <=0))
 // {
 //   alert("Please enter your Password in the \"Password\" field.");
 //   document.Frmcareers.Password.focus();
 //   return (false);
 // }
 //  if ((document.Frmcareers.CPassword.value == "") || ((mytrim(document.Frmcareers.CPassword).length) <=0))
 // {
 //   alert("Please enter your Confirm Password in the \"Confirm Password\" field.");
 //   document.Frmcareers.CPassword.focus();
 //   return (false);
 // }

//  if (document.Frmcareers.Password.value != document.Frmcareers.CPassword.value)
//  {
//    alert("Please check Password and Confirm Password must be the same.");
//    document.Frmcareers.CPassword.focus();
//    return (false);
//  } 

//Degree
// if (document.Frmcareers.Degree.value == "") 
//  { 
//    alert("Please input your Degree name in \" Specify Post Graduation Degree(s) \" Field !!");                                       
//    document.Frmcareers.Degree.focus();
//	return (false);
//}
  
  if ((document.Frmcareers.YearPassed.value == "") || ((mytrim(document.Frmcareers.YearPassed).length) <=0))
  { 
    alert("Please input your year passed in \" Year Passed Last Degree \" Field !!");                                       
    document.Frmcareers.YearPassed.focus();
	return (false);
  }

//Year Check starts
// Variables for the current date, year and month

var right_now=new Date();
//var the_year=right_now.getYear() +1;
var theyear= parseInt(right_now.getFullYear()) + 1;
// Check to see if the year request is calid
if ( (parseInt(document.Frmcareers.YearPassed.value) <= 1900) ||  (parseInt(document.Frmcareers.YearPassed.value) >= parseInt(theyear)) )
{
alert("Please check the year passed in.");
document.Frmcareers.YearPassed.focus();
return(false);
}

 //Year Check ends



 if(!document.Frmcareers.CurrentEmp[0].checked && !document.Frmcareers.CurrentEmp[1].checked)
	{
    	alert("Please input your Current Employment Status in \" Currently Employmed? \" Field !!");                                       
//	document.Frmcareers.CurrentEmp.focus();
	return (false);
	}

if(document.Frmcareers.CurrentEmp[0].checked && !document.Frmcareers.EmpStatus[0].checked && !document.Frmcareers.EmpStatus[1].checked&& !document.Frmcareers.EmpStatus[2].checked)
	{
    	alert("Please input your Employment Status in \"If Employed\" Field !!");                                       
//	document.Frmcareers.EmpStatus.focus();
	return (false);
	}
 // if ((document.Frmcareers.Advertisement.value == "")
//	{
  //  	alert("Please Select How did you come to know about the ‘work from home’ option from BizAcumen? field.");
//	document.Frmcareers.Advertisement.focus();
 //   	return (false);
 // 	}
//	if ((document.Frmcareers.Advertisement.value == "")
//	{
  //  	alert("Please Select How did you come to know about the ‘work from home’ option from BizAcumen? field.");
//	document.Frmcareers.Advertisement.focus();
 //   	return (false);
 // 	}

// if ((document.Frmcareers.Skills.value == "") || ((mytrim(document.Frmcareers.Skills).length) <=3500))
//var len1 =My_form.text_word.value;
//if ((document.Frmcareers.Skills.value == "") || ((My_form.text_word.value < 500))
/*if ((document.Frmcareers.Skills.value == "") || ((mytrim(document.Frmcareers.Skills).length) <=3500))
  {
    //alert("Please outline any special skills or qualifications in the \"Skills\" field.");
	alert("We request you to write more about yourself and reach the minimum character count of 3500 characters for us to screen your application and take the process further’.");
    document.Frmcareers.Skills.focus();
    return (false);
  }*/

  if (document.Frmcareers.Skills.value == "")
  {
    alert("Please outline any special skills or qualifications in the \"Skills\" field.");
    document.Frmcareers.Skills.focus();
    return (false);
  }
 
 if  ((document.Frmcareers.text_word.value < 500))
{
	alert("We request you to write more about yourself and reach the minimum word count of 500 words for us to screen your application and take the process further’.");
    document.Frmcareers.Skills.focus();
    return (false);
}





return (true);
}

function mytrim(o)
{

   while(o.value.charAt(0)==" ")
	 {
		o.value=o.value.slice(1);
	 }
	while(o.value.charAt(o.value.length-1)==" ")
	{
		o.value=o.value.slice(0,-1);
	}
  return o.value;
}

function check_length(my_form)
{
maxLen = 7000; // max number of characters allowed
minLen = 1200;
var len =my_form.Skills.value.split(/[\s]+/);
if (my_form.Skills.value.length >= maxLen) {
// Alert message if maximum limit is reached. 
// If required Alert can be removed. 
var msg = "You have reached your maximum limit of characters allowed";
alert(msg);
// Reached the Maximum length so trim the textarea
my_form.Skills.value = my_form.Skills.value.substring(0, maxLen);
}
//else if (my_form.Skills.value.length < minLen) {
//var msg = "You have not reached the minimum character count of 1200 characters for us to proceed further with your application";
//alert(msg);
// Reached the Maximum length so trim the textarea
//my_form.Skills.value = my_form.Skills.value.substring(0, maxLen);
//}
else{ // Maximum length not reached so update the value of my_text counter
my_form.text_num.value = maxLen - my_form.Skills.value.length;
my_form.text_word.value = len.length; //checkWordLen(my_form.text_word);
}
}


</script>
<script language="JavaScript">
<!--
function Validate1(cur)
{
	//change max # of words to determine below
	var maxwords=300
	var temp=document.Frmcareers.words.value.split(" ")
	if (temp.length>maxwords)
	{
		alert("Please restrain your input to 300 words or 30 lines!")
		return false
	}
}
//-->
</script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	color: #013365;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
}
b{color:#4D0D04}



.navigation td {
	border-bottom: 1px solid #476687;
	}
	
.navigation a {
	font: 12px Arial, Helvetica, sans-serif;
	color: #000000;
	line-height:10px;
	letter-spacing:.1em;
	text-decoration: none;
	display:block;
	padding:8px 6px 8px 20px;
	background: url("images/arrow2.gif") 5px 45% no-repeat;
	}
	
.navigation a:hover {
	color:#ffffff;
	background: #476687 url("images/arrow.gif") 5px 45% no-repeat;
	text-decoration:none
	}
	
.subnavi td {
	border-bottom: 1px solid #ffffff;
	}
	
.subnavi a {
	font: 12px Arial, Helvetica, sans-serif;
	color: #000066;
	line-height:10px;
	text-decoration: none;
	display:block;
	padding:6px 0px 6px 0px;
	}
	
.subnavi a:hover {
	color:#A51101;
	text-decoration:underline
	}


td.align{ 
padding:10px 10px;
text-align:justify}

.top{ 
	COLOR:#333333; 
	TEXT-DECORATION: none;
	font-weight:bold 
}
A.top:link {
	COLOR: #333333; 
	TEXT-DECORATION: none;
}
A.top:visited {
	COLOR: #333333; 
	TEXT-DECORATION: none;
}
A.top:active {
	COLOR: #333333; 
	TEXT-DECORATION: none;
}
A.top:hover { 
	COLOR: #cd4d02;
	text-decoration:underline
}
.style1 {color: #999999}
-->
</style>
<link href="../globind.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <!--Top strip start here-->
  <tr>
    <td width="100%" height="85" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="100" align="left"><img src="../images/Banner1.JPG" width="243" height="100" /></td>
        <td width="100%" height="100" align="center" valign="middle"><img src="../images/Bannerm.jpg" width="100%" height="100" /></td>
        <td height="100" align="right"><img src="../images/Banner3.jpg" width="140" height="100" /></td>
      </tr>
    </table></td>
      </tr>
       <tr>
        <td bgcolor="#000000" height="1" ></td>
      </tr>
      <tr>
        <td bgcolor="#A51101" height="7"></td>
      </tr>
	  <tr>
        <td bgcolor="#000000" height="1" ></td>
      </tr>
    </table></td>
  </tr>
<!--Top strip end here-->
  <tr>
    <td  valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        
        <td width="85%" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
	<tr>
                <td height="5px" bgcolor="#E8E8E8"></td>
              </tr>
          <tr>
            <td class="align">
			<!--insert neeistum-->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td align="center"><form name="Frmcareers" method="post" action="FRM_Biz_FreeLancersNew.asp" >
<table border="0" width="100%" bgcolor="white" style="border-collapse:collapse;" align="center" cellspacing="0" cellpadding="0" bordercolor="#421C05">
  <tr>
    <td width="100%" align="center">
      <table border="0" align="center" width="100%" cellspacing="4" cellpadding="0" >
       
        
        <tr align="center">
          <td width="100%" height="21"><div align="right"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <b>Note</b> : Items marked </font><font color="#FF0000">*</font> are required</font></div>
	  <div align="left"><font color="red">Please do not copy any content from MS-word into this application (in any of the boxes provided) to eliminate the risk of junk characters, and problem in submission of application.</font></div></td>
        </tr>
	
		<tr align="center">
          <td width="100%" height="21" ><div align="center"><p><font color="#804040" size=4><strong>&nbsp;&nbsp;WorkfromHome@BizAcumen</strong></font></td>
        </tr>
		 <!--tr align="center">
           <td width="100%" height="21">
			  <table border="0" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
			  <%
			  'dim myselected1,myselected2,myselected3,myselected4
			  'myselected1=""
			  'myselected2=""
			  'myselected3=""
			  'myselected4=""
			  'if trim(request("pid"))="1" then
			  '	myselected1 = "checked"
			  'elseif trim(request("pid"))="2" then
			  '	myselected2 = "checked"
			  'elseif trim(request("pid"))="3" then
			  '	myselected3 = "checked"
			  'elseif trim(request("pid"))="4" then
			  '	myselected4 = "checked"
			  'end if
			  %>
	    	  <tr align="left"><td width="100%" height="0"><input type="checkbox" name="chktype1" value="Research Analysis" <%'=myselected1%>> Research Analysis [Post Graduation required].</font><td></tr>
	 	  	  <tr align="left"><td width="100%" height="0"><input type="checkbox" name="chktype2" value="Editorial" <%'=myselected2%>> Editorial.</font><td></tr>
			  <tr align="left"><td width="100%" height="0"><input type="checkbox" name="chktype3" value="Web Downloading" <%'=myselected3%>> Web Downloading.</font><td></tr>
			  <tr align="left"><td width="100%" height="0"><input type="checkbox" name="chktype4" value="Data Entry" <%'=myselected4%>> Data Entry.</font><td></tr>
			 </table>
		   </td>
		 </tr-->
		  <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;Contact Information</strong></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21"><div align="center"><center><table border="0" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
	   <tr><td colspan=3 height=5></td></tr>
            <tr>
              <td width="17%" height="1" align="left">Full Name (With Surname)<small><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="1"><strong>:</strong></font></td>
              <td width="79%" height="1"><input type="text" name="Name" size="30" maxlength="30" tabindex="1"></td>
            </tr>
	<tr>
              <td width="17%" height="25" align="left">Gender</font></td>
              <td width="4%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"> <input type="radio" value="Male" name="gender" tabindex="43" checked>Male</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Female" name="gender" tabindex="44">Female</font></td>
             </td>
            </tr>
            <tr>
              <td width="17%" height="60" align="left">Address</font><font color="#FF0000">*</font></td>
              <td width="4%" align="center" height="60"><strong>:</strong></font></td>
              <td width="79%" height="60"><textarea rows="3" name="Address" cols="23" tabindex="2"></textarea></td>
            </tr>
	<tr>
              <td width="17%" height="25" align="left">City</font><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"><input type="text" name="city" maxlength="20" size="30" tabindex="3"></td>
            </tr>
            <tr>
              <td width="17%" height="25" align="left">Age<small><font color="#FF0000">*</font> </small></font></td>
              <td width="4%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"><input type="text" name="Age" maxlength="2" size="30" tabindex="3"></td>
            </tr>
            <tr>
              <td width="17%" height="1" align="left">Phone (Home)</font><font color="#FF0000">*</font></td>
              <td width="4%" align="center" height="1"><strong>:</strong></font></td>
              <td width="79%" height="1"><input type="text" name="Phone" size="30" tabindex="4" maxlength="11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone (Mobile)<font color="#FF0000">*</font><strong> :</strong>&nbsp;&nbsp;+91<input type="text" name="mobile" size="30" tabindex="4" maxlength="10"></td>
            </tr>
	    <tr>
              <!--td width="17%" height="25" align="left"> &nbsp;</td>
              <td width="4%" align="left" height="25"></font></td-->
              <td  height="25" colspan="3">&nbsp;&nbsp;<font color="red"><small>PLEASE ENTER CORRECT AND ACTIVE EMAIL IDs. YAHOO.CO.IN & REDIFFMAIL EMAIL IDs ARE NOT REQUIRED. PLS KEEP CHECKING YOUR INBOX AND SPAM/JUNK FOLDERS FOR COMMUNICATION FROM BIZACUMEN.</small></font></td>
            </tr>
            <tr>
              <td width="17%" height="25" align="left">Email</font><small><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"><input type="text" name="Email" size="30" maxlength="50" tabindex="5"> <!--&nbsp;&nbsp;<font color="red"><small>(PLEASE ENTER CORRECT EMAIL ID. DO NOT ENTER YAHOO.CO.IN & REDIFFMAIL EMAIL IDs HERE)</small></font--></td>
            </tr>
	    <tr>
              <td width="17%" height="25" align="left">Alternate Email</font><small><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"><input type="text" name="AltEmail" size="30" maxlength="50" tabindex="5"> <!--&nbsp;&nbsp;<font color="red"><small>(PLEASE ENTER CORRECT AND ACTIVE EMAIL IDs. YAHOO.CO.IN & REDIFFMAIL EMAIL IDs ARE NOT REQUIRED. PLS KEEP CHECKING YOUR INBOX AND SPAM/JUNK FOLDERS FOR COMMUNICATION FROM BIZACUMEN)</small></font--></td>
            </tr>
	    <tr>
              <td width="17%" height="25" align="left">Father's Name</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"><input type="text" name="FatherName" maxlength="75" size="30" tabindex="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Father's Occupation&nbsp;<input type="text" name="Fatheroccupation" maxlength="150" size="30" tabindex="6"></td>
            </tr>
          </table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
	<!--tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;Password Information</strong></font>&nbsp;<small>(Please use this password to check your application status.)</small></td>
        </tr>
	<tr align="center">
          <td width="100%" height="21"><div align="center"><center><table border="0" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
	   <tr><td colspan=3 height=5></td></tr>
            <tr>
              <td width="17%" height="1" align="left">Password<small><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="1"><strong>:</strong></font></td>
              <td width="79%" height="1"><input type="password" name="Password" size="15" maxlength="15" tabindex="5"></td>
            </tr>
	    <tr>
              <td width="17%" height="1" align="left">Confirm Password<small><font color="#FF0000">*</font> </small></td>
              <td width="4%" align="center" height="1"><strong>:</strong></font></td>
              <td width="79%" height="1"><input type="password" name="CPassword" size="15" maxlength="15" tabindex="6"></td>
            </tr>
	 </table>
          </center></div></td>
        </tr-->

	
        <tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;
          Education</strong></font> <small>(Select all that apply)</small></font></td>
        </tr>
        <tr align="center">
          <td width="109%" height="21"><div align="center">
          <center>
          <table border="0" width="95%" cellspacing="0" cellpadding="0">
	     <tr>
              <td width="28%" height="36">Post Graduate Degree:</font></td>
              <td width="2%" height="36" align="center"><strong>:</strong></font></td>
              <td width="14%" height="36"><input type="checkbox" name="MBA" value="MBA" tabindex="6">MBA</font></td>
              <td width="14%" height="36" colspan="2"><input type="checkbox" name="PGDBA" value="PGDBA" tabindex="7">PGDBA</font></td>
              <td width="15%" height="36"><input type="checkbox" name="PGDBM" value="PGDBM" tabindex="8">PGDBM</font></td>
              <td width="34%" height="36"><input type="checkbox" name="MA" value="MA Economics / Statistics" tabindex="9">MA <small>(Economics/Statistics)</small></font></td>
            </tr>
	    <tr>
              <td width="28%" height="34">&nbsp;</td>
              <td width="2%" height="34" align="center">&nbsp;</td>
	      <td width="14%" height="34"><input type="checkbox" name="MCA" value="MCA" tabindex="10">MCA</font></td>
              <td width="14%" height="34"><input type="checkbox" name="MCOM" value="MCOM" tabindex="10">M. COM</font></td>
              <td width="49%" colspan="3" height="34">&nbsp;Others <small>(Specify)</small>&nbsp;
              <input type="text" name="Degree" size="20" maxlength="50" tabindex="11"></font></td>
            </tr>
            <tr>
              <td width="28%" height="36"> Graduate Degree:</font></td>
              <td width="2%" height="36" align="center"><strong>:</strong></font></td>
			  <td  height="36" colspan=5><table><tr>
              <td width="14%" height="36"><input type="checkbox" name="BTech" value="BTech" tabindex="6">BE/B.Tech</font></td>
              <td width="14%" height="36" colspan="2"><input type="checkbox" name="BA" value="BA" tabindex="10">BA</font></td>
              <td width="14%" height="36"><input type="checkbox" name="BSC" value="BSC" tabindex="7">BSc</font></td>
              <td width="14%" height="36"><input type="checkbox" name="BCA" value="BCA" tabindex="6">BCA</font></td>
			  <td width="14%" height="36"><input type="checkbox" name="BCom" value="BCom" tabindex="6">BCom</font></td>
			  </tr></table>
			  
            </tr>
            <tr>
              <td width="28%" height="34">&nbsp;</td>
              <td width="2%" height="34" align="center">&nbsp;</td>              
              <td width="49%" colspan="5" height="34">&nbsp;Others <small>(Specify)</small>&nbsp;
              <input type="text" name="UGDegree" size="20" maxlength="50" tabindex="11"></font></td>
            </tr>
			<!--tr><td colspan="3" height="25"><input type="Radio" name="RdDegree" value="1" checked> My last Degree is Post Graduation [MBA, PGDBA, PGDBM, MA (Economics / Statistics), MCOM etc]</td></tr>
			<tr><td colspan="3" height="25"><input type="Radio" name="RdDegree" value="2"> My last Degree is Graduation </td></tr>
			<tr>
              <td width="28%" height="25">Preffered Post Graduation</font><font color="#FF0000">*</font></td>
              <td width="2%" height="25" align="center"><strong>:</strong></font></td>
              <td width="77%" colspan="5" height="25"> [MBA, PGDBA, PGDBM, MA (Economics / Statistics), MCOM etc]</td>
            </tr>
			<tr>
              <td width="28%" height="25">Specify Post Graduation Degree(s)</font><font color="#FF0000">*</font></td>
              <td width="2%" height="25" align="center"><strong>:</strong></font></td>
              <td width="77%" colspan="5" height="25"> <input type="text" name="Degree" size="20" maxlength="100" tabindex="11"></font> [If multiple same level Degrees please specify them with comma seperation.]</td>
            </tr-->
            <tr>
              <td width="28%" height="34">Year Passed </font><font color="#FF0000">*</font> </td>
              <td width="2%" height="34" align="center"><strong>:</strong></font></td>
              <td width="77%" colspan="5" height="34">&nbsp;<input type="text" name="YearPassed" size="20" tabindex="12" maxlength="4"></font></td>
            </tr>
	    <tr>
              <td width="28%" height="34">Marital Status</font><small><font color="#FF0000"> *</font> </small></td>
	      <td width="2%" height="34" align="center"><strong>:</strong></font></td>
              <td width="77%" colspan="5" height="34"><input type="radio" value="Single" name="MaritalStatus" tabindex="13" checked>Single</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="Married" name="MaritalStatus" tabindex="13">Married</font></td>
            </tr>
          </table>
          </center></div></td>
        </tr>
        
        <tr align="center">
          <td width="100%" height="5"><div align="center"><center><table border="0" width="95%" cellspacing="0" cellpadding="0" height="62">
            <tr>
              <td width="28%" height="21" align="right">Are you currently Employed ? <small><font color="#FF0000"> *</font> </small><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></font><small><font color="#FF0000">&nbsp;&nbsp;</font></td>
              <td width="13%" height="21"><input type="radio" value="Yes" name="CurrentEmp" tabindex="13">Yes</font></td>
              <td width="52%" height="21" colspan="2"><input type="radio" value="No" name="CurrentEmp" tabindex="13">No</font></td>
            </tr>
            <tr>
              <td width="28%" height="20"><small><div align="right"><p></small>If
              Employed <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</strong></font><small><font color="#FF0000">&nbsp;&nbsp;</font></small></td>
              <td width="13%" height="20"><input type="radio" value="Full Time" name="EmpStatus" tabindex="14">Full-Time</font></td>
              <td width="16%" height="20"><input type="radio" value="Part Time" name="EmpStatus" tabindex="14">Part-Time</font></td>
              <td width="36%" height="20"><input type="radio" value="Work from Home" name="EmpStatus" tabindex="14">Work From Home</font></td>
            </tr>
          </table>
          </center></div></td>
        </tr>
		 <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;&nbsp;
          Work Experience</strong></font> <small>(If any) (Will be verified prior to employment)</small></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="6"><div align="center"><center><table border="0" width="85%" cellspacing="0">
            <tr>
              <td width="27%" align="center"><strong>Year (From Year - To Year)</strong></font></td>
              <td width="44%" align="center"><strong>Company / Organization</strong></font></td>
              <td width="37%" align="center"><strong>Location</strong></font></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year1" size="10" tabindex="15" maxlength="11"></td>
              <td width="44%" align="center"><input type="text" name="Company1" size="25" tabindex="16" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location1" size="15" tabindex="17" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year2" size="10" tabindex="18" maxlength="11"></td>
              <td width="44%" align="center"><input type="text" name="Company2" size="25" tabindex="19" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location2" size="15" tabindex="20" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year3" size="10" tabindex="21" maxlength="11"></td>
              <td width="44%" align="center"><input type="text" name="Company3" size="25" tabindex="22" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location3" size="15" tabindex="23" maxlength="30"></td>
            </tr>
            <!--tr>
              <td width="27%" align="center"><input type="text" name="Year4" size="10" tabindex="24" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company4" size="25" tabindex="25" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location4" size="15" tabindex="26" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year5" size="10" tabindex="27" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company5" size="25" tabindex="28" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location5" size="15" tabindex="29" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year6" size="10" tabindex="30" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company6" size="25" tabindex="31" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location6" size="15" tabindex="32" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year7" size="10" tabindex="33" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company7" size="25" tabindex="34" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location7" size="15" tabindex="35" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year8" size="10" tabindex="36" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company8" size="25" tabindex="37" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location8" size="15" tabindex="38" maxlength="30"></td>
            </tr-->
          </table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;
          Self Assessment</strong></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="2"><div align="center"><center><table border="0" width="95%"
          cellspacing="0" cellpadding="2">
            <tr>
              <td width="36%" height="19">Spoken English Skills</font></td>
              <td width="5%" align="center" height="19"><strong>:</strong></font></td>
              <td width="14%" height="19"><input type="radio" value="Excellent" name="Spoken" tabindex="39" checked>Excellent</font></td>
              <td width="11%" height="19"><input type="radio" value="Good" name="Spoken" tabindex="40">Good</font></td>
              <td width="15%" height="19"><input type="radio" value="Moderate" name="Spoken" tabindex="41">Moderate</font></td>
              <td width="19%" height="19"><input type="radio" value="Poor" name="Spoken" tabindex="42">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21">Written English Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Written" tabindex="43" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Written" tabindex="44">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Written" tabindex="45">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Written" tabindex="46">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21"><font color="#1F4B77"><strong>Computer Skills</strong></font></td>
              <td width="5%" align="center" height="21"></td>
              <td width="14%" height="21"></td>
              <td width="11%" height="21"></td>
              <td width="15%" height="21"></td>
              <td width="19%" height="21"></td>
            </tr>
            <tr>
              <td width="36%" height="21">Windows Functions &amp; Environment</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Windows" tabindex="47" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Windows" tabindex="48">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Windows" tabindex="49">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Windows" tabindex="50">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21">Keyboard Skills(Typing &amp; Mouse)</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Keyboard" tabindex="51" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Keyboard" tabindex="52">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Keyboard" tabindex="53">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Keyboard" tabindex="54">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21">Microsoft Word Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Word" tabindex="55" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Word" tabindex="56">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Word" tabindex="57">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Word" tabindex="58">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21">Microsoft Excel Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Excel" tabindex="59" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Excel" tabindex="60">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Excel" tabindex="61">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Excel" tabindex="62">Poor</font></td>
            </tr>
            <!--tr>
              <td width="36%" height="21">Microsoft Access Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Access" tabindex="63" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Access" tabindex="64">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Access" tabindex="65">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Access" tabindex="66">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21">Microsoft Powerpoint Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Powerpoint" tabindex="67" checked>Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Powerpoint" tabindex="68">Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Powerpoint" tabindex="69">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Powerpoint" tabindex="70">Poor</font></td>
            </tr-->
          </table>
          </center></div></td>
        </tr>
	
	<tr align="center">
          <td width="100%" height="10"><table border="0" width="95%" cellspacing="0" cellpadding="0">
        <tr>
		<td width="36%" height="21">Do you have a computer ?</font></td>
                <td width="5%" align="center" height="21"><strong>:</strong></font></td>
               <td width="59%" height="21"><input type="radio" value="Yes" name="Computer" tabindex="13" checked>Yes</font>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="No" name="Computer" tabindex="13">No</font></td>
            </tr>
	<tr>
		<td width="36%" height="21">Do you have internet access ?</font></td>
                <td width="5%" align="center" height="21"><strong>:</strong></font></td>
             
              <td width="15%" height="21"><input type="radio" value="Yes" name="internet" tabindex="13" checked>Yes</font>&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="No" name="internet" tabindex="13">No</font></td>
            </tr>
	</table></td></tr>
<tr align="center">
          <td width="100%" height="10"></td>
        </tr>
         <tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;
          More about yourself</strong></font></td>
        </tr>

<tr align="center">
          <td width="100%" height="10"><table border="0" width="95%" cellspacing="0" cellpadding="1">
<!--tr>
              <td width="43%" height="21"><font color="#1F4B77"><strong>More about yourself</strong></font></td>
              <td width="6%" align="center" height="21"></td>
              <td width="14%" height="21"></td>
              <td width="11%" height="21"></td>
              <td width="15%" height="21"></td>
              <td width="19%" height="21"></td>
            </tr-->
		<tr><td colspan=6 height=5></td></tr>
		<tr align="left">
		<td width="36%" height="31" valign="top">How many hours per 7-day week can you spare for the home assignments?</font></td>
                <td width="5%" align="center" height="21" valign="top"><strong>:</strong></font></td>
          	<td width="59%" height="21" valign="top">&nbsp;&nbsp;&nbsp;<select name="workhours" class="cpttext">
		<option value="20">20 hours per week</option>
		<option value="30">30 hours per week</option>
		<option value="40">40 hours per week</option>
		<option value="50">50 hours per week</option>
		</select></td>
        	</tr>

            <tr>
              <td width="36%" height="90" valign="top">What kind of publications do you read </font></td>
              <td width="5%" align="center" height="19" valign="top"><strong>:</strong></font></td>
              <td height="19" colspan=4 valign="top">&nbsp;&nbsp;&nbsp;<select multiple size="4" name="publications" class="cpttext">
<option value="Anand Bazar Patrika">Anand Bazar Patrika</option>
<option value="Asian Age">Asian Age</option>
<option value="Business Line">Business Line</option>
<option value="Business Standard">Business Standard</option>
<option value="Business Today">Business Today</option>
<option value="Business World">Business World</option>
<option value="Cosmopolitan">Cosmopolitan</option>
<option value="Dainik Bhaskar">Dainik Bhaskar</option>
<option value="Dainik Jagran">Dainik Jagran</option>
<option value="Deccan Chronicle">Deccan Chronicle</option>
<option value="Deccan Herald ">Deccan Herald </option>
<option value="Eenadu ">Eenadu </option>
<option value="Elle India">Elle India</option>
<option value="Femina">Femina</option>
<option value="Financial Express">Financial Express</option>
<option value="Frontline">Frontline</option>
<option value="Good Housekeeping">Good Housekeeping</option>
<option value="Gurlz">Gurlz</option>
<option value="Hindustan ">Hindustan </option>
<option value="Hindustan Times">Hindustan Times</option>
<option value="India Today">India Today</option>
<option value="Indian Express ">Indian Express </option>
<option value="International Herald">International Herald</option>
<option value="Lokmat ">Lokmat </option>
<option value="Nav Bharat Times ">Nav Bharat Times </option>
<option value="Outlook">Outlook</option>
<option value="Savvy">Savvy</option>
<option value="The Economic and Political Weekly">The Economic and Political Weekly</option>
<option value="The Economic Times ">The Economic Times </option>
<option value="The Financial Express">The Financial Express</option>
<option value="The Hindu">The Hindu</option>
<option value="The Industrial Economist">The Industrial Economist</option>
<option value="The Pioneer">The Pioneer</option>
<option value="The Statesman">The Statesman</option>
<option value="The Telegraph">The Telegraph</option>
<option value="The Times of India ">The Times of India </option>
<option value="The Tribune">The Tribune</option>
<option value="The Week">The Week</option>
<option value="Verve">Verve</option>
<option value="Womans Era">Woman's Era</option>
<option value="WOW">WOW</option>


		
		</select><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Please click Ctrl button for multiple selections)</font></td>
              </tr>
	   <tr>
              <td width="36%" height="31" valign="top">How do you spend your time on the Internet</font></td>
              <td width="5%" align="center" height="19" valign="top"><strong>:</strong></font></td>
              <td height="19" colspan=4 valign="top">&nbsp;&nbsp;&nbsp;<input type="text" name="Online" size="36" maxlength="100"></td>
	  </tr>
<tr>
              <td width="36%" height="31" valign="top">How did you come to know about the ‘work from home’ option from BizAcumen?</font></td>
              <td width="5%" align="center" height="19" valign="top"><strong>:</strong></font></td>
              <td height="19" colspan=4 valign="top">&nbsp;&nbsp;&nbsp;<select name="Advertisement" class="cpttext">
<option value="">--Select--</option>
<option value="Friend">Friend (Please specify name and e-mail ID)</option>
<option value="Colleague">Colleague (Please specify name and e-mail ID)</option>
<option value="Advertisement on Naukri.com">Advertisement on Naukri.com </option>
<option value="Advertisement in Newspaper">Advertisement in Newspaper (Please specify)</option>
<option value="Advertisement in India Today">Advertisement in India Today</option>
<option value="Any Other Source">Any Other Source (Please specify)</option>
		
		</select>&nbsp;  (Specify): &nbsp;<input type="test" size="40" name="othersadvt" maxlength=200></font></td>
              </tr>
</table><br></td></tr>
<!--tr align="center">
          <td width="100%" height="21" bgcolor="#AABACA"><div align="left"><p><font color="#1F4B77"><strong>&nbsp;&nbsp;
          </strong></font></td>
        </tr-->
        
        </tr>
        <tr align="center">
          <td width="100%" height="30" valign="bottom" align="center"><table cellpadding=0 cellspacing=0 width="95%"><tr><td><div align="left"><p></font> 
	<!--Please tell us about yourself, your family, interests, special skills, hobbies, etc. in a couple of pages. The following write-up submitted by you will be the primary basis of our recruitment initiative -->
	<!--Tell us about yourself, your family, your interests, special skills and qualifications. This write-up also helps us assess your writing skills>
	Please tell us about yourself, your family, interests, special skills, hobbies, and anything that would enable us to know more about you as a person. The following write-up should be a minimum of 1200 characters for our recruitment committee to evaluate your proficiency in written English. Maximum characters can go up to 7000.-->Please tell us about yourself, your family, interests, special skills, hobbies, and anything that would enable us to know more about you as a person. Minimum number of words for qualifying the screening process is 500 (3500 characters).  Please note we are mainly looking for quality English expression in your write-up. Maximum number of words can go up to 1000 (7000 characters). The following write-up submitted by you will be the primary basis for selection in our team.  <font color=red>*You are requested NOT to paste your resume in the following box. Pasting your resume here will automatically disqualify you from our recruitment process.</font>
	</b></font></td></tr></table></td>
        </tr>
        <tr align="left">
          <td width="100%" height="0"><div align="left"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <textarea rows="10" name="Skills" cols="90" tabindex="71" onKeyPress=check_length(this.form); onKeyDown=check_length(this.form); ></textarea><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input size=2 readonly value=7000 name=text_num> Characters Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Word Count: <input size=2 value=500 readonly name=text_word> 
</td>
        </tr>
        <tr align="center">
          <td width="100%" height="0"></td>
        </tr>
				 
        <tr align="center">
          <td width="100%" height="0"><b>Thanks for applying. We will inform you of our decision shortly.<br>All of us at BizAcumen wish you a successful career! 
</b></font><td></tr>
	<tr align="center">
          <td width="100%" height="0"><b><b><td></tr>
        <tr align="center">
          <td width="100%" height="0"><div align="center"><center><p><input class="butn" type="submit" value="Submit" onclick="return Validate();" name="BtnSubmit" tabindex="72">
          </td>
        </tr>
        <tr align="center">
          <td width="100%" height="0"></td>
        </tr>
        
      </table>
      </center></div>
    </form>
    </td>
  </tr>
</table>
</td></tr></table>
			<!--aapu-->
</td>
          </tr>          
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td  valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
       <tr>
    <td height="22" bgcolor="#373737" align="center"><span class="style1">© <script language="JavaScript">document.write(new Date().getFullYear());</script> BizAcumen Research Private Limited</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
