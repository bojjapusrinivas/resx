<%
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' Author        : Srinivas Reddy
''' Date Created  : June 29, 2004
''' Date Modified :
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''' This is a Function to build the TOC with check boxes of
'''(Chapters, Sub Chapters, Options to add them to shopping cart)

Function BuildTOCString(Byval RetReportID)
	''' add main report wise	
	myString=""		
	myString = myString & "<div class=""reporttitle""><table width='100%'><tr><td width='60%'><INPUT onclick='deSelectReport();' type=checkbox name='R-"&request("code")&"' id='R-"&request("code")&"'>&nbsp;&nbsp;<b>"& ucase(title) &" (Full Report)</b></td><td width='13%' align='left'><b>Price : $ "&RS("Price")&".00 </b></td><td width='2%'>|</td><td width='10%' align='left'><b>Pages : "& RS("Pages") &"</b></td></tr></table></div>"
	dim myString,MainID,SubID
	Set rsMain =Server.CreateObject("ADODB.Recordset")
	rsMain.ActiveConnection = con
	sqlMain="select Main_ID,Report_ID,Main_title,Title_order,Chapter_price,Chapter_pages from TBL_TOC_Main where Report_id='"& RetReportID &"' order by Title_order"
	rsMain.Open sqlMain
	IF not rsMain.EOF THEN				
		MainID=0
		SubID=0
		while not rsMain.EOF
			MainID=MainID+1
			'' Main Chapter Link
			'' check to see if any of the chapter price is 0.00$
			if cint(trim(rsMain("Chapter_price")))<=0 then
				FreeChapter = 1
				if trim(FreeChapterString)<>"" then
					FreeChapterString = FreeChapterString & ":" & trim(rsMain("Main_title")) & "(" & trim(rsMain("Main_ID")) & ")"
				else
					FreeChapterString = trim(rsMain("Main_title")) & "(" & trim(rsMain("Main_ID")) & ")"
				end if
			end if
			'' format for Main Chapter Check Box : M-MainId-Price			
			myString = myString & "<div class=""menutitle"" onclick=""SwitchMenu('sub"&MainID&"',1)""><table width='100%'><tr><td width='60%'><INPUT onclick='deSelectSub("& rsMain("Main_ID") &");' type=checkbox name='M-"& rsMain("Main_ID") &"-"&rsMain("Chapter_Price") &"' id='M-"& rsMain("Main_ID") &"-"&rsMain("Chapter_Price") &"'>&nbsp;&nbsp;<b>"& rsMain("Main_title") &"</b></td><td width='13%' align='left'><b>Price : $ "& rsMain("Chapter_price") &".00 </b></td><td width='2%'>|</td><td width='10%' align='left'><b>Pages : "&rsMain("Chapter_pages")&"</b></td></tr></table></div><span class=""submenu"" id='sub"&MainID&"'>"
				''' get into Sub ID
				Set rsSub =Server.CreateObject("ADODB.Recordset")
				rsSub.ActiveConnection = con
				sqlSub="select Sub_ID,Main_ID,Sub_Title,title_order,Sub_Chapter_Price,Sub_Chapter_pages from TBL_TOC_Sub where Main_ID='"& rsMain("Main_ID") &"' order by Title_order"
				rsSub.Open sqlSub
				IF not rsSub.EOF THEN	
					while not rsSub.EOF
						'' check sub chapter amount
						if cint(trim(rsSub("Sub_Chapter_Price")))<=0 then
							FreeSubChapter = 1
							if trim(FreeSubChapterString)<>"" then
								FreeSubChapterString = FreeSubChapterString & ":"&trim(rsSub("Sub_Title"))&"(" & trim(rsSub("Sub_ID"))&")"
							else
								FreeSubChapterString = trim(rsSub("Sub_Title")) & "("& trim(rsSub("Sub_ID")) & ")"
							end if
						end if
						'' CHECK TO SEE IF THE Main Chapter has any Sub Chapters
						SubID=SubID+1
						Set RSCheck =Server.CreateObject("ADODB.Recordset")
						RSCheck.ActiveConnection = con
						sqlRSCheck="select Option_ID from TBl_toc_Options where Sub_ID='"& trim(rsSub("Sub_ID")) &"'"
						RSCheck.Open sqlRSCheck
						IF (RSCheck.EOF and RSCheck.BOF) THEN
							myString = myString & rsSub("Sub_Title") & "<br>"
						Else
							''Sub Chapter link
							'' format for sub Chapter Check Box : S-MainId-SubID-Price
							myString = myString & "<div class=""submenutitle"" onclick=""SwitchMenu('sub"&MainID&""&SubID&"',2)""><INPUT onclick='deSelectMain("& rsSub("Main_ID") &");' type=checkbox name='S-"& rsSub("Main_ID") &"-"& rsSub("Sub_ID") &"-"&rsSub("Sub_Chapter_Price") &"' id='S-"& rsSub("Main_ID") &"-"& rsSub("Sub_ID") &"-"&rsSub("Sub_Chapter_Price") &"'>&nbsp;"& rsSub("Sub_title") &" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price : $ "& rsSub("Sub_Chapter_price") &".00 &nbsp;|&nbsp; Pages : "& rsSub("sub_Chapter_pages") &" </div><font class=""subsubmenu"" id='sub"&MainID&""&SubID&"'><p align='left'>"
								''' get into Option ID
								Set RSOption =Server.CreateObject("ADODB.Recordset")
								RSOption.ActiveConnection = con
								usql1="select Option_ID,Sub_ID,Option_title,Option_Order from TBL_TOC_Options where Sub_ID='"& rsSub("Sub_ID") &"' order by Option_order"
								RSOption.Open usql1
								IF not RSOption.EOF THEN	
									while not RSOption.EOF
										''View the options in the sub chapter
										myString = myString & RSOption("Option_Title")
									RSOption.MoveNext 
									wend
									myString = myString & "</p></font>"
								else
									myString = myString & "</p></font>"
								End if
								set RSOption=nothing								
						End If
						Set RSCheck = nothing
					rsSub.MoveNext 
					wend
					myString = myString & "</span>"
				else
					myString = myString & "<div class=""menutitle"">-- Chapters have not been added for this Report --</div>"
				End if
				set rsSub=nothing	
		rsMain.MoveNext 
		wend
	else
		myString = myString & "<div class=""submenutitle"">NOTE: Chapters have not been added for this Report "&code&", you can buy full report only.</div>"
	End if
	set rsMain=nothing	
	BuildTOCString=myString
End Function

function addNewReportToXML(recID,rcode,rname,rpages,rprice,rType,rACSFileName,rMainID)
	 '' rcode -- ReportID
	 '' ReportName
	 dim strXMLFilePath,strFileName
	 strXMLFilePath = server.MapPath("XML_Files")
	 strFileName = session.SessionID&".xml"
	 Dim objDom, objRoot, objRecord, objField,objFieldValue
	 Dim objattID,objattTabOrder,objPI,blnFileExists,objelement
	 Dim objcode,objname,objpages,objprice,objType,objrecID,objACSFileName,objMainID
	 ''' Create XML DOM object
	 Set objDom = server.CreateObject("Microsoft.XMLDOM")
	 objDom.preserveWhiteSpace = True
	 blnFileExists = objDom.Load(strXMLFilePath & "\" & strFileName)
	 If blnFileExists = false Then		
		Set objPI = objDom.createProcessingInstruction("xml", "version='1.0'")
		objDom.insertBefore objPI, objDom.childNodes(0)
		'''' Add main node
		Set objRoot = objDom.createElement("Shoppingcart")
		objDom.appendChild objRoot
		'''' add Sub nodes
		Set objRecord = objDom.createElement("cart")
		objRoot.appendChild objRecord			 
		
		Set objType = objDom.createElement("Type")
		objRecord.appendChild objType
		objType.text = rType
			 
		Set objrecID = objDom.createElement("RecID")
		objRecord.appendChild objrecID
		objrecID.text = recID
			 
		Set objcode = objDom.createElement("ReportID")
		objRecord.appendChild objcode
		objcode.text = rcode
			 
		Set objname = objDom.createElement("ReportName")
		objRecord.appendChild objname
		objname.text = rname
			 
		Set objpages = objDom.createElement("Pages")
		objRecord.appendChild objpages
		objpages.text = rpages
			 
		Set objprice = objDom.createElement("Price")
		objRecord.appendChild objprice
		objprice.text = rprice	
		
		Set objACSFileName = objDom.createElement("ACSFileName")
		objRecord.appendChild objACSFileName
		objACSFileName.text = rACSFileName	
		
		Set objMainID = objDom.createElement("MainID")
		objRecord.appendChild objMainID
		objMainID.text = rMainID
					
		Set objecopy = objDom.createElement("Electroniccopy")
		objRecord.appendChild objecopy
		objecopy.text = "soft"
		
		Set objType = objDom.createElement("Sno")
		objRecord.appendChild objType
		objType.text = 1
					
		'' add the sub nodes to the Shopping cart node
		objDom.insertBefore objPI, objDom.childNodes(0)	
	 Else
	 	'''' add Sub nodes
		'''check to see if same node exists or not
		dim InsertRec,lastrecID
		InsertRec=0
		lastrecID=1
		Set objXML = Server.CreateObject("Microsoft.XMLDOM")
		Set objLst = Server.CreateObject("Microsoft.XMLDOM")
		Set objHdl = Server.CreateObject("Microsoft.XMLDOM")
		objXML.async = False
		objXML.Load (strXMLFilePath &"\"&strFileName)	
		Set objLst = objXML.getElementsByTagName("cart")
		noOfReports = objLst.length
		for i = 0 to cint(noOfReports-1)
		Set objHdl = objLst.item(i)
			If (trim(objHdl.childNodes(0).childNodes(0).text)=trim(rType) and trim(objHdl.childNodes(1).childNodes(0).text)=trim(recID)) then
				InsertRec=1
			End if
			if (i=cint(noOfReports-1)) then
				lastrecID = trim(objHdl.childNodes(9).childNodes(0).text)
				lastrecID = cint(lastrecID)+1
			end if
		Next
		dim RecStr
		RecStr=""
		'' if hte record do
		if InsertRec=0 then
			''' check to see if any sub chapters exists for the main chapter being added
			'if trim(rType)="Chapter" then
			'	Set objXML = Server.CreateObject("Microsoft.XMLDOM")
			'	Set objLst = Server.CreateObject("Microsoft.XMLDOM")
			'	Set objHdl = Server.CreateObject("Microsoft.XMLDOM")
			'	objXML.async = False
			'	objXML.Load (strXMLFilePath &"\"&strFileName)	
			'	Set objLst = objXML.getElementsByTagName("cart")
			'	noOfReports = objLst.length
			'	for i = 0 to cint(noOfReports-1)
			'		Set objHdl = objLst.item(i)
			'		If (trim(objHdl.childNodes(0).childNodes(0).text)="Sub Chapter" and trim(objHdl.childNodes(7).childNodes(0).text)=trim(recID)) then
			'			'''''''''remove the sub chapters if main chapter is added
			'			Set objXMLDoc = CreateObject("Microsoft.XMLDOM") 
			'			objXMLDoc.async = False 
			'			objXMLDoc.load(strXMLFilePath &"\"&strFileName) 
			'			
			''			Set objRoot = objXMLDoc.documentElement 
			'			Set objExNode = objRoot.removeChild(objRoot.childNodes.item(i))	
			'			i = i - 1
			'			objXMLDoc.save strXMLFilePath &"\" & strFileName
			'			Set objExNode = nothing
			'			Set objRoot = nothing						
			'			Set objXMLDoc = nothing
			'			'''''''''''
			'		End if
			'	Next
			'	Set objXML = nothing
			'	Set objLst = nothing
			'	Set objHdl = nothing
			'end if			
			''''''''''''''''''''''''''''''''''''''''''''''
			'' add the new record
			Set objRoot = objDom.documentElement
			
			Set objRecord = objDom.createElement("cart")
			objRoot.appendChild objRecord
				 
			Set objType = objDom.createElement("Type")
			objRecord.appendChild objType
			objType.text = rType
				 
			Set objrecID = objDom.createElement("RecID")
			objRecord.appendChild objrecID
			objrecID.text = recID
				 
			Set objcode = objDom.createElement("ReportID")
			objRecord.appendChild objcode
			objcode.text = rcode
				 
			Set objname = objDom.createElement("ReportName")
			objRecord.appendChild objname
			objname.text = rname
				 
			Set objpages = objDom.createElement("Pages")
			objRecord.appendChild objpages
			objpages.text = rpages
				 
			Set objprice = objDom.createElement("Price")
			objRecord.appendChild objprice
			objprice.text = rprice	
			
			Set objACSFileName = objDom.createElement("ACSFileName")
			objRecord.appendChild objACSFileName
			objACSFileName.text = rACSFileName	 
			
			Set objMainID = objDom.createElement("MainID")
			objRecord.appendChild objMainID
			objMainID.text = rMainID	
			
			Set objecopy = objDom.createElement("Electroniccopy")
			objRecord.appendChild objecopy
			objecopy.text = "soft"
			
			Set objType = objDom.createElement("Sno")
			objRecord.appendChild objType
			objType.text = lastrecID
			
		end if	
		Set objXML = nothing
		Set objLst = nothing
		Set objHdl = nothing
	 End If		
	 
	 objDom.save strXMLFilePath &"\" & strFileName
	 Set objDom = Nothing
	 Set objRoot = Nothing
	 Set objRecord = Nothing
	 Set objType = Nothing
	 Set objrecID = Nothing
	 Set objcode = Nothing
	 Set objname = Nothing
	 Set objPI = Nothing
	 Set objpages = nothing
	 Set objprice = nothing
	 Set objACSFileName = nothing
End Function

Function DeleteReportNode(recID,rType)   
	dim RecCount
	RecCount=-1
	dim strXMLFilePath,strFileName
	strXMLFilePath = server.MapPath("XML_Files")
	strFileName = session.SessionID&".xml"
		Set objXML = Server.CreateObject("Microsoft.XMLDOM")
		Set objLst = Server.CreateObject("Microsoft.XMLDOM")
		Set objHdl = Server.CreateObject("Microsoft.XMLDOM")
		objXML.async = False
		objXML.Load (strXMLFilePath &"\"&strFileName)	
		Set objLst = objXML.getElementsByTagName("cart")
		noOfReports = objLst.length
		for i = 0 to cint(noOfReports-1)
		Set objHdl = objLst.item(i)
		If (trim(objHdl.childNodes(0).childNodes(0).text)=trim(rType) and trim(objHdl.childNodes(1).childNodes(0).text)=trim(recID)) then
			RecCount=i
		End if
		Next
		Set objXML = nothing
		Set objLst = nothing
		Set objHdl = nothing
		
		''' remove the i th node
		Set objXMLDoc = CreateObject("Microsoft.XMLDOM") 
		objXMLDoc.async = False 
		objXMLDoc.load(strXMLFilePath &"\"&strFileName) 

		Set objRoot = objXMLDoc.documentElement 
		'' remove the child		
		Set objExNode = objRoot.removeChild(objRoot.childNodes.item(RecCount))		
		objXMLDoc.save strXMLFilePath &"\" & strFileName
		Set objXMLDoc = nothing
		Set objRoot = nothing
		Set objExNode = nothing		
End Function

Function UpdateReportNode(recID,rcopy)  
	dim strXMLFilePath,strFileName
	strXMLFilePath = server.MapPath("XML_Files")
	strFileName = session.SessionID&".xml"
		Set objXML = Server.CreateObject("Microsoft.XMLDOM")
		Set objLst = Server.CreateObject("Microsoft.XMLDOM")
		Set objHdl = Server.CreateObject("Microsoft.XMLDOM")
		objXML.async = False
		objXML.Load (strXMLFilePath &"\"&strFileName)	
		Set objLst = objXML.getElementsByTagName("cart")
		noOfReports = objLst.length	
		for i = 0 to cint(noOfReports-1)
			Set objHdl = objLst.item(i)
			If (trim(objHdl.childNodes(9).childNodes(0).text)=trim(recID)) then		
				Set objRoot = objXML.documentElement 
				' Update the child		
				objHdl.childNodes(8).childNodes(0).text=trim(rcopy)
				objXML.save strXMLFilePath &"\" & strFileName
				exit for
			End if
		Next
		Set objXML = nothing
		Set objLst = nothing
		Set objHdl = nothing	
End Function

Function Dot2LongIP (ByVal DottedIP)
Dim i, pos
Dim PrevPos, num
If DottedIP = "" Then
    Dot2LongIP = 0
Else
    For i = 1 To 4
        pos = InStr(PrevPos + 1, DottedIP, ".", 1)
        If i = 4 Then 
            pos = Len(DottedIP) + 1
        End If
        num = Int(Mid(DottedIP, PrevPos + 1, pos - PrevPos - 1))
        PrevPos = pos
        Dot2LongIP = ((num Mod 256) * (256 ^ (4 - i))) + Dot2LongIP
    Next
End If
End Function 

Function getDBvalue(tablename,fldname,wherefld,whereval,ctype)
	set rsgetvalue  = server.createobject("ADODB.Recordset")
	rsgetvalue.activeconnection = DataSource3
	rsgetvalue.CursorType = 3
	if ctype=1 then
		sqlaccno = "select "&fldname&" from "&tablename&" where "&wherefld&"='"&whereval&"'"
	else
		sqlaccno = "select "&fldname&" from "&tablename&" where "&wherefld&"="&whereval&""
	end if
	rsgetvalue.open sqlaccno	
	if not rsgetvalue.EOF then
		getDBvalue = trim(rsgetvalue(0))
	else
		getDBvalue = 1
	end if		
	rsgetvalue.Close
	set rsgetvalue = nothing
End Function

Function getDBvaluecon(tablename,fldname,wherefld,whereval,ctype)
	set rsgetvalue  = server.createobject("ADODB.Recordset")
	rsgetvalue.activeconnection = con
	rsgetvalue.CursorType = 3
	if ctype=1 then
		sqlaccno = "select "&fldname&" from "&tablename&" where "&wherefld&"='"&whereval&"'"
	else
		sqlaccno = "select "&fldname&" from "&tablename&" where "&wherefld&"="&whereval&""
	end if
	rsgetvalue.open sqlaccno	
	if not rsgetvalue.EOF then
		getDBvaluecon = trim(rsgetvalue(0))
	else
		getDBvaluecon = 1
	end if		
	rsgetvalue.Close
	set rsgetvalue = nothing
End Function

Function getDBvaluecon1(Strqry)
	set rsgetvalue  = server.createobject("ADODB.Recordset")
	rsgetvalue.activeconnection = con
	rsgetvalue.CursorType = 3
	
		sqlaccno = Strqry
	rsgetvalue.open sqlaccno	
	if not rsgetvalue.EOF then
		getDBvaluecon = trim(rsgetvalue(0))
	else
		getDBvaluecon = 0
	end if		
	rsgetvalue.Close
	set rsgetvalue = nothing
End Function

Function getDBNextPrevValue(recid,ctype)
	set rsgetvalue  = server.createobject("ADODB.Recordset")
	rsgetvalue.activeconnection = con
	rsgetvalue.CursorType = 3
	'ctype 1 = next
	if ctype=1 then
		sqlaccno = "SELECT  min(rec_id) FROM TBL_SIS_Analysts_Gurgaon where rec_id >" & recid & " and user_status not in (0,9)"
	else
		sqlaccno = "SELECT  max(rec_id) FROM TBL_SIS_Analysts_Gurgaon where rec_id <" & recid & " and user_status not in (0,9)"
	end if
	rsgetvalue.open sqlaccno	
	if not rsgetvalue.EOF then
		getDBNextPrevValue = trim(rsgetvalue(0))
	else
		getDBNextPrevValue = 1
	end if		
	rsgetvalue.Close
	set rsgetvalue = nothing
End Function


Function ValueTrim(ActValue,CutValue)
	dim LenValue
	LenValue = len(trim(ActValue))
	if LenValue>CutValue then
		ValueTrim = mid(ActValue,1,CutValue)
		ValueTrim =ValueTrim & "...."
	else
		ValueTrim = ActValue
	end if
End Function

Function Selected(val1,val2)
	IF trim(val1) = trim(val2) then
		Selected = " Selected"
	else
		Selected = ""
	End IF
END Function
%>