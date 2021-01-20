<%
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' Author        : Srinivas CHV
''' Date Created  : August, 26, 2010
''' Date Modified :
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' This is a Function to check IP address of logged people in admin interfaces


Function IPAddressCheck()
	''''''*** check IP Address of the system and do not display login details ****''''''''''
	
	dim ChkIPAddList, CHKSplitIP, CHKIPOK, CHKSYSIPAddress
	CHKSYSIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
	if CHKSYSIPAddress = "" then
		CHKSYSIPAddress = Request.ServerVariables("REMOTE_ADDR")
	end if
	''response.write (CHKSYSIPAddress & "<br>")
	''' even after trying to get IP address is null just stop the process
	if CHKSYSIPAddress = "" then
		response.end
	end if

	CHKIPOK = "NO"
	''ChkIPAddList = "202.65.148.20,202.65.148.21,99.37.154.190,99.37.154.185,99.37.154.186,99.37.154.187,99.37.154.188,99.37.154.189,10.0.0.1,10.0.0.2"
	ChkIPAddList = "192.168.1.46,192.168.1.17,192.168.1.14,192.168.1.13,192.168.1.35,192.168.1.49,192.168.1.31,192.168.1.76,192.168.0.25,202.65.148.20,202.65.148.24,10.0.0.1,10.0.0.2,10.0.0.3,192.168.1.48,192.168.1.24,192.168.1.101,192.168.0.22,122.160.157.80"
	CHKSplitIP = split(ChkIPAddList,",")
	for x = 0 to ubound(CHKSplitIP)
		''Response.write CHKSplitIP(x) & "<br>"
		if CHKSplitIP(x)=CHKSYSIPAddress then
			CHKIPOK = "YES"		
			EXIT for
		end if
	next
	IPAddressCheck=CHKIPOK
	''response.end
	''response.write (IPAddressCheck)
End Function

%>
