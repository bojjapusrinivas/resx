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
			if(onform[i][0