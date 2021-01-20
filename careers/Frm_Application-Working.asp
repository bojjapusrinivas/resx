<!DOCTYPE html>
<%@ Language=VBScript %>

<!--#include file="ASPIncludes/dbopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
	  defaultDate: '-30y'
	 // minDate: '-40y', maxDate:'-20y'
    });
	
  });

</script>

<%


	'if trim(Request.ServerVariables("http_referer"))="" then
	'	Response.Redirect "default.htm"
	'end if

%>
<html>
<head>
<title>WELCOME TO BizAcumen Research Private Limited :: Careers </title>

<%
On Error resume Next

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
		<td width="100%" align="center"><font face=verdana size='2' color='red'>Check the data given cannot be more than 7000 charaters</font></td></tr>
		<tr><td width="100%"  align="center"><input type="button" onclick="javascript:history.back();" name="btnback" value="Back"></td></tr>
		</table>
		<%Response.End 
	end if	

	dim workExp, UGEducation, PGEducation, PostApplied
	workExp = ""	
	PGEducation = ""
	UGEducation = ""
	for i = 1 to 3
		if trim(request("Company"&i&""))<>"" then
			workExp = workExp & "Year :"& trim(Request("Year"&i&"")) & " Company : "& trim(Request("Company"&i&"")) & " Location : "& trim(Request("Location"&i&"")) & "<br>"
		end if
	next
	'''PostApplied
	if trim(request("chktype"))<>"" then
		'PostApplied = PostApplied & " " & trim(request("chktype"))
		PostApplied =  trim(request("chktype"))
	end if	
	

	''''''''''''''''''''''''''''''''''''''''''''''''''''''
	if trim(PostApplied)="" then
		'''PostApplied = "as applicable"
		PostApplied = "none selected"
	end if
	
	'''''''''''''''''''''''''''''''''''''''''''''''''''
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
	if trim(request("BCom"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " &  trim(request("BCom"))
		else
			UGEducation = trim(request("BCom"))
		end if
	end if	
	if trim(request("BA"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & ", " &  trim(request("BA"))
		else
			UGEducation = trim(request("BA"))
		end if
	end if
	if trim(request("DegreeUG"))<>"" then
		if trim(UGEducation)<>"" then
			UGEducation = UGEducation & " :: Others :: " & trim(request("DegreeUG"))
		else
			UGEducation = "Others :: " & trim(request("DegreeUG"))
		end if
	end if

	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
	if trim(request("MCOM"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("MCOM"))
		else
			PGEducation = trim(request("MCOM"))
		end if
	end if
	if trim(request("MSC"))<>"" then
		if trim(PGEducation)<>"" then
			PGEducation = PGEducation & ", " &  trim(request("MSC"))
		else
			PGEducation = trim(request("MSC"))
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
	if trim(PGEducation)="" then
		PGEducation = "No Degree Specified"
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
	
''' DOB
	if trim(request("datevalue"))="" then
		usrAge = usrAge & "## Date of Birth:" &  0
	else
		usrAge = usrAge & "## Date of Birth(mmddyyyy):" & trim(request("datevalue"))
	end if

	dim varfathername,varOccupation
	varfathername = trim(request("FatherName")) 
	IF trim(request("MotherName"))<>"" then
		varfathername = varfathername & "## Mother`s Name: "&trim(request("MotherName"))
	END If
	
	varOccupation  = trim(request("Fatheroccupation"))
	IF trim(request("Motheroccupation"))<>"" then
		varOccupation = varOccupation & "## Mother`s Occupation: "&trim(request("Motheroccupation"))
	END If
	
	IF trim(request("SpouseName"))<>"" then
		varfathername = varfathername & "## Spouse Name: "&trim(request("SpouseName"))
	else
		varfathername = varfathername & "## Spouse Name: --"
	END If

	IF trim(request("Spouseoccupation"))<>"" Then
		varOccupation = varOccupation & "## Spouse Occupation: "&trim(request("Spouseoccupation"))
	else
		varOccupation = varOccupation & "## Spouse Occupation: --"
	END If

	''''''''Sibling(s)
	IF trim(request("SiblingName"))<>"" then
		varfathername = varfathername & "## Sibiling`s Name: "&trim(request("SiblingName"))
	END If
	IF trim(request("Siblingoccupation"))<>"" then
		varOccupation = varOccupation & "## Sibiling`s Occupation: "&trim(request("Siblingoccupation"))
	END If

	IF trim(request("txtAMCATest")) <> "" THEN
		VARAMCATest=trim(request("txtAMCATest"))
	else
		VARAMCATest=0
	END IF
	''' call the stored procedure to insert data into the table
	con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	'response.write "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		
	set cmdEdit=server.CreateObject("ADODB.Command")
	cmdEdit.ActiveConnection = con
		If Err.number <> 0 then
  			Response.write Err.description & "  test"
			Response.end
		End If
	
				MyUser_Name=trim(request("Name"))
				MySurName=trim(request("SurName"))
				MyUser_Address=trim(request("Address"))
				MyPermanent_Address=trim(request("PermanentAddress"))
				MyUser_Gender=trim(request("Gender"))
				MyMarital_status=trim(request("MStatus"))
				MyTasks_performed=trim(request("Tasks"))
				MyUser_Age=trim(usrAge)
				MyUser_Phone=trim(request("Phone"))
				MyUser_Email=trim(request("Email"))
				MyFathers_Name=trim(varfathername)
				MyFathers_Occupation=trim(varOccupation)
				MyEducation_UG=trim(UGEducation)
				MyEducation_PG=trim(PGEducation)
				MyYear_Passed=trim(YearPassed)
				MyPercentage_Scored=trim(request("txtpercentage"))
				MyEmp_status=trim(request("CurrentEmp"))
				MyEmp_Type=trim(request("EmpStatus"))				
				MyWork_Experience=trim(workExp)
				MySpoken_English=trim(request("Spoken"))
				MyWritten_Skills=trim(request("Written"))
				MyWindows_Skills=trim(request("Windows"))
				MyKeyboard_Skills=trim(request("Keyboard"))
				MyWord_Skills=trim(request("Word"))
				MyExcel_Skills=trim(request("Excel"))
				MyAccess_Skills=trim(request("Access"))
				MySpecial_Skills=replace(trim(request("Skills")),"'","''")
				MyUpdated_By="Admin"
				MyUser_Status=1
				MyReason_Update=""
				MyAdmin_Status=1
				MyPost_Applied=trim(PostApplied)
				MyCurrentSalary=trim(request("txtCurrentSal"))
				MyExpectedSalary=trim(request("txtExpectedSal"))
				MyUser_AlternateEmail=trim(request("AltEmail"))
			 	MyLocation="Hyderabad"
			 
				MyApplicant_Status=0
				MyApplicant_Remarks="Pending"
			 	MyApplicationfor="Bizacumen"
 				MyAMCATPercentile=VARAMCATest
sqlins="INSERT INTO TBL_SIS_Applications (Rec_ID,User_Name,SurName,User_Address,Permanent_Address,User_Gender,Marital_status,Tasks_performed,User_Age,User_Phone,User_Email,Fathers_Name,Fathers_Occupation,Education_UG,Education_PG,Year_Passed,Percentage_Scored,Emp_status,Emp_Type,Work_Experience,Spoken_English,Written_Skills,Windows_Skills,Keyboard_Skills,Word_Skills,Excel_Skills,Access_Skills,Special_Skills,Date_Created,Date_Updated,Updated_By,User_Status,Reason_Update,admin_Status,Post_Applied,CurrentSalary,ExpectedSalary,User_AlternateEmail,Location,Applicant_Status,Applicant_Remarks,Applicationfor,AMCATPercentile ) VALUES   (dbo.[GetMaxTBL_SIS_Applications](),'" & MyUser_Name & "','" & MySurName & "','" & MyUser_Address & "','" & MyPermanent_Address & "','" & MyUser_Gender & "','" & MyMarital_status & "','" & MyTasks_performed & "','" & MyUser_Age & "','" & MyUser_Phone & "','" & MyUser_Email & "','" & MyFathers_Name & "','" & MyFathers_Occupation & "','" & MyEducation_UG & "','" & MyEducation_PG & "','" & MyYear_Passed & "','" & MyPercentage_Scored & "','" & MyEmp_status & "','" & MyEmp_Type & "','" & MyWork_Experience & "','" & MySpoken_English & "','" & MyWritten_Skills & "','" & MyWindows_Skills & "','" & MyKeyboard_Skills & "','" & MyWord_Skills & "','" & MyExcel_Skills & "','" & MyAccess_Skills & "','" & MySpecial_Skills & "',getdate(),getdate(),'" & MyUpdated_By & "','" & MyUser_Status & "','" & MyReason_Update & "','" & MyAdmin_Status & "','" & MyPost_Applied & "','" & MyCurrentSalary & "','" & MyExpectedSalary & "','" & MyUser_AlternateEmail & "','" & MyLocation & "','" & MyApplicant_Status & "','" & MyApplicant_Remarks & "','" & MyApplicationfor & "','" & MyAMCATPercentile & "')"
con.execute sqlins
loadedval=1
'response.write sqlins
'response.end


			with cmdEdit
				.CommandText = "SPTBL_SIS_Applications_BizAcu"
				.CommandType = adcmdStoredProc
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"INSERT")
				.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInput,,0)
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInput,50,trim(request("Name")))
				.Parameters.Append .CreateParameter ("@MySurName",advarchar,adparamInput,20,trim(request("SurName")))
				.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInput,500,trim(request("Address")))
				.Parameters.Append .CreateParameter ("@MyPermanent_Address",advarchar,adparamInput,500,trim(request("PermanentAddress")))
				.Parameters.Append .CreateParameter ("@MyUser_Gender",advarchar,adparamInput,10,trim(request("Gender")))
				.Parameters.Append .CreateParameter ("@MyMarital_status",advarchar,adparamInput,25,trim(request("MStatus")))
				.Parameters.Append .CreateParameter ("@MyTasks_performed",advarchar,adparamInput,1500,trim(request("Tasks")))
				.Parameters.Append .CreateParameter ("@MyUser_Age",advarchar,adparamInput,50, trim(usrAge))
				.Parameters.Append .CreateParameter ("@MyUser_Phone",advarchar,adparamInput,15,trim(request("Phone")))
				.Parameters.Append .CreateParameter ("@MyUser_Email",advarchar,adparamInput,50,trim(request("Email")))
				.Parameters.Append .CreateParameter ("@MyFathers_Name",advarchar,adparamInput,500,trim(varfathername))
				.Parameters.Append .CreateParameter ("@MyFathers_Occupation",advarchar,adparamInput,500,trim(varOccupation))
				.Parameters.Append .CreateParameter ("@MyEducation_UG",advarchar,adparamInput,500,trim(UGEducation))
				.Parameters.Append .CreateParameter ("@MyEducation_PG",advarchar,adparamInput,500,trim(PGEducation))
				.Parameters.Append .CreateParameter ("@MyYear_Passed",advarchar,adparamInput,50,trim(YearPassed))
				.Parameters.Append .CreateParameter ("@MyPercentage_Scored",advarchar,adparamInput,10,trim(request("txtpercentage")))
				.Parameters.Append .CreateParameter ("@MyEmp_status",advarchar,adparamInput,5,trim(request("CurrentEmp")))
				.Parameters.Append .CreateParameter ("@MyEmp_Type",advarchar,adparamInput,20,trim(request("EmpStatus")))				
				.Parameters.Append .CreateParameter ("@MyWork_Experience",advarchar,adparamInput,7900,trim(workExp))
				.Parameters.Append .CreateParameter ("@MySpoken_English",advarchar,adparamInput,10,trim(request("Spoken")))
				.Parameters.Append .CreateParameter ("@MyWritten_Skills",advarchar,adparamInput,10,trim(request("Written")))
				.Parameters.Append .CreateParameter ("@MyWindows_Skills",advarchar,adparamInput,10,trim(request("Windows")))
				.Parameters.Append .CreateParameter ("@MyKeyboard_Skills",advarchar,adparamInput,10,trim(request("Keyboard")))
				.Parameters.Append .CreateParameter ("@MyWord_Skills",advarchar,adparamInput,10,trim(request("Word")))
				.Parameters.Append .CreateParameter ("@MyExcel_Skills",advarchar,adparamInput,10,trim(request("Excel")))
				.Parameters.Append .CreateParameter ("@MyAccess_Skills",advarchar,adparamInput,10,trim(request("Access")))
				.Parameters.Append .CreateParameter ("@MySpecial_Skills",advarchar,adparamInput,7900,trim(request("Skills")))
				.Parameters.Append .CreateParameter ("@MyUpdated_By",advarchar,adparamInput,10,"Admin")
				.Parameters.Append .CreateParameter ("@MyUser_Status",adInteger,adparamInput,,1)
				.Parameters.Append .CreateParameter ("@MyReason_Update",advarchar,adparamInput,500,null)
				.Parameters.Append .CreateParameter ("@MyAdmin_Status",adInteger,adparamInput,,1)
				.Parameters.Append .CreateParameter ("@MyPost_Applied",advarchar,adparamInput,500,trim(PostApplied))
				.Parameters.Append .CreateParameter ("@MyCurrentSalary",advarchar,adparamInput,10,trim(request("txtCurrentSal")))
				.Parameters.Append .CreateParameter ("@MyExpectedSalary",advarchar,adparamInput,10,trim(request("txtExpectedSal")))
				.Parameters.Append .CreateParameter ("@MyUser_AlternateEmail",advarchar,adparamInput,60,trim(request("AltEmail")))
			 	.Parameters.Append .CreateParameter ("@MyLocation",advarchar,adparamInput,15,"Hyderabad")
			 	''.Parameters.Append .CreateParameter ("@MyLocation",advarchar,adparamInput,15,trim(request("Location")))
				.Parameters.Append .CreateParameter ("@MyApplicant_Status",adInteger,adparamInput,,0)
				.Parameters.Append .CreateParameter ("@MyApplicant_Remarks",advarchar,adparamInput,15,"Pending")
			 	.Parameters.Append .CreateParameter ("@MyApplicationfor",advarchar,adparamInput,15,"Bizacumen")
 				.Parameters.Append .CreateParameter ("@MyAMCATPercentile",adInteger,adparamInput,,VARAMCATest)
				.Parameters.Append .CreateParameter ("@MyResult",adInteger,adParamOutput,,1)

			'	.Execute
				                                                
			end with
	
	'	loadedval = cmdEdit.Parameters("@MyResult")

	'	Response.write ("INSERT INTO TBL_SIS_Applications (Rec_ID,User_Name,SurName,User_Address,User_Age,User_Phone,User_Email,Fathers_Name,Fathers_Occupation,Education_UG,Education_PG,Year_Passed,Percentage_Scored,Emp_status,Emp_Type,Work_Experience,Spoken_English,Written_Skills,Windows_Skills,Keyboard_Skills,Word_Skills,Excel_Skills,Access_Skills,Special_Skills,Date_Created,Date_Updated,Updated_By,User_Status,Reason_Update,admin_Status,Post_Applied,CurrentSalary,ExpectedSalary,User_AlternateEmail,Location,Applicant_Status,Applicant_Remarks,Applicationfor) VALUES (")
	'      Response.write ("INSERT,0," & trim(request("Name")) & "," & trim(request("SurName")) & "," & trim(request("Address")) & "," & TRIM(usrAge) & "," & trim(request("Phone")) & "," & trim(request("Email")) & "," & trim(varfathername) & "," & trim(varOccupation) & "," & trim(UGEducation) & "," & trim(PGEducation) & "," & trim(YearPassed) & "," & trim(request("txtpercentage")) & "," & trim(request("CurrentEmp")) & "," & trim(request("EmpStatus")) & "," & trim(workExp) & "," & trim(request("Spoken")) & "," & trim(request("Written")) & "," & trim(request("Windows")) & "," & trim(request("keyboard")) & "," & trim(request("word")) & "," & trim(request("excel")) & "," & trim(request("access")) & "," & trim(request("skills")) & ",'admin',0,null,1," & trim(PostApplied) & "," & trim(request("txtCurrentSal")) & "," & trim(request("txtExpectedSal")) & "," & trim(request("AltEmail")) & "," & trim(request("Location")) & "," & "0,'pending','hyderabad'")

		'Response.write("for testing purpose " & loadedval)
	   ' Response.end
			 'response.write workExp 
		If Err.number <> 0 then
  			Response.write Err.description
			err.clear
			'Response.end
		End If
	'	Response.write("for testing purpose " & loadedval)
	    'Response.end
		set cmdEdit = nothing
		con.close()
		Response.Redirect ("Frm_Submit_info.asp?acttype="&loadedval&"&name="&trim(request("Name"))&"")
end if
%>
<script language = "Javascript">
/**
 * DHTML date validation script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/datevalidation.asp)
 */
// Declaring valid date character, minimum year and maximum year
var dtCh= "/";
var right_now=new Date();
var theyear= (right_now.getFullYear() - 20);
var minYear=(right_now.getFullYear() - 40) //1973;
var maxYear=theyear;

function getAge() {
    var dt=document.Frmcareers.datevalue

	var today = new Date();
    var birthDate = new Date(dt.value);
    var age = today.getFullYear() - birthDate.getFullYear();
    //alert(age);
	document.Frmcareers.Age.value =age;
	    
}

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}

function ValidateForm(){
	var dt=document.frmSample.txtDate
	if (isDate(dt.value)==false){
		dt.focus()
		return false
	}
    return true
 }

</script>
<script language="JavaScript">
function trim(str)
{
    var len;
    len = str.length;
    for(i=0;i<=len;i++)
    {
        if (str.indexOf(" ")== 0)
        {
                str = str.substr(1,len);        
        }
    }
  return str;  
}

function Validate()
{
  //if(!document.Frmcareers.chktype1.checked && !document.Frmcareers.chktype2.checked && !document.Frmcareers.chktype3.checked && !document.Frmcareers.chktype4.checked)
  //{
  //  alert("Please check Post Applied For in \" Research Analysis, Editorial, Web Downloading, Data Entry \" Field !!");  
	//document.Frmcareers.chktype1.focus();                                     
	//return (false);
  //}
	
  if (document.Frmcareers.Name.value == "")
  {
    alert("Please enter your Name in the \"Name\" field.");
    document.Frmcareers.Name.focus();
    return (false);
  }

 if (document.Frmcareers.SurName.value == "")
  {
    alert("Please enter your Surname in the \"SurName\" field.");
    document.Frmcareers.SurName.focus();
    return (false);
  }

if (document.Frmcareers.Address.value == "")
  {
    alert("Please enter your Address in the \"Address\" field.");
    document.Frmcareers.Address.focus();
    return (false);
  }

if (document.Frmcareers.datevalue.value == "")
  {
    alert("Please select your Date of Birth.");
    document.Frmcareers.datevalue.focus();
    return (false);
  }

var dt=document.Frmcareers.datevalue
	document.Frmcareers.Age.value ='';
	if (isDate(dt.value)==false)
    {
		dt.focus()
		return false
	}

		var today = new Date();
    var birthDate = new Date(dt.value);
    var age = today.getFullYear() - birthDate.getFullYear();
    //alert(age);
	document.Frmcareers.Age.value =age;

/*	var today = new Date();
    var birthDate = new Date(dt.value);
    var age = today.getFullYear() - birthDate.getFullYear();
    alert(age);
	document.Frmcareers.Age.value =age;
	if (getAge(dt.value)==false)
	{

		dt.focus()
		return false
	}*/

if (document.Frmcareers.Age.value == "")
  {
    alert("Please enter your Age in the \"Age\" field.");
    document.Frmcareers.Age.focus();
    return (false);
  }

  if ( (parseInt(document.Frmcareers.Age.value) < 20) ||  (parseInt(document.Frmcareers.Age.value) > 40) )
{
	alert("Please enter your Age between 20 to 40.");
	document.Frmcareers.Age.focus();
	return(false);
}

  if(!document.Frmcareers.Gender[0].checked && !document.Frmcareers.Gender[1].checked)
	{
    alert("Please input your Gender in \" Gender? \" Field !!");                                       
	
	return (false);
	}
 if(!document.Frmcareers.MStatus[0].checked && !document.Frmcareers.MStatus[1].checked && !document.Frmcareers.MStatus[2].checked)
	{
    alert("Please input your Marital Status in \" Marital Status? \" Field !!");                                       
	
	return (false);
	}


//alert(document.Frmcareers.Phone.value.length());
if ((document.Frmcareers.Phone.value == "") && (document.Frmcareers.Phone.value.length < 10))
  {
    alert("Please enter your Phone in the \"Phone\" field.");
    document.Frmcareers.Phone.focus();
    return (false);
  }



  if (document.Frmcareers.Email.value == "")
  {
    alert("Please enter Your E-Mail in the \"Email\" field.");
    document.Frmcareers.Email.focus();
    return (false);
  }

 if (document.Frmcareers.AltEmail.value == "")
  {
    alert("Please enter Your Alternate E-Mail in the \"Alternate Email\" field.");
    document.Frmcareers.AltEmail.focus();
    return (false);
  }

 if (document.Frmcareers.Email.value !="")
  {
    str1 = document.Frmcareers.Email.value;
    b= trim(str1);
    if (b =="")
   {
    alert ("Do Not Enter Spaces!!");
    document.Frmcareers.Email.focus();
    str1="";
    return false;
   }
  }   


if (document.Frmcareers.AltEmail.value !="")
  {
    str1 = document.Frmcareers.AltEmail.value;
    b= trim(str1);
    if (b =="")
   {
    alert ("Do Not Enter Spaces!!");
    document.Frmcareers.AltEmail.focus();
    str1="";
    return false;
   }
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
//Mother's name 
if (document.Frmcareers.MotherName.value == "")
  {
    alert("Please enter your Mother`s Name in the \"Mother`s Name\" field.");
    document.Frmcareers.MotherName.focus();
    return (false);
  }

  if (document.Frmcareers.Motheroccupation.value == "")
  {
    alert("Please enter your Mother`s Occupation in the \"Mother`s Occupation\" field.");
    document.Frmcareers.Motheroccupation.focus();
    return (false);
  }

 if(document.Frmcareers.MStatus[1].checked)
	{
		 //Spouse's name 
		 if (document.Frmcareers.SpouseName.value == "")
		   {
		    alert("Please enter your Spouse Name in the \"Spouse Name\" field.");
		    document.Frmcareers.SpouseName.focus();
		    return (false);
		  }
		
		  if (document.Frmcareers.Spouseoccupation.value == "")
		  {
		    alert("Please enter your Spouse Occupation in the \"Spouse Occupation\" field.");
		    document.Frmcareers.Spouseoccupation.focus();
		    return (false);
		  }
}

//Sibling's name 
 if (document.Frmcareers.SiblingName.value == "")
   {
    alert("Please enter your Sibling Name in the \"Sibling Name\" field.");
    document.Frmcareers.SiblingName.focus();
    return (false);
  }

  if (document.Frmcareers.Siblingoccupation.value == "")
  {
    alert("Please enter your Sibling Occupation in the \"Sibling Occupation\" field.");
    document.Frmcareers.Siblingoccupation.focus();
    return (false);
  }


if ((!document.Frmcareers.BA.checked) && (!document.Frmcareers.BCom.checked) && (!document.Frmcareers.BSC.checked) && (!document.Frmcareers.BCA.checked) && (document.Frmcareers.DegreeUG.value.trim().length <= 3)) 
{
alert("Please select Graduate Degree.");
document.Frmcareers.DegreeUG.focus();
return (false);
}

//Degree
 //if (document.Frmcareers.Degree.value == "") 
 // { 
 //   alert("Please input your Degree name in \" Specify Post Graduation Degree(s) \" Field !!");                                       
//    document.Frmcareers.Degree.focus();
//	return (false);
//}
  
//  if (document.Frmcareers.YearPassed.value == "") 
 if (document.Frmcareers.YearPassed.value.trim().length <= 3 ) 
  { 
    alert("Please input your year passed in \" Year Passed Last Degree \" Field !!");                                       
    document.Frmcareers.YearPassed.focus();
	return (false);
  }


 //Year Check starts
  // Variables for the current date, year and month
var right_now=new Date();
//var theyear=right_now.getYear() + 1;
var theyear= right_now.getFullYear() + 1;
//alert (right_now.getFullYear());
//alert ((theyear));
// Check to see if the year request is calid
if ( (parseInt(document.Frmcareers.YearPassed.value) <= 1900) ||  (parseInt(document.Frmcareers.YearPassed.value) >= parseInt(theyear)) )
{
alert("Please check the year passed in.");
document.Frmcareers.YearPassed.focus();
return(false);
}

 //Year Check ends

if (document.Frmcareers.txtpercentage.value == "") 
  { 
    alert("Please input percentage secured in \" Percentage Secured \" Field !!");                                       
    document.Frmcareers.txtpercentage.focus();
	return (false);
  }

if(!document.Frmcareers.AMCATTest[0].checked && !document.Frmcareers.AMCATTest[1].checked)
	{
    alert("Please select your AMCAT Test taken Yes/No !!");                                       
//	document.Frmcareers.CurrentEmp.focus();
	return (false);
	}
if (document.Frmcareers.AMCATTest[0].checked==true &&  document.Frmcareers.txtAMCATest.value == "")
{
		alert("Please input your AMCAT Test Percentile !!");
		 document.Frmcareers.txtAMCATest.focus();
		 return (false);
}

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

if(document.Frmcareers.CurrentEmp[0].checked)
	{
	if (document.Frmcareers.txtCurrentSal.value =="") 
		{
		alert("Please Enter the Current Salary.");	
		document.Frmcareers.txtCurrentSal.focus();
		return (false);
		}
	if (document.Frmcareers.txtExpectedSal.value =="")
		{
		alert("Please Enter the Expected Salary.");	
		document.Frmcareers.txtExpectedSal.focus();
		return (false);
 		}

	}

  if (document.Frmcareers.Skills.value == "")
  {
    alert("Please outline any special skills or qualifications in the \"Skills\" field.");
    document.Frmcareers.Skills.focus();
    return (false);
  }

 //if ((document.Frmcareers.Skills.value == "") || ((mytrim(document.Frmcareers.Skills).length) <=3500))
  //{
    //alert("Please outline any special skills or qualifications in the \"Skills\" field.");
//	alert("We request you to write more about yourself and reach the minimum character count of 3500 characters for us to screen your application and take the process further.");
  //  document.Frmcareers.Skills.focus();
   // return (false);
 // }

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

 function changetextbox(tvalue)
{
	
    if (tvalue == "Yes") {
		
        document.Frmcareers.txtAMCATest.disabled =false;
		document.Frmcareers.txtAMCATest.focus();
    } else {
		document.Frmcareers.txtAMCATest.value="";
		 document.Frmcareers.txtAMCATest.disabled =true;
        //document.Frmcareers.txtAMCATest.style='visibility:hidden';
    }
}


function checkCheckBoxes() 
   {
   	if (document.Frmcareers.CheckAddress.checked == true) 
      {  
      if(document.Frmcareers.PermanentAddress.value == "")
      	{      
        document.Frmcareers.PermanentAddress.value = document.Frmcareers.Address.value ;
	   }
     
      }
      else if(document.Frmcareers.CheckAddress.checked == false)
      {  
            if (document.Frmcareers.PermanentAddress.value == document.Frmcareers.TxtAddress.value)
              {
              document.Frmcareers.PermanentAddress.value = "" ;
              }
             
      }
   }




function changeSpouse(tvalue)
{
	//alert(tvalue);
    if (tvalue == "Married")  {
		
		document.Frmcareers.SpouseName.disabled =false;
        document.Frmcareers.Spouseoccupation.disabled =false;
		//document.Frmcareers.txtAMCATest.focus();
      
    } else {
		
         document.Frmcareers.SpouseName.value="";
 		 document.Frmcareers.Spouseoccupation.value="";
		 document.Frmcareers.SpouseName.disabled =true;
		 document.Frmcareers.Spouseoccupation.disabled =true;
    }
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
my_form.text_num.value = maxLen - my_form.Skills.value.length;}
my_form.text_word.value = len.length; //checkWordLen(my_form.text_word);
}

</script>
<script language="JavaScript">



function OpenWin()
{ 
	myWin = open("ViewHyderabad.html" ,"userwin","width=860,height=600,status=no,toolbar=no,resizable=yes,menubar=no,scrollbars=yes");
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
jQuery(function () {
    // remove the below comment in case you need chnage on document ready
    // location.href=jQuery("#selectbox").val(); 
    jQuery("#WorkfromHome").change(function () {
        location.href = jQuery(this).val();
    })
})
</script>
<link href="../globind.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000066;
}
.br{ color:#8E4A1C}
-->
</style>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 <!--TOP Starts here-->
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
  <!--tr>
    <td width="100%" height="100%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="10%"><a href="../index.htm"><img src="../images/sislogo.gif" width="346" height="72" border="0" /></a></td>
            <td width="10%"><img src="../images/sis02.gif" width="264" height="72" /></td>
            <td width="80%"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td bgcolor="#B2BEC3" height="4" ></td>
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
	  <tr>
        <td bgcolor="#E3F0F9" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="10%"><img src="../images/sis022.gif" width="146" height="125" /></td>
                    <td width="10%"><img src="../images/sis033.gif" width="141" height="125" /></td>
                    <td width="10%"><img src="../images/sis044.gif" width="142" height="125" /></td>
                    <td width="10%"><img src="../images/sis055.gif" width="151" height="125" /></td>
                    <td width="60%" ><img src="../images/sis066.gif" width="42" height="125" /></td>
                  </tr>
				  
                </table></td>
      </tr>
	  
    </table></td>
  </tr-->
  <!--TOP Ends here-->
  <!--Left Starts here-->
  <!--tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
       <td width="15%" height="515px" valign="top" bgcolor="#E8E8E8"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="158px" bgcolor="#AABACA" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"></td>
                <td width="80%"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="navigation">
                  <tr>
                    <td >&nbsp;</td>
                  </tr>
				  <tr>
                    <td ><a href="index.htm">Home</a></td>
                  </tr>
                  <tr>
                    <td><a href="aboutus.htm">About Us</a></td>
                  </tr>
                  <tr>
                    <td><a href="services.htm">Services</a></td>
                  </tr>
                  <tr>
                    <td><a href="careers.htm">Careers</a></td>
                  </tr>
                  <tr>
                    <td><a href="contactus.htm">Contact Us</a></td>
                  </tr>
                </table></td>
                <td width="5%"></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="5px" bgcolor="#476687"></td>
          </tr>
          
          <tr>
            <td><p > </p></td>
          </tr>
		  <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td style="padding-left:1px" bgcolor="#2F4E6E"></td-->
        <!--Left Ends Here-->
		<!--Body Starts Here-->
		<td width="100%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                <td height="1" colspan="2" bgcolor="#041570"></td>
              </tr>
            </table></td>
          </tr>
          <tr >
            <td valign="top" style="padding:10px 10px " >	
<br><table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td align="center"><form name="Frmcareers" method="post" action="Frm_Application.asp" onSubmit="return Validate()">
<table border="1" width="90%" bgcolor="white" style="border-collapse:collapse;" align="center" cellspacing="0" cellpadding="0" bordercolor="#305c99">
  <tr>
    <td width="100%" align="center">
      <table border="0" align="center" width="100%" cellspacing="4" cellpadding="0" >
       <tr align="center">
          <td width="100%" height="21" bgcolor="#13426E"><div align="center"><p><font  size=3 color="white"><strong>&nbsp;&nbsp;Careers@BizAcumen</strong></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="11" align="left">At BizAcumen Research, we take pride in recruiting employees of the highest caliber and quality. We strongly feel that without a quality team, we cannot achieve our goals and objectives. When evaluating/screening your application, it is essential that we have a clear picture of your education, talents, abilities, and personality so that we may best match your interests and strengths with our current openings. The information provided here will help us to objectively and fairly evaluate your skills and personality in relation to the current opening. We request you to complete this application in full as we consider and review only fully completed forms. Readymade resumes pasted here will automatically be disqualified from our recruitment process.</td>
        </tr>
        <tr align="center">
          <td width="100%" height="21"><div align="right"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <b>Note</b> : Items marked </font><font color="#FF0000">*</font> are required</font></td>
        </tr>
		<tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;Position/Department Applied For:</strong></font></td>
        </tr>
		 <tr align="center">
           <td width="100%" height="21">
			  <table border="0" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
			  <%
			  dim myselected1,myselected2,myselected3,myselected4,myselected5,myselected6, myselected7
			'  myselected1="disabled"
			 ' myselected2="disabled"
			 ' myselected3="disabled"
			 ' myselected4="disabled"
			 ' myselected5="disabled"
			 ' myselected6="disabled"
			 ' myselected7="disabled"
			  if trim(request("pid"))="1" then
			  	myselected1 = "checked"
			  elseif trim(request("pid"))="2" then
			  	myselected2 = "checked"
			  elseif trim(request("pid"))="3" then
			  	myselected3 = "checked"
			  elseif trim(request("pid"))="4" then
			  	myselected4 = "checked"
			  elseif trim(request("pid"))="5" then
			  	myselected5 = "checked"
			  elseif trim(request("pid"))="6" then
				myselected6 = "checked"
			  elseif trim(request("pid"))="7" then
				myselected7 = "checked"

			  end if
			  %>
	    	 
			<!--tr align="left"><td width="100%" height="0"><input type="radio" name="chktype" value="Quality Control Team" <%=myselected6%>> Quality Control Team [Post Graduation required]</font> <td></tr-->
	 	  	  <tr align="left"><td width="100%" height="0"><input type="radio" name="chktype" value="Content Writers" <%=myselected1%>> Content Writers</font><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small><font color="#FF0000"> <!--(MBAs, MA English, MA Economics, MA Communications, and other streams), M Phils/Ph Ds-->(M.Sc, M.Com, MA English, MA Mass Comm., MA Economics, and others, Post Graduate Diploma holders or M.Phils/Ph.Ds)</font> </small><td></tr>
			  <tr align="left"><td width="100%" height="0"><input type="radio" name="chktype" value="Computer Operators" <%=myselected3%>> Computer Operators</font>&nbsp;&nbsp;<small><font color="#FF0000">(Any Graduate)</font> </small><td></tr>
			  <!--<tr align="left"><td width="100%" height="0"><input type="radio" name="chktype" value="Desktop Publications" <%=myselected4%>> Desktop Publications (DTP)</font>&nbsp;&nbsp;<small><font color="#FF0000">(Any Graduate)</font> </small><td></tr>-->
<!--			  <tr align="left"><td width="100%" height="0"><br><input type="radio"  name="WorkfromHome" value="http://www.bizacumen.com/WorkFromHome.asp" <%'=myselected7%>-><a href="http://www.bizacumen.com/WorkFromHome.asp" class="btn btn-info" target=new>Work from Home</a> (Any Graduate/Post Graduate with exceptional English writing skills)</font><td></tr>-->
			 <tr align="left"><td width="100%" height="0"><input type="radio"  name="chktype" value="Virtual Assistants" <%=myselected7%>> Virtual Assistants (Web Researchers @Work from Home)</font><td></tr>
			 </table>
		   </td>
		 </tr>
		  <tr align="center">
          <td width="100%" height="10"></td>
        </tr>

	 <!--tr align="center">
          <td width="100%" height="21" bgcolor="#Eff3ff"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;Recruiting Location</strong></font></td>
        </tr-->
	<!--tr align="center">
          <td width="100%" height="21"><div align="center"><center>
		<table border="0" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
		  <tr align="center">
        	  <td width="100%" colspan="2"><div align="center"><center>
			<table border="0" width="100%"     cellspacing="0" cellpadding="0">
			    <tr><td height=30>Currently we are recruiting for Hyderabad & Gurgaon locations. Please specify your interest by selecting the right option. <br><br>I would like to be considered for -</td></tr>
	    		    <tr>
	                    <td width="14%" height="21"><input type="radio" value="Hyderabad" name="Location" tabindex="67" checked>&nbsp;&nbsp;&nbsp;<a style="cursor:hand;" onclick="javascript:OpenWin();"><u>Hyderabad</u></a> <-(<a style="cursor:hand;" onclick="javascript:OpenWin();"><u>Click to see more about Hyderabad City</u></a>)</font-> <font color='red'>- Current Openings Exist For Both ‘RESEARCH ANALYSTS’ And ‘CONTENT WRITERS’</font></td>
			    </tr>
            		    <tr>
		              <td width="14%" height="21"><input type="radio" value="Gurgaon" name="Location" tabindex="67" >&nbsp;&nbsp;&nbsp;Gurgaon </font><font color='red'> – Current Openings Are For ‘CONTENT WRITERS’ Only</font></td>
			    </tr>
	     		    <tr>
		              <td width="14%" height="21"><input type="radio" value="Both" name="Location" tabindex="67">&nbsp;&nbsp;&nbsp;Either of the two locations</font></td>
			    </tr>
			</table>
           	</td>
		</tr>
	      </table>
          </center></div></td>
        </tr-->
        <tr align="center">
          <td width="100%" height="10"></td>
        </tr>

        <tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;Personal Details</strong></font></td>
        </tr>


        <tr align="center">
          <td width="100%" height="21"><div align="center"><center><table border="0" bordercolor="#EBF1F0" width="95%" cellspacing="0" cellpadding="0">
            
	    <tr>
              <td width="28%" height="1" align="left">Full Name (as it appears on your Passport/Aadhaar Card):<small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="1"><strong>:</strong></font></td>
              <td width="79%" height="1"  align="left"><input type="text" name="Name" size="30" maxlength="30" tabindex="1" >&nbsp;&nbsp;Surname: <input type="text" name="SurName" size="20" maxlength="20" tabindex="1"></td>
            </tr>
            <tr>
              <td width="17%" height="81" align="left">Address<small><font color="#FF0000">*</font> </small></font></td>
              <td width="2%" align="center" height="81"><strong>:</strong></font></td>
              <td width="79%" height="81" align="left"><table><tr><td><b>Present</b><br><textarea rows="3" name="Address" cols="25" tabindex="2"></textarea></td><td><b>Permanent</b><br><textarea rows="3" name="PermanentAddress" cols="25" tabindex="2"></textarea></td></tr><tr><td colspan="2"><input type="checkbox" onclick="return checkCheckBoxes();" name="CheckAddress">Check if Present Address same as Permanent Address.</td></tr></table></td>
            </tr>
            <tr>
              <td width="17%" height="25" align="left">Date of Birth(MM/DD/YYYY) <small><font color="#FF0000">*</font> </small></font></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25" align="left"><input type='text' id="datepicker" tabindex="3" readonly value="" name="datevalue" onchange="getAge();"  >&nbsp;&nbsp;&nbsp;Age : <input type="number" name="Age"  step="1" min="20" max="40" maxlength="2"  readonly size="10" tabindex="3"></td>
            </tr>
			 <tr>
              <td width="17%" height="25" align="left">Gender<small><font color="#FF0000">*</font> </small></font></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="radio" value="Male" name="Gender" tabindex="13">Male &nbsp;&nbsp;&nbsp;<input type="radio" value="Female" name="Gender" tabindex="13">Female </td>
            </tr>
			<tr>
              <td width="17%" height="25" align="left">Marital status<small><font color="#FF0000">*</font> </small></font></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="radio" value="Single" name="MStatus" tabindex="13"  onChange="changeSpouse(this.value);">Single  &nbsp;&nbsp;&nbsp;<input type="radio" value="Married" name="MStatus" tabindex="13"  onChange="changeSpouse(this.value);">Married &nbsp;&nbsp;&nbsp;<input type="radio" value="Divorced/Separated" name="MStatus" tabindex="13"  onChange="changeSpouse(this.value);">Divorced/Separated </td>
            </tr>
            <tr>
              <td width="17%" height="1" align="left">Phone (Mobile)<small><font color="#FF0000">*</font> </small></font></td>
              <td width="2%" align="center" height="1"><strong>:</strong></font></td>
              <td width="79%" height="1"  align="left">+91<input type="tel" name="Phone" size="10" placeholder="5555555555" pattern="^[0-9]{10}$" tabindex="4" maxlength="10">&nbsp;&nbsp;</td>
            </tr>
	    <tr>
              <!--td width="17%" height="25" align="left"> &nbsp;</td>
              <td width="4%" align="left" height="25"></font></td-->
              <td  height="25" colspan="3"><font color="red"><small>PLEASE ENTER CORRECT AND ACTIVE EMAIL IDs. EMAIL IDs BASED ON YAHOO.CO.IN & REDIFFMAIL DOMAINS ARE NOT REQUIRED.</small></font></td>
            </tr>
            <tr>
              <td width="17%" height="25" align="left">Email</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="email" name="Email" size="30" placeholder="some@email.com" maxlength="50" tabindex="5"><!--font size=1 color="red">  (PLEASE ENTER CORRECT EMAIL ID. DO NOT ENTER YAHOO.CO.IN & REDIFFMAIL EMAIL IDs HERE)</font--></td>
            </tr>
	    <tr>
              <td width="17%" height="25" align="left">Alternate Email</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="email" placeholder="some@alternateemail.com" name="AltEmail" size="30" maxlength="50" tabindex="5"><!--font size=1 color="red">  (PLEASE ENTER CORRECT EMAIL ID. DO NOT ENTER YAHOO.CO.IN & REDIFFMAIL EMAIL IDs HERE)</font--></td>
            </tr>
	    <tr>
              <td width="17%" height="25" align="left">Father's Name</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="text" name="FatherName" maxlength="50" size="30" tabindex="6">&nbsp;Occupation&nbsp;<small><font color="#FF0000">*</font> </small><input type="text" name="Fatheroccupation" maxlength="50" size="30" tabindex="6"></td>
            </tr>
			 <tr>
              <td width="17%" height="25" align="left">Mother's Name</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="text" name="MotherName" maxlength="50" size="30" tabindex="6">&nbsp;Occupation&nbsp;<small><font color="#FF0000">*</font> </small><input type="text" name="Motheroccupation" maxlength="50" size="30" tabindex="6"></td>
            </tr>
			<tr>
              <td width="17%" height="25" align="left">Name of Spouse</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25"  align="left"><input type="text" name="SpouseName" maxlength="50" size="30" tabindex="6">&nbsp;Occupation&nbsp;<small><font color="#FF0000">*</font> </small><input type="text" name="Spouseoccupation" maxlength="50" size="30" tabindex="6"></td>
            </tr>
		    <tr>
              <td width="17%" height="25" align="left">Sibling's Name</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" align="center" height="25"><strong>:</strong></font></td>
              <td width="79%" height="25" align="left"><input type="text" name="SiblingName" maxlength="50" size="30" tabindex="6">&nbsp;Occupation&nbsp;<small><font color="#FF0000">*</font> </small><input type="text" name="Siblingoccupation" maxlength="50" size="30" tabindex="6"></td>
            </tr>
          </table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;
          Education</strong></font> <small>(Select all that apply)</small></font></td>
        </tr>
        <tr align="center">
          <td width="109%" height="21"><div align="center">
          <center>
          <table border="0" width="95%" cellspacing="0" cellpadding="0">
	    <tr>
              <td width="28%" height="36" align="left"> Graduate Degree:</font><small><font color="#FF0000">*</font> </small></td>
              <td width="2%" height="36" align="center"><strong>:</strong></font></td>
              <td width="14%" height="36"  align="left"><input type="checkbox" name="BA" value="BA" tabindex="11">BA</font></td>
              <td width="14%" height="36" colspan="2"><input type="checkbox" name="BCom" value="BCom" tabindex="9">BCom</font></td>
              <td width="15%" height="36"><input type="checkbox" name="BSC" value="BSC" tabindex="8">BSc</font></td>
              <td width="34%" height="36"><input type="checkbox" name="BCA" value="BCA" tabindex="7">BCA</font></td>
            </tr>
            <tr>
              <td width="28%" height="34">&nbsp;</td>
              <td width="2%" height="34" align="center">&nbsp;</td>
              <td width="49%" colspan="5" height="34"  align="left">Others <small>(Specify)</small>
              <input type="text" name="DegreeUG" size="20" maxlength="50" tabindex="12"></font></td>
            </tr>
            <tr>
              <td width="28%" height="36" align="left">Post Graduate Degree:</font></td>
              <td width="2%" height="36" align="center"><strong>:</strong></font></td>
              <td width="14%" height="36"  align="left"><input type="checkbox" name="MBA" value="MBA" tabindex="6">MBA</font></td>
              <td width="14%" height="36" colspan="2"><input type="checkbox" name="PGDBA" value="PGDBA" tabindex="7">PGDBA</font></td>
              <td width="15%" height="36"><input type="checkbox" name="PGDBM" value="PGDBM" tabindex="8">PGDBM</font></td>
              <td width="34%" height="36"><input type="checkbox" name="MA" value="MA" tabindex="9">MA</font></td>
            </tr>
            <tr>
              <td width="28%" height="34">&nbsp;</td>
              <td width="2%" height="34" align="center">&nbsp;</td>
	      <td width="14%" height="34"  align="left"><input type="checkbox" name="MSC" value="MSC" tabindex="10">MSC</font></td>
              <td width="14%" height="34"><input type="checkbox" name="MCOM" value="MCOM" tabindex="10">M. COM</font></td>
              <td width="49%" colspan="3" height="34"  align="left">Others <small>(Specify)</small>
              <input type="text" name="Degree" size="20" maxlength="50" tabindex="11"></font></td>
            </tr>			
            <tr>
              <td width="28%" height="25" align="left">Year Passed Last Degree </font><font color="#FF0000">*</font> </td>
              <td width="2%" height="25" align="center"><strong>:</strong></font></td>
              <td width="77%" colspan="5" height="25"  align="left"><input type="text" name="YearPassed" size="8" tabindex="12" maxlength="4"></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Percentage Scored <small><font color="#FF0000">*</font> </small> : &nbsp;&nbsp;<input type="text" name="txtpercentage" maxlength="5" size="8" tabindex="12"></td>
            </tr>
			

			<tr>
              <td width="28%" height="21">Have you taken AMCAT Test ?</font><small><font color="#FF0000"> *</font> </small></td>
			  <td width="2%" height="25" align="center"><strong>:</strong></font></td>
              <td width="25%" height="21" ><input type="radio" id="Yes" value="Yes" name="AMCATTest"  tabindex="13"  onChange="changetextbox(this.value);">Yes</font> </td>
              <td width="52%" height="21" colspan="4"><input type="radio" value="No"  name="AMCATTest" tabindex="13"  onChange="changetextbox(this.value);">No</font></td>
            </tr>
			<tr>
              <td width="33%" height="21"></td>
              <td width="25%" height="21" colspan="3">If  yes </font> &nbsp;&nbsp;AMCAT Test Percentile <small><font
              color="#FF0000"> *</font> </small> :<input type="text"  name="txtAMCATest"  id="txtAMCATest" maxlength="2" size="5" tabindex="3"></td>
              <td width="52%" height="21" colspan="3">&nbsp;</td>
            </tr>
          </table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td width="100%" height="5"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="5"><div align="center"><center><table border="0" width="95%"
          cellspacing="0" cellpadding="0" height="62">
            <tr>
              <td width="33%" height="21" align="left">Are you currently Employed ?</font><small><font
              color="#FF0000"> *</font> </small></td>
              <td width="15%" height="21"  align="left"><input type="radio" value="Yes" name="CurrentEmp" tabindex="13">Yes</font></td>
              <td width="52%" height="21" colspan="2"  align="left"><input type="radio" value="No" name="CurrentEmp" tabindex="13">No</font></td>
            </tr>
            <tr>
              <td width="33%" height="20"><small><div align="right"><p></small>If
              Employed <strong>:</strong></font><small><font color="#FF0000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font></small></td>
              <td width="15%" height="20"  align="left"><input type="radio" value="Full Time" name="EmpStatus" tabindex="14">Full-Time</font></td>
              <td width="16%" height="20"  align="left"><input type="radio" value="Part Time" name="EmpStatus" tabindex="14">Part-Time</font></td>
              <td width="36%" height="20"  align="left"><input type="radio" value="Work from Home" name="EmpStatus" tabindex="14">Work From Home</font></td>
            </tr>
          </table>
          </center></div></td>
        </tr>
		 <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
	<tr align="center">
          <td width="100%" height="6"><div align="center"><center><table border="0" width="85%" cellspacing="0">
            <tr>
              <td width="28%" height="25">Current Salary: </font><small><font color="#FF0000">*</font> </small> </td>
              <td width="2%" height="25" align="center"><strong>:</strong></font></td>
              <td width="77%" colspan="5" height="25"  align="left"><input type="number" name="txtCurrentSal" min="5000" max="100000" step=1000 placeholder="9999" size="8" tabindex="16" maxlength="6">/Per Month</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Expected Salary<small><font color="#FF0000">*</font> </small>: &nbsp;&nbsp;<input type="number" name="txtExpectedSal" maxlength="6" min="5000" max="100000" step=1000 placeholder="9999" size="8" tabindex="16">/Per Month</td>
            </tr>
		</table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;&nbsp;
          Work Experience</strong></font> <small>(If any) (Will be verified prior to employment)</small></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="6"><div align="center"><center><table border="0" width="85%" cellspacing="0">
            <tr>
              <td width="27%" align="center"><strong>Year</strong></font></td>
              <td width="44%" align="center"><strong>Company / Organization</strong></font></td>
              <td width="37%" align="center"><strong>Location</strong></font></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year1" size="10" tabindex="15" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company1" size="25" tabindex="16" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location1" size="15" tabindex="17" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year2" size="10" tabindex="18" maxlength="4"></td>
              <td width="44%" align="center"><input type="text" name="Company2" size="25" tabindex="19" maxlength="30"></td>
              <td width="37%" align="center"><input type="text" name="Location2" size="15" tabindex="20" maxlength="30"></td>
            </tr>
            <tr>
              <td width="27%" align="center"><input type="text" name="Year3" size="10" tabindex="21" maxlength="4"></td>
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
          <td width="100%" height="0"><div align="left"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tasks performed at your current/previous employer and reason for leaving (if currently not employed) in not exceeding 100 words:<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <textarea rows="4" name="Tasks" cols="90" tabindex="71" ></textarea><br></td>
        </tr>
        <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;
          English Proficiency Skills</strong></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="2"><div align="center"><center><table border="0" width="95%"
          cellspacing="0" cellpadding="0">
            <tr>
              <td width="36%" height="19" align="left">Spoken English Skills</td>
              <td width="5%" align="center" height="19"><strong>:</strong></font></td>
              <td width="14%" height="19"><input type="radio" value="Excellent" name="Spoken" tabindex="39">Excellent</font></td>
              <td width="11%" height="19"><input type="radio" value="Good" name="Spoken" tabindex="40" checked>Good</font></td>
              <td width="15%" height="19"><input type="radio" value="Moderate" name="Spoken" tabindex="41">Moderate</font></td>
              <td width="19%" height="19"><input type="radio" value="Poor" name="Spoken" tabindex="42">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21" align="left">Written English Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Written" tabindex="43">Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Written" tabindex="44" checked>Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Written" tabindex="45">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Written" tabindex="46">Poor</font></td>
            </tr>
			 </table>
          </center></div></td>
        </tr>
		<tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;
          Computer Skills</strong></font></td>
        </tr>
		 <tr align="center">
          <td width="100%" height="2"><div align="center"><center><table border="0" width="95%"
          cellspacing="0" cellpadding="0">
           
            <tr>
              <td width="36%" height="21"  align="left">Windows Functions &amp; Environment</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Windows" tabindex="47">Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Windows" tabindex="48" checked>Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Windows" tabindex="49">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Windows" tabindex="50">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21"  align="left">Keyboard Skills(Typing &amp; Mouse)</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Keyboard" tabindex="51">Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Keyboard" tabindex="52" checked>Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Keyboard" tabindex="53">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Keyboard" tabindex="54">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21" align="left">Microsoft Word Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Word" tabindex="55">Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Word" tabindex="56" checked>Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Word" tabindex="57">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Word" tabindex="58">Poor</font></td>
            </tr>
            <tr>
              <td width="36%" height="21" align="left">Microsoft Excel Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Excel" tabindex="59">Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Excel" tabindex="60" checked>Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Excel" tabindex="61">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Excel" tabindex="62">Poor</font></td>
            </tr>
            <!--tr>
              <td width="36%" height="21" align="left">Microsoft Access Skills</font></td>
              <td width="5%" align="center" height="21"><strong>:</strong></font></td>
              <td width="14%" height="21"><input type="radio" value="Excellent" name="Access" tabindex="63">Excellent</font></td>
              <td width="11%" height="21"><input type="radio" value="Good" name="Access" tabindex="64" checked>Good</font></td>
              <td width="15%" height="21"><input type="radio" value="Moderate" name="Access" tabindex="65">Moderate</font></td>
              <td width="19%" height="21"><input type="radio" value="Poor" name="Access" tabindex="66">Poor</font></td>
            </tr-->
            
          </table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td width="100%" height="10"></td>
        </tr>
		<tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;
          Documents to be submitted at the time of written test/interview:</strong></font></td>
        </tr>
<tr align="center">
          <td width="100%" height="1" style="padding-left:12px" align="left">
		  1. Detailed Curriculum Vitae/Resume<br>
2. Latest Passport Size Photograph<br>
3. Photo ID Proof (Copy of Passport or Driving License or Voters ID Card or PAN Card or Savings Account or Aadhar Card or Ration Card)
</td>
        </tr>
<tr align="center">
          <td width="100%" height="21" bgcolor="#E8E8E8"><div align="left"><p><font color="#804040"><strong>&nbsp;&nbsp;
          More about yourself: </strong></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="1" style="padding-left:12px"><div align="left"><font color="#FF0000"><small>*</small>
	<!--Please WRITE IN YOUR OWN WORDS about yourself, your family, interests, special skills, hobbies, and anything that would enable us to know more about you as a person. Please limit to 7000 characters. The following write-up submitted by you will be one of the key bases of our recruitment and selection process.-->Please tell us about yourself; your family; your areas of highest proficiency; special skills; or other items that may contribute to your abilities in performing the above mentioned position and enable us to know more about you as a person. We are mainly looking for quality English expression in your write-up. <!--Minimum number of words for qualifying the screening process is 500 (3500 characters), while maximum words can go up to 1000 (7000 characters).--> This section forms an important basis for shortlisting your application. Please do not paste your resume in the box below. <!--Pasting your resume and/or duplicated content would automatically lead to disqualification of your application.--></font>
	
</em></font></td>
        </tr>
        <tr align="center">
          <td width="100%" height="0"><div align="left"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <textarea rows="10" name="Skills" cols="90" tabindex="71" placeholder="This section forms an important basis for shortlisting your application. Please do not paste your resume in this box. Pasting your resume and/or duplicated content would automatically lead to disqualification of your application." onKeyPress=check_length(this.form); onKeyDown=check_length(this.form);></textarea><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input size=2 value=7000 name=text_num> Characters Left&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Word Count: <input size=2 value=500 name=text_word> </td>
        </tr>
        <tr align="center">
          <td width="100%" height="0"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="0" align="left"><b>Thanks for applying. We will get back to you shortly. Please keep checking your Inbox (and sometimes Spam/Junk Folders also) for communication from BizAcumen. All of us at BizAcumen wish you the very best in your pursuit of a suitable career!</b></font><td></tr>
	<tr align="center">
          <td width="100%" height="0"><b><b><td></tr>
        <tr align="center">
          <td width="100%" height="0"><div align="center"><center><p><input class="butn" type="submit" value="Submit" name="BtnSubmit" tabindex="72">
          </td>
        </tr>
        <tr align="center">
          <td width="100%" height="0"></td>
        </tr>
        <tr align="center">
          <td width="100%" height="0"></td>
        </tr>
      </table>
      
    </form>
    </td>
  </tr>
</table>

</td>
          </tr>
</table></td>
      </tr>
    </td>
  </tr>
    <!--Body Ends here-->
  
</table>
<tr><td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22" bgcolor="#373737" align="center" class="style1"><font color="white">© <script language="JavaScript">document.write(new Date().getFullYear());</script> BizAcumen Research Private Limited</font></td>
  </tr>
</table></td></tr>
</body>
</html>

