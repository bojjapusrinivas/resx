function wopen(myurl)
{
	detailswindow=window.open(myurl,'detailswindow','toolbar=yes,scrollbars=yes,resizable=yes,width=600,height=400,top=20;left=20');
}
function validatefrm()

{

  //to check the blank mandatory fields 
  for(i=0;i<document.forms[0].elements.length;i++)
  {
   trim(document.forms[0].elements[i]);  
   if((document.forms[0].elements[i].value=="")&&(document.forms[0].elements[i].disabled==false))
   {
	 var optfield=false;	 
	 for(n=0;((n<optfields.length)&&(optfield==false));n++)
	  {
		if(trim(optfields[n]).toLowerCase()==trim(document.forms[0].elements[i].name).toLowerCase())
		optfield=true;		
	  }
	 if(optfield==false)
	  {		
	   		val1=document.forms[0].elements[i].name;
	   		if(document.forms[0].elements[i].type=="select-one")
	   		{
				alert(getfieldname(document.forms[0].elements[i].name)+ " not selected" );	   			
	   		}
	   		else
	   		{
	   			alert(getfieldname(document.forms[0].elements[i].name)+ " cannot be left blank." );
	   		}
	   		if (document.forms[0].elements[val1].type!="hidden")				
			document.forms[0].elements[val1].focus();			
			return false;
      }
    }   
  }
  //to check the field data and length with respective validation function and length defined in the onform array
  for (j=0;j<document.forms[0].elements.length;j++)
   {
	 optfield=false;	 
	 for(n=0;((n<optfields.length)&&(optfield==false));n++)
	  {
		if(trim(optfields[n]).toLowerCase()==trim(document.forms[0].elements[j].name).toLowerCase())
		optfield=true;		
	  }
	 
	  for(k=0;k<valstr.length;k++)
	  {
		if(document.forms[0].elements[j].name==valstr[k][0])
		{
			o=document.forms[0].elements[j];						
			if (optfield==false)
	        {
			 if(eval(valstr[k][1]+"(o)")==false)
			  {
			   return false;
			  }
			} 
			if (o.value.length>valstr[k][2])
			{
				alert(getfieldname(o.name)+" value length should not be more than "+valstr[k][2]);
				o.focus();
				return false;
			}
		}
	  }     
	}   
  return true;
}
function validatefrm1()

{

  //to check the blank mandatory fields 
  for(i=0;i<document.forms[1].elements.length;i++)
  {
   trim(document.forms[1].elements[i]);  
   if((document.forms[1].elements[i].value=="")&&(document.forms[1].elements[i].disabled==false))
   {
	 var optfield=false;	 
	 for(n=0;((n<optfields.length)&&(optfield==false));n++)
	  {
		if(trim(optfields[n]).toLowerCase()==trim(document.forms[1].elements[i].name).toLowerCase())
		optfield=true;		
	  }
	 if(optfield==false)
	  {		
	   		val1=document.forms[1].elements[i].name;
	   		if(document.forms[1].elements[i].type=="select-one")
	   		{
				alert(getfieldname(document.forms[1].elements[i].name)+ " not selected" );	   			
	   		}
	   		else
	   		{
	   			alert(getfieldname(document.forms[1].elements[i].name)+ " cannot be left blank." );
	   		}
	   		if (document.forms[1].elements[val1].type!="hidden")				
			document.forms[1].elements[val1].focus();			
			return false;
      }
    }   
  }
  //to check the field data and length with respective validation function and length defined in the onform array
  for (j=0;j<document.forms[1].elements.length;j++)
   {
	 optfield=false;	 
	 for(n=0;((n<optfields.length)&&(optfield==false));n++)
	  {
		if(trim(optfields[n]).toLowerCase()==trim(document.forms[1].elements[j].name).toLowerCase())
		optfield=true;		
	  }
	 
	  for(k=0;k<valstr.length;k++)
	  {
		if(document.forms[1].elements[j].name==valstr[k][0])
		{
			o=document.forms[1].elements[j];						
			if (optfield==false)
	        {
			 if(eval(valstr[k][1]+"(o)")==false)
			  {
			   return false;
			  }
			} 
			if (o.value.length>valstr[k][2])
			{
				alert(getfieldname(o.name)+" value length should not be more than "+valstr[k][2]);
				o.focus();
				return false;
			}
		}
	  }     
	}   
  return true;
}


