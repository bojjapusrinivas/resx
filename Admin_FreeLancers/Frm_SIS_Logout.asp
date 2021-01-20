<%@ LANGUAGE="VBScript" %>
<%
	session("user_name")=""
	session("user_type")=""	
	session("editor")=""
	session.abandon
	Response.Redirect ("default.asp")
%>
