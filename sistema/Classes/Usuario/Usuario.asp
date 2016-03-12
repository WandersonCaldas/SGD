<%       
class cUsuario
    function RetornaNomeUsuario(byval cod_usuario)
        dim rsUsuario, txt_nome

        set rsUsuario = oRecordSet("SELECT txt_nome FROM tbl_usuario WHERE id_usuario = " & cod_usuario)

        txt_nome = rsUsuario("txt_nome")

        rsUsuario.close()
        set rsUsuario = nothing

        RetornaNomeUsuario = txt_nome
    end function

    function ListaUsuarios()    
        set ListaUsuarios = oRecordSet("SELECT * FROM tbl_usuario")
    end function
end class
%>