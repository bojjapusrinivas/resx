function firstFldFocus() 
{
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{
			if ((field.elements[i].type == "text") || (field.elements[i].type == "password")  || (field.elements[i].type == "textarea") || (field.elements[i].type.toString().charAt(0) == "s")) 
			{
				document.forms[0].elements[i].focus();
				break;
			}
		}
	}
}

function wopen(myurl)
	{
		detailswindow=window.open(myurl,'detailswindow','toolbar=no,menubar=no,status=no,scrollbars=yes,resizable=no,width=500,height=500');
	}
function getfieldname(val)
{
var onform=new Array(["bank_name","Bank Name"],["bank_routing","Bank Routing Number"],["name","Courier Service Provider's name"],["email","Email of the Courier Service Provider"]);
for(i=0;i<onform.length;i++)
{
if(onform[i][0]==val)
 return onform[i][1];
}
return "nothing";
}	

function validatefrm()
{
  for(i=0;i<document.forms[frmname].elements.length;i++)
  {
   mytrim(document.forms[frmname].elements[i]);  
   if(((document.forms[frmname].elements[i].value=="")||(document.forms[frmname].elements[i].value==" "))&&(document.forms[frmname].elements[i].disabled==false))
   {
	 var optfield=false;
	 
	 for(n=0;((n<optfields.length)&&(optfield==false));n++)
	  {
	
		if(mytrimval(optfields[n]).toLowerCase()==mytrimval(document.forms[frmname].elements[i].name).toLowerCase())
		optfield=true;
		
	  }
	 if(optfield==false)
	  {		
	   
		var val1=document.forms[frmname].elements[i].name;
		var val=getfieldname1(document.forms[frmname].elements[i].name);
			if(val =="nothing")
				alert(val1+ " cannot be left blank.");
			else
				alert(val+ " cannot be left blank." );
			if (document.forms[frmname].elements[val1].type!="hidden")				
			document.forms[frmname].elements[val1].focus();			
		return false;
      }
    }   
  }
  for (j=0;j<document.forms[frmname].elements.length;j++)
   {
	 for(k=0;k<valstr.length;k++)
	  {
		if(document.forms[frmname].elements[j].name==valstr[k][0])
		{
			o=document.forms[frmname].elements[j];			
			if(valonsubmit(o,valstr[k][1])==false)
			 {
			  return false;
			 }			
			if (o.value.length>valstr[k][2])
			{
				alert(getfieldname1(o.name)+" value length should not be more than "+valstr[k][2]);
				o.focus();
				return false;
			}
		}
	  }
	}   
  return true;
}


function validatefrm_sch()
{
  for(i=0;i<document.forms[frmname].elements.length;i++)
  {
   mytrim(document.forms[frmname].elements[i]);  
   if(((document.forms[frmname].elements[i].value=="")||(document.forms[frmname].elements[i].value==" "))&&(document.forms[frmname].elements[i].disabled==false))
   {
	 var optfield=false;
	 
	 for(n=0;((n<optfields.length)&&(optfield==false));n++)
	  {
	   
	     v1=(document.forms[frmname].elements[i].name).toLowerCase();
	   //  alert(v1.slice(0,-1));
	     
	     
		if(mytrimval(optfields[n]).toLowerCase()== v1.slice(0,-1))
		optfield=true;
		
	  }
	 if(optfield==false)
	  {		
	   
		var val1=document.forms[frmname].elements[i].name;
		var val=getfieldname1(document.forms[frmname].elements[i].name);
			if(val =="nothing")
				alert(val1+ " cannot be left blank.");
			else
				alert(val+ " cannot be left blank." );
			if (document.forms[frmname].elements[val1].type!="hidden")				
			document.forms[frmname].elements[val1].focus();			
		return false;
      }
    }   
  }
  for (j=0;j<document.forms[frmname].elements.length;j++)
   {
	 for(k=0;k<valstr.length;k++)
	  {
		if(document.forms[frmname].elements[j].name==valstr[k][0])
		{
			o=document.forms[frmname].elements[j];			
			if(valonsubmit(o,valstr[k][1])==false)
			 {
			  return false;
			 }			
			if (o.value.length>valstr[k][2])
			{
				alert(getfieldname1(o.name)+" value length should not be more than "+valstr[k][2]);
				o.focus();
				return false;
			}
		}
	  }
	}   
  return true;
}


function valonsubmit(o,t)
{
	mytrim(o);
	switch(t)
	{
	 case("numvalidate"):
	 {
	   numvalidate(o);
	   break;
	  }
	 case("charvalidate"):
	  {
	   charvalidate(o);
	   break;
	  }
	  case("numvalidate1"):
	 {
	   numvalidate1(o);
	   break;
	  }
	  case("charvalidateaddress"):
	  {
	   charvalidateaddress(o);
	   break;
	  }
	  case("validatename"):
	  {
	   validatename(o);
	   break;
	  }
	  case("validatename1"):
	  {
	   validatename1(o);
	   break;
	  }
	  case("validateuserid"):
	  {
	   validateuserid(o);
	   break;
	  }
	  case("numb"):
	  {
	   numb(o);
	   break;
	  }	  
	  
	  case("commvalidate"):
	  {
	   commvalidate(o);
	   break;
	  }
	  case("validatetel"):
	  {
	   validatetel(o);
	   break;
	  }
	  case("validemail"):
	  {
	   validemail(o);
	   break;
	  }
	  
	  case("vallogin"):
	  {
	   vallogin(o);
	   break;
	  }
	  case("validemailmulti"):
	  {
	   validemailmulti(o);
	   break;
	  }
	  case("consumernovalidate"):
	  {
		consumernovalidate(o);
		break;
	  }	  
	  case("valweb_address"):
	  {
	   valweb_address(o);
	   break;
	  }
	  case("validateweb"):
	  {
	   validateweb(o);
	   break;
	  }
	 }	
}


function getfieldname1(val)
{
for(i=0;i<onform.length;i++)
{
if(onform[i][0]==val)
 return onform[i][1];
}
return "nothing";
}	



function gtdate(d, m, y)
{
	if (m==2)
	{
		if (d>29) 
		{
			alert("Invalid Date! February cannot have more than 29 days");
			return false;
		}
		if ((y%4)!==0)
		{
			if (d>=29)
			{
				alert("Invalid Date! February cannot have more than 28 days");
				return false;
			}
		}		
	}
	else if (d==31)		
	{
		if (m==4)
			{
				alert ("Invalid date! April cannot have more than 30 days ");
				return false;
			}
		if (m==6)
			{
				alert ("Invalid date! June cannot have more than 30 days");
				return false;
			}
		if (m==9)
			{
				alert ("Invalid date! September cannot have more than 30 days");
				return false;
			}
		if (m==11)
			{
				alert ("Invalid date! November cannot have more than 30 days");
				return false;
		
			}
		}
	return true;
}

function gtmonth(m)
{

	switch (m.toUpperCase())
	{
		case "JAN":
			return 1;
		case "FEB":
			return 2;
		case "MAR":
			return 3;
		case "APR":
			return 4;
		case "MAY":
			return 5;
		case "JUN":
			return 6;
		case "JUL":
			return 7;
		case "AUG":
			return 8;
		case "SEP":
			return 9;
		case "OCT":
			return 10;
		case "NOV":
			return 11;
		case "DEC":
			return 12;			
		case "JANUARY":
			return 1;
		case "FEBRUARY":
			return 2;
		case "MARCH":
			return 3;
		case "APRIL":
			return 4;
		case "JULY":
			return 7;
		case "AUGUST":
			return 8;
		case "SEPTEMBER":
			return 9;
		case "OCTOBER":
			return 10;
		case "NOVEMBER":
			return 11;
		case "DECEMBER":
			return 12;
	}
}
			
