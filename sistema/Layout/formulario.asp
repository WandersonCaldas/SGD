<% sub ComboAtivo() %>
    <label><% =application("lb_ativo") %></label> 
    <select class="form-control" id="cod_ativo" name="cod_ativo">
        <option value="1"><% =application("lb_sim") %></option>
        <option value="0"><% =application("lb_nao") %></option>                                        
    </select>  
<% end sub %>