function getfieldname(val)
{
	if (trim(typeof(onform))=="undefined")
		return toProperCase(val.replace(/_/," "));
	else
	{
		for(i=0;i<onform.length;i++)
		{
			if(onform[i][0]==val)
			
			return onform[i][1];
		}
	}
	return toProperCase(val.replace(/_/," "));
}	

function check(re,iChars,o,valstr)
{
	trim(o);
	var fldname;
	var val=o.value;
	if(typeof(o)=="object")
		{			
			val=o.value;
			fldname=getfieldname(o.name)	
		}
	else
		{
			val=trim(o);	
			fldname="Entered data";
		}
	if(val!="")
	{
		fldstr=fldname.toLowerCase(fldname);
		if (fldstr.indexOf("qty")>=0)
		{
			fldname="Quantity";
		}
		if (val.search(re) != -1)
			return true;
		else
		{
			alert(fldname+" can have "+valstr);
			if(typeof(o)=="object")
			{
				o.focus();
				o.select();
			}
			return false;
		}
		for (var i = 0; i < val.length; i++){
		  if (iChars.indexOf(val.charAt(i))!=-1)
			{
			alert(fldname+" can have "+valstr);
			if(typeof(o)=="object")
				{
					o.focus();
					o.select();
				}
			return false;
			}
		}		 
	}
	return true;
}

function checkalpha(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=, 0123456789";
	var re=/^[a-zA-Z]+(_?[a-zA-Z])*$/;	
	var valstr="only characters between A/a-Z/z";
	return check(re,iChars,o,valstr)
}
function checkalphaspace(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=,0123456789";
	var re=/^[a-zA-Z]+(((_?|\s+)[a-zA-Z])*)?$/;	
	var valstr="only characters between A/a-Z/z,space";
	return check(re,iChars,o,valstr)
}
function checkalphaspacecama(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=0123456789";
	var re=/^[a-zA-Z]+(((_?|\s+)[a-zA-Z])*)?$/;	
	var valstr="only characters between A/a-Z/z,space";
	return check(re,iChars,o,valstr)
}

function checkalphanum(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=,";
	var re=/^[a-zA-Z]\w+$/;		
	var valstr="only characters between A/a-Z/z,0-9\nand should start with 2 characters";
	return check(re,iChars,o,valstr)
}

