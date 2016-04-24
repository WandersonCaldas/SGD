<%   
public sub VerificaSessao()        
    if session("cod_usuario") = "" or isnull(session("cod_usuario")) then js_go("/sgd/index.asp")
end sub

function Autenticar(login, senha)
    dim rs1, retorno

    retorno = ""
    
    set rs1 = oRecordSet("SELECT id_usuario, cod_ativo FROM tbl_usuario WHERE txt_email = '" & trim(login) & "' AND txt_senha = '" & trim(senha) & "'" )       
    if not rs1.eof then
        if rs1("cod_ativo") = 1 then
            retorno = rs1(0)    
        else
            retorno = 0
        end if                        
    else
        retorno = ""
    end if
    rs1.close()
    set rs1 = nothing

    Autenticar = retorno
end function

function RetornaNomeUsuarioCabecalho(byval cod_usuario)
    dim rs1, retorno

    set rs1 = oRecordSet("SELECT txt_nome FROM tbl_usuario WHERE id_usuario = " & cod_usuario)
    
    if not rs1.eof then
        retorno = rs1("txt_nome")
    end if

    rs1.close()
    set rs1 = nothing

    RetornaNomeUsuarioCabecalho = retorno
end function
%>