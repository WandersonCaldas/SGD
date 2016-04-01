<!-- #include virtual="include/conexao.asp" -->
<%       
class cDemanda
    Public id_demanda_
    Public id_comentario_
    Public txt_descricao_    
    Public id_prioridade_
    Public id_situacao_
    Public txt_titulo_
    Public txt_arquivo_
    Public id_usuario_    
    
    sub IncluirDemanda() 
        Me.id_demanda_ = RetornaIdDemanda()        
        
        'INCLUIR NA TBL_DEMANDA
        Executar("INSERT INTO tbl_demanda(id_demanda, id_situacao, cod_usuario_abertura, " & _
                " txt_descricao, cod_usuario_responsavel, id_prioridade, txt_titulo) " & _
                " VALUES(" & Me.id_demanda_ & ", " & Me.id_situacao_ & ", " & session("cod_usuario") & ", " & _
                " '" & trim(Me.txt_descricao_) & "', " & session("cod_usuario") & ", " & Me.id_prioridade_ & ", " & _ 
                " '" & trim(Me.txt_titulo_) & "')")
        
        'INCLUIR NA TBL_COMENTARIO
        call IncluirComentario()        
        
        'INCLUIR NA TBL_ARQUIVO
        if trim(Me.txt_arquivo_) <> "" then
            call IncluirArquivo()
        end if
        
    end sub

    function RetornaIdDemanda()
        dim rsIdDemanda, retorno
    
        set rsIdDemanda = oRecordSet("SELECT TOP 1 id_demanda FROM tbl_demanda ORDER BY id_demanda DESC")                
        if not rsIdDemanda.eof then
            retorno = limpar_comparacao(rsIdDemanda(0)) + 1
        else
            retorno = 1            
        end if

        rsIdDemanda.close()
        set rsIdDemanda = nothing

        RetornaIdDemanda = retorno
    end function

    function RetornaIdComentario()
        dim rsIdComentario, retorno
        
        set rsIdComentario = oRecordSet("SELECT TOP 1 id_comentario FROM tbl_comentario ORDER BY id_comentario DESC")
        if not rsIdComentario.eof then
            retorno = limpar_comparacao(rsIdComentario(0)) + 1
        else
            retorno = 1            
        end if

        rsIdComentario.close()
        set rsIdComentario = nothing
        
        RetornaIdComentario = retorno
    end function

    sub IncluirComentario()        
        Me.id_comentario_ = RetornaIdComentario()

        Executar("INSERT INTO tbl_comentario(id_comentario, id_demanda, id_usuario) " & _
                 " VALUES(" & Me.id_comentario_ & ", " & Me.id_demanda_ & ", " & session("cod_usuario") & ")")
    end sub

    sub IncluirArquivo()
        Executar("INSERT INTO tbl_arquivo(txt_arquivo, id_usuario, txt_extensao, id_comentario) " & _
                 " VALUES('" & trim(Me.txt_arquivo_) & "', " & session("cod_usuario") & ", 'pdf', " & Me.id_comentario_ & " )")
    end sub

    function ListaDemandas() 
        dim condicao

        if cstr(Me.id_usuario_) <> "" then 
            condicao = condicao & " AND TD.cod_usuario_responsavel = " & Me.id_usuario_
        end if

        set ListaDemandas = oRecordSet("SELECT id_demanda, txt_titulo, txt_situacao, txt_nome, TD.cod_ativo FROM tbl_demanda TD " & _
                                        " INNER JOIN tbl_usuario TU ON TU.id_usuario = TD.cod_usuario_responsavel " & _
	                                    " INNER JOIN tbl_situacao TS ON TS.id_situacao = TD.id_situacao " & _
                                        " WHERE TD.cod_ativo = 1 " & condicao)
    end function
end class
%>