function checkalphanumspace(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=,";
	var re=/^[a-zA-Z]+\w+((\s*\w+)*)?$/;		
	var valstr="only characters between A/a-Z/z,0-9,space\nand should start with 2 characters";
	return check(re,iChars,o,valstr)
}
function checknumalphaspacehyand(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|`'()=,";
	var re=/[a-zA-Z]+\w+((\s*\w+)*)?$/;
	var valstr="only characters between A/a-Z/z,0-9,&,-,space";
	return check(re,iChars,o,valstr)
}
function checknum(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=,";
	var re=/^\d+$/;		
	var valstr="only numbers";
	return check(re,iChars,o,valstr)
}
function checkpositivenum(o)
{
	if (checknum(o))
	{
		if (parseFloat(o.value)<=0)
		{
			alert("Please enter only positive numbers");
			o.focus();
			return false;
		}
	}	
}
function checkphone(o)
{
	var iChars="@*~!#$%^{}[]:;?<>/|`'&=,";
	var re=/^\(?\+?\d+\)?(\s*\d+)((\s*-\s*\d+)|(\s*\d+))*$/;
	var valstr="only characters between 0-9\n";
	return check(re,iChars,o,valstr)
}
function checkzip(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=,";
	var re=/^\w+(((\s*-*\s*)?\s*\w+)*)?$/;		
	//var valstr="only ZIP/PIN code with characters between A/a-Z/z,0-9";
	var valstr="only characters A/a-Z/z,0-9 and space";
	return check(re,iChars,o,valstr)
}
function checkfloat(o)
{
	var iChars="@*+~!#$%^{}[]:;?<>/|-`'&()=,";
	var re=/^\d+(\.\d+)?$/;
	var valstr="only positive decimal number";
	return check(re,iChars,o,valstr)
}
function checkurl(o)
{
	var iChars="*+~!#$%^{}[];<>|`'&()=,";
	//var re=/^(((http|https|ftp|gopher|wais|socks|telnet|ports|wingate|mailto):\/\/\w+)|\w+)+(\.)+\w+((\w+)|(\/\w+)|(-\w+)|(\.\w+)|(\:\w+))+(\.\w+|\/|\w+)+(\/)?((\?\w+)|(\=\w+)|(\&\w+)|(\+\w+)|(\-\w+)|(\w+)|(=&))*$/gi;
	var re=/^(((http|https|ftp|gopher|wais|socks|telnet|ports|wingate|mailto):\/\/\w+)|\w+)+(\.)+\w+((\w+)|(\/\w+)|(-\w+)|(\.\w+)|(\:\w+))+(\.\w+|\/|\w+)+(\/)?((\?\w+)|(\=\w+)|(\&\w+)|(\+\w+)|(\-\w+)|(\w+)|(=&))*$/gi;
	var valstr="only url in the format ex: http://www.e_world_money.com";
	return check(re,iChars,o,valstr)
}
function checkselect(o)
 {
	if (o.selectedIndex<=0){
	alert(getfieldname(o.name)+" is not selected");
	o.focus();	
	//o.select();
	return false;
    }
 }
 function checkcheckbox(o)
 {
   if (o.checked==false){
	alert(getfieldname(o.name)+" checkbox should not be empty");
	o.focus();
	o.select;
	return false;
    }
 }

function checkradio(o)
{
	var radio_choice = false;		
	for (counter = 0; counter < document.forms[0].elements[o.name].length; counter++)
		if (eval("document."+0+"."+o.name+"["+counter+"].checked")==true)
			radio_choice = true;
	if (!radio_choice)
	{
		alert(getfieldname(o.name)+" is not selected, please select a value.")
		eval("document."+0+"."+o.name+"[0].focus();");
		return (false);
	}
}

function getconfirm(o1,o2,ms)//ms=1(valid if match),ms=0(invalid if match)
{
	var v1=(typeof(o1)=="object")?o1.value:o1;
	var v2=(typeof(o2)=="object")?o2.value:o2;
	var dstr=""
	if(typeof(o1)=="object")
	dstr=getfieldname(o1.name)+" and "+getfieldname(o2.name)
	if(v2!="")
	if (ms=="1")
	{
		if (trim(v1)!=trim(v2)) 
		{
			alert(dstr+" are different please enter same...");
			if(typeof(o1)=="object")
				{
					o2.select();
					o2.focus();					
				}
			return false;
		}
	}
	else
	{
		if (trim(v1).toLowerCase()==trim(v2).toLowerCase()) 
		{
			alert(dstr+" are same please enter differently...");
			if(typeof(o1)=="object")
				{
					o2.select();
					o2.focus();					
				}	
			return false;
		}
	}
	return true;
}
function checklength(o,min,max)
{
	var val=(typeof(o)=="object")?o.value.length:o.length;
	var dstr=""
	if(typeof(o)=="object")
	dstr=getfieldname(o.name);
	if ((val<min)||(val>max))
	{
		alert(dstr+" should be between "+min+" to "+max+" characters length");
		if(typeof(o)=="object")
		{
			o.select();
			o.focus(); 
		}
		return false 
	}
}
function checkfordb(o)
{
	var iChars="'";
	var val=(typeof(o)=="object")?o.value:o;
	if(val!="")
	{
		for (var i = 0; i < val.length; i++)
		{
		  if (iChars.indexOf(val.charAt(i))!=-1)
			{
			alert("Data is invalid please remove "+iChars+" character(s) in the data.");
			if(typeof(o)=="object")
			{
				o.focus();
				o.select();
			}
			return false;
			}
		}		
	}
}
/*function checkaddress(o)
{
	var iChars="'&";
	var val=(typeof(o)=="object")?o.value:o;
	if(val!="")
	{
		for (var i = 0; i < val.length; i++)
		{
		  if (iChars.indexOf(val.charAt(i))!=-1)
			{
			alert("Data is invalid please remove "+iChars+" character(s) in the data.");
			if(typeof(o)=="object")
			{
				o.focus();
				o.select();
			}
			return false;
			}
		}		
	}
}*/

