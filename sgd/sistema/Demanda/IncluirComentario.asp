<!-- #include virtual="/sgd/include/conexao.asp" -->
<!-- #include virtual="/sgd/sistema/Classes/Arquivo/Arquivo.asp" -->
<!-- #include virtual="/sgd/sistema/Classes/Demanda/Demanda.asp" -->
<!-- #include virtual="/sgd/sistema/Classes/Upload/Upload.asp" -->
<%
Response.Expires = 0
server.ScriptTimeout = 1200  

dim oDemanda : set oDemanda = new cDemanda
dim oArquivo : set oArquivo = new cArquivo

dim txt_local : txt_local = oArquivo.LocalGravar()
   
' Create the FileUploader
Dim Uploader, File
Set Uploader = New FileUploader

' This starts the upload process
Uploader.Upload()

on error resume next

txt_descricao   = Uploader.Form("txt_descricao")
id_demanda      = Uploader.Form("id")
    
If Uploader.Files.Count > 0 Then
    For Each File In Uploader.Files.Items     
        txt_arquivo = remove_acento(File.FileName)
        txt_tamanho_arquivo = File.FileSize           

        txtPath = FnPathFileName() & txt_arquivo
    
        txt_arquivo_gravar = replace(txt_local, application("txt_caminho_documento_curto"), "") & "\" & txtPath                         
      
        ' Save the file
        File.FileName = txtPath
        File.SaveToDisk txt_local & "\" 
    Next
End If

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
        conexao.rollbacktrans()
        js_alert(err.Description)
        js_go_back(application("msg_erro_incluir"))
    end if
else
    js_go_back(application("msg_erro_incluir"))
end if

on error goto 0
%>