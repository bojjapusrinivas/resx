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
							myString = myString & "<div class=""submenutitle"" onclick=""SwitchMenu('sub"&MainID&""&SubID&"',2)""><INPUT onclick='deSelectMain("& rsSub("Main_ID") &");' type=checkbox name='S-"& rsSub("Main_ID") &"-"& rsSub("Sub_ID") &"-"&rsSub("Sub_Chapter_Price") &"' id='S-"& rsSub("Main_ID") &"-"& rsSub("Sub_ID") &"-"&rsSub("Sub_Chapter_Price") &"'>&nbsp;"& rsSub("Sub_title") &" &nbsp;&nb