function checknemails(o)
{
	var val;
	var vals;
	if(typeof(o)=="object")
	{
		trim(o);
		val=o.value;
	}
	else
	{
		val=trim(o);
	}
	if (val!="")
	{
		vals=split(val,",");
		for(i=0;i<vals.length;i++)
		{
		 if (vals[i].length>64)
		 {
			alert("Email address should not be more than 64 characters");
			o.focus();	
			o.select();
			return false;
		 }			 
		 if(checkemail(vals[i])==false)
		 {
			o.focus();	
			return false;
		 }
		 else
		  if(trim(vals[i])=="")
		   {
			  alert("Email should not be blank (or) Remove any extra commas")
			  o.focus();	
			  return false;
		   }
		}
	}
}
function checknnames(o)
{
	var val;
	var vals;
	if(typeof(o)=="object")
	{
		trim(o);
		val=o.value;
	}
	else
	{
		val=trim(o);
	}
	if (val!="")
	{
		vals=split(val,",");
			
		for(i=0;i<vals.length;i++)
		{
		 if (vals[i].length>30)
		 {
			alert("Name should not be more than 30 characters");
			o.focus();	
			o.select();
			return false;
		 }			 
		 if(checkalphanumspace(vals[i])==false)
		   {
			o.focus();	
			return false;
		    }	
 		 else
		  if(trim(vals[i])=="")
		   {
			  alert("Name should not be blank (or) Remove any extra commas")
			  o.focus();	
			  return false;
		   }
		}
	}
	return true;
}	
/********************************supporting functions***************/
function trim(o)
{
	var val=(typeof(o)=="object")?o.value:o;
	while(val.indexOf("  ")>0)
	val=val.replace("  "," ");	
	while(val.charAt(0)==" ")
	val=val.slice(1);
	while(val.charAt(val.length-1)==" ")
	val=val.slice(0,-1);
	if (typeof(o)=="object")
		o.value=val;
	else
		return val;
}
function split(s,del){
	arrS= new Array();
	var i=0;
	var j=0;
	var k=0;
	var delim=new String(del);
	if(s.indexOf(delim)!=-1){
		for (i=0; i<s.length;i++){
			if(s.charAt(i)==delim){
				if(k==0){
					arrS[j]=s.substring(k,i);
				}else{
					arrS[j]=s.substring(k+1,i);
				}
				k=i;
				j++;
			}
		}
		arrS[j]=s.substring(k+1,s.length);
	}else{
		arrS[0]=s;
	}
	return arrS;
}
function toProperCase(s){
	var i;
	var returnString = "";
	var tmpS=s.toLowerCase();
	var arrS= new Array();
	var arrS2 = new Array();
	arrS=split(tmpS," ");
	for (i = 0; i < arrS.length; i++){   
		var thisWord=arrS[i];
		//Check to see if word contains a hyphen
		if(thisWord.indexOf("-")!=-1){
			arrS2 = split(thisWord,"-");
			for(var j=0; j < arrS2.length; j++){
				var thisWord2=arrS2[j];
				returnString = returnString + thisWord2.charAt(0).toUpperCase() + thisWord2.substring(1,thisWord2.length)+"-";
				
			}
			returnString = returnString.substring(0,returnString.length-1)+" ";
		} else {
			returnString = returnString + thisWord.charAt(0).toUpperCase() + thisWord.substring(1,thisWord.length)+" ";
		}
	}
	returnString = returnString.substring(0,returnString.length-1);
	return returnString;
}
function checkemail(o) {
	if(typeof(o)=="object")
		{
			trim(o);
			emailStr=o.value;
		}
	else
		{
			emailStr=trim(o);
		}	
	if(emailStr!="")
	{
		var emailPat=/^(.+)@(.+)$/
		var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
		var validChars="\[^\\s" + specialChars + "\]"
		var quotedUser="(\"[^\"]*\")"
		var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
		var atom=validChars + '+'
		var word="(" + atom + "|" + quotedUser + ")"
		var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
		var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
		
		var matchArray=emailStr.match(emailPat)		
		if (matchArray==null) {
		alert("Email address is invalid (check @ and .'s)")
		if(typeof(o)=="object")
		o.focus();
		return false
	    }
		var user=matchArray[1]
		var domain=matchArray[2]
		if (user.match(userPat)==null) {
	    alert("Email - Username doesn't seem to be valid.")
	    if(typeof(o)=="object")
	    o.focus();
	    return false
		}
		var IPArray=domain.match(ipDomainPat)
		if (IPArray!=null){
	      for (var i=1;i<=4;i++) {
		    if (IPArray[i]>255) {
		        alert("Email - Destination IP address is invalid!")
		        if(typeof(o)=="object")
		        o.focus();
				return false
		    }
	    }
	    return true
	  }
	var domainArray=domain.match(domainPat)
	if (domainArray==null) {
		alert("Email - Domain name doesn't seem to be valid.")
		if(typeof(o)=="object")
		o.focus();
	//alert(emailStr);
	
	return false
	}
	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2 || 
	    domArr[domArr.length-1].length>3) {
	   alert("Email address must end in a three letter domain or two letter country.")
	   if(typeof(o)=="object")
	   o.focus();
	   return false
	}
	if (len<2) {
	   var errStr="Email - address is missing a hostname!"
	   alert(errStr)
	   if(typeof(o)=="object")
	   o.focus();
	   return false
	}
	if(isEmail(emailStr)==false)
		{
			alert("Email address is invalid");
			if (typeof(o)=="object")
			{
				o.focus();
				o.select();
			}
			return false;
		}
  }
