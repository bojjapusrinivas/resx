 <table cellpadding=0 cellspacing=0 width="100%">
 <tr>
    <td height="79" colspan="2" valign="top">
		<table width="100%"  align="center" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#87CEFA">
		  <td width="100%" height="79" align="center">&nbsp;<font color="#804040"><strong>Administration Interface</strong></font></td>		  
		</tr>
		</table>
	</td>
  </tr>
  </table>
  <% Function PCase(byVal string)
	Dim Tmp, Word, Tmp1, Tmp2, firstCt, a, sentence, c, i
	If IsNull(string) Then
		PCase = Null
		Exit Function
	Else
		string = CStr( string )
	End If
	a = Split( string, vbCrLf )
	c = UBound(a)
	i = 0
	For each sentence in a
		Tmp = Trim( sentence )
		Tmp = split( sentence, " " )
		For Each Word In Tmp
			Word = Trim( Word )
			Tmp1 = UCase( Left( Word, 1 ) )
			Tmp2 = LCase( Mid(  Word, 2 ) )
			PCase = PCase & Tmp1 & tmp2 & " "
		Next
		PCase = Left( PCase, Len(PCase) - 1 )
		If i = c then
		Else
			PCase = PCase & vbCrLf
		End If
		i = i + 1
	Next
End Function
%>