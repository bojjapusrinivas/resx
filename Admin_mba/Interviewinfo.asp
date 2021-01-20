<%@ Language=VBScript %>
<!--#include file="ASPIncludes/DBopen.asp"-->
<!--#include file="ASPIncludes/ADOVBS.inc"-->
<!--include file="ASPIncludes/SiteFunctions.asp"-->

<%

Dim strname,strID,strIntviewEwer,strperradio,strfamily,strcoforigin,strResradio,strspokenEng,strspkEndradio,strCompany,stryears,strsalary,strprofile,strotherinfo

If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
if trim(Request("ID")) <>"" then
strID =  trim(Request("ID"))
end if


Dim varint,varmsg


if trim(Request("msg"))="1" then
    varmsg =  "Details Added Successfully."

elseif trim(Request("msg"))="2" then
    varmsg =  "Details Updated Successfully."
end if

strIntviewEwer=session("user_name")


function fnchecked(val1,val2)
		if (strComp(val1,val2,0) = 0 ) then
			fnchecked= "checked"
		else
			fnchecked= ""
		end if
end function


con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)


if trim(Request("ID")) <>"" then
set rs=server.CreateObject("ADODB.Recordset")

	rs.ActiveConnection=con
	       '' response.write("select *,dbo.returnname(rec_ID,'G') as cname from Interview_Hyd_Details where rec_ID = '" & trim(strID) & "'" )
''response.write "select *,new_sisuser.returnname(rec_ID,'G') as cname from Interview_Hyd_Details where rec_ID = '" & trim(strID) & "'" 
''response.end
	rs.open ("select *,dbo.returnname(rec_ID,'G') as cname from Interview_Hyd_Details where rec_ID = '" & trim(strID) & "'" )

	if not rs.eof Then
	
		'strID=rs("Rec_ID")
		strname = trim(rs("cname"))
                if trim(rs("Interviewewer")) <> "" then
		  strIntviewEwer = rs("Interviewewer")
		else
                   strIntviewEwer = session("user_name")
		end if
		strperradio=rs("Personality")
		'strtxtperradio=rs("Personality")
		strfamily=rs("AboutFamily")
		'strcoforigin=rs("CityofOrigin")
		strResradio=rs("Residentof")
		'strtxtResradio=rs("Residentof")
		strspkEndradio=rs("SpokenEnglish")		
		strdrecoderadio=rs("DressCode")
		strCompany=rs("Company")
		stryears=rs("Years")
		strsalary=rs("Salary")
		'strprofile=rs("Profile")
		strotherinfo=rs("Otherinfo")
	
	End if
          rs.close
          
	set rs=nothing	

           
         set rsname=server.CreateObject("ADODB.Recordset")

	rsname.ActiveConnection=con
	rsname.open ("select dbo.returnname(" & trim(strID) & ",'H') ")
        
	if not rsname.eof Then
           strname = trim( rsname(0))
        end if
  		
         rsname.close          
	set rsname=nothing	



end if
if trim(strfamily) ="" then

	strfamily="Education:&#13;&#10;Previous Experience:&#13;&#10;Father:&#13;&#10;Mother:&#13;&#10;Siblings:&#13;&#10;Spouse:&#13;&#10;In-Laws:"
end if


IF (Trim(request("btnsubmit")))="Submit"  Then
    

dim varpers,varrec
if Trim(request("perradio")) <> "" then
 varpers= Trim(request("perradio"))
end if
if Trim(request("txtother")) <>"" then 
  varpers= Trim(request("txtother"))
end if

if Trim(request("Resradio")) <> "" then
 varrec= Trim(request("Resradio"))
end if
if Trim(request("txtResother")) <>"" then 
  varrec= Trim(request("txtResother"))
