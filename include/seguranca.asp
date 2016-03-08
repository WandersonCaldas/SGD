<%   
public sub VerificaSessao()    
    if session("cod_usuario") = "" or isnull(session("cod_usuario")) then js_go("../index.asp")
end sub

function Autenticar(login, senha)
    dim rs1, retorno

    retorno = ""
    
    set rs1 = oRecordSet("SELECT id_usuario, cod_ativo FROM tbl_usuario WHERE txt_email = '" & trim(login) & "' AND txt_senha = '" & trim(senha) & "'" )       
    if not rs1.eof then
        if rs1("cod_ativo") then
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
%>