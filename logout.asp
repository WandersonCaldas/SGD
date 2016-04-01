<%       
    session("cod_usuario") = ""
	Session.Contents.RemoveAll()
	Session.Abandon()
    response.write "<script language=javascript> self.location.href = 'index.asp';</script>"    
%>