end if
 
        set cmdEdit=server.CreateObject("ADODB.Command")
        cmdEdit.ActiveConnection = con
         with cmdEdit
                .CommandText = "SPInterview_Hyd_Details"
                .CommandType = adcmdStoredProc
                .Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"INSERT")
                .Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(Request("txtid")))
                .Parameters.Append .CreateParameter ("@MyInterviewewer",advarchar,adparamInputOutput,50,Trim(request("txtIntviewEwer")))
                .Parameters.Append .CreateParameter ("@MyAttributes",advarchar,adparamInputOutput,200,"Y")
                .Parameters.Append .CreateParameter ("@MyPersonality",advarchar,adparamInputOutput,200,varpers)
		.Parameters.Append .CreateParameter ("@MyAboutFamily",advarchar,adparamInputOutput,4000,Trim(request("txtfamily")))
		.Parameters.Append .CreateParameter ("@MyCityofOrigin",advarchar,adparamInputOutput,100,"")
		.Parameters.Append .CreateParameter ("@MyResidentof",advarchar,adparamInputOutput,200,varrec)
		.Parameters.Append .CreateParameter ("@MySpokenEnglish",advarchar,adparamInputOutput,50,Trim(request("spkEndradio")))
		.Parameters.Append .CreateParameter ("@MyDressCode",advarchar,adparamInputOutput,50,Trim(request("drecoderadio")))
		.Parameters.Append .CreateParameter ("@MyCompany",advarchar,adparamInputOutput,100,Trim(request("txtCompany")))
		.Parameters.Append .CreateParameter ("@MyYears",advarchar,adparamInputOutput,50,Trim(request("txtyears")))
		.Parameters.Append .CreateParameter ("@MySalary",advarchar,adparamInputOutput,50,Trim(request("txtsalary")))
		.Parameters.Append .CreateParameter ("@MyProfile",advarchar,adparamInputOutput,1000,"")
		.Parameters.Append .CreateParameter ("@MyOtherinfo",advarchar,adparamInputOutput,3000,Trim(request("txtotherinfo")))
		.Parameters.Append .CreateParameter ("@MyInterviewDate",adDate,adparamInputOutput,,Now())
                .Parameters.Append .CreateParameter ("@MyResult",adInteger,adparamInputOutput,,1)
                .Execute
            end with
        loadedval = cmdEdit.Parameters("@MyResult") 
		updateStr="update TBL_SIS_Applications set ana_no='BNA" & trim(Request("txtid")) & "',testwriteupdate='" & Date & "' where rec_id =" & trim(Request("txtid"))
	con.execute(updatestr)
      response.redirect("Interviewinfo.asp?ID="&trim(Request("txtid"))&"&msg="&loadedval)
        

End if

con.close()

%>





<html>
<head>
<title>View Applicant Details</title>
</head>
<script language="JavaScript">
function validatefrom()
{
o = document.frmsis;
// Grabs all inputs - radio, checkbox, text, buttons and lists -sticks them in an array
allInputs = document.getElementsByTagName("input");
var last = "NameUnlikelyToBeUsedAsAnElementName";

// walk through the array
for (i = 0; i< allInputs.length; i++)
{
        var input = allInputs[i];
        if (input.name == last) continue; 

       
        else if (input.type == "radio" )
        {    
            last = input.name;  
            var radios = document.getElementsByName(input.name);
            var radioSelected=false;

        
        for (j=0; j < radios.length; j++)
            {
                    if(radios[j].checked)
                    {
                       radioSelected=true;
                       break;  
                    }
            }

         if ((!radioSelected)&&(input.name == "perradio")&&((o.txtother.value =="")||(o.txtother.value ==" ")))
            {        
 		        if((input.name == "perradio"))
                      {alert("You must select Personalitys.");}   
                       
                    input.focus();
                    return false;
            }  

                if ((!radioSelected)&& (input.name == "Resradio")&&((o.txtResother.value =="")||(o.txtResother.value ==" ")))
            {        
 		        if((input.name == "Resradio"))
                       {alert("You must select Resident.");} 
                       
                    input.focus();
                    return false;
            }  

            if ((!radioSelected)&& (input.name == "spkEndradio"))
            {        
 		         if((input.name == "spkEndradio"))
                       {alert("You must select Spoken English.");}                     
 
                       
                    input.focus();
                    return false;
            }     

          if ((!radioSelected)&& (input.name == "drecoderadio"))
            {        
 		                          
 
                       if((input.name == "drecoderadio"))
                       {alert("You must select Dress code.");}  
					   
                    input.focus();
                    return false;
            }                                
        }

}



return true;
                         


}
</script>
<style>

