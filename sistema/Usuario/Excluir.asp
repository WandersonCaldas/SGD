<!-- #include virtual="include/conexao.asp" -->
<% 
dim id : id = request("id")    
js_go("Visualizar.asp?id=" & id & "&txt_acao=excluir")    
%>