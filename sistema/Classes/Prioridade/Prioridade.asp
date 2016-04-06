<!-- #include virtual="include/conexao.asp" -->
<%       
class cPrioridade
    function GetPrioridades()        
        set GetPrioridades = oRecordSet("SELECT * FROM tbl_prioridade WHERE cod_ativo = 1")        
    end function

    sub ComboGetPrioridades()
        dim rsPrioridade

        set rsPrioridade = GetPrioridades() 

        if not rsPrioridade.eof then %>
            <label><% =application("lb_prioridade") %></label> 
            <select class="form-control" id="cod_prioridade" name="cod_prioridade"> <%
                do while not rsPrioridade.eof %>            
                    <option value="<% =rsPrioridade("id_prioridade") %>"><% =rsPrioridade("txt_prioridade") %></option> <%
                rsPrioridade.movenext : loop %>
            </select> <%
        end if

        rsPrioridade.close()
        set rsPrioridade = nothing
    end sub
end class
%>