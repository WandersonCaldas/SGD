<!-- #include virtual="/sgd/sistema/Classes/Demanda/Demanda.asp" -->
<!-- #include virtual="/sgd/sistema/Prioridade/ManterPrioridade.asp" -->
<!-- #include virtual="/sgd/sistema/Classes/Usuario/Usuario.asp" -->
<%       
Response.Charset = "ISO-8859-1"

acao = request("acao")
   
dim strRetorno : strRetorno = ""

dim oDemanda : set oDemanda = new cDemanda
dim oUsuario : set oUsuario = new cUsuario
  
select case ucase(acao)    
    case "VALIDAR_INCLUIR"
        txt_titulo = request("txt_titulo")
        txt_descricao = request("txt_descricao")
        cod_prioridade = request("cod_prioridade")

        if ValidarIncluir() then
            strRetorno = "OK"
        end if

        'RETORNO
        Response.Clear
        Response.Write strRetorno  

    case "VALIDAR_COMENTAR"
        txt_descricao = request("txt_descricao")

        if ValidarComentar() then
            strRetorno = "OK"
        end if

        'RETORNO
        Response.Clear
        Response.Write strRetorno 

    case "ENCERRAR"
        id = request("id")
        txt_comentario = request("txt_comentario")

        if ValidarEncerrar() then
            'ENCERRAR DEMANDA
            oDemanda.id_demanda_ = id
            oDemanda.txt_comentario_ = RemoveHTML(trim(txt_comentario))                     

            on error resume next
            conexao.begintrans()
            oDemanda.Encerrar()

            if err.number = 0 then
                conexao.committrans()
                js_go("Visualizar.asp?id=" & id)
            else
                conexao.rollbacktrans()
                js_go_back(err.Description)                
            end if

            strRetorno = "OK"
            on error goto 0
        end if

        'RETORNO
        Response.Clear
        Response.Write strRetorno
    
    case "ANDAMENTO"
        id              = request("id")
        txt_comentario  = request("txt_comentario")    
        cod_usuario     = request("cod_usuario")
    
        if ValidarAndamento() then
            oDemanda.id_demanda_ = id
            oDemanda.txt_comentario_ = RemoveHTML(trim(txt_comentario))  
            oDemanda.id_usuario_ = cod_usuario          

            on error resume next
            conexao.begintrans()
            oDemanda.Andamento()
    
            if err.number = 0 then
                conexao.committrans()
                js_go("Visualizar.asp?id=" & id)
            else
                conexao.rollbacktrans()
                js_go_back(err.Description)                
            end if

            strRetorno = "OK"
            on error goto 0
        end if        

        'RETORNO
        Response.Clear
        Response.Write strRetorno  

end select

function ValidarComentar()
    dim retorno : retorno = false

    if txt_descricao <> "" then
        retorno = true
    end if

    ValidarComentar = retorno
end function

function ValidarIncluir()
    dim retorno : retorno = false

    if txt_titulo <> "" and txt_descricao <> "" and cod_prioridade <> "" then
        retorno = true
    end if

    ValidarIncluir = retorno
end function

function ValidarAndamento()
    dim retorno : retorno = false

    if ValidarEncerrar() and cod_usuario <> "" then
        retorno = true
    end if
    ValidarAndamento = retorno
end function

function ValidarEncerrar()
    dim retorno : retorno = false

    if id <> "" and txt_comentario <> "" then
        retorno = true
    end if

    ValidarEncerrar = retorno
end function

sub ComboPrioridade()
    'MONTAR A COMBO DE PRIORIDADES - CLASSE PRIORIDADE    
    call ComboGetPrioridades()
end sub

sub ComboUsuario()
    'MONTAR A COMBO DE USUÁRIOS - CLASSE USUÁRIO
    call oUsuario.ComboGetUsuario()
end sub

function ListaDemandas(byval cod_usuario)
    oDemanda.id_usuario_ = cod_usuario

    set ListaDemandas = oDemanda.ListaDemandas() 
end function

function DetalheDemanda(byval id)
    oDemanda.id_demanda_ = id
    set DetalheDemanda = oDemanda.DetalheDemanda()
end function

function DetalheComentario(byval id)
    oDemanda.id_demanda_ = id
    set DetalheComentario = oDemanda.DetalheComentario()
end function

function PermissaoEncerrar(byval id)
    dim retorno : retorno = false

    oDemanda.id_demanda_ = id
    oDemanda.id_usuario_ = session("cod_usuario")

    if oDemanda.PermissaoEncerrar() then
        retorno = true
    end if

    PermissaoEncerrar = retorno
end function

function PermissaoComentar(byval id)
    dim retorno : retorno = false

    oDemanda.id_demanda_ = id

    if oDemanda.PermissaoComentar() then
        retorno = true
    end if

    PermissaoComentar = retorno
end function

function PermissaoAndamento(byval id)
    dim retorno : retorno = false

    oDemanda.id_demanda_ = id
    oDemanda.id_usuario_ = session("cod_usuario")

    if oDemanda.PermissaoAndamento() then
        retorno = true
    end if

    PermissaoAndamento = retorno
end function
%>