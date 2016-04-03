<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Classes/Arquivo/Arquivo.asp" -->
<!-- #include virtual="sistema/Classes/Demanda/Demanda.asp" -->
<%
Response.Expires = 0
server.ScriptTimeout = 1200
    
set objUpload = server.CreateObject("Dundas.Upload.2")
objUpload.UseUniqueNames = true    

dim oDemanda : set oDemanda = new cDemanda
dim oArquivo : set oArquivo = new cArquivo

dim txt_local : txt_local = oArquivo.LocalGravar()

on error resume next
objUpload.Save txt_local

txt_titulo      = objUpload.Form("txt_titulo")
txt_descricao   = objUpload.Form("txt_descricao")
cod_prioridade  = objUpload.Form("cod_prioridade")

for d = 0 to (objUpload.Files.Count  -1)
    txt_arquivo = objUpload.Files(d).Path	
	txt_arquivo = remove_acento(txt_arquivo)
    txt_tamanho_arquivo = objUpload.Files(d).Size

    txt_arquivo_gravar = replace(txt_arquivo, application("txt_caminho_documento_curto"), "")
next

'INCLUIR DEMANDA
if err.number = 0 then        
    oDemanda.txt_titulo_ = txt_titulo
    oDemanda.txt_descricao_ = txt_descricao
    oDemanda.id_prioridade_ = cod_prioridade
    oDemanda.id_situacao_ = 1 
    oDemanda.txt_arquivo_ = txt_arquivo_gravar       
     
    conexao.begintrans()
    oDemanda.IncluirDemanda()
       
    if err.number = 0 then
        conexao.committrans()
        js_go("Listagem.asp")
    else
        conexao.rollback()
        js_alert(err.Description)
        js_go_back(application("msg_erro_incluir"))
    end if
else
    js_go_back(application("msg_erro_incluir"))
end if

set objUpload = nothing
on error goto 0
%>