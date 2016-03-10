<%       
class cUsuario
    function RetornaNomeUsuario(byval cod_usuario)
        dim rsUsuario

        set rsUsuario = oRecordSet("SELECT txt_nome FROM tbl_usuario WHERE id_usuario = " & cod_usuario)

        RetornaNomeUsuario = rsUsuario("txt_nome")
    end function
end class
%>