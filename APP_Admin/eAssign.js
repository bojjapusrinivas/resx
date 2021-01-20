// JScript source code
function validatefrom()
	{
		
		var o;
		o = document.frmsis;
		var i = o.elements.length;
		var x ="false";
		for (var j=0;j<i;j++)
		{
			if (o.elements[j].type =="checkbox")
			{
				if (o.elements[j].checked)
				{
					x = "true";
				}
			}
		}
		if ( x == "false" )
		{
			alert("Select atleast one Candidate.");
			return false;
		}
		else 
		{
			return true;

		}
	}

	function fnUserCheckAll()
	{
		var o;
		o = document.frmsis;
		var k =o.elements.length;
			for (var i=0; i<k;i++)
			{
				//if ((o.elements[i].name == "CHK"))
				if (o.elements[i].type =="checkbox")

				{
					o.elements[i].checked = true;
				}
			}
	}
	function fnUserClearAll()
	{
		var o;
		o = document.frmsis;
		//alert(o.elements[1].type);
		var k =o.elements.length;
			for (var i=0; i<k;i++)
			{
				if (o.elements[i].type =="checkbox")
				//if ((o.elements[i].name == "CHK"))
				{
					o.elements[i].checked = false;
				}
			}
	}


	