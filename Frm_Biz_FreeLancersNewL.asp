<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<%
	'if trim(Request.ServerVariables("http_referer"))="" then
	'	Response.Redirect "default.htm"
	'end if
%>
<!doctype html>

<html lang="en-US">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>BizAcumen Research Pvt.,Ltd</title>
		<meta name="description" content="BizAcumen Research Pvt., Ltd"/>
		<meta name="keywords" content="BizAcumen, Market Research, Research Trends" />
		
        <!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Google Fonts  -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,500' rel='stylesheet' type='text/css'> <!-- Body font -->
		<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'> <!-- Navbar font -->

		<!-- Libs and Plugins CSS -->
		<link rel="stylesheet" href="inc/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="inc/animations/css/animate.min.css">
		<link rel="stylesheet" href="inc/font-awesome/css/font-awesome.min.css"> <!-- Font Icons -->
		<link rel="stylesheet" href="inc/owl-carousel/css/owl.carousel.css">
		<link rel="stylesheet" href="inc/owl-carousel/css/owl.theme.css">

		<!-- Theme CSS -->
        <link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/mobile.css">

		<!-- Skin CSS -->
		<link rel="stylesheet" href="css/skin/cool-gray.css">
       
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
       

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
  //  	alert("Please Select How did you come to know about the ‘work from home’ option from SIS? field.");
//	document.Frmcareers.Advertisement.focus();
 //   	return (false);
 // 	}