function psvalidate()
{ 
  var m_day;
  var m_month;
  var m_year;
  var m_date;
  var startdate;
  var stopdate;
  var flag;
  
  for(i=0;i<document.f1.elements.length;i++)
  	{
   if(((document.f1.elements[i].value=="")||(document.f1.elements[i].value==" "))&&(document.f1.elements[i].name != "submit") &&(document.f1.elements[i].name != "address2"))
   {
     var val1=document.f1.elements[i].name;
     var val=getfieldname(document.f1.elements[i].name);
	 if(val =="nothing")
	 alert(val1+ " cannot be left blank.");
	 else
	 alert(val);	 
	 document.f1.elements[val1].focus();
     return false;
    }
  }
    
  if(document.f1.elements["period"].value=="select")
  {
	  alert(" select the schedule period");
	document.f1.elements["period"].focus();
	return false;
  }
  m_day = document.f1.elements["from_day"].value;
  m_month = getmonth(document.f1.elements["from_month"].value);
  m_year=document.f1.elements["from_year"].value;
  m_year = "20" + m_year;
  m_date= m_month + "/" + m_day + "/" + m_year;
  startdate = new Date(m_date);
  flag = getdate(m_day, m_month, m_year);
  if(flag==false)
  {
	return false;
  }  
  
  m_day = document.f1.elements["to_day"].value;
  m_month = gtmonth(document.f1.elements["to_month"].value);
  m_year=document.f1.elements["to_year"].value;
  m_year = "20" + m_year;
  m_date = m_month + "/" + m_day + "/" + m_year;
  stopdate = new Date(m_date); 
  flag = getdate(m_day, m_month, m_year);
  if (flag==false)
  {
	  return false;
  }
  
  var today = new Date();
 
  if (startdate<today)
  {
	alert ("Starting Date cannot be lesser than today's date")
	return false;
  }
  if (stopdate<today)
  {
	alert ("Stop Date cannot be lesser than today's date")
	return false;
  }	
  if (stopdate<startdate)
  {
	alert ("Stop Date cannot be lesser than starting date")
	return false;
  } 
   
 if(stopdate==startdate)
  {
  alert("The Start Date and the End Date cannot be the same")
  return false;
  
  }
  
  if(document.f1.elements["period"].value=="select")
  {
	alert(" select the schedule period");
	document.f1.elements["period"].focus();
	return false;
  }
  return true
}

function charvalidate(o)
{
  mytrim(o);
  val=o.value;
  var spchr1 = new Array(",","*","+","~","!","#","$","%","^","{","}","[","]",":",";","'","?","<",">","/","|","@","\\");
  p = spchr1.length;
  /////
  var  theField=""; 
  var strobjName=o.name;
  strobjName=strobjName.toLowerCase();
  if(strobjName=="town")
	theField="Town";
  if(strobjName=="county")
	theField="County";
if(strobjName=="discription")
	theField="Description";
  
  if(val!=" ")
  	{
  		if(val!="")
  		{
  			if(!isNaN(val))
  			{
   				if(theField!="")
   					alert(theField+" cannot have only digits");
   				else
   					alert("Enter valid data");
   				o.value="";
   				o.select();
   				o.focus(); 
   				return false;
   			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					
					if (spchk1 >= 0)
					{
						if(theField!="")
   							alert(theField+" can have a/A-z/Z, 0-9, .(DOT) values only");
   						else
   							alert("Enter valid value without any special characters");
						
						o.value="";
						o.select();
						o.focus();
						
						return false;
						break;
					}
				}
			}
		}
	}

}  


function acodevalidate(o)
{
  mytrim(o);
  val=o.value;
  var spchr1 = new Array(",","*","+","~","!","#","$","%","^","{","}","[","]",":",";","'","?","<",">","/","|","@");
  p = spchr1.length;
  if(val!=" ")
  	{
  		if(val!="")
  		{
  			for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					
					if (spchk1 >= 0)
					{
						alert("Enter valid value without any special characters.");
						o.value="";
						o.select();
						o.focus();
						
						return false;
						break;
					}
				}
		}
	}

}  


function charfoldervalidate(o)
{
  mytrim(o);
  val=o.value;
  var spchr1 = new Array(",","*","+","~","!","#","$","%","^","{","}","[","]",":",";","'","?","<",">",".","/","|","@"," ","\\");
  p = spchr1.length;
  // dbLoginName LoginID
 var theField="";
  if((o.name=="firmid")||(o.name=="AccountantID")||(o.name=="ClientID"))
	theField="Account Code";
  if((o.name=="LoginID")||(o.name=="Loginid"))
	theField="Login ID";
  if(val!=" ")
  	{
  		if(val!="")
  		{
  			for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					
					if (spchk1 >= 0)
					{
						if(theField!="")
						{
							alert(theField+" can have a/A-z/Z, 0-9 and _ values only");
						}
						else
						{
							alert("Enter valid value without any special characters or space except _");
						}
						
						o.value="";
						o.select();
						o.focus();
						
						return false;
						break;
					}
				}
		}
	}

}  

function charvalidatecheck(o)
{
  mytrim(o);
  val=o.value;
  var spchr1 = new Array(",","*","+","~","!","#","$","%","^","{","}","[","]",":",";","'","?","<",">","/","|","@");
  p = spchr1.length;
  if(val!=" ")
  	{
  		if(val!="")
  		{
  			if(!isNaN(val))
  			{
   				//alert("Enter valid data.");
   				o.value="";
   				o.select();
   				o.focus(); 
   				return false;
   			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					
					if (spchk1 >= 0)
					{
						//alert("Enter valid value without any special characters.");
						o.value="";
						o.select();
						o.focus();
						
						return false;
						break;
					}
				}
			}
		}
	}

}  

function charvalidateaddress(o)
{
  mytrim(o);
  val=o.value;  
  var spchr1 = new Array("~","!","%","^","'","?","<",">","|","@","$","\"");
  p = spchr1.length;
  if(val!=" ")
  	{
  		if(val!="")
  		{
  			/*if(!isNaN(val))
  			{
   				alert("Enter proper address.")
   				o.value=""
   				o.select();
   				o.focus(); 
   				return false     
   			}
			else
			{*/
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					if (spchk1 >= 0)
					{
						alert("Address can have a/A-z/Z, 0-9, *, # values only");
						o.value="";
						o.select();
						o.focus();
						return false;
						break;
					}
				}
			//}
		}
	}
return true
}  

function validatename(o)
{
  mytrim(o);
  val=o.value;
  var spchr = new Array("@","*","+","~","!","#","$","%","^","{","}","[","]",":",";","?","<",">","/","|","-","`","\\","'","\"");
  	l = spchr.length;
  //firmname	
  if(val!=" ")
  {
  	if(val!="")
  	{
  		if(!isNaN(val))
 		{
  			alert("Name cannot have only digits")
   			o.select();
   			o.focus();      
   			return false;
		}
		else
		{
		for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >=0)
					{
						alert("Name can have a/A-z/Z, 0-9, .(DOT) values only");
						o.focus();
						o.select();
						return false;						
					}
				}
		}
	}
 }
}  

function validatename1(o)
{
  mytrim(o);
  val=o.value;
  var spchr = new Array("*","@","+","~","!","#","$","%","^","{","}","[","]",":",";","'","?","<",">","/","|","-","_","`");
  l = spchr.length;	
  if(val!=" ")
  {
  	if(val!="")
  	{
  		if(!isNaN(val))
 		{
  			alert("Enter valid data.")
   			o.select();
   			o.focus();      
   			return false;
		}
		else
		{
		for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk>=0)
					{
						alert("Enter valid data.");
						o.focus();
						o.select();
						return false;						
					}
				}
		}
	}
 }
}

function validateuserid(o)
{
  mytrim(o);
  myval=o.value; 
  var spchr = new Array("&","*","+","~","!","#","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","-","@");
  l = spchr.length;
	
  if(myval!=" ")
  {
  if(myval!="")
  {
	for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter valid User ID");
						//o.value="";
						o.focus();
						o.select();
						return false;
						
					}
				}
	
}}
return true;
} 


