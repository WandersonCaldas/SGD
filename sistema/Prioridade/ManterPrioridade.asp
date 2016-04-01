<!-- #include virtual="sistema/Classes/Prioridade/Prioridade.asp" -->
<%       
Response.Charset = "ISO-8859-1"

dim oPrioridade : set oPrioridade = new cPrioridade

sub ComboGetPrioridades()
    dim rsPrioridade

    set rsPrioridade = oPrioridade.GetPrioridades() 

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

%>