return true;
}
function mytrim(o)
{
	trim(o);	
}
function mytrimval(o)
{
	trim(o)
}

function gtdate(d, m, y)
{
	if (m==2)
	{
		if ((y%4)!==0)
		{
			if (d>=29)
			{
				alert("Invalid Date! February cannot have more than 28 days");
				return false;
			}
		}
		if (d>29) 
		{
			alert("Invalid Date! February cannot have more than 29 days");
			return false;
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
	var monstr1="JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC";
	var monstra1=split(monstr1,",")
	var monstr2="JANUARY,FEBRUARY,MARCH,APRIL,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER";
	var monstra2=split(monstr2,",")
	if (isNaN(m)==false)
		return m;
	else
	{   
	for(i=0;i<monstra1.length;i++)	
	  if(monstra1[i]==m.toUpperCase())
	    return i+1;
	for(i=0;i<monstra2.length;i++)	
	  if(monstra2[i]==m.toUpperCase())
	    return i+1;    		
	}	
}
//dimension ("some_name", v, w, x, y, z); // sizing at runtime
	function dimension (name_str, n0, n1, n2, n3)
   {
      var numDimens = dimension.arguments.length - 1;
      var code = name_str + " = new Array();";
      eval (code);

      for (var i = 0; i <  n0; i++) // first index is 0
//    for (var i = 1; i <= n0; i++) // first index is 1
      {
         var newName = name_str + "[" + i + "]";      
         if (numDimens > 1)
         {
            code = "dimension ('" + newName + "'";
            for (var j = 2; j <= numDimens; j++)
               code += ", " + dimension.arguments[j];
            code += ");";
            eval (code);
         }
      }  
   }
 function isEmail(string) {
    if (string.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1)
        return true;
    else
        return false;
}  
/***var 0="frmaddbranch";
	var valstr=new Array(["Branch_name","charvalidate",20],["city","charvalidate",30],["district","charvalidate",30],["zipcode","numvalidate",9],["p_phone1","numvalidate",5],["p_phone2","nuimvalidate",7]);
	var onform=new Array(["Branch_name","Branch Name"],["city","City"],["district","District"],["zipcode","PIN/ZIP Code"],["p_phone1","Phone Area Code"],["p_phone2","Phone Number"]);
	var optfields=new Array("");***/
//javascript:window.history.forward(1);
function norightclick(btnClick)
{
	if (navigator.appName=="Netscape" && btnClick.which==3)
	{
	alert("Right click is disabled");
	return false;
	}
	else if(navigator.appName=="Microsoft Internet Explorer" && event.button==2)
	{
	alert("Right click is disabled");
	return false;
	}
}

function checkaddress(o)
{
  mytrim(o);
  val=o.value;  
  var spchr1 = new Array("~","!","%","^","'","?","<",">","|","@",'"');
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
					alert("Enter valid data (without ~ , ! , % , ^ ,  ? , < , > , | , @)");
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

//document.onmousedown=norightclick;


//*********************************************************************************

//BEGIN OF ALPHANUMERICS WITHOUT SPACES FUNCTION FOR PASSWORD
function validatepassword(o)
{

	var val;
	var count;
	val=o.value;
	var len=o.value.length;
	var spchr = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/","?","."," ");
  	l = spchr.length;
	if (val!=" ")
    {
		if(val!="")
		{
	   	if(!isNaN(val))
  			{
  				alert(" "+getfieldname(o.name) + " should start with characters");
   				o.value="";
   				//o.select();
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
						alert(" "+ getfieldname(o.name)+" can have ('a/A-z/Z','0-9') values only"); 
						//o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
				if ((len< 5)||(len> 15))
  				{
					alert("Password must be of 5-15 characters. ");
					o.value="";
					o.focus();
					//o.select();
					return false;	
				}
			}
		}
	if ( (val.indexOf('"')>=0)|| (val.indexOf("'")>=0))
	{
		
		alert(" "+ getfieldname(o.name)+" can have ('a/A-z/Z','0-9') values only"); 
		//o.value="";
		o.focus();
		return false;
	}
	}
	return true;		
}	

//END ALPHANUMERIC WITHOUT SPACES FUNCTION FOR PASSWORD
//*********************************************************************************


//*********************************************************************************
 //BEGIN OF TEXTAREA WITH SPECIAL CHARACTERS FUNCTION
function textareasplchars(o,s)
{
	
	var count;
	var str1;
	var len;
	val=o.value;
	len = o.value.length;
	
	
	/*if(val.indexOf(" ")==-1)
	{
		alert("Please enter valid data for "+ getfieldname(o.name));
		o.value="";
		o.focus();
		return false;
	}
	*/
	if(val!=" ")
	{
		if(val!="")
		{
			if(len > s)
			{
				alert("You cannot exceed "+s+" characters for "+ getfieldname(o.name));
				o.focus();
				return false;
			}
			
			else if ( (val.indexOf("\n")==-1) &&(len > 16))
			{			
				count=0;
				while(count < len)
				{
					//alert("hi");
					str1 = val.substring(count,count+16);
					str1len = str1.length
					if(str1len >= 16)				
					{
						if ( (str1.indexOf(" ")==-1))
						{
							alert("The number of characters in a word cannot exceed 16 characters,give spaces");
							o.focus();
							return false;
						}
					}
					count = count + 16
				}
				
			}	
			
			/*if(!(isNaN(val)))
			{
				alert(" Please Enter valid data in " + getfieldname(o.name))
				o.value="";
				o.select();
				o.focus(); 
				return false;     
			}*/
		}
	}
	return true;
}

//END OF TEXTAREA WITH SPECIAL CHARACTERS FUNCTION
//*********************************************************************************

//*********************************************************************************

//BEGIN CHARACTERS WITH SPACES FUNCTION
function charwithspaces(o)
{
	var val;
	var count;
	val=o.value;
	var len=o.value.length;
	var spchr = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/","?",".","1","2","3","4","5","6","7","8","9","0");
  	l = spchr.length;
	if ((val!=""))
    {		
		if((val!=" "))
		{	
  			if(!isNaN(val))
  			{
  			
  				alert(" "+ getfieldname(o.name) + " can have only characters");
   				o.value="";
   				o.focus(); 
   				//o.select();
   				
   				return false;     
			}
			else
			{					
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
						alert(" "+getfieldname(o.name) + " can have ('a/A-z/Z','  ') values only");
						//o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
			}
			if ( len > 16)
			{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+16);
					str1len = str1.length
					if(str1len >= 16)				
					{
						if ( (str1.indexOf(" ")==-1))
						{
							alert("A word cannot be more than 16 characters for " + getfieldname(o.name) +"");
							o.focus();
							return false;
						}
					}
					count = count + 16
				}
				
			}
			
		}
	if ( (val.indexOf('"')>=0)|| (val.indexOf("'")>=0))
	{
		alert("Please enter valid data in "+ getfieldname(o.name));
		//o.value="";
		o.focus();
		return false;
	}
	}
	return true;		
}							

//END CHARACTERS WITH SPACES FUNCTION


//*********************************************************************************


//BEGIN alphanumeric with WITH SPACES ,'(',')', '.','&','-',':','/' and numbers FUNCTION


function validatetitle(o)
{
	
	var val;
	var count;
	val=o.value;
	var len=o.value.length;
	var spchr = new Array("~","`","!","@","#","$","%","^","*","_","+","=","[","{","]","}","|","\\",";","'","\"","<",">","?");
  	l = spchr.length;
	if ((val!=""))
    {		
		if((val!=" "))
		{	
  			if(!isNaN(val))
  			{
  			
  				//alert(" "+getfieldname(o.name) + " can have ('a/A-z/Z','0-9','  ','(',')','.','&','-',':','/',',') values only");
   				alert(" "+getfieldname(o.name) + " should start with characters");
   				o.value="";
   				o.focus(); 
   				//o.select();
   				
   				return false;     
			}
			else
			{					
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
					alert(" "+getfieldname(o.name) + " can have ('a/A-z/Z','0-9','  ','(',')','.','&','-',':','/') values only");
					//alert("Please enter valid data in "+ getfieldname(o.name) + "  like  " + getfieldmessage(o.name));
						//o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
			}
			if ( len > 16)
			{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+16);
					str1len = str1.length
					if(str1len >= 16)				
					{
						if ( (str1.indexOf(" ")==-1))
						{
							alert("A word cannot be more than 16 characters for " + getfieldname(o.name) +"");
							o.focus();
							return false;
						}
					}
					count = count + 16
				}
				
			}
			
		}
	if ( (val.indexOf('"')>=0)|| (val.indexOf("'")>=0))
	{
		alert("Please enter valid data in "+ getfieldname(o.name) + "  like  " + getfieldmessage(o.name));
		//o.value="";
		o.focus();
		return false;
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
//END validate title FUNCTION
//*********************************************************************************
//*********************************************************************************

//BEGIN CHARACTERS WITHout SPACES FUNCTION
function charwithoutspaces(o)
{
	var val;
	var count;
	val=o.value;
	var len=o.value.length;
	var spchr = new Array("~"," ","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","|","\\",":",";","'","\"","<",",",">","/","?",".","1","2","3","4","5","6","7","8","9","0");
  	l = spchr.length;
	if ((val!=""))
    {		
		if((val!=" "))
		{	
  			if(!isNaN(val))
  			{
  			
  				alert(" "+ getfieldname(o.name) + " can have only characters");
   				o.value="";
   				o.focus(); 
   				//o.select();
   				
   				return false;     
			}
			else
			{					
				for(i=0;i<l;i++)
				{
					var spchk = o.value.indexOf(spchr[i]);
					if (spchk >= 0)
					{
				
					//alert("Please enter valid data in "+ getfieldname(o.name) + "  like  " + getfieldmessage(o.name));
					alert(" "+getfieldname(o.name) + " can have ('a/A-z/Z','  ') values only");
						//o.value="";
						o.select();
						o.focus();
						return false;
					}
				}
			}
			if ( len > 16)
			{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+16);
					str1len = str1.length
					if(str1len >= 16)				
					{
						if ( (str1.indexOf(" ")==-1))
						{
							alert("A word cannot be more than 16 characters for " + getfieldname(o.name) +"");
							o.focus();
							return false;
						}
					}
					count = count + 16
				}
				
			}
			
		}
	if ( (val.indexOf('"')>=0)|| (val.indexOf("'")>=0))
	{
		alert("Please enter valid data in "+ getfieldname(o.name));
		//o.value="";
		o.focus();
		return false;
	}
	}
	return true;		
}							