function editPhone(evt) {

var isNav = (navigator.appName.indexOf("Netscape") != -1);
var isIE = (navigator.appName.indexOf("Microsoft") != -1);
var isIE4 = (msieversion() <=4);

if (isIE) {

        if (isIE4 == true) {
        var keycode = window.event.keyCode;
        var pos     = this.value.length + 1;

        if (pos == 1) return true;
        if (pos == 2) return true;
        if (pos == 3) return true;
        if (pos == 4) return true;
        if (pos == 5) return true;
        if (pos == 6) return true;
        if (pos == 7) return true;
        if (pos == 8) return true;
        if (pos == 9) return true;
        if (pos == 10) return true;
        if (pos == 11) return true;
        if (pos == 12) return true;
        if (pos == 13) return true;
        if (pos == 14) return true;
        if (keycode == 13) return true;

        return false;

        } else {

        var keycode = window.event.keyCode;
        var shift   = window.event.shiftKey;
        var ctrl    = window.event.ctrlKey;
        var alt     = window.event.altKey;
        var digit   = (!shift && !ctrl && !alt && keycode >= 48 && keycode <= 57);
        var lparen  = (shift  && !ctrl && !alt && keycode == 40);
        var rparen  = (shift  && !ctrl && !alt && keycode == 41);
        var space   = (!shift && !ctrl && !alt && keycode == 32);
        var dash    = (!shift && !ctrl && !alt && keycode == 45);
        var slash   = (!shift && !ctrl && !alt && keycode == 47);

        var pos     = this.value.length + 1;

        if (keycode == 13) return true; 

        if (!lparen && !rparen && !space && !dash && !digit) return false;

        if (pos == 1  && lparen) return true;
        if (pos == 1  && digit) { this.value = '('; return true; }

        if (pos == 2  && digit) return true;
        if (pos == 3  && digit) return true;
        if (pos == 4  && digit) return true;

        if (pos == 5  && rparen) { this.value += ') '; return false; }
        if (pos == 5  && dash)   { this.value += ') '; return false; }
        if (pos == 5  && slash)  { this.value += ') '; return false; }
        if (pos == 5  && space)  { this.value += ') '; return false; }
        if (pos == 5  && digit)  { this.value += ') '; return true; }

        if (pos == 6  && space) return true;
        if (pos == 6  && digit) { this.value += ' '; return true; }

        if (pos == 7  && digit) return true;
        if (pos == 8  && digit) return true;
        if (pos == 9  && digit) return true;

        if (pos == 10 && dash) return true;
        if (pos == 10 && space) { this.value += '-'; return false; }
        if (pos == 10 && digit) { this.value += '-'; return true; }

        if (pos == 11 && digit) return true;
        if (pos == 12 && digit) return true;
        if (pos == 13 && digit) return true;
        if (pos == 14 && digit) return true;

        return false;

        }

}

if (isNav) {
var keycode = evt.which;
var charcode = String.fromCharCode(evt.which);
var bs = String.fromCharCode(evt.which);
var shift   = evt.modifiers & Event.SHIFT_MASK;
var ctrl    = evt.modifiers & Event.CTRL_MASK;
var alt     = evt.modifiers & Event.ALT_MASK
var lparen  = (shift  && !ctrl && !alt && keycode == 40);
var rparen  = (shift  && !ctrl && !alt && keycode == 41);
var space   = (!shift && !ctrl && !alt && keycode == 32);
var dash    = (!shift && !ctrl && !alt && keycode == 45);
var digit   = (keycode >= 48 && keycode <= 57);

if (bs == "\b") return true;
var pos     = this.value.length + 1;

if (pos == 1) return true;
if (pos == 2) return true;
if (pos == 3) return true;
if (pos == 4) return true;
if (pos == 5) return true;
if (pos == 6) return true;
if (pos == 7) return true;
if (pos == 8) return true;
if (pos == 9) return true;
if (pos == 10) return true;
if (pos == 11) return true;
if (pos == 12) return true;
if (pos == 13) return true;
if (pos == 14) return true;
if (keycode == 13) return true;

return false;

}

}

function numb(obj)
{
var keyCode;
for(p=0;p<obj.length;p++)
{ 
keyCode=obj.charAt(p)
if(keyCode==0 || keyCode == 1 || keyCode == 3 || keyCode==2 || keyCode == 4 || keyCode == 5 ||keyCode==6 || keyCode == 7 || keyCode == 8 ||keyCode==9 || keyCode== "(" || keyCode== ")" || keyCode== "-" )
 {
	return false;
 }
}
return true;
}




 function numvalidate(o)
 {
   mytrim(o);
   val=o.value;   
   if(val!="")
   {
  		if(val!=" ") 
   		{
   			if (val.indexOf(".")>0)
			{
				alert("Enter only numbers!");
			   	o.value="";
			   	o.focus();			    
				return false;
			
			}
			if(isNaN(val))
			{
				alert("Enter only numbers!");
				o.value="";
				o.focus();			    
				return false;			
			}
			
			if(numb(val))
			{
   			   alert("Enter only numbers!");
			   o.value="";
			   o.focus();			    
			 return false;
			}
						
			if((val==0)||(val<0))
			
			{
				alert("Enter only numbers!");
				o.value="";
				o.focus();			    
				return false;
			}
		}
	}
	 
	return true;
}

function numvalidatecheck(o)
 {
   mytrim(o);
   val=o.value;   
   if(val!="")
   {
  		if(val!=" ") 
   		{
   			if (val.indexOf(".")>0)
			{
				//alert("Enter only numbers!");
			   	o.value="";
			   	o.focus();			    
				return false;
			
			}
			if(isNaN(val))
			{
				//alert("Enter only numbers!");
				o.value="";
				o.focus();			    
				return false;			
			}
			
			if(numb(val))
			{
   			   //alert("Enter only numbers!");
			   o.value="";
			   o.focus();			    
			 return false;
			}
						
			if((val==0)||(val<0))
			
			{
				//alert("Enter only numbers!");
				o.value="";
				o.focus();			    
				return false;
			}
		}
	}
	 
	return true;
}


 function commvalidate(o)
 {
  mytrim(o);
  val=o.value;
  if(val!="")
   {
  		if(val!=" ") 
   		{
     		if(numb(val))
			{
   			   alert("Enter only numbers!");
			   o.value="";
			   o.focus();
			    
			 return false;
			}
			if(val<0)
			{
	   			  alert("Enter only numbers!");
			   o.value="";
			   o.focus();
			    
			 return false;		
			}
				
		}
	}
	 
	return true;
}

 function validatetel(o)
  {
  mytrim(o);
  val=o.value;
  l=val.length;
  if(val!="")
   {
  	 if(val!=" ")
   		{
		if (val!="0")
		{
  		if(isNaN(val))
  			{
  
   			alert("Enter valid data" );
   			alert(o.value);
			o.value="";
   			o.focus();
  			
  			return false;
     //l=10;
  			}
  //if(l!=7)
  //{
   //alert("Enter 7 digit valid telephone number")
   //o.value="";
    //o.focus();
   // o.select();
  //}
  		}
  	}
	}
	return true;
  }
  
function validemail(o)
{
	mytrim(o);
    val=o.value;
	var ind=o.value.indexOf("@");
    var dot=o.value.indexOf(".");
	var lind=o.value.lastIndexOf("@");
	var ldot=o.value.lastIndexOf(".");
    var str=o.value;
    var len=str.length;	
	count=0;	
    var spchr = new Array("&","*","~","!","#","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","-");
  	l = spchr.length;
	if(val!="")
  	{
   		if(val!=" ")
   		{
    		if((ind>0)&&(dot>0))
    		{
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter valid Email ID like LoginName@ServiceProvider.com");
						o.focus();
						o.select();
						return false;
						break;
					}
				}
				for (i=0;i<len;i++)
					{
	 					if(((str.charAt(i)==".")&&(str.charAt(i+1)=="@"))||((str.charAt(i)==".")&&(str.charAt(i-1)=="@")))
						{
						alert("Enter valid Email ID like LoginName@ServiceProvider.com");
						o.focus();
						o.select();
						return false;						
					    }	 					
					}				
				if ((ind.valueOf()<=0)||(ind.valueOf()==dot.valueOf()+1)||(len<=ldot.valueOf()+1)||(ind.valueOf()+1==dot.valueOf())||(lind.valueOf()!=ind.valueOf()))
					{
						alert("Enter valid Email ID like LoginName@ServiceProvider.com");
						o.focus();
						o.select();
						return false;						
					}				
			}
    		else
   			{
    			alert("Enter valid Email ID like LoginName@ServiceProvider.com");    			
				o.select();
				o.focus();
				return false;
    		}
   		}
	}
	val=mytrimval(val)
	var space=val.indexOf(" ");
	if (space>0)
		{
			alert("Space is not allowed in the email address");
			o.select();
			o.focus();
			return false;		
		}
	
	return true;
	
}
   
   function selectvalid(o)
   {
   if (o.selectedIndex<=0)
   {
   alert("Select a value");
   o.focus();
   o.select;
   return false;
   }
   }
  
  function validdate12(o)
  {
   mytrim(o);
  // for seperate date , month , year  formats //
    val=o.value;
	date1=new Date();
   	dt=new Date(o.value);
 //  alert(date1);
 //  alert(dt);
  days=dt.getDate();
   m=dt.getMonth();
   yy=dt.getYear();
 //  alert(yy);// returns as 00,01,02 so on
 //  alert(m);//returns from 0 - 11
 //  alert(days);// returns from 1 - 31
					
   if(val!="")
   {
   if(val!=" ")
   {
   
    if(((m+1)<1)||((m+1)>12)||(days>31)||(days<1)||(isNaN(yy))||(yy<0))
   {
    alert("Enter valid date.");
    o.focus();
    o.select();
    }
  }
  }
  }
  
  function validdate(o)
  {
    mytrim(o);
    val=o.value;
	var m="",days="",yy="",tdate="";
   					
				
				var a = new Date();
				var b = a.getFullYear();
					var tdate;
					b=b.toString();
					
					tdate = b.substr(2,3);
					
					var ind1=o.value.indexOf("/");
 					m=val.substr(0,ind1);
					var ind2=o.value.lastIndexOf("/");
									
					days=val.substr(ind1+1,ind2-3);
					yy=val.substr(ind2+1);
					
					m=parseInt(m);
					days=parseInt(days);
					yy=parseInt(yy);
					 tdate=parseInt(tdate);
					
   if(val!="")
   {
   if(val!=" ")
   {
    if(((m)<1)||((m)>12)||(days>31)||(days<1)||(isNaN(yy))||(yy<0)||((yy!=tdate)&&(yy!=tdate+1)&&(yy!=tdate+2)&&(yy!=tdate+3)&&(yy!=tdate+4)&&(yy!=tdate+5)&&(yy!=tdate+6)&&(yy!=tdate+7)&&(yy!=tdate+8)&&(yy!=tdate+9)&&(yy!=tdate+10)&&(yy!=tdate+11)&&(yy!=tdate+12)&&(yy!=tdate+13)&&(yy!=tdate+14)&&(yy!=tdate+15)&&(yy!=tdate+16)))
   {
    alert("Enter valid date.");
    o.focus();
    o.select();
    }
  }
  }}

 function validzip(o)
  {
    mytrim(o);
    val=o.value;
    l=val.length;
	if(val!="")
   {
   if(val!=" ")
   {	
	if(l==8)
	{
	var len=o.value.indexOf(" ");
	if(len<=0)
	{
	alert("Invalid Zip Code");
	o.focus();	
	o.select();
	}
	}	
	if((l>7))
	{
	alert("Invalid Zip Code");
	o.focus();	
	o.select();
	}      
  for(i=0;i<o.value.length;i++)
   
  {
    c=o.value.charAt(i);
    if((isNaN(c)))
    {
      alert("Invalid Zip/Pin Code");
      o.value="";
      o.focus();     
    }  
 }
}}}


