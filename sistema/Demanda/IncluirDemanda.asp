<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Classes/Arquivo/Arquivo.asp" -->
<!-- #include virtual="sistema/Classes/Demanda/Demanda.asp" -->
<!-- #include virtual="sistema/Classes/Upload/Upload.asp" -->
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

txt_titulo      = Uploader.Form("txt_titulo")
txt_descricao   = Uploader.Form("txt_descricao")
cod_prioridade  = Uploader.Form("cod_prioridade")

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

'INCLUIR DEMANDA
if err.number = 0 then        
    oDemanda.txt_titulo_ = txt_titulo
    oDemanda.txt_descricao_ = RemoveHTML(txt_descricao)
    oDemanda.id_prioridade_ = cod_prioridade
    oDemanda.id_situacao_ = 1 
    oDemanda.txt_arquivo_ = txt_arquivo_gravar       
     
    conexao.begintrans()
    oDemanda.IncluirDemanda()
       
    if err.number = 0 then        
        conexao.committrans()
        js_go("Listagem.asp")
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