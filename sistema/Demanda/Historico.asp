<%
dim rs1 
set rs1 = DetalheComentario(id)
    
%>

<div class="col-md-12">
        <!--   Basic Table  -->
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4><label><% =application("lb_historico") %></label></h4>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th><% =application("lb_data") %> / <% =application("lb_hora") %></th>
                            <th><% =application("lb_usuario") %></th>
                            <th><% =application("lb_comentario") %></th>
                            <th><% =application("lb_arquivo") %></th>
                            <th><% =application("lb_acao") %></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% do while not rs1.eof 
                            dim txt_arquivo : txt_arquivo = rs1("txt_arquivo")
                            if not isnull(txt_arquivo) then
                                dim txt_nome_arquivo : txt_nome_arquivo = mid(txt_arquivo, instr(txt_arquivo, "_") + 1, len(txt_arquivo))    
                            end if
                        %>
                            <tr>
                                <td><% =rs1("dt_comentario") %></td>
                                <td><% =rs1("txt_nome") %></td>
                                <td><% =rs1("txt_comentario") %></td>
                                <td>
                                    <% if not isnull(txt_arquivo) then %>
                                        <a href="#" onclick="window.open('<% =replace(txt_arquivo, "\", "/") %>', '_blank', 'menubar=yes, resizable=yes, titlebar=yes, toolbar=yes, status=yes,width=650,height=450,scrollbars=1')">
                                            <% =txt_nome_arquivo %>
                                        </a> 
                                    <% end if %>
                                </td>
                                <td><% =rs1("txt_acao") %></td>
                            </tr>       
                        <% rs1.movenext : loop %>      
                        <% rs1.close() %>
                        <% set rs1 = nothing %>                                   
                    </tbody>
                </table>
            </div>
        </div>
    </div>
        <!-- End  Basic Table  -->
</div>