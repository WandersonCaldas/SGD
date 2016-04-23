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
    Public txt_comentario_
    Public id_acao_
    
    sub IncluirDemanda() 
        Me.id_demanda_ = RetornaIdDemanda()        
        
        'INCLUIR NA TBL_DEMANDA
        Executar("INSERT INTO tbl_demanda(id_demanda, id_situacao, cod_usuario_abertura, " & _
                " txt_descricao, cod_usuario_responsavel, id_prioridade, txt_titulo) " & _
                " VALUES(" & Me.id_demanda_ & ", " & Me.id_situacao_ & ", " & session("cod_usuario") & ", " & _
                " '" & trim(Me.txt_descricao_) & "', " & session("cod_usuario") & ", " & Me.id_prioridade_ & ", " & _ 
                " '" & trim(Me.txt_titulo_) & "')")
        
        'INCLUIR NA TBL_COMENTARIO
        Me.txt_comentario_ = "CADASTRO"
        Me.id_acao_ = 4
        call IncluirComentario()        
        
        'INCLUIR NA TBL_ARQUIVO
        if trim(Me.txt_arquivo_) <> "" then
            call IncluirArquivo()
        end if
        
    end sub

    sub Comentar()
        'INCLUIR COMENTÁRIO        
        Me.id_acao_ = 1
        call IncluirComentario()
      
        'INCLUIR NA TBL_ARQUIVO
        if trim(Me.txt_arquivo_) <> "" then
            call IncluirArquivo()
        end if
    end sub

    sub Encerrar()
        'ENCERRAR DEMANDA
        Executar("UPDATE tbl_demanda SET id_situacao = 2, dt_encerramento = GETDATE(), cod_usuario_encerramento = " & session("cod_usuario") & _
                    " WHERE id_demanda = " & Me.id_demanda_)

        'INCLUIR NA TBL_COMENTARIO         
        Me.id_acao_ = 3
        call IncluirComentario() 
    end sub

    sub Andamento()
        Executar("UPDATE tbl_demanda SET cod_usuario_responsavel = " & Me.id_usuario_ & " " & _
                    " WHERE id_demanda = " & Me.id_demanda_)

        'INCLUIR NA TBL_COMENTARIO         
        Me.id_acao_ = 2
        call IncluirComentario()
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

        Executar("INSERT INTO tbl_comentario(id_comentario, id_demanda, id_usuario, txt_comentario, id_acao) " & _
                 " VALUES(" & Me.id_comentario_ & ", " & Me.id_demanda_ & ", " & session("cod_usuario") & ", '" & trim(Me.txt_comentario_) & "', " & Me.id_acao_ & ")")
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
                                        " WHERE TD.cod_ativo = 1 AND TD.id_situacao <> 2 " & condicao)
    end function

    function DetalheDemanda()
        dim sql

        sql = "SELECT T1.*, T2.txt_situacao, T3.txt_prioridade, T4.txt_nome AS UsuarioResponsavel, " & _ 
                     " T5.txt_nome AS UsuarioAbertura, T6.txt_nome AS UsuarioEncerramento, T2.txt_cor " & _
                " FROM tbl_demanda T1 " & _
                " INNER JOIN tbl_situacao T2 ON T2.id_situacao = T1.id_situacao " & _
                " INNER JOIN tbl_prioridade T3 ON T3.id_prioridade = T1.id_prioridade " & _
                " INNER JOIN tbl_usuario T4 ON T4.id_usuario = T1.cod_usuario_responsavel " & _
                " INNER JOIN tbl_usuario T5 ON T5.id_usuario = T1.cod_usuario_abertura " & _
                " LEFT JOIN tbl_usuario T6 ON T6.id_usuario = T1.cod_usuario_encerramento " & _
            " WHERE T1.id_demanda = " & Me.id_demanda_
        
        set DetalheDemanda = oRecordSet(cstr(sql))
    end function

    function DetalheComentario()
        dim sql

        sql = "SELECT T1.dt_comentario, T1.txt_comentario, T2.txt_nome, T3.txt_acao, T4.txt_arquivo " & _
                " FROM tbl_comentario T1 " & _
                " INNER JOIN tbl_usuario T2 ON T2.id_usuario = T1.id_usuario " & _
                " INNER JOIN tbl_acao T3 ON T3.id_acao = T1.id_acao " & _
                " LEFT JOIN tbl_arquivo T4 ON T4.id_comentario = T1.id_comentario " & _
              " WHERE T1.id_demanda = " & Me.id_demanda_ & " ORDER BY T1.dt_comentario DESC"
    
        set DetalheComentario = oRecordSet(cstr(sql))
    end function

    function PermissaoEncerrar()
        dim retorno : retorno = false
        dim rs2
    
        set rs2 = DetalheDemanda()
        
        if cint(rs2("id_situacao")) <> 2 and rs2("cod_usuario_responsavel") = Me.id_usuario_ and rs2("cod_usuario_abertura") = Me.id_usuario_ then
            retorno = true
        end if        

        PermissaoEncerrar = retorno
    end function

    function PermissaoComentar()
        dim retorno : retorno = false
        dim rs2
        
        set rs2 = DetalheDemanda()
        if cint(rs2("id_situacao")) <> 2 then
            retorno = true
        end if
        
        PermissaoComentar = retorno
    end function

    function PermissaoAndamento()
       dim retorno : retorno = false
        dim rs2
    
        set rs2 = DetalheDemanda()
        
        if cint(rs2("id_situacao")) <> 2 and rs2("cod_usuario_responsavel") = Me.id_usuario_ then
            retorno = true
        end if 

        PermissaoAndamento = retorno
    end function
    
end class
%>