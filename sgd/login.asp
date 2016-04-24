<!-- #include virtual="/sgd/include/conexao.asp" -->
<%       
dim autenticacao, login, senha

login = request("form-username")
senha = request("form-password")
    
autenticacao = Autenticar(login, senha)
  
if isnull(autenticacao) or autenticacao = "" then
    js_alert(ExibeMensagem("MSG_002"))
    js_go("/sgd/index.asp")
end if

if autenticacao > 0 then
    session("cod_usuario") = autenticacao
    js_go("/sgd/sistema/Default.asp")
elseif autenticacao = 0 then
    js_alert(ExibeMensagem("MSG_001"))
    js_go("/sgd/index.asp")    
end if

%>