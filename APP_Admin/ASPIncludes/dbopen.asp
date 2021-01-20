<%dim drivertype,servertype,userid,pwd,dbname,con,cmd
	drivertype="SQLOLEDB.1"
	''servertype="128.242.110.20"
	''userid="new_sisuser"
	''pwd="sisindia959$"

	''servertype="198.71.225.113"
	servertype="43.255.152.25"
	userid="new_sisuser"
	pwd="sisindia959$"
	dbname="resxtech"	
	set con=Server.CreateObject ("ADODB.Connection")
  ''Encrypt=False;Packet Size=4096
	''con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
	set cmd = Server.CreateObject("ADODB.Command")
	''cmd.ActiveConnection = con
	
	''set con1=Server.CreateObject ("ADODB.Connection")
	''con1.open "Provider=SQLOLEDB.1;data source=202.65.148.24;uid=gbadmin;pwd=admin;initial catalog=ebooks"  
	
%>