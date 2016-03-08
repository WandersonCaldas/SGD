<!-- #include virtual="include/funcao.asp" -->
<%       
    session("cod_usuario") = ""
	Session.Contents.RemoveAll()
	Session.Abandon()
    js_go("index.asp")
%>