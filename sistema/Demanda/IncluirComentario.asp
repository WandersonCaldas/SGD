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

txt_descricao   = objUpload.Form("txt_descricao")
id_demanda      = objUpload.Form("id")

for d = 0 to (objUpload.Files.Count  -1)
    txt_arquivo = objUpload.Files(d).Path	
	txt_arquivo = remove_acento(txt_arquivo)
    txt_tamanho_arquivo = objUpload.Files(d).Size

    txt_arquivo_gravar = replace(txt_arquivo, application("txt_caminho_documento_curto"), "")
next

'INCLUIR COMENTÁRIO
if err.number = 0 then 
    oDemanda.id_demanda_ = id_demanda           
    oDemanda.txt_comentario_ = RemoveHTML(txt_descricao)        
    oDemanda.txt_arquivo_ = txt_arquivo_gravar       
     
    conexao.begintrans()
    oDemanda.Comentar()
       
    if err.number = 0 then
        conexao.committrans()
        js_go("Visualizar.asp?id=" & id_demanda)
    else
        'conexao.rollback()
        js_alert(err.Description)
        js_go_back(application("msg_erro_incluir"))
    end if
else
    js_go_back(application("msg_erro_incluir"))
end if

set objUpload = nothing
on error goto 0
%>