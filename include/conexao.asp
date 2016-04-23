<%
Response.AddHeader "cache-control", "private"
Response.CacheControl = "Private"
Response.AddHeader "pragma", "no-cache"
Response.ExpiresAbsolute = #January 1, 2020 00:00:01#
Response.Expires = -1

t_servidor = "sql"
t_data_padrao = "CURRENT_TIMESTAMP"
server.ScriptTimeout = 300
session.lcid = 1046
Session.TimeOut = 60

application("txt_conexao") = "Provider=SQLOLEDB.1; Data Source=local; Initial Catalog=sgd; User ID=user; Password=senha;"

set conexao = Server.CreateObject ("adodb.connection")
conexao.ConnectionString = application("txt_conexao")
conexao.CommandTimeout = 10
conexao.ConnectionTimeout = 10
server.ScriptTimeout = 300
conexao.CursorLocation = 3
conexao.Open

%>
<!-- #include virtual="include/config.asp" -->
<!-- #include virtual="include/funcao.asp" -->
<!-- #include virtual="include/seguranca.asp" -->
<!-- #include virtual="mensagem/mensagens.asp" -->
<!-- #include virtual="sistema/Layout/cabecalho.asp" -->
<!-- #include virtual="sistema/Layout/rodape.asp" -->
