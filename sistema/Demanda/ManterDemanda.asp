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
end select

function ValidarIncluir()
    dim retorno : retorno = false

    if txt_titulo <> "" and txt_descricao <> "" and cod_prioridade <> "" then
        retorno = true
    end if

    ValidarIncluir = retorno
end function

sub ComboPrioridade()
    'MONTAR A COMBO DE PRIORIDADES - CLASSE PRIORIDADE    
    call ComboGetPrioridades()
end sub

function ListaDemandas(byval cod_usuario)
    oDemanda.id_usuario_ = cod_usuario

    set ListaDemandas = oDemanda.ListaDemandas() 
end function

%>