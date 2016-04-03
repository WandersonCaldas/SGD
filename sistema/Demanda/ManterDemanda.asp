<!-- #include virtual="sistema/Classes/Demanda/Demanda.asp" -->
<!-- #include virtual="sistema/Prioridade/ManterPrioridade.asp" -->
<%       
Response.Charset = "ISO-8859-1"

acao = request("acao")
   
dim strRetorno : strRetorno = ""

dim oDemanda : set oDemanda = new cDemanda
  
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

    case "ENCERRAR"
        id = request("id")
        txt_comentario = request("txt_comentario")

        if ValidarEncerrar() then
            'ENCERRAR DEMANDA
            oDemanda.id_demanda_ = id
            oDemanda.txt_comentario_ = trim(txt_comentario)                     

            conexao.begintrans()
            oDemanda.Encerrar()

            if err.number = 0 then
                conexao.committrans()
                js_go("Visualizar.asp?id=" & id)
            else
                conexao.rollback()
                js_go_back(err.Description)                
            end if

            strRetorno = "OK"
        end if

        'RETORNO
        Response.Clear
        Response.Write strRetorno  
end select

function ValidarIncluir()
    dim retorno : retorno = false

    if txt_titulo <> "" and txt_descricao <> "" and cod_prioridade <> "" then
        retorno = true
    end if

    ValidarIncluir = retorno
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
    if oDemanda.PermissaoEncerrar() then
        retorno = true
    end if

    PermissaoEncerrar = retorno
end function

%>