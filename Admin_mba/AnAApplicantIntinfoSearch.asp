<%@ Language=VBScript %>
<!--#include file="../ASPIncludes_vizag/DBopen.asp"-->
<!--#include file="../ASPIncludes_vizag/ADOVBS.inc"-->
<!--#include file="../ASPIncludes/SiteFunctions.asp"-->
<!--#include file="PageContents.asp"-->
<%
If trim(session("User_Name"))="" then
	Response.Redirect ("Default.asp?message=sesexp")
End if
function fnchecked(val1,val2)
		if (strComp(val1,val2,0) = 0 ) then
			fnchecked= "checked"
		else
			fnchecked= ""
		end if
end function

'''' update the status of the records that were selected for the check boxes
if trim(request("butnvalue"))<>"" then
		''' User Status = 1 -- pending
		''' User Status = 2 -- approved
		''' User Status = 3 -- Declined
		''' User Status = 5 -- Hold	
		
		dim Mystat, mystat1, insertval,userrank,userrank1,admstats
		userrank="0"
		userrank1="0"
	 admstats=1
	if trim(request("SelStatus")) <> "" then
	  admstats=trim(request("SelStatus"))
	else
	  admstats=1
	end if
	
		if trim(request("txtreason"))<>"" then
			mystat1 = trim(request("txtreason"))
		end if
	'Response.write trim(lcase(request("butnvalue")))
	'response.end
      	if trim(lcase(request("butnvalue")))="accept1" then
			Mystat = "Approve"
			'mystat1 = "Approved"
			mystat1=request("txtreason")
			userrank=0 'request("UserRank")
			insertval = 2
			sqlupdate="update TBL_SIS_Analysts set User_Points="&trim(userrank)&" where Rec_ID="&trim(request("ID"))&""
		
			
	elseif trim(lcase(request("butnvalue")))="accept2" then
			Mystat = "Approve 2"
			mystat1 = "Approved"
			mystat1=request("txtreason")
			userrank1=request("UserRank1")
			sqlupdate="update TBL_SIS_Analysts set User_Points_US="&trim(userrank1)&" where Rec_ID="&trim(request("ID"))&""
			insertval = 2
	elseif trim(lcase(request("butnvalue")))="accept3" then
			mystat1=request("txtreason")
			sqlupdate="update TBL_SIS_Analysts set admin_status =" & trim(request("SelStatus")) & "  where Rec_ID="&trim(request("ID"))&""
			insertval = 2
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
			'response.end
	elseif trim(lcase(request("butnvalue")))="high expectations" then
			mystat1="High Expectations " & request("txtreason")
			sqlupdate="update TBL_SIS_Analysts set user_status =9  where Rec_ID="&trim(request("ID"))&""
			insertval = 9
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
			'response.end
	elseif trim(lcase(request("butnvalue")))="competitor" then
			mystat1="Competitor " & request("txtreason")
			sqlupdate="update TBL_SIS_Analysts set user_status =10  where Rec_ID="&trim(request("ID"))&""
			insertval = 10
			'admstats=trim(request("SelStatus"))
			rESPONSE.WRITE SQLUPDATE
      	elseif trim(lcase(request("butnvalue")))="decline" then
			Mystat = "Decline"
			mystat1 = "Declined"
			userrank=0
			userrank1=0
			insertval = 3
			sqlupdate=""
	elseif trim(lcase(request("butnvalue")))="hold" then
			Mystat = "Hold"
			mystat1 = "Hold"
			insertval = 5
			userrank=0
			userrank1=0
			sqlupdate=""
      	end if
	
	
		dim recID
		recID = trim(request("ID"))
		''' call the stored procedure to insert data into the table
		
		con.open "Provider="&drivertype&";data source="&servertype&";uid="&userid&";pwd="&pwd&";initial catalog="&trim(dbname)  
		set cmdEdit=server.CreateObject("ADODB.Command")
		cmdEdit.ActiveConnection = con	
			with cmdEdit
				.CommandText = "SP_TBL_SIS_Analysts"
				.CommandType = adcmdStoredProc	
				'Reason_Update=@MyReason_Update,
                'Date_Updated=@MyDate_Updated,
				'Updated_By=@MyUpdated_By,
				'User_Status=@MyUser_Status,
				'Admin_Status=@MyAdmin_Status
				.Parameters.Append .CreateParameter ("@MyOption",advarchar,adparamInput,10,"UPDATESTAT")
				.Parameters.Append .CreateParameter ("@MyRec_ID",adInteger,adparamInputOutput,,trim(recID))
				.Parameters.Append .CreateParameter ("@MyUser_Name",advarchar,adparamInputOutput,50,"Name")
				.Parameters.Append .CreateParameter ("@MyUser_Address",advarchar,adparamInputOutput,500,"Address")
				.Parameters.Append .Creat