//	if ((document.Frmcareers.Advertisement.value == "")
//	{
  //  	alert("Please Select How did you come to know about the ‘work from home’ option from SIS? field.");
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

	 
	</head>
    
    
    

    <body data-spy="scroll" data-target="#main-navbar">
    
        <div class="page-loader"></div>  <!-- Display loading image while page loads -->
        
    	<div class="body">
        
        
           <!--========== BEGIN HEADER ==========-->
          
            <header id="header" class="header-main">

                <!-- Begin Navbar -->
                <nav id="main-navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">

                  <div class="container">

                    <div class="navbar-header">
                    
                      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                      </button>
                      
                      <a class="navbar-brand page-scroll" href="index.html">BiZAcumen</a>
                      
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse col-sd-12" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a class="page-scroll" href="index.html">Home</a></li>
                            <li><a class="page-scroll" href="Aboutus.html">About</a></li>
                            <li><a class="page-scroll" href="Service.html">Services</a></li>
                             <li><a class="page-scroll" href="Careers.html">Careers</a></li>
                            <li><a class="page-scroll" href="hyderabad.html">Hyderabad</a></li>
                             <li><a class="page-scroll" href="http://www.bizacumen.com/workez/FRM_Biz_FreeLancersNew.asp">Work from Home</a></li>
                            <li><a class="page-scroll" href="Training.html">Training</a></li>                            
                            <li><a class="page-scroll" href="Contactus.html">Contact</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                  </div><!-- /.container -->
                </nav>
                <!-- End Navbar -->

            </header>
            <!-- ========= END HEADER =========-->
            
        	
            
             <!--========== BEGIN FORM ==========-->
           	<section id="Training" class="page bg-style1">
               <div class="container"> <!---container start ---->
           		   
                   
                   <!---=========TOP SECTION BEGIN=========--->
                   
                   <div class="row"><!---row start ---->
                   
                   		<div class="container">
                     	<p class="text-right ">Note: Items marked <span class="text-danger">*</span> are required</p>
                                    <br/>
                        <p class="text-center text-danger">Please do not copy any content from MS-word into this application (in any of the boxes provided) to eliminate the risk of junk characters, and problem in submission of application.</p>
                                    <br/>
                                    <br/>
                        <h3 class="text-center"><u>WorkfromHome@BizAcumen</u></h3>
                        <p class="text-justify">At BizAcumen Research, we take pride in recruiting employees of the highest caliber and quality. We strongly feel that without a quality team, we cannot achieve our goals and objectives. When evaluating/screening your application, it is essential that we have a clear picture of your education, talents, abilities, and personality so that we may best match your interests and strengths with our current openings. The information provided here will help us to objectively and fairly evaluate your skills and personality in relation to the current opening. We request you to complete this application in full as we consider and review only fully completed forms. Readymade resumes pasted here will automatically be disqualified from our recruitment process.
                        </p>
                        <br/>
                        </div>
           		
               	   </div><!---Row End ---->
                   <!---=========TOP SECTION END=========--->
                   
                   <!---=========FORM SECTION STARTS=========--->
                   		<form class="form-horizontal" name="Frmcareers" method="post" action="Frm_Biz_FreeLancersNew.asp" >

                   		<!-----First Block----->
                   		<div class="row">
                        	<div class="col-lg-12 col-md-12">
	                        	<h5 class="bg-primary form_bar">&nbsp; &nbsp;Contact Information </h5>
                            </div>
                        
                           	<div class="extra-space-m"></div>
                            
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Full Name (With Surname)<span class="text-danger">*</span>&nbsp; :</label>
                                    <div class="col-sm-8">
                                    	<input type="text" name="Name"  maxlength="27" tabindex="1" class="form-control">
                                 </div>
                                 </div>
                            </div>
                            
                            <div class="clearfix"></div>
                            <!---break-->
                            <div class="col-lg-6  col-sm-6 col-xs-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-6 control-label">Gender &nbsp;:</label>
                                    
                                    <div class="col-sm-6">
                                    	<label class="radio-inline">
                                           <input type="radio" value="Male" name="gender" tabindex="43">Male
                                        </label>
                                          
                                         <label class="radio-inline">
                                            <input type="radio" value="Female" name="gender" tabindex="44">Female
                                       	 </label>
                                   </div>
                                   
                                 </div>
                            </div>
                            
                            
                             <div class="col-lg-6  col-sm-6   col-xs-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4 control-label">Age&nbsp; :</label>
                                    <div class="col-sm-3">
                                    <input type="number" name="Age" step="1" min="20" max="80" maxlength="2" size="10" tabindex="3" class="form-control">
                                   </div>
                                 </div>
                            </div>
                            <div class="clearfix"></div>
                            
                            <!------------->
                            
                            <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-6 control-label">Address<span class="text-danger">*</span> &nbsp;:</label>
                                    <div class="col-sm-6">
                                    <textarea rows="3" name="Address" cols="23" tabindex="2" class="form-control"></textarea>
                                   </div>
                                 </div>
                            </div>
                            
                            
                             <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4 control-label">City<span class="text-danger">*</span>&nbsp; :</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="city" maxlength="20" tabindex="3" class="form-control">
                                   </div>
                                 </div>
                            </div>
                            
                            <div class="clearfix"></div>
                              <!------------->
                            
                            <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-6 control-label">Phone(Home)<span class="text-danger">*</span>&nbsp;:</label>
                                    <div class="col-sm-6">
                                   <input type="text" name="Phone" tabindex="4" maxlength="11" class="form-control">
                                   </div>
                                 </div>
                            </div>
                            
                            
                             <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4 control-label">Phone(Mobile)<span class="text-danger">*</span>&nbsp; :</label>
                                    <div class="col-sm-6">
                                    	
                                        <input type="tel" name="mobile"  placeholder="5555555555" pattern="^[0-9]{10}$" tabindex="4" maxlength="10" class="form-control">
                                   </div>
                                 </div>
                            </div>
                            <!-------------->
                            
                            <p class="text-danger col-lg-8 col-lg-offset-3 col-sm-offset-3"> <span class="small">(PLEASE ENTER CORRECT AND ACTIVE EMAIL IDs. YAHOO.CO.IN & REDIFFMAIL EMAIL IDs ARE NOT REQUIRED. PLS KEEP CHECKING YOUR INBOX AND SPAM/JUNK FOLDERS FOR COMMUNICATION FROM BizAcumen.)</span></p>
                         
                             <!------------->
                            
                            <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-6 control-label">Email<span class="text-danger">*</span> &nbsp;:</label>
                                    <div class="col-sm-6">
                                    
                                    <input type="email" name="Email"  placeholder="some@email.com" maxlength="50" tabindex="5" class="form-control">
                                    
                                    
                                   </div>
                                 </div>
                            </div>
                            
                            
                             <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4 control-label">Alternate Email<span class="text-danger">*</span>&nbsp; :</label>
                                    <div class="col-sm-6">
                                    	<input type="email" name="AltEmail" size="25" placeholder="some@alternateemail.com" maxlength="50" tabindex="5" class="form-control">
                                   </div>
                                 </div>
                            </div>
                            <!-------------->
                            
                             <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-6 control-label">Father's Name<span class="text-danger">*</span> &nbsp;:</label>
                                    <div class="col-sm-6">
                       
                                    <input type="text" name="FatherName" maxlength="75"  tabindex="6" class="form-control">
                                    
                                   </div>
                                 </div>
                            </div>
                            
                            
                             <div class="col-lg-6 col-sm-6">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-4 control-label">Father's Occupation &nbsp; :</label>
                                    <div class="col-sm-6">
                  
                                        <input type="text" name="Fatheroccupation" maxlength="150"  tabindex="6" class="form-control">
                                        
                                   </div>
                                 </div>
                            </div>
                            <!-------------->
                          
                   		</div>
                   		<!-----First eEND----->
                         
                        <!-----Second Block----->
                   		<div class="row">
                        
                        <div class="col-lg-12">
                         	 <h5 class="bg-primary form_bar"> &nbsp;&nbsp;Education <span class="small" style="color:#FFF">(Select all that apply)</span> </h5>
                        </div>
                        
                        	

                            <div class="extra-space-m"></div>
                            
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="input01" class="col-sm-3 control-label">Post Graduate Degree &nbsp; :</label>
                                    <div class="col-sm-8" style="padding-left:0px;">
                                    	<label class="radio-inline col-lg-2">
											<input type="checkbox" name="MBA" value="MBA" tabindex="6">MBA
                                       	   </label>
                                          
                                          <label class="radio-inline col-lg-2">
                                     
                                           <input type="checkbox" name="PGDBA" value="PGDBA" tabindex="7">PGDBA
                                          </label>
                                          
                                          <label class="radio-inline col-lg-2">
                                  
                                            <input type="checkbox" name="PGDBM" value="PGDBM" tabindex="8">PGDBM 
                                          </label>
                                          
                                           <label class="radio-inline col-lg-5">
                                        
                                            <input type="checkbox" name="MA" value="MA Economics / Statistics" tabindex="9"> MA <span class="small">(Economics/Statistics)</span> 
                                          </label>
                                          <span class="clearfix"></span>
                                          <br/>
                                          
                                                                                   
                                          <label class="radio-inline col-lg-2">
                                           
                                            <input type="checkbox" name="MCA" value="MCA" tabindex="10">MCA  
                                          </label>
                                       
                                          
                                          <label class="radio-inline col-lg-2">
                                            <!--input type="checkbox" id="inlineCheckbox1" value="option1"-->
                                            <input type="checkbox" name="MCOM" value="MCOM" tabindex="10">M.COM    
                                          </label>
                                          
                                           <label class="radio-inline col-lg-1">
                                           Others 
                                                
                                  		  </label>
                                         
                                          <label class="radio-inline col-lg-4">
                                        
                                            <input type="text" name="Degree" maxlength="50" tabindex="11" >
                                  		  </label>
                                          
                                          
                                   </div>
                                 
                                 </div>
                            </div>
                            
                            <div class="clearfix"></div>
                            <!---break-->
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Graduate Degree &nbsp; :</label>
                                    <div class="col-sm-8" style="padding-left:0px;">
                                    	<label class="radio-inline col-lg-2">
                                  
                                           <input type="checkbox" name="BTech" value="BTech" tabindex="6">BE/B.Tech  
                                        </label>
                                          
                                          <label class="radio-inline col-lg-2">
                                          <input type="checkbox" name="BA" value="BA" tabindex="10">BA 
                                          
                                          </label>
                                          
                                          <label class="radio-inline col-lg-2">
                                          <input type="checkbox" name="BSC" value="BSC" tabindex="7"> BSc  
                                          </label>
                                      
                                           <label class="radio-inline col-lg-2">
                                            <input type="checkbox" name="BCom" value="BCom" tabindex="6">BCA
                                 		    </label>
                                          
                                          <label class="radio-inline col-lg-1">
                                           Others  
                                  		  </label>
                                          
                                           <label class="radio-inline col-lg-3">
                                            <input type="text" name="other"  maxlength="27" tabindex="1"  placeholder="Specify  Others ">
                                  		  </label>
                                         
                                          
                                   </div>
                                   
                                  
                                   
                                 </div>
                            </div>
                            
                            <!------------->
                            
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3  control-label">Year Passed<span class="text-danger">*</span> &nbsp;:</label>
                                    <div class="col-sm-8">
                                   
                                    <input type="text" name="YearPassed" size="20" tabindex="12" maxlength="4" class="form-control">
                              
                                   </div>
                                 </div>
                            </div>
                            
                            
                            <div class="clearfix"></div>
                              <!------------->
                            
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Marital Status<span class="text-danger">*</span>&nbsp;:</label>
                                    <div class="col-sm-9">
                                    
                                   		 <label class="radio-inline col-lg-2">
                                           <input type="radio" value="Single" name="MaritalStatus" tabindex="13" checked="">Single
                                         </label>
                                          
                                        <label class="radio-inline col-lg-2">
                                           <input type="radio" value="Married" name="MaritalStatus" tabindex="13">Married 
                                        </label>
                                   </div>
                                 </div>
                            </div>
                            
                             <!------------->
                            
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Are you currently Employed ? <span class="text-danger">*</span>&nbsp;:</label>
                                    <div class="col-sm-9">
                                    
                                    <label class="radio-inline col-lg-2">
                                           <input type="radio" value="Yes" name="CurrentEmp" tabindex="13">Yes   
                                        </label>
                                          
                                        <label class="radio-inline col-lg-2">
                                           <input type="radio" value="No" name="CurrentEmp" tabindex="13">NO  
                                        </label>
                                   </div>
                                 </div>
                            </div>
                            
                            <!------------->
                            
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">If Employed&nbsp;:</label>
                                    <div class="col-sm-9">
                                    
                                    <label class="radio-inline col-lg-2">
                                          <input type="radio" value="Full Time" name="EmpStatus" tabindex="14">Full-Time  
                                        </label>
                                          
                                        <label class="radio-inline col-lg-2">
                                           <input type="radio" value="Part Time" name="EmpStatus" tabindex="14">Part-Time  
                                        </label>
                                        
                                        <label class="radio-inline col-lg-3">
                                           <input type="radio" value="Work from Home" name="EmpStatus" tabindex="14">Work From Home 
                                        </label>
                                   </div>
                                 </div>
                            </div>
                            
                            
                   		</div>
                   		<!-----Second eEND----->
                        
                        <!-----Third Block----->
                   		<div class="row">
                        
                        	<div class="col-lg-12">
                            
                            	<h5 class="bg-primary form_bar"> &nbsp;&nbsp;Work Experience <span class="small" style="color:#FFF">(If any) (Will be verified prior to employment)</span> </h5>
                            
                       		 </div>
                        
                            
                            <div class="container">
                            
                            	<div class="row">
                                
                                
                                		<div class=" col-lg-10 col-lg-offset-1 col-sm-12">
			<table class="table " >
			  <thead>
				<tr>
				  <th>Year (From Year - To Year)</th>
				  <th>Company / Organization</th>
				  <th>Location</th>
				  
				</tr>
			  </thead>
			  <tbody>
				<tr>
				  <td><input type="text" name="Year1" size="35" tabindex="15" maxlength="11" class="form-control"></td>
				  <td><input type="text" name="Year2" size="35" tabindex="15" maxlength="11" class="form-control"></td>
				  <td><input type="text" name="Year3" size="35" tabindex="15" maxlength="11" class="form-control"></td>
				
				</tr>
				<tr>
				  <td><input type="text" name="Company1" size="35" tabindex="16" maxlength="30" class="form-control"></td>
				  <td> <input type="text" name="Company2" size="35" tabindex="16" maxlength="30" class="form-control"></td>
				  <td><input type="text" name="Company3" size="35" tabindex="16" maxlength="30" class="form-control"></td>
				 
				</tr>
				<tr>
				  <td><input type="text" name="Location1" size="35" tabindex="17" maxlength="30" class="form-control"></td>
				  <td> <input type="text" name="Year2" size="35" tabindex="15" maxlength="11" class="form-control"></td>
				  <td><input type="text" name="Company2" size="35" tabindex="16" maxlength="30" class="form-control"></td>
				 
				</tr>
			  </tbody>
			</table>
		  </div>
                                
                                
                                
                            
                            			<!--div class="col-lg-3 col-sm-12 col-lg-offset-1">
                                        	<h6 class="text-left">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Year (From Year - To Year)</h6>
                                            
                                            <div class="col-lg-11 ">
                                  			<input type="text" name="Year1" size="35" tabindex="15" maxlength="11" class="form-control">
                                            <br/>
                                            <input type="text" name="Year2" size="35" tabindex="15" maxlength="11" class="form-control">
                                              <br/>
                                            <input type="text" name="Year3" size="35" tabindex="15" maxlength="11" class="form-control">
                                              <br/>
                                		   </div>
                                        
                            
                            			</div>
                                        
                                        
                                     <div class="col-lg-3 col-sm-12 col-lg-offset-1">
                                        	<h6 class="text-left">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Company / Organization</h6>
                                            
                                            <div class="col-lg-11 ">
                                    		<input type="text" name="Company1" size="35" tabindex="16" maxlength="30" class="form-control">
                                              <br/>
                                            <input type="text" name="Company2" size="35" tabindex="16" maxlength="30" class="form-control">
                                              <br/>
                                            <input type="text" name="Company3" size="35" tabindex="16" maxlength="30" class="form-control">
                                              <br/>
                                		   </div>
                                        
                            
                            			</div>
                                        
                                        
                                        
                                        <div class="col-lg-3 col-sm-12 col-lg-offset-1">
                                        	<h6 class="text-left">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Location</h6>
                                            
                                            <div class="col-lg-11 ">
                                    		<input type="text" name="Location1" size="35" tabindex="17" maxlength="30" class="form-control">
                                              <br/>
                                            <input type="text" name="Year2" size="35" tabindex="15" maxlength="11" class="form-control">
                                              <br/>
                                            <input type="text" name="Company2" size="35" tabindex="16" maxlength="30" class="form-control">
                                              <br/>
                                		   </div>
                                        </div-->
                              	</div>
                        	 </div>
                      	</div>
                   		<!-----Third eEND----->
                        
                        <!-----Fourth Block----->
                   		<div class="row">
                        
                        	<div class="col-lg-12">
                            
                            	<h5 class="bg-primary form_bar">&nbsp;&nbsp;&nbsp;Self Assessment</h5>
                            
                            </div>
                        
                        	

                           	<div class="extra-space-m"></div>
                            
                            <!---break-->
                            <div class="col-lg-12 col-sm-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Spoken English Skills &nbsp; :</label>
                                    
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Excellent" name="Spoken" tabindex="39" checked=""> Excellent 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Good" name="Spoken" tabindex="39" checked=""> Good
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Moderate" name="Spoken" tabindex="39" checked=""> Moderate
                                        </label>
                                         <label class="radio-inline col-lg-2">
                                                 <input type="radio" value="Poor" name="Spoken" tabindex="39" checked=""> Poor
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                            <!------------->
                            
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Written English Skills &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Excellent" name="Written" tabindex="39" checked=""> Excellent 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Good" name="Written" tabindex="39" checked=""> Good
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                 <input type="radio" value="Moderate" name="Written" tabindex="39" checked=""> Moderate
                                        </label>
                                         <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Poor" name="Written" tabindex="39" checked=""> Poor
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                            <!------------->
                            
                            <div class="col-lg-12">
                            
                            	<h6 class="text-center bg-info form_bar2"> Computer Skills </h6>
                            
                            </div>
                            
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Windows Functions & Environment &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Excellent" name="Windows" tabindex="39" checked=""> Excellent 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Good" name="Windows" tabindex="39" checked=""> Good
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Moderate" name="Windows" tabindex="39" checked=""> Moderate
                                        </label>
                                         <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Poor" name="Windows" tabindex="39" checked=""> Poor
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                            <!------------->
                            
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Keyboard Skills <span class="small" style="color:#FFF">(Typing & Mouse)</span> &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Excellent" name="Keyboard" tabindex="39" checked=""> Excellent 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Good" name="Keyboard" tabindex="39" checked=""> Good
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                 <input type="radio" value="Moderate" name="Keyboard" tabindex="39" checked=""> Moderate
                                        </label>
                                         <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Poor" name="Keyboard" tabindex="39" checked=""> Poor
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                            
                            <!------------->
                            <div class="clearfix"></div>
                            
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Microsoft Word Skills &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2 ">
                                                 <input type="radio" value="Excellent" name="Word" tabindex="39" checked=""> Excellent 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Good" name="Word" tabindex="39" checked=""> Good
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Moderate" name="Word" tabindex="39" checked=""> Moderate
                                        </label>
                                         <label class="radio-inline col-lg-2">
                                                 <input type="radio" value="Poor" name="Word" tabindex="39" checked=""> Poor
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                            <!------------->
                            
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Microsoft Excel Skills &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2 ">
                                                 <input type="radio" value="Excellent" name="Excel" tabindex="39" checked=""> Excellent 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Good" name="Excel" tabindex="39" checked=""> Good
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Moderate" name="Excel" tabindex="39" checked=""> Moderate
                                        </label>
                                         <label class="radio-inline col-lg-2">
                                                 <input type="radio" value="Poor" name="Excel" tabindex="39" checked=""> Poor
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                             <!------------->
                             
                            
                             
                             
                            
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input02" class="col-sm-3 control-label">Do you have a computer ? &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2">
                                                  <input type="radio" value="Yes" name="Computer" tabindex="13" checked=""> Yes 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="No" name="Computer" tabindex="13" checked=""> No
                                        </label>
                                    </div>
                                 </div>
                            </div>
                            
                            <!------------->
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="input03" class="col-sm-3 control-label">Do you have internet access? &nbsp; :</label>
                                    <div class="col-sm-9">
                                    	<label class="radio-inline col-lg-2 ">
                                                  <input type="radio" value="Yes" name="internet" tabindex="13" checked=""> Yes 
                                        </label>
                                        <label class="radio-inline col-lg-2">
                                                  <input type="radio" value="No" name="internet" tabindex="13" checked=""> No
                                        </label>
                                        
                                    </div>
                                 </div>
                            </div>
                            
                          
                   		</div>
                   		<!-----fourth END----->
                        
                        
                        <!-----Fifth Block----->
                   		<div class="row">
                        
                        	<div class="col-lg-12">
                            
                             <h5 class="bg-primary form_bar"> &nbsp;&nbsp;More about yourself </h5>
                       		 </div>
                        
                            
                             
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-4 control-label">How many hours per 7-day week can you spare for the  home assignments? &nbsp; &nbsp;:</label>
                                        <div class="col-sm-7">
                                       	
                                           <select name="workhours" class="cpttext textbox_border form-control">
                                                <option value="20">20 hours per week</option>
                                                <option value="30">30 hours per week</option>
                                                <option value="40">40 hours per week</option>
                                                <option value="50">50 hours per week</option>
                                           </select>
                                     
                                        </div>
                                     </div>
                                  </div>
                                  
                                  
                                  <div class="col-lg-12">
                                      <div class="form-group">
                                          <label for="inputEmail3" class="col-sm-4 control-label">What kind of publications do you read &nbsp; &nbsp;:</label>
                                           <div class="col-sm-7">
                                           	   
                                               <select multiple="" size="4" name="publications" class="cpttext textbox_border form-control">
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
                                                </select>
                                         
                                                <br/>
                                                (Please click Ctrl button for multiple selections)
                                                </div>
                                              </div>
                                      </div>
                                      
                                      <div class="col-lg-12">
                                              <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">How do you spend your time on the Internet &nbsp; &nbsp;:</label>
                                                <div class="col-sm-7">
                                                  <input type="text" name="Online" class="form-control" id="Online" placeholder="">
                                                </div>
                                              </div>
                                      </div>
                                      
                                      <div class="col-lg-12">
                                              <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">How did you come to know about the 'work from home' option from BizAcumen? &nbsp; &nbsp; :</label>
                                                <div class="col-sm-7">
                                                
                                                  <select name="Advertisement" class="cpttext textbox_border form-control">
                                                    <option value="">--Select--</option>
                                                    <option value="Friend">Friend (Please specify name and e-mail ID)</option>
                                                    <option value="Colleague">Colleague (Please specify name and e-mail ID)</option>
                                                    <option value="Advertisement on Naukri.com">Advertisement on Naukri.com </option>
                                                    <option value="Advertisement in Newspaper">Advertisement in Newspaper (Please specify)</option>
                                                    <option value="Advertisement in India Today">Advertisement in India Today</option>
                                                    <option value="Any Other Source">Any Other Source (Please specify)</option>
                                                            
                                                    </select>
                                                 
                                                  <br/>
                                                  <input type="text" class="form-control" id="othersadvt"  maxlength="200" placeholder=" (Specify)">
                                                </div>
                                              </div>
                                      </div>
                                
                      	</div>
                   		<!-----Fifth eEND----->
                        
                        <!---Sixth Block Starts---->
                        <div class="container">
                        
                        <p class="text-justify">Please tell us about yourself, your family, interests, special skills, hobbies, and anything that would enable us to know more about you as a person. Minimum number of words for qualifying the screening process is 500 (3500 characters). Please note we are mainly looking for quality English expression in your write-up. Maximum number of words can go up to 1000 (7000 characters). The following write-up submitted by you will be the primary basis for selection in our team. <br/><br/><span class="text-danger">*You are requested NOT to paste your resume in the following box. Pasting your resume here will automatically disqualify you from our recruitment process.</span></p>
                        <br/>
                     
                        
                          		<label class="radio-inline col-lg-12 col-sm-12 col-xs-12">
                                <textarea name="Skills" cols="" rows="10" class="col-lg-8 col-sm-12  col-xs-12" rows="10" name="Skills" tabindex="71" onKeyPress="check_length(this.form);" onKeyDown="check_length(this.form);"></textarea>
                                
                                </label>
                                
                                <label class="radio-inline col-lg-4">
									<input size="2" readonly="" size="50%" value="7000" name="text_num" class="textbox_border"> Characters Left
                                </label>
                                
                                <label class="radio-inline col-lg-4">
									<input size="2" value="500" readonly="" name="text_word" class="textbox_border">Word Count
                                </label>
                                <div class="clearfix"></div>
                                
                                
                                
                              
							<div class="extra-space-l"></div>

                                
                                <p class="text-center">Thanks for applying. We will inform you of our decision shortly.<br/>
