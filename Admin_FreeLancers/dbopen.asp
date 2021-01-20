<%dim drivertype,servertype,userid,pwd,dbname,con,cmd
	drivertype="SQLOLEDB.1"
	servertype="128.242.110.20"
	''userid="sa"
	''pwd="gia4sat"
	userid="new_sisuser"
	pwd="sisindia959$"
	dbname="Analyst_vizag"	
	set con=Server.CreateObject ("ADODB.Connection")
	''con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmd = Server.CreateObject("ADODB.Command")
	''cmd.ActiveConnection = con
	
	''set con1=Server.CreateObject ("ADODB.Connection")
	''con1.open "Provider=SQLOLEDB.1;data source=202.65.148.24;uid=gbadmin;pwd=admin;initial catalog=ebooks"  
	
%>