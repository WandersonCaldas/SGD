<!-- #include virtual="include/conexao.asp" -->
<%       
class cUsuario
    Public id
    Public txt_nome
    Public txt_email
    Public txt_senha    

    sub Incluir()            
        dim sql        
        sql = "INSERT INTO tbl_usuario(txt_nome, txt_email, txt_senha) VALUES('" & trim(Me.txt_nome) & "', '" & trim(Me.txt_email) & "', '" & trim(Me.txt_senha) & "')"                   
        Executar(sql)
    end sub

    sub Excluir()
        dim sql
        sql = "UPDATE tbl_usuario SET cod_ativo = 0 WHERE id_usuario = " & Me.id
        Executar(sql)
    end sub

    sub Alterar()
        dim sql
        sql = "UPDATE tbl_usuario SET txt_nome = '" & trim(Me.txt_nome) & "', txt_email = '" & trim(Me.txt_email) & "', txt_senha = '" & trim(Me.txt_senha) & "' " & _
               " WHERE id_usuario = " & Me.id                       
        Executar(sql)
    end sub

    function RecuperarSenha()
        dim rsUsuario, retorno        

        set rsUsuario = oRecordSet("SELECT txt_email FROM tbl_usuario WHERE txt_email = '" & trim(Me.txt_email) & "'")
        if not rsUsuario.eof then
            retorno = true
        else
            retorno = false
        end if
        
        rsUsuario.close()
        set rsUsuario = nothing

        RecuperarSenha = retorno
    end function
        
    function RetornaNomeUsuario(byval cod_usuario)
        dim rsUsuario, txt_nome

        set rsUsuario = oRecordSet("SELECT txt_nome FROM tbl_usuario WHERE id_usuario = " & cod_usuario)

        txt_nome = rsUsuario("txt_nome")

        rsUsuario.close()
        set rsUsuario = nothing

        RetornaNomeUsuario = txt_nome
    end function

    function DetalheUsuario(byval cod_usuario)
        set DetalheUsuario = oRecordSet("SELECT * FROM tbl_usuario WHERE id_usuario = " & cod_usuario)
    end function

    function ListaUsuarios()    
        set ListaUsuarios = oRecordSet("SELECT * FROM tbl_usuario")
    end function
end class
%>