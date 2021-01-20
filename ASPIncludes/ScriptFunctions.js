//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
//''' Author        : Srinivas Reddy
//''' Date Created  : July 1, 2004
//''' Date Modified :
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
//''' This are the Functions to for TOC, check boxes of
//'''(Chapters, Sub Chapters, Options , shopping cart)

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

if (document.getElementById)
{
	//minimize all main chapters details
	document.write('<style type="text/css">\n')
	document.write('.submenu{display: none;}\n')
	document.write('</style>\n')
	//minimize all the sub chapter details
	document.write('<style type="text/css">\n')
	document.write('.subsubmenu{display: none;}\n')
	document.write('</style>\n')
}

function ShowFullDetails()
{
	if(document.getElementById)
	{
	//var el = document.getElementById(obj);
	var ar = document.getElementById("masterdiv").getElementsByTagName("span"); // for main
	var sr = document.getElementById("masterdiv").getElementsByTagName("font"); // for sub
		//if(el.style.display != "block")
		//{ //
			
				for (var i=0; i<ar.length; i++)
				{
					if (ar[i].className=="submenu") // for main
					ar[i].style.display = "block";
				}
				//el.style.display = "none";
			
				for (var i=0; i<sr.length; i++)
				{
					if (sr[i].className=="subsubmenu") // for sub
					sr[i].style.display = "block";
				}
				//el.style.display = "none";			
		//}
		//else
		//{
			//el.style.display = "none";
		//}
	}
}

function ShowNoDetails()
{
	if(document.getElementById)
	{	
		var ar = document.getElementById("masterdiv").getElementsByTagName("span"); // for main
		var sr = document.getElementById("masterdiv").getElementsByTagName("font"); // for sub
		for (var i=0; i<ar.length; i++)
		{
			if (ar[i].className=="submenu") // for main
			ar[i].style.display = "none";
		}		
			
		for (var i=0; i<sr.length; i++)
		{
			if (sr[i].className=="subsubmenu") // for sub
			sr[i].style.display = "none";
		}
	}
}

function SwitchMenu(obj,mid)
{
	if(document.getElementById)
	{
	var el = document.getElementById(obj);
	var ar = document.getElementById("masterdiv").getElementsByTagName("span"); // for main
	var sr = document.getElementById("masterdiv").getElementsByTagName("font"); // for sub
		if(el.style.display != "block")
		{ //
			if (mid==1)
			{
				for (var i=0; i<ar.length; i++)
				{
					if (ar[i].className=="submenu") // for main
					ar[i].style.display = "none";
				}
				el.style.display = "block";
			}
			if (mid==2)
			{
				for (var i=0; i<sr.length; i++)
				{
					if (sr[i].className=="subsubmenu") // for sub
					sr[i].style.display = "none";
				}
				el.style.display = "block";
			}
		}
		else
		{
			el.style.display = "none";
		}
	}
}
function ClearALL()
{	
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if ((field.elements[i].type == "checkbox")) 
			{					
				document.forms[0].elements[i].checked=false;
			}				
		}
	}
}
	
function CheckALL()
{	
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if (field.elements[i].type == "checkbox") 
			{
				if (field.elements[i].name.toString().charAt(0) == "M")
				{
					document.forms[0].elements[i].checked=true;
				}					
			}				
		}
	}
}
	var getvalchecked;
	getvalchecked=0;
	
function callsubmit()
{
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if ((field.elements[i].type == "checkbox")) 
			{					
				if (document.forms[0].elements[i].checked==true)
				{
					getvalchecked=1;
				}
			}				
		}
	}
	if (getvalchecked==1)
	{
		document.frmshop.method="post";
		document.frmshop.action="SubDB.asp";
		document.frmshop.submit();
	}
	else
	{
		alert ("Please check an option to add to Cart");
		return false;
	}
}
	
function deSelectSub(gval)
{		
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];			
		for (i = 0; i < field.length; i++) 
		{						
			if (field.elements[i].type == "checkbox") 
			{					
				if (field.elements[i].name.toString().charAt(0) == "S")
				{						
					if (field.elements[i].name.toString().charAt(2) == gval)
					{
						document.forms[0].elements[i].checked=false;
					}
				}
				if (field.elements[i].name.toString().charAt(0) == "R")
				{
					document.forms[0].elements[i].checked=false;
				}					
			}					
		}
	}
}

function deSelectMain(Mainval)
{		
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];			
		for (i = 0; i < field.length; i++) 
		{						
			if (field.elements[i].type == "checkbox") 
			{					
				if (field.elements[i].name.toString().charAt(0) == "M")
				{						
					if (field.elements[i].name.toString().charAt(2) == Mainval)
					{
						document.forms[0].elements[i].checked=false;
					}
				}
				if (field.elements[i].name.toString().charAt(0) == "R")
				{
					document.forms[0].elements[i].checked=false;
				}						
			}					
		}
	}
}

function deSelectReport()
{		
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if ((field.elements[i].type == "checkbox")) 
			{	
				if (field.elements[i].name.toString().charAt(0) != "R")
				{				
					document.forms[0].elements[i].checked=false;
				}
			}				
		}
	}
}
function CheckALLboxes()
{	
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if (field.elements[i].type == "checkbox") 
			{
				document.forms[0].elements[i].checked=true;							
			}				
		}
	}
}
function CheckALLReports()
{	
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if (field.elements[i].type == "checkbox") 
			{
				if (field.elements[i].name.toString().charAt(0) == "R")
				{
					document.forms[0].elements[i].checked=true;
				}					
			}				
		}
	}
}
function CheckALLSub()
{	
	if (document.forms.length > 0) 
	{
		var field = document.forms[0];
		for (i = 0; i < field.length; i++) 
		{			
			if (field.elements[i].type == "checkbox") 
			{
				if (field.elements[i].name.toString().charAt(0) == "S")
				{
					document.forms[0].elements[i].checked=true;
				}					
			}				
		}
	}
}

// validate EmailID
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
						alert("Enter valid Email ID like LoginName@Domain.com");
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
						alert("Enter valid Email ID like LoginName@Domain.com");
						o.focus();
						o.select();
						return false;						
					    }	 					
					}				
				if ((ind.valueOf()<=0)||(ind.valueOf()==dot.valueOf()+1)||(len<=ldot.valueOf()+1)||(ind.valueOf()+1==dot.valueOf())||(lind.valueOf()!=ind.valueOf()))
					{
						alert("Enter valid Email ID like LoginName@Domain.com");
						o.focus();
						o.select();
						return false;						
					}				
			}
    		else
   			{
    			alert("Enter valid Email ID like LoginName@Domain.com");    			
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
// validate password
function valpass(o)
 {
	mytrim(o);
	val=o.value;
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