text
{
    COLOR: black;
    FONT-FAMILY: Verdana;
    size : 1
}
</style>

<link href="../globind.css" rel="stylesheet" type="text/css">
<body topmargin="0" leftmargin="0" bottommargin="0" rightmargin="0">
<form method="post" action="Interviewinfo.asp" name="frmsis">

<table border="1" width="100%" height="100%" cellspacing="0" cellpadding="0" bordercolor="#000080" calss="text">

                 <tr>
                      <td align="center" valign="top" >
		 
                             <table border="1" width="95%" bordercolor="#005563" cellspacing="0" cellpadding="0" style="border-collapse:collapse;"> 


                                            <tr>
                     					<td align="center">
		 
                             				   <table border="1" width="100%" bordercolor="#005563" cellspacing="2" cellpadding="3" style="border-collapse:collapse;"> 
			 
                                                           
                                                                              
			<tr>
    				<td width="100%" bgcolor="#456F77" colspan=2 ><p align="center"><strong><big><font color="#FFFFFF">Candidate Details</font></big></strong></td>
  			</tr>
                          <tr><td colspan=2 align="center"><font face='verdana' size='2' color="red"><%=varmsg%></font></td></tr>
 			  <tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Candidate Name &nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left" ><font face='verdana' size='2'>&nbsp;<input  name="txtname" readonly value="<%=trim(strname)%>"></font></td>
     		 	  </tr>
			  <tr>
        	         			<td width="25%" height="10" align="right" ><font face='verdana' size='2'>Candidate ID&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left"><font face='verdana' size='2'>&nbsp;<input  name="txtID" readonly value="<%=strID%>"></font></td>
     		 	  </tr>
 			   <tr>
        	         			<td width="25%" height="10" align="right" class="text"><font face='verdana' size='2'>Interviewer&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left" class="text"><font face='verdana' size='2'>&nbsp;<input name="txtIntviewEwer" value="<%=strIntviewEwer%>"></font></td>
     		 	  </tr>
			<tr>
        	         			<td width="100%" height="10" align="left" colspan="2" bgcolor="#456F77"><font color="#FFFFFF" face='verdana'>Attributes</font></td>
     		 	  </tr>
 			 <tr>
        	         			<td width="25%" height="10" align="right" valign="middle"><font face='verdana' size='2'>Personality&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left" valign="middle"><font face='verdana' size='2'>
                                                        <input type="radio" name="perradio" value="Pleasing" <%=fnchecked(trim(strperradio),"Pleasing")%>>&nbsp;Pleasing&nbsp;
                                                        <input type="radio" name="perradio" value="Aggressive" <%=fnchecked(trim(strperradio),"Aggressive")%>>&nbsp;Aggressive&nbsp;
							<input type="radio" name="perradio" value="Introvert" <%=fnchecked(trim(strperradio),"Introvert")%>>&nbsp;Introvert&nbsp;
							<input type="radio" name="perradio" value="Extrovert" <%=fnchecked(trim(strperradio),"Extrovert")%>>&nbsp;Extrovert&nbsp;&nbsp;Other&nbsp;<input type="text" name="txtother" value="<%=strperradio%>"></font>

						</td>
     		 	  </tr>
 			<tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'><!--Family background&nbsp;-->Comments/Observations&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;<textarea name="txtfamily" rows=10 cols=60><%=strfamily%></textarea></td>
     		 	  </tr>
                          
 			  <!--tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>City of Origin&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;<input name="txtcoforigin" value="<%=strcoforigin%>" ></td>
     		 	  </tr-->
			   <tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Resident of&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left"><font face='verdana' size='2'>
                                                      <!-- <input type="radio" name="Resradio" value="Delhi" <%=fnchecked(trim(strResradio),"Delhi")%>>&nbsp;Delhi&nbsp;&nbsp;
                                                        <input type="radio" name="Resradio" value="Gurgaon"<%=fnchecked(trim(strResradio),"Gurgaon")%>>&nbsp;Gurgaon&nbsp;&nbsp;-->
							<input type="radio" name="Resradio" value="Hyderabad" <%=fnchecked(trim(strResradio),"Hyderabad")%>>&nbsp;Hyderabad&nbsp;&nbsp;							
                                                        &nbsp;&nbsp;Other&nbsp;:&nbsp;<input type="text" name="txtResother" value="<%=strResradio%>"></font>

						</td>
     		 	  </tr>
				
			 <tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Spoken English&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">
        						<input type="radio" name="spkEndradio"  value="Excellent" <%=fnchecked(trim(strspkEndradio),"Excellent")%>><font face='verdana' size='2'>&nbsp;Excellent&nbsp;&nbsp;
                                                        <input type="radio" name="spkEndradio"  value="Good" <%=fnchecked(trim(strspkEndradio),"Good")%>>&nbsp;Good&nbsp;&nbsp;
							<input type="radio" name="spkEndradio"  value="Satisfactory" <%=fnchecked(trim(strspkEndradio),"Satisfactory")%>>&nbsp;Satisfactory&nbsp;&nbsp;
							<input type="radio" name="spkEndradio"  value="NotGood" <%=fnchecked(trim(strspkEndradio),"NotGood")%>>&nbsp;Not Good&nbsp;&nbsp;
						       <input type="radio" name="spkEndradio"   value="Bad" <%=fnchecked(trim(strspkEndradio),"Bad")%>>&nbsp;Bad&nbsp;&nbsp;</font>
						</td>
     		 	  </tr>
				<tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Dress Code&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left"><font face='verdana' size='2'>
        						<input type="radio" name="drecoderadio"  value="Decent" <%=fnchecked(trim(strdrecoderadio),"Decent")%>>&nbsp;Decent&nbsp;&nbsp;
                                                        <input type="radio" name="drecoderadio"  value="Western" <%=fnchecked(trim(strdrecoderadio),"Western")%>>&nbsp;Western&nbsp;&nbsp;
							<input type="radio" name="drecoderadio"  value="Indian" <%=fnchecked(trim(strdrecoderadio),"Indian")%>>&nbsp;Indian&nbsp;&nbsp;
							<input type="radio" name="drecoderadio"  value="NotAcceptable" <%=fnchecked(trim(strdrecoderadio),"NotAcceptable")%>>&nbsp;Not Acceptable&nbsp;&nbsp;</font><br>
						
						</td>
     		 	  </tr>
			
			  <!--tr>
        	         			<td width="100%" height="10" colspan=2 bgcolor="#456F77"><font color="#FFFFFF" face='verdana'>Previous Experience (If any)</font> </td>
     		 	  </tr>
				<tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Company&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;--><input type="hidden" name="txtCompany"  value="<%=strCompany%>"><!--</td>
     		 	  </tr>
				<tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Years&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;<font face='verdana' size='2'>--><input type="hidden" name="txtyears" value="<%=stryears%>"><!--</td>
     		 	  </tr>

				<tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Salary&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;--><input type="hidden" name="txtsalary" value="<%=strsalary%>"><!--</td>
     		 	  </tr>
				<!--tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Profile&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;--><input type="hidden" name="txtprofile" value="<%=strprofile%>"><!--</td>
     		 	  </tr->
			<tr>
        	         			<td width="25%" height="10" align="right"><font face='verdana' size='2'>Other Information&nbsp;:&nbsp;</font></td>
						<td width="75%" height="10" align="left">&nbsp;--><div style="display:none"><textarea id="txtotherinfo" name="txtotherinfo" rows=5 cols=40 ><%=strotherinfo%></textarea></di>
     		 <!--	  </tr> -->

  				<!--tr>
        	         			<td width="100%" height="10" colspan=2>&nbsp;</td>
     		 	  </tr-->
			  <tr>
        	         			<td width="100%" height="10" colspan=2 align="center"><INPUT type="submit" value="Submit"  name="btnsubmit" onclick="return validatefrom();" >&nbsp; <INPUT type="button" value="Close"  name="btnclose" Onclick="window.close();"></td>
     		 	  </tr>
	                       <!--tr>
        	         			<td width="100%" height="10" colspan=2>&nbsp;</td>
     		 	  </tr-->



							    </table>	

	          
                    					</td>
                                            </tr> 

           

                            </table>	

	          
                    </td>
                 </tr> 

  </table>
</form>
</body>
</html>