function validzipuk(o)
  {
	 var spchr = new Array("&","*","~","!","#","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","-","\"");
  	 r = spchr.length;
	 mytrim(o);
	 val=o.value;
	 l=val.length;
		if(val!="")
	{
		if(val!=" ")
		{	
			if(val.length>7)
			{
				alert("Post Code cannot exceed 7 characters");
				o.focus();	
				o.select();
				return false;
			} 
			if(!(isNaN(val)))
			{
				if(val.length==7)
				{
					alert("Post Code can have maximum of 6 digits");
					o.focus();	
					o.select();
					return false;
				}
			}
			for(i=0;i<r;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Post Code can have digits and space only");
						o.focus();
						o.select();
						return false;
						break;
					}
				}
		}
	}		
}


 function validatepass(o)
 {
 mytrim(o);
 //validateuserid(o);
  val=o.value;
   var spchr1 = new Array("&","*","~","!","#","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","@");
  p = spchr1.length;
  	 if(val!=" ")
  	{
	if(val!="")
  		{
  		
  			if(val.length<=5)
  			{
			   alert("Password must be atleast 6 characters!");
			   o.focus();
			   o.select();
			   return false;	
			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					if (spchk1 > 0)
					{
						alert("Enter valid password without any special characters.");
						o.value="";
						o.focus();
						o.select();
						return false;
						break;
					}
				}
			}
		}
	}
	
}  


 function vallogin(o)
 {
 mytrim(o);
 //alert(o.value);
 //validateuserid(o);
  val=o.value;
   var spchr1 = new Array("&","*","~","!","#","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","@");
  p = spchr1.length;
  	 if(val!=" ")
  	{
	if(val!="")
  		{
  		
  			if(val.length<=5)
  			{
			   alert("Login ID must be atleast 6 characters!");
			   o.focus();
			   o.select();
			   return false;	
			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					if (spchk1 > 0)
					{
						alert("Enter valid Login ID without any special characters. \n only numbers(0-9), characters(a-z) and (_) are allowed");
						o.value="";
						o.focus();
						o.select();
						return false;
						break;
					}
				}
			}
		}
	}
	
}  
function numvalidate1(o)
 {
   mytrim(o);
   val=o.value;    
   var dotser=val.indexOf(".");
   if(val!="")
   	{
   		if(val!=" ")
   		{
   			if ((isNaN(val)) || (numb(val)))
   			{
   				alert("Enter numeric data.")
   				o.value=""
   				o.focus();
   				o.select();   
 			}			
			if (dotser>-1)
			{
				alert("Enter numeric data!");
			   	o.value="";
			   	o.focus();			    
			 	return false;
			}	
			if((val==0)||(val<0))
			
			{
			alert("Enter numeric data!");
			   o.value="";
			   o.focus();
			    
			 return false;
			}
 		}
	}	
}
 
 function numvalidatebiz(o)
 {
   mytrim(o);
   val=o.value; 
   var dotser=val.indexOf(".");
   if(val!="")
   	{
   		if(val!=" ")
   		{
   			if ((isNaN(val)) || (numb(val)))
   			{
   				alert("Enter numeric data.")
   				o.value=""
   				o.focus();
   				o.select();   
 			}
			
			//if (dotser>-1)
			//{
			//	alert("Enter only numbers!");
			//   	o.value="";
			//   	o.focus();			    
			// 	return false;
			//}	
			if((val==0)||(val<0))
			
			{
			alert("Enter numeric data!");
			   o.value="";
			   o.focus();
			    
			 return false;
			}
 		}
	}
}

function valpass(o)
 {
 mytrim(o);
 //validateuserid(o);
  val=o.value;
//  alert(o.value);
   var spchr1 = new Array("&","*","~","!","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","@");
  p = spchr1.length;
  	if(val!=" ")
  	{
		if(val!="")
  		{
  			if(val.lenght<=5)
  			{
			   alert("Password must be atleast 6 characters!");
			   o.focus();
			   o.select();
			   return false;	
			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					if (spchk1 > 0)
					{
						alert("Enter valid Password without any special characters.");
						o.value="";
						o.focus();
						o.select();
						return false;
						
					}
				}
			}
		}
	}
	
}  
	function checkrepwd(o)
	{
	mytrim(o);
	 val=o.value;
         if(val!=" ")
  	{
	if(val!="")
  		{  		
  			if(document.frmpin.pinnumber.value != document.frmpin.repinnumber.value)
  			{
			   alert("PIN mismatch!  enter the same PIN.");
			   document.frmpin.pinnumber.value="";
			   document.frmpin.repinnumber.value="";
			   document.frmpin.pinnumber.focus();
			   document.frmpin.pinnumber.select();
			   return false;	
			}
		}
	}
}   


function currencyvalidate(o)
{
	mytrim(o);
	var val=o.value;
	var len=o.value.length;
	var flag;
	var p1=o.value.indexOf(".");
	var s1=o.value.substr(0,p1);
	var s2=o.value.substr(p1,len);	
	var p2=o.value.indexOf("+");	
	if(val!="")
  	{
   	  if(val!=" ")
   	   {
		if((isNaN(s1))||(isNaN(s2))||(val<0)||(p2==0))
		{
			alert("Enter only currency value!");
			o.value="";
			o.focus();
			return false;   
		}  
	  }
    }
    s2=mytrimval(s2)
	if ((s2.length>2)&&(p1>0))
	{
		s3=s2.substr(1,2)
		o.value=s1+"."+s3
	}
    
}


function validateweb(o)
{
	mytrim(o);
	var str=o.value;
	var len=str.length;
	var dot=o.value.indexOf(".");
	var ldot=o.value.lastIndexOf(".");
	var spchr = new Array("`","~","!","^","(",")",",","+","=","{","[","}","]","|","\\",";","'","\"","<",",",">","?");
  	l = spchr.length;
	if(str!="")
  	{
   		if(str!=" ")
   		{
   			if ((len<=ldot.valueOf()+1)||(dot.valueOf()+1==ldot.valueOf())||(dot.valueOf()<=0))
			{
				alert("Enter valid Email ID like LoginName@ServiceProvider.com");
				//o.value="";
				o.focus();
				o.select();
				return false;						
			}       		
    		if(dot>0)
    		{
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter valid Web URL.");
						o.focus();
						o.select();
						return false;
						break;
					}
				}
			}
    		else
   			{
    			alert("Enter valid Web URL like yourcompany.com");
    			//o.value="";
				o.select();
				o.focus();
				return false;
    		}
   		}
	}
	return true;
}

