<!-- #include virtual="/sgd/sistema/Classes/Usuario/Usuario.asp" -->
<%       
Response.Charset = "ISO-8859-1"

acao = request("acao")

dim strRetorno : strRetorno = ""

dim txt_nome, txt_email, txt_senha

dim oUsuario : set oUsuario = new cUsuario

select case ucase(acao)
    case "INCLUIR"                
        txt_nome            = request("txt_nome")
        txt_email           = request("txt_email")
        txt_senha           = request("txt_senha") 
        cod_tipo_usuario    = request("cod_tipo_usuario")       
        
        if ValidarIncluir() then
            oUsuario.txt_nome           = txt_nome
            oUsuario.txt_email          = txt_email
            oUsuario.txt_senha          = txt_senha
            oUsuario.cod_tipo_usuario_  = cod_tipo_usuario
                              
            'INCLUIR O USUÁRIO  
            oUsuario.Incluir()            

            strRetorno = "OK"

            'RETORNO
            Response.Clear
            Response.Write strRetorno
        end if
    case "ALTERAR"    
        id          = request("id")
        txt_nome    = request("txt_nome")
        txt_email   = request("txt_email")
        txt_senha   = request("txt_senha") 
       
         if ValidarAlterar(id) then  
            oUsuario.id         = id          
            oUsuario.txt_nome   = txt_nome
            oUsuario.txt_email  = txt_email
            oUsuario.txt_senha  = txt_senha
        
            oUsuario.Alterar()

            strRetorno = "OK"

            'RETORNO
            Response.Clear
            Response.Write strRetorno
        end if
    case "EXCLUIR"
        oUsuario.id = request("id")
        oUsuario.Excluir()

        strRetorno = "OK"

        'RETORNO
        Response.Clear
        Response.Write strRetorno
    case "RECUPERAR_SENHA"
        txt_email = request("txt_email")

        oUsuario.txt_email  = txt_email
        strRetorno = oUsuario.RecuperarSenha() 

        if strRetorno = 0 then           
            strRetorno = ""
        end if

        'RETORNO
        Response.Clear
        Response.Write strRetorno
end select

function ValidarIncluir()
    dim retorno : retorno = false

    if txt_nome <> "" and txt_email <> "" and txt_senha <> "" then
        retorno = true
    end if

    ValidarIncluir = retorno
end function

function ValidarAlterar(byval id)
    dim retorno : retorno = false

    if id <> "" and txt_nome <> "" and txt_email <> "" and txt_senha <> "" then
        retorno = true
    end if

    ValidarAlterar = retorno
end function

function RetornaNomeUsuario(byval cod_usuario)
    RetornaNomeUsuario = oUsuario.RetornaNomeUsuario(cod_usuario)
end function

function ListaUsuarios()
    set ListaUsuarios = oUsuario.ListaUsuarios() 
end function

function DetalheUsuario(byval id)
    set DetalheUsuario = oUsuario.DetalheUsuario(id)
end function

function TipoUsuario(byval cod)
    TipoUsuario = oUsuario.TipoUsuario(cod)
end function

%>