<%   
function ExibeMensagem(numero)
    dim rs1, retorno, MSG_001
        
    select case numero
        case "MSG_001"
             retorno = "USUÁRIO INATIVO."
        case "MSG_002"
             retorno = "USUÁRIO NÃO ENCONTRADO."
        case else
            retorno = ""
    end select  

    ExibeMensagem = retorno
end function
%>