function valweb_address(o)
{
	mytrim(o);
	var str=o.value;
	var len=str.length;
	var dot=o.value.indexOf(".");
	var ldot=o.value.lastIndexOf(".");
	var colon=o.value.indexOf(":");
	var lcolon=o.value.lastIndexOf(":");
	var slash=o.value.indexOf("/");
	var lslash=o.value.lastIndexOf("/");
	var spchr = new Array("`","~","!","@","#","$","%","^","&","*","(",")","+","=","{","[","}","]","|","\\",";","'","\"","<",",",">","?");
  	var l = spchr.length;  	
  	var temp=o.value;
  	if(str!="")
  	{
   		if(str!=" ")
   		{
   			if (temp.substring(0,11)== "http://www.")
   			{
	   			var temp1 = temp.substring(11,len)
	   			//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		} //if for substring(http://www.).
   			if (temp.substring(0,7)== "http://")
   			{
	   			var temp1 = temp.substring(7,len)
	   			//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{A
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		} //elseif for substring(http://).    		
   			else if(temp.substring(0,10)== "ftp://www.")
			{
				var temp1 = temp.substring(10,len)
				//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		}//else if for substring(ftp://www.).
   			else if(temp.substring(0,6)== "ftp://")
			{
				var temp1 = temp.substring(6,len)
				//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		}//else if for substring(ftp://).
   			else if(temp.substring(0,12)== "https://www.")
			{
				var temp1 = temp.substring(12,len)
				//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		}//else if for substring(https://www.).    		 	    		 	
   			else if(temp.substring(0,8)== "https://")
			{
				var temp1 = temp.substring(8,len)
				//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		}//else if for substring(https://).    	    		
   			else if(temp.substring(0,4)== "www.")
   			{
				var temp1 = temp.substring(4,len)
				//alert("value of temp1 "+temp1);
	   			var len1=temp1.length;
	   			var dot=temp1.indexOf(".");
				var ldot=temp1.lastIndexOf(".");
				var colon=temp1.indexOf(":");
				var lcolon=temp1.lastIndexOf(":");
				var slash=temp1.indexOf("/");
				var lslash=temp1.lastIndexOf("/");
	   			if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
    			if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="."))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)=="/"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="/"))||((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)=="."))||((temp1.charAt(i)=="/")&&(temp1.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}									
				}//if for dot>0.
    		}//else if for substring(www.).
			else if(dot>0)
   			{
   				if ((len<=ldot.valueOf()+1)||(len<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
				{
					alert("Enter valid Web URL.");
					o.focus();
					o.select();
					return false;						
				}       		
				if(dot>0)
    			{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;
						}
					}
					for (i=0;i<l;i++)
					{
	 					if(((temp.charAt(i)==".")&&(temp.charAt(i+1)=="."))||((temp.charAt(i)==".")&&(temp.charAt(i+1)=="/"))||((temp.charAt(i)==".")&&(temp.charAt(i-1)=="/"))||((temp.charAt(i)=="/")&&(temp.charAt(i+1)=="/")))//((temp1.charAt(i)=="/")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i+1)==":"))||((temp1.charAt(i)==".")&&(temp1.charAt(i-1)==":"))||((temp.charAt(i)==".")&&(temp.charAt(i-1)=="."))||((temp.charAt(i)=="/")&&(temp.charAt(i-1)=="/"))
						{
							alert("Enter valid Web URL.");
							o.focus();
							o.select();
							return false;						
						}	 					
					}										
				}//if for dot>0.
			}//elseif for dot>0.    		 	
			else
			{
				//alert("value of temp "+temp);
				alert("Enter valid Web URL.");
				o.focus();
				o.select();
				return false;
			}//if for else.
   		}//if for space.
	}//if for value == null.
	return true;
	}   
	
function validemailmulti(obj)
{
	mytrim(obj);
    val=obj.value;
	var ind=obj.value.indexOf("@");
    var dot=obj.value.indexOf(".");
	var lind=obj.value.lastIndexOf("@");
	var ldot=obj.value.lastIndexOf(".");
    var str=obj.value;
    var len=str.length;	
	count=0;	
    var spchr = new Array("&","*","~","!","#","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">","/","|","-");
  	l = spchr.length;
	if(val!="")
  	{
   		if(val!=" ")
   		{
    		if((ind>0)&&(dot>0))
    		{
				for(i=0;i<l;i++)
				{
					var spchk = obj.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter valid Email ID like LoginName@ServiceProvider.com");
						obj.focus();
						obj.select();
						return false;
						break;
					}
				}
				for (i=0;i<len;i++)
					{
	 					if(((str.charAt(i)==".")&&(str.charAt(i+1)=="@"))||((str.charAt(i)==".")&&(str.charAt(i-1)=="@")))
						{
						alert("Enter valid Email ID like LoginName@ServiceProvider.com");
						obj.focus();
						obj.select();
						return false;						
					    }	 					
					}				
						
			}
    		else
   			{
    			alert("Enter valid Email ID like LoginName@ServiceProvider.com");    			
				obj.select();
				obj.focus();
				return false;
    		}
   		}
	}
	val=mytrimval(val)
	var space=val.indexOf(" ");
	if (space>0)
	{
		alert("Space is not allowed in the email address");
		return false;		
	}
	
	return true;
	
}

function changecountry()
	{
		(document.forms[frmname].state.selectedIndex<31)?document.forms[frmname].country.selectedIndex=0:document.forms[frmname].country.selectedIndex=1;
	}

function changestate()
{
	if((document.forms[frmname].country.selectedIndex==1)&&(document.forms[frmname].state.selectedIndex<=31))
	{
		document.forms[frmname].state.selectedIndex=34;
		alert(" Select A State from USA");
		document.forms[frmname].state.focus();		
	}
	if((document.forms[frmname].country.selectedIndex==0)&&(document.forms[frmname].state.selectedIndex>=31))
	{
		document.forms[frmname].state.selectedIndex=0;
		alert("Select A State from INDIA");
		document.forms[frmname].state.focus();
	}	
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
}

function mytrimval(val)
{
	while(val.charAt(0)==" ")
	 {
		val=val.slice(1);
	 }
	while(val.charAt(val.length-1)==" ")
	 {
		val=val.slice(0,-1);
	 }
	return val;
}
function validatedate(formname)
{
  var m_day = document.forms[formname].elements["from_day"].value;
  var m_month = gtmonth(document.forms[formname].elements["from_month"].value);
  var m_year=document.forms[formname].elements["from_year"].value;
  mmonth = m_month - 1;
  myear = m_year;
  m_year = "20" + m_year;
  
  var flag = gtdate(m_day, m_month, m_year);
  if (flag==false)
  {
  	  document.forms[formname].elements["from_day"].focus();
   	  document.forms[formname].elements["from_day"].select;
	  return false;
  }
	
  var t_day = document.forms[formname].elements["to_day"].value;
  var t_month = gtmonth(document.forms[formname].elements["to_month"].value);
  var t_year=document.forms[formname].elements["to_year"].value;
  t_year = "20" + t_year;
  tmonth = t_month - 1
  var flag = gtdate(t_day, t_month, t_year);
  if (flag==false)
  {
  	  document.forms[formname].elements["to_day"].focus();
   	  document.forms[formname].elements["to_day"].select;
	  return false;
  }
	fromdt = new Date(m_year,mmonth,m_day);
	todt = new Date(t_year,tmonth,t_day);  
	//alert("to date is " + todt);		
	today = new Date();
	//alert("todays date is " + today);	
	if ((fromdt>today))
	{
	alert("From Date Cannot be greater than Todays Date");
  	  document.forms[formname].elements["from_day"].focus();
   	  document.forms[formname].elements["from_day"].select;
	  return false;
	}
	if ((fromdt>todt))
	{
	alert("From date cannot be greater than Todays date");
  	  document.forms[formname].elements["from_day"].focus();
   	  document.forms[formname].elements["from_day"].select;
	  return false;
	}
	
	if((todt>today))
	{
  	  alert("To Date Cannot be greater than Todays Date");
  	  document.forms[formname].elements["to_day"].focus();
   	  document.forms[formname].elements["to_day"].select;
	  return false;	
	}
  return true;
}


function valpassword(o)
 {
 validateuserid(o);
  val=o.value;
  	 if(val!=" ")
  	{
	if(val!="")
  		{
  		
  			if(val.length<=7)
  			{
			   alert("Password must be atleast 8 characters!");
			   o.focus();
			   o.select();
			   return false;	
			}
		}
	}
}

function valdescript(o,len)
{  
 l=o.value.length;
 if(l>=len) 
 {
 alert("Enter below "+len+" characters.");
 //o.select();
 //o.focus();
 return false; 
 }
}

