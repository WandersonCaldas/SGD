<%   
function ExibeMensagem(numero)
    dim rs1, retorno, MSG_001
        
    select case numero
        case "MSG_001"
             retorno = "USU�RIO INATIVO."
        case "MSG_002"
             retorno = "USU�RIO N�O ENCONTRADO."
        case else
            retorno = ""
    end select  

    ExibeMensagem = retorno
end function
%>