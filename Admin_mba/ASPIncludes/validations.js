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
	