function datevalidate(v)
{

//mday=parseInt(document.forms[frmname].elements[document.forms[frmname].elements[v+"_day"].value].value)+1;
	//mday=parseInt(document.forms[frmname].elements["date"+v+"_day"].value)+1;
	mmonth=document.forms[frmname].elements["date"+v+"_month"].value;
	myear="20"+document.forms[frmname].elements["date"+v+"_year"].value;
	mday=document.forms[frmname].elements["date"+v+"_day"].value;
	//alert(mmonth);
	var mdate=new Date(myear,gtmonth(mmonth)-1,mday);
	//alert(mdate);
	var tdate=new Date();
	if (mdate<tdate)
	{
		alert("date should not be less than today date");
		document.forms[frmname].elements["date"+v+"_day"].focus();
		return false;
	}
  return true;	
}

function datevalidate1(v)
{
	mday=parseInt(document.forms[frmname].elements["date"+v+"_day"].value)+1;
	mmonth=document.forms[frmname].elements[v+"_month"].value;
	myear="20"+document.forms[frmname].elements[v+"_year"].value;
	mday=document.forms[frmname].elements[v+"_day"].value;
	//alert(mmonth);
	var mdate=new Date(myear,gtmonth(mmonth)-1,mday);
	//alert(mdate);
	var tdate=new Date();
	if (mdate<tdate)
	{
		alert("date should not be less than today date");
		document.forms[frmname].elements[v+"_day"].focus();
		return false;
	}
  return true;	
}



	
function validateDB(o)
{
	var val;
	var str1;
	var count;
	val=o.value;
	var len=o.value.length;
  	var spchr = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/");
  	l = spchr.length;
	if(val!=" ")
    {
		if(val!="")
  		{
			
			if(len > 30)
			{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+20);
					str1len = str1.length
					//alert(str1);
					//alert(count);	
					if(str1len == 30)				
					{
						if(str1.indexOf(" ")==-1)
						{
							alert("Give spaces for "+ getfieldname(o.name));
							o.focus();
							return false;
						}
					}
					count = count + 30
				}
			}	
			
			if(o.name=="txtuserid")
			{
				if(len<5)
				{
  					alert("Enter minimum of Five characters data in " + getfieldname(o.name));
   					////o.value="";
   					o.select();
   					o.focus(); 
   					return false;     				
				}
				else
				{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid characters. Ex. A/a – Z/z or 0-9.");
							////o.value="";
							o.select();
							o.focus();
							return false;
						}
					}				
				}
			}
			if(o.name=="txtcname")
			{
				if(len<3)
				{
  					alert("Enter minimum of three characters data in " + getfieldname(o.name));
   					////o.value="";
   					o.select();
   					o.focus(); 
   					return false;     				
				}
				else
				{
					for(i=0;i<l;i++)
					{
						var spchk = o.value.indexOf(spchr[i]);
						if (spchk >= 0)
						{
							alert("Enter valid characters. Ex. A/a – Z/z or 0-9.");
						//	//o.value="";
							o.select();
							o.focus();
							return false;
						}
					}				
				}
			}
			
				
			  		
  			if(!isNaN(val))
  			{
  				alert("Enter character data also");
   				////o.value="";
   				o.select();
   				o.focus(); 
   				return false;     
			}
			else
			{					
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter valid characters. Ex. A/a – Z/z or 0-9.");
						////o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
			}
		}		
	}
	return true;		
}	

var ErrMsg = "Right Click is disabled ";

function disableRightClick(btnClick)
{
if (navigator.appName == "Netscape" && btnClick.which == 3) // check for netscape and right click
	{ 
		alert(ErrMsg);
		return false;
	}
else if (navigator.appName =="Microsoft Internet Explorer" && event.button == 2) // for IE and Right Click
	{
		alert(ErrMsg);
		return false;
	}
}
document.onmousedown = disableRightClick;

////// line 2329 additional function from CLIENT --- added by shantha

// first element is set foocus by default
function placeFocus() 
{
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{
			if ((field.elements[i].type == "text") || (field.elements[i].type == "password")  || (field.elements[i].type == "textarea") || (field.elements[i].type.toString().charAt(0) == "s")) 
			{
				document.forms[0].elements[i].focus();
				break;
			}
		}
	}
	//window.history.forward(0);
}

// roundoff - true currency format
function convertToCurrency(val)
{
	var curNum,len1,ind1,dif;
	
	//alert("val= "+val+"index= "+val.indexOf("."));
	val=val+"";
	if( (val=="")||(val==" "))
		{val="0";}
	len1=val.length;
	ind1=val.indexOf(".");
	dif=len1-ind1;
	if(ind1<0)     //"." not found
		{dif=0;}
	
	curNum=val;
	
	if  (dif==0)
		curNum=val+".00";
	if (dif==1)
		curNum=val+"00";
	if (dif==2)
		curNum=val+"0";
	return curNum;
}
// Account Code
function validateAccountCode(o)
{
	mytrim(o);
	val=o.value;
	var spchr1 = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-"," ","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/","?",".");
	p = spchr1.length;
	var fName= o.name; // accountCode
	var labelName;
	if (fName=="accountCode")
		labelName="Account Code"
	if (fName=="invNo")
		labelName="Invoice No."
	if (fName=="creNo")
		labelName="Credit Note No."
  if(val!=" ")
  	{
  		if(val!="")
  		{
			for(i=0;i<p;i++)
			{
				var spchk1 = o.value.indexOf(spchr1[i]);
					
				if (spchk1 >= 0)
				{
					alert(labelName+" cannot have special characters except '_'");
					
					//o.value="";
					o.select();
					o.focus();
						
					return false;
					break;
				}
			}
		}
	}
}  

//Just name
function validateOnlyName(o)
{
	var val;
	var str1;
	var count;
	val=o.value;
	var len=o.value.length;
  	var spchr = new Array("_","~","`","!","@","#","$","%","^","&","*","(",")","-","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">",".","/","?","0","1","2","3","4","5","6","7","8","9");
  	l = spchr.length;
	//// contactName
	var theFieldName="Name";
	if(o.name=="contactName")
		theFieldName="Contact Name"
	if(val!=" ")
    {
		if(val!="")
  		{
			
			if(len > 30)
			{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+30);
					str1len = str1.length
					//alert(str1);
					//alert(count);	
					if(str1len == 30)				
					{
						if(str1.indexOf(" ")==-1)
						{
							alert("Give spaces for "+theFieldName);
							o.focus();
							return false;
						}
					}
					count = count + 30
				}
			}	
					
  			if(!isNaN(val))
  			{
  				alert(" Enter character data only for "+theFieldName);
   				////o.value="";
   				o.select();
   				o.focus(); 
   				return false;     
			}
			else
			{					
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter only alphabets and space for "+theFieldName);
					//	//o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
			}
		}		
	}
	return true;		
}

// Customer / Supplier names (possibly company names)
function validateCustSupplierName(o)
{
	var val;
	var str1;
	var count;
	val=o.value;
	var len=o.value.length;
  	var spchr = new Array("_","~","`","!","@","#","$","%","^","&","*","(",")","-","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">",".","/","?");
  	l = spchr.length;
	//// contactName
	
	if(val!=" ")
    {
		if(val!="")
  		{
			
			if(len > 30)
			{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+30);
					str1len = str1.length
					//alert(str1);
					//alert(count);	
					if(str1len == 30)				
					{
						if(str1.indexOf(" ")==-1)
						{
							alert("Give spaces for Name");
							o.focus();
							return false;
						}
					}
					count = count + 30
				}
			}	
					
			for(i=0;i<l;i++)
			{
				var spchk = o.value.indexOf(spchr[i]);
				if (spchk >= 0)
				{
					alert("Do not enter any special characters");
				//	//o.value="";
					o.select();
					o.focus();
					return false;
				}
			}
			
		}		
	}
	return true;		
}

// User ID / Login ID validation   ///// already exists - chaeck again
function validateUserID(o)
{
	var val;
	val=o.value;
	var len=o.value.length;
  	var spchr = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-"," ","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/","?",".");
  	l = spchr.length;
  	var theFieldName="User ID";
  	//// loginId
  	
  	if(o.name=="userId")
  		theFieldName="User ID"
  	if(o.name=="loginId")
  		theFieldName="Login ID"
  	if(o.name=="userAccountCode")
  		theFieldName="Account Code"
  		
  	
	if(val!=" ")
    {
		if(val!="")
  		{
			if(val.length<5)
  			{
				alert(theFieldName+" should have minimum 5 characters");
				//o.value="";
				o.focus();
				//o.select();
				return false;	
			}	
			for(i=0;i<l;i++)
			{
				var spchk = o.value.indexOf(spchr[i]);
				if (spchk >= 0)
				{
					alert(theFieldName+" cannot have special characters except '_'");
					//o.value="";
					o.select();
					o.focus();
					return false;
				}
			}				
				
				
  			if(!isNaN(val))
  			{
  				alert("Enter character data");
   				//o.value="";
   				o.select();
   				o.focus(); 
   				return false;     
			}
			else
			{					
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Do not give spaces and special character except '_'");
						//o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
			}
		}		
	}
	return true;		
}		


