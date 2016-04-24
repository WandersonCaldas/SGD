<!-- #include virtual="/sgd/include/conexao.asp" -->
<%       
class cArquivo
       
    function LocalGravar()
        dim txt_local

        txt_local = application("txt_caminho_documento")

        txt_local = txt_local & "\" & year(date()) & "\" & formatar_documento_numero(month(date()), 2)
        Set objFSO = Server.CreateObject("Scripting.FileSystemObject")    
        if not objFSO.FolderExists(txt_local) then
	        txt_local_ano = application("txt_caminho_documento") & "\" & year(date())
	        if not objFSO.FolderExists(txt_local_ano) then
		        objFSO.CreateFolder(txt_local_ano)
	        end if
	        objFSO.CreateFolder(txt_local)
        end if
        set objFSO = Nothing

        LocalGravar = txt_local
    end function
end class
%>