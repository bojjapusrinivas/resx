<%
	Function ReturnPageContent(sPageName,folderHR)
		dim sfile,xobj1,loadflag,rootnode,cnode,Contentvar
		if folderHR=1 then
			sfile = Server.MapPath ("../Admin_MBA/Test_Files/"&sPageName&".xml")
		elseif folderHR=2 then
			sfile = Server.MapPath ("ProdServ_Files/"&sPageName&".xml")
		else
			sfile = Server.MapPath ("SubSidry_Files/"&sPageName&".xml")
		end if
		''response.write (sfile)
		''response.end
		set xobj1 = Server.CreateObject ("Microsoft.XMLDOM")
		loadflag = xobj1.load(sfile)
		IF loadflag = true then
			set rootnode = xobj1.documentElement
			
				Set cnode = xobj1.getElementsByTagName("Text")
				IF cnode.length > 0 then
					Contentvar = cnode.item(0).text
				End IF	
				Set cnode = Nothing
			
			ReturnPageContent = Trim(Contentvar)
			Set xobj1 = nothing
			
			IF err<>0 Then
				call CheckASPError ("There is a system problem." )
				Response.End
			End IF
			
		Else
			ReturnPageContent = ""
			'<h3>Page Under Construction</h3>
		End IF
	End Function

	Function ReturnPageContentUser(sPageName,folderHR)
		dim sfile,xobj1,loadflag,rootnode,cnode,Contentvar
		if folderHR=1 then
			sfile = Server.MapPath ("User_Files/"&sPageName&".xml")
		else
			sfile = Server.MapPath ("../User_Files/"&sPageName&".xml")
		end if
		'''response.write (sfile)
		'''response.end
		set xobj1 = Server.CreateObject ("Microsoft.XMLDOM")
		loadflag = xobj1.load(sfile)
		IF loadflag = true then	
			set rootnode = xobj1.documentElement
			
				Set cnode = xobj1.getElementsByTagName("Text")
				IF cnode.length > 0 then
					Contentvar = cnode.item(0).text
				End IF	
				Set cnode = Nothing
			
			ReturnPageContentUser = Trim(Contentvar)
			Set xobj1 = nothing
			
			IF err<>0 Then
				call CheckASPError ("There is a system problem." )
				Response.End
			End IF
			
		Else
			ReturnPageContentUser = "<h3>Page Under Construction</h3>"
		End IF
	End Function
	
	Function ReturnPageContentEdited(sPageName,folderHR)
		dim sfile,xobj1,loadflag,rootnode,cnode,Contentvar
		if folderHR=1 then
			sfile = Server.MapPath ("Edited_Files/"&sPageName&".xml")
		else
			sfile = Server.MapPath ("../Edited_Files/"&sPageName&".xml")
		end if
		''response.write (sfile)
		''response.end
		set xobj1 = Server.CreateObject ("Microsoft.XMLDOM")
		loadflag = xobj1.load(sfile)
		IF loadflag = true then	
			set rootnode = xobj1.documentElement
			
				Set cnode = xobj1.getElementsByTagName("Text")
				IF cnode.length > 0 then
					Contentvar = cnode.item(0).text
				End IF	
				Set cnode = Nothing
			
			ReturnPageContentEdited = Trim(Contentvar)
			Set xobj1 = nothing
			
			IF err<>0 Then
				call CheckASPError ("There is a system problem." )
				Response.End
			End IF
			
		Else
			ReturnPageContentEdited = "<h3>Page Under Construction</h3>"
		End IF
	End Function
%>