///// Password   // with this name, there is no function but already exists
function validatePassword(o)
 {
 mytrim(o);
 //validateuserid(o);
  val=o.value;
//  alert(o.value);
   var spchr1 = new Array("&","*","~","!","$","%","^","(",")","{","}","[","]",":",";","'","?","<",">",",","/","|","@"," ");
  p = spchr1.length;
  	if(val!=" ")
  	{
		if(val!="")
  		{
			
			if(val.length<6)
  			{
				alert("Password field should have atleast 6 characters");
				//o.value="";
				o.focus();
				//o.select();
				return false;	
			}
			for(i=0;i<p;i++)
			{
				var spchk1 = o.value.indexOf(spchr1[i]);
				if (spchk1 > 0)
				{
					alert("Enter a valid Password without any special characters");
					o.value="";
					o.focus();
					o.select();
					return false;
						
				}
			}
		}
	}
	
} 
//////// PASSWORD Password

//address Address1  Address2 // with this name, there is no function but already exists
function validateAddress(o)
{
  mytrim(o);
  val=o.value;  
  var spchr1 = new Array("~","!","%","^","'","?","<",">","|","@");
  p = spchr1.length;
  if(val!=" ")
  	{
  		if(val!="")
  		{
  			
			for(i=0;i<p;i++)
			{
				var spchk1 = o.value.indexOf(spchr1[i]);
				if (spchk1 >= 0)
				{
					alert("Enter valid data (without ~ , ! , % , ^ , ' , ? , < , > , | , @)");
					//o.value="";
					o.select();
					o.focus();
					return false;
					break;
				}
			}
			
		}
	}
return true
}  

// VAT Number validation  //// Unique
function validateVATnumber(o)
{
	mytrim(o);
	val=o.value;
	theFieldname=o.name;
	
	var spchr1 = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/","?",".");
	p = spchr1.length;
	if(val!=" ")
  	{
  		if(val!="")
  		{
  			if(!isNaN(val))
  			{
   				if((val<0)||(val==0))
   				{
   					alert("Enter value greater than 0");
   					o.select();
   					o.focus(); 
   					return false;
   				}
   			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					
					if (spchk1 >= 0)
					{
						alert("VAT Number cannot have special characters");
						o.select();
						o.focus();
						return false;
						break;
					}
				}
			}
		}
	}
	return true;
}

///  
// Town    State    County    Reference External      Reference
function charValidate(o)   //// already exists. check again
{
  mytrim(o);
  val=o.value;
  var spchr1 = new Array(",","*","+","~","!","#","$","%","^","{","}","[","]",":",";","'","\"","?","<",">","/","|","@");
  p = spchr1.length;
  
  var theFieldname;
  theFieldname="Name";
  if(o.name=="town")
	theFieldname="Town";
  if(o.name=="state")
	theFieldname="State";
  if(o.name=="county")
	theFieldname="County";
  
  if(o.name=="reference")
	theFieldname="Reference";
  if(o.name=="extReference")
	theFieldname="External Reference";
  if(o.name=="details")
	theFieldname="Details";
	

  if(val!=" ")
  	{
  		if(val!="")
  		{
  			if(!isNaN(val))
  			{
   				alert(theFieldname+" cannot have only digits");
   				o.value="";
   				o.select();
   				o.focus(); 
   				return false;
   			}
			else
			{
				for(i=0;i<p;i++)
				{
					var spchk1 = o.value.indexOf(spchr1[i]);
					
					if (spchk1 >= 0)
					{
						alert(theFieldname+" cannot have special characters");
						//o.value="";
						o.select();
						o.focus();
						
						return false;
						break;
					}
				}
			}
		}
	}
}  

/// already exists
function numValidate(o)
 {
   mytrim(o);
   val=o.value;   
   if(val!="")
   {
  		if(val!=" ") 
   		{
   			if (val.indexOf(".")>0)
			{
				alert("Enter only integer value");
			   	o.select();
			   	o.focus();			    
				return false;
			
			}
			if(isNaN(val))
			{
				alert("Enter only number");
				o.select();
				o.focus();			    
				return false;			
			}
			
			if(numb(val))
			{
   			   alert("Enter only number");
			   o.select();
			   o.focus();			    
			 return false;
			}
						
			if((val==0)||(val<0))
			
			{
				alert("Enter number greater than 0");
				o.select();
				o.focus();			    
				return false;
			}
		}
	}
	 
	return true;
}

////  validation currency for 5(9,2) currencyvalidate92
/////  Net Amount VAT Amount
function currencyValidate92(o)
{
	var val=o.value;
	var len=o.value.length;
	var flag;
	var p1=o.value.indexOf(".")
	var s1=o.value.substr(0,p1);
	var spchr = new Array("+","-");
  	l = spchr.length;			
	var s2=o.value.substr(p1,len);
	
	var lastCharacter1=val.charAt(len-1)
	var lastCharacter2=val.charAt(len-2)
	
	/////alert("last "+lastCharacter1);
	////alert("last but one "+lastCharacter2);
	var theFieldName="Amount";
	//// over
		if(o.name=="netAmount")
			theFieldName="Net Amount";
		if(o.name=="vatAmount")
			theFieldName="VAT";
	
	if(val!="")
	{
		if(val!=" ")
		{
			if(val!=0)
			{
				if((isNaN(s1))||(isNaN(s2)))
				{
					alert("Enter currency only for "+theFieldName+" field");
					o.select();
					////o.value="";
					o.focus();
					return false;   
				}
				if(val.indexOf(".")>-1) //"." present
				{
					//alert(val.indexOf("."));
					//alert(val.indexOf(".")+3);
					//alert(len);
					if(val.lastIndexOf(".")+3<len)
					{
						alert("Enter only two digits after decimal point for "+theFieldName+" field");
						o.select();
						////o.value="";
						o.focus();
						return false;   		
					} 
					if(val.lastIndexOf(".")>7)
					{
						/////alert(". is at "+val.lastIndexOf("."))
						alert("Only seven digits are allowed before decimal point \nAmount cannot be greater than 9999999.99");
						o.select();
						////o.value="";
						o.focus();
						return false;   		
					} 
					if(val.indexOf(".")==0)
					{
						alert("Enter atleast one digit number before decimal point for "+theFieldName+" field");
						o.select();
						////o.value="";
						o.focus();
						return false;   		
					}
					if ((lastCharacter1==0)&&(lastCharacter2==0))
					{
						if(s1==0)
						{
							alert("Enter a value greater than 0 before decimal point for "+theFieldName+" field");
							o.select();
							////o.value="";
							o.focus();
							return false;   		
						}
					}		  	 
				}
				else ///// "." not present
				{
					if(len>7)
					{
						alert(theFieldName+" cannot be greater than 9999999.99");
						o.select();
						////o.value="";
						o.focus();
						return false;   
					}
				}
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter unsigned number only for "+theFieldName+" field");
						////o.value="";
						o.focus();
						o.select();
						return false;
					}
				}
			}
			
		}
	}
	///////return false;
}

// START - rounding off decimal part
function roundOffDecimalPart(val)
{
	var curAmount=val;
	if((val=="")||(val==" "))
	{
		val="0";
	}
	curAmount=curAmount+"";
	var ip,dp,dp1,adp,roundedNumber;
		if (curAmount.indexOf(".")>=0)
		{
			ip=parseInt(curAmount); // integer part
			dp=curAmount.substring((curAmount.indexOf(".")+1),curAmount.length); // dp- decimal part
			if(dp.length>2) // after decimal point more than 2 digits are present
			{
				if (dp.substr(0,1)==0)
				{
					//alert ("hi");
					dp1=dp.substr(0,2)+"."+dp.substr(2,dp.length); // if its 0.5678, make it 56.76 which returns 57 
					adp=Math.round(dp1);                           // so output is 0.57  
					roundedNumber=ip+".0"+adp;
				}
				else
				{
					dp1=dp.substr(0,2)+"."+dp.substr(2,dp.length); // if its 0.5678, make it 56.76 which returns 57 
					adp=Math.round(dp1);                           // so output is 0.57  
					roundedNumber=ip+"."+adp;
				}
			}
			else
			{	
				
				roundedNumber=curAmount;
				if(dp.length==1)
				{
					roundedNumber=curAmount+"0";
				}
			}
		}
		else
		{
			roundedNumber=curAmount+".00";
		}
	//alert("roundedNumber= "+roundedNumber);
	return roundedNumber;
	
}
// END - rounding off decimal part