//END CHARACTERS WITH SPACES FUNCTION


//*********************************************************************************

///*****************************************\
///FUNCTION FOR ONKEYPRESS OF RETURN OR ENTER BUTTON

function nochange()
{
	if(window.event.srcElement.id != "submit1")
	{
		if(window.event.keyCode==13)
		{
		return false;
		}
	}
	return quotes();
	return true;
}

/////////////***************END OF FUNCTION

function quotes()
{
	if ((window.event.keyCode==39) ||(window.event.keyCode==34)||(window.event.keyCode==60)||(window.event.keyCode==62))
	{
	return false;
	}
}

//***********************for changing the button****
function pviiW3Cbg(obj, pviiColor) { //v1.1 by Project VII
	obj.style.backgroundColor=pviiColor
}
///***********************end **********************

//BEGIN OF ALPHANUMERICS WITH SPACES and comma FUNCTION
function alphnumericwithspacescomma(o)
{

	var val;
	var count;
	val=o.value;
	var len=o.value.length;
	var spchr = new Array("~","`","!","@","#","$","%","^","&","*","(",")","-","_","+","=","[","{","]","}","|","\\",":",";","'","\"","<",">","/","?",".");
  	l = spchr.length;
	if ((val!=" "))
    {
		 if((val!=""))
		 {
    		if(!isNaN(val))
  				{
  					alert(" "+ getfieldname(o.name) + " can have characters between A/a-Z/z,0-9,space,comma\nand should start with character");
   					o.value="";
   					//o.select();
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
							alert(" "+ getfieldname(o.name) + " can have characters between A/a-Z/z,0-9,space,comma\nand should start with character");
							//o.value="";
							o.select();
							o.focus();
							return false;
						}
					}
				}
			}
			if ( len > 16)
		{			
				count=0;
				while(count < len)
				{
					str1 = val.substring(count,count+16);
					str1len = str1.length
					if(str1len >= 16)				
					{
						if ( (str1.indexOf(" ")==-1))
						{
							alert("The number of characters in a word cannot exceed 16 characters,give spaces in between "+ getfieldname(o.name));
							
							o.focus();
							return false;
						}
					}
					count = count + 16
				}
				
		}
			if ( (val.indexOf('"')>=0)|| (val.indexOf("'")>=0))
	{
		alert("Please enter valid data in "+ getfieldname(o.name) + " ");
		//o.value="";
		o.focus();
		return false;
	}
	}
	return true;		
}	

//END ALPHANUMERIC WITH SPACES FUNCTION
//*********************************************************************************