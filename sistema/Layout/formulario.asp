<% sub ComboAtivo() %>
    <label><% =application("lb_ativo") %></label> 
    <select class="form-control" id="cod_ativo" name="cod_ativo">
        <option value="1"><% =application("lb_sim") %></option>
        <option value="0"><% =application("lb_nao") %></option>                                        
    </select>  
<% end sub %>

<% sub ComboAcao(byval id, byval cod_situacao) 
    dim txt_endereco, a_txt_endereco, i, txt_endereco_2
    dim txt_endereco_alterar, txt_endereco_excluir, txt_endereco_visualizar

    txt_endereco = request.ServerVariables("PATH_INFO")
        
    a_txt_endereco = split(txt_endereco, "/")
    
    txt_endereco_2 = a_txt_endereco(ubound(a_txt_endereco))

    txt_endereco_alterar = replace(txt_endereco, txt_endereco_2, "Alterar.asp?id=") & id
    txt_endereco_excluir = replace(txt_endereco, txt_endereco_2, "Excluir.asp?id=") & id
    txt_endereco_visualizar = replace(txt_endereco, txt_endereco_2, "Visualizar.asp?id=") & id
    
%>  
    <select class="form-control" id="cod_acao" name="cod_acao" onchange="javascript:go(this)">
        <option value=""><% =application("lb_acao") %></option>
        <% if cod_situacao = 1 then %>
            <option value="<% =txt_endereco_alterar %>"><% =application("lb_alterar") %></option>
            <option value="<% =txt_endereco_excluir %>"><% =application("lb_excluir") %></option>
        <% end if %>
        <option value="<% =txt_endereco_visualizar %>"><% =application("lb_visualizar") %></option>                                        
    </select>      
<% end sub %>

<% sub OpcaoAcao(byval txt_acao, byval cod_ativo) %>
    <% if txt_acao = "" then %>
        <% if cod_ativo = 1 then %>
            <a href="Alterar.asp?id=<% =id %>"><% =application("lb_alterar") %></a>   
            |
            <a href="Excluir.asp?id=<% =id %>"><% =application("lb_excluir") %></a>   
        <% end if %>                                    
    <% else %>
        <button type="button" id="btn_excluir" name="btn_excluir" class="btn btn-default"><b><% =application("lb_excluir") %></b></button>
    <% end if %>
<% end sub %>