///START - email validation
// Email ID

function validEmail(obj) ///// already exists with this name
{
    var str=obj.value;
    var len=str.length;
    var uscore=obj.value.indexOf("_");
    var luscore=obj.value.lastIndexOf("_");
	var ind=obj.value.indexOf("@");
    var dot=obj.value.indexOf(".");
    var lind=obj.value.lastIndexOf("@");
    var ldot=obj.value.lastIndexOf(".");
    var spchr = new Array("`","~","!","#","$","%","^","&","*","(",")","-","+","=","{","[","]","}","|","\\",":",";","'","\"","?","/",">","<",","," ");
  	l = spchr.length;
	if(str!="")
  	{
   		if(str!=" ")
   		{
   			if ((ind.valueOf()<=0)||(lind.valueOf()>=ldot.valueOf())||(dot.valueOf()<=0)||(lind.valueOf()!=ind.valueOf())||(len<=ldot.valueOf()+1)||(ind.valueOf()+1==ldot.valueOf())||(ind.valueOf()+1==dot.valueOf())||(dot.valueOf()+1==ind.valueOf())||(luscore.valueOf()>=ldot.valueOf())||(uscore.valueOf()==0))//||(luscore.valueOf()>=ldot.valueOf())||(uscore.valueOf()==0)
			{
				alert("Enter valid Email ID "+"\n"+"ex:- david@hotmail.com");
				obj.value="";
				obj.focus();
				obj.select();
				return false;						
			}    
    		if((ind>0)&&(dot>0))
    		{
				for(i=0;i<l;i++)
				{
					var spchk = obj.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Enter valid Email ID"+"\n"+"ex:- david@hotmail.com");
						obj.value="";
						obj.focus();
						obj.select();
						return false;
						break;
					}
				}
				for (i=0;i<len;i++)
				{
	 				if(((str.charAt(i)==".")&&(str.charAt(i+1)=="@"))||((str.charAt(i)==".")&&(str.charAt(i+1)=="."))||((str.charAt(i)==".")&&(str.charAt(i-1)=="@"))||((str.charAt(i)==".")&&(str.charAt(i+1)=="_"))||((str.charAt(i)=="_")&&(str.charAt(i+1)=="_"))||((str.charAt(i)=="@")&&(str.charAt(i+1)=="_"))||((str.charAt(i)==".")&&(str.charAt(i-1)=="_"))||((str.charAt(i)=="@")&&(str.charAt(i-1)=="_")))//||((str.charAt(i)==".")&&(str.charAt(i+1)=="_"))||((str.charAt(i)=="_")&&(str.charAt(i+1)=="_"))||((str.charAt(i)=="@")&&(str.charAt(i+1)=="_"))||((str.charAt(i)==".")&&(str.charAt(i-1)=="_"))||((str.charAt(i)=="@")&&(str.charAt(i-1)=="_"))
					{
						alert("Enter valid Email ID"+"\n"+"ex:- david@hotmail.com");
						obj.focus();
						obj.select();
						return false;						
				    }	 					
				}									
			}
    		else
   			{
    			alert("Enter valid Email ID"+"\n"+"ex:- david@hotmail.com");
    			obj.value="";
				obj.select();
				obj.focus();
				return false;
    		}
   		}
	}
	return true;
}


//URL web validation
// website
function validateWeb(obj)  //// already exists
{
	var str2=obj.value;
	var str=str2.toLowerCase();
	var len=str.length;
	var dot=obj.value.indexOf(".");
	var spchr = new Array("`","~","!","@","#","$","%","^","&","*","(",")","-","_","+","=","{","[","}","]","|","\\",";","'","\"","<",",",">","?"," ");
  	var l = spchr.length;  	
  	if(str!="")
  	{
   		if(str!=" ")
   		{
   			if((str.indexOf("ftp")!=str.lastIndexOf("ftp"))||(str.indexOf("http")!=str.lastIndexOf("http"))||(str.indexOf("https")!=str.lastIndexOf("https")))//(str.indexOf("www")!=str.lastIndexOf("www"))||
   			{
				alert("Web Site format should be like: www.SiteName.com");
				obj.value="";
				obj.focus();
				//obj.select();
				return false;						   			
   			}
   			if (str.substring(0,11)== "http://www.")
   			{
	   			var str1 = str.substring(11,len);
            }//if for substring(http://www.).
   			else if (str.substring(0,7)== "http://")
   			{
	   			var str1 = str.substring(7,len)
    		}//elseif for substring(http://).    		
   			else if(str.substring(0,10)== "ftp://www.")
			{
				var str1 = str.substring(10,len)
    		}//else if for substring(ftp://www.).
   			else if(str.substring(0,6)== "ftp://")
			{
				var str1 = str.substring(6,len)

    		}//else if for substring(ftp://).
   			else if(str.substring(0,12)== "https://www.")
			{
				var str1 = str.substring(12,len)
    		}//else if for substring(https://www.).    		 	    		 	
   			else if(str.substring(0,8)== "https://")
			{
				var str1 = str.substring(8,len)
    		}//else if for substring(https://).    	    		
   			else if(str.substring(0,4)== "www.")
   			{
				var str1 = str.substring(4,len)
    		}//else if for substring(www.).
			else if(dot>0)
   			{
   				if(str.substring(0,3)== "www")
   				{
   					alert("Web Site format should be like: www.SiteName.com");
   					obj.value="";
   					obj.focus();
					//obj.select();
					return false;
   				}
   				else if(str.substring(0,3)== "ftp")
   				{
   					alert("Web Site format should be like: www.SiteName.com");
   					obj.value="";
   					obj.focus();
					///obj.select();
					return false;   				
   				}
   				else if(str.substring(0,4)== "http")
   				{
   					alert("Web Site format should be like: www.SiteName.com");
   					obj.value="";
   					obj.focus();
					//obj.select();
					return false;   				
   				}
   				else if(str.substring(0,5)== "https")
   				{
   					alert("Web Site format should be like: www.SiteName.com");
   					obj.value="";
   					obj.focus();
					//obj.select();
					return false;   				
   				}   				   				
   				else
   				{
   					var str1 = obj.value;
   				}
    		}//end for elseif dot>0.    		 	
			else
			{
				alert("Web Site format should be like: www.SiteName.com");
				obj.value="";
				obj.focus();
				//obj.select();
				return false;
			}//end for else.
	   		var len1=str1.length;
	   		var dot=str1.indexOf(".");
			var ldot=str1.lastIndexOf(".");
			var colon=str1.indexOf(":");
			var lcolon=str1.lastIndexOf(":");
			var slash=str1.indexOf("/");
			var lslash=str1.lastIndexOf("/");			
	   		if ((len1<=ldot.valueOf()+1)||(len1<=lslash.valueOf()+1)||(dot.valueOf()<=0)||(slash.valueOf()==0)||(colon.valueOf()>=0)||(lslash.valueOf()+1>=ldot.valueOf()))//||(colon.valueOf()>ldot.valueOf())||(colon.valueOf()>lslash.valueOf())||(colon.valueOf()!=lcolon.valueOf())||(dot.valueOf()+1==ldot.valueOf())
			{
				alert("Web Site format should be like: www.SiteName.com");
				obj.value="";
				obj.focus();
				//obj.select();
				return false;						
			}
			if(dot>0)
    		{
				for(i=0;i<l;i++)
				{
					var spchk = obj.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert("Web Site format should be like: www.SiteName.com");
						obj.value="";
						obj.focus();
						//obj.select();
						return false;
					}
				}
				for (i=0;i<l;i++)
				{
	 				if(((str1.charAt(i)==".")&&(str1.charAt(i+1)=="."))||((str1.charAt(i)==".")&&(str1.charAt(i+1)=="/"))||((str1.charAt(i)==".")&&(str1.charAt(i-1)=="/"))||((str1.charAt(i)=="/")&&(str1.charAt(i+1)=="/")))//((str1.charAt(i)=="/")&&(str1.charAt(i+1)==":"))||((str1.charAt(i)==".")&&(str1.charAt(i+1)==":"))||((str1.charAt(i)==".")&&(str1.charAt(i-1)==":"))||((str1.charAt(i)==".")&&(str1.charAt(i-1)=="."))||((str1.charAt(i)=="/")&&(str1.charAt(i-1)=="/"))
					{
						alert("Web Site format should be like: www.SiteName.com");
						obj.value="";
						obj.focus();
						//obj.select();
						return false;						
					}	 					
				}									
			}//if for dot>0.			
   		}//if for space.
	}//if for value == null.
	return true;
}
//end for function.   