All of us at BizAcumen wish you a successful career!</p>

<div class="extra-space-l"></div>
									<input class="btn btn-danger btn-lg text-center col-lg-offset-5" type="submit" value="Submit" onClick="return Validate();" name="BtnSubmit" tabindex="72" >
                               
                                
                                <div class="extra-space-l"></div>
                                
                               <p class="text-center"> <a href="http://www.BizAcumen.com" class="text-danger">www.BizAcumen.com</a></p>
                        
                        
                        <!---Sixth Bock Ends------>
                        
                        </div>
                        
                        
                        
                        
                        
                        </form>
                   
                   <!---=========FORM SECTION END=========--->
                   
                   
                   
                   
			   </div> <!---container end ---->
            </section>
           <!--========== END FORM ==========-->
           
           
            <!-- Begin footer -->
            <footer class="text-off-white">
                            
                <div class="footer">
                    <div class="container text-center wow fadeIn" data-wow-delay="0.4s">
                        <p class="copyright">© 2015 BizAcumen Research Pvt., Ltd </p>
                    </div>
                </div>

            </footer>
            <!-- End footer -->
            
            
           
            
            

            <a href="#" class="scrolltotop"><i class="fa fa-arrow-up"></i></a> <!-- Scroll to top button -->
            
            <!-- Scroll to top button -->
                                              
        </div><!-- body ends -->
        
        <!-- Plugins JS -->
	<script src="inc/jquery/jquery-1.11.1.min.js"></script>
		<script src="inc/bootstrap/js/bootstrap.min.js"></script>
		<script src="inc/owl-carousel/js/owl.carousel.min.js"></script>
		<script src="inc/stellar/js/jquery.stellar.min.js"></script>
		<script src="inc/animations/js/wow.min.js"></script>
        <script src="inc/waypoints.min.js"></script>
		<script src="inc/isotope.pkgd.min.js"></script>
		<script src="inc/classie.js"></script>
		<script src="inc/jquery.easing.min.js"></script>
		<script src="inc/jquery.counterup.min.js"></script>
		<script src="inc/smoothscroll.js"></script>

		<!-- Theme JS -->
		<script src="js/theme.js"></script>
        
   
		
	
        

    </body> 
           
</html>
