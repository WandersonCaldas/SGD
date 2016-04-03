<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Demanda/ManterDemanda.asp" -->

<% 
call cabecalho()

id = request("id")

if id = "" then js_go("Listagem.asp")

dim rs 
set rs = DetalheDemanda(id)
%>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_demandas") & " > " & application("lb_detalhe")) %>
        <hr />
        <div class="row">
            <div class="col-md-12">             
                <div class="panel panel-default">
                   <div class="panel-body">
                        <!--<div class="col-md-6">-->
                            <form role="form" id="form1" name="form1">
                                <input type="hidden" id="id" name="id" value="<% =id %>" />                                
                                <div class="form-group">
                                    <div class="row">
                                        <!--<div class="col-md-6">-->
                                             <!--   Basic Table  -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <center><label><h3><% =application("lb_numero") %> - <% =id %></h3></label></center>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="table-responsive">
                                                        <table class="table">
                                                            <thead>
                                                                <tr>
                                                                    <th><% =application("lb_titulo") %></th>
                                                                    <th><% =application("lb_data_abertura") %></th> 
                                                                    <th><% =application("lb_data_encerramento") %></th>                                                                                                                                                                                            
                                                                </tr>                                                               
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><% =rs("txt_titulo") %></td>
                                                                    <td><% =rs("dt_abertura") %></td> 
                                                                    <td><% =rs("dt_encerramento") %></td>                                                                                                               
                                                                </tr>                                                                                                                          
                                                            </tbody>
                                                            <thead>
                                                                 <tr>
                                                                    <th><% =application("lb_usuario_responsavel") %></th>
                                                                    <th><% =application("lb_prioridade") %></th> 
                                                                    <th><% =application("lb_situacao") %></th>                                                             
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>                                                                   
                                                                    <td><% =rs("UsuarioResponsavel") %></td>
                                                                    <td><% =rs("txt_prioridade") %></td>
                                                                    <td><font color='<% =rs("txt_cor") %>'><b><% =rs("txt_situacao") %></b></font></td>                                              
                                                                </tr>                                                                                                                          
                                                            </tbody>
                                                            <thead>
                                                                <th><% =application("lb_usuario_abertura") %></th>
                                                                <th><% =application("lb_usuario_encerramento") %></th>
                                                                <th><% =application("lb_ativo") %></th>  
                                                            </thead>
                                                            <tbody>
                                                                <tr>                                             
                                                                    <td><% =rs("UsuarioAbertura") %></td>                        
                                                                    <td><% =rs("UsuarioEncerramento") %></td>                        
                                                                    <td><% =LabelAtivo(rs("cod_ativo")) %></td>                                                                                                                  
                                                                </tr>                                                                                                                          
                                                            </tbody>
                                                        </table>                                                        
                                                    </div>
                                                </div>
                                                <!-- End  Basic Table  -->                                                
                                            </div>                        
                                            
                                            <div class="row">                                                
                                                <div class="col-md-12" >
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <label><% =application("lb_descricao") %></label>
                                                        </div>
                                                        <div class="panel-body">
                                                            <p>
                                                                <%=rs("txt_descricao") %>
                                                            </p>
                                                        </div>
                                                        <div class="panel-footer">                                                                                                                                                                                    
                                                            <a href="#" class="btn btn-primary btn-lg"><% =application("lb_andamento") %></a>
                                                            |
                                                            <a href="#" class="btn btn-primary btn-lg"><% =application("lb_comentar") %></a>
                                                            
                                                            <% if PermissaoEncerrar(id) then %>
                                                                |
                                                                <a href="Encerrar.asp?id=<% =id %>" class="btn btn-primary btn-lg"><% =application("lb_encerrar") %></a>
                                                            <% end if %>
                                                        </div>
                                                    </div>
                                                </div>                                                
                                            </div>
                                            <%
                                            rs.close()
                                            set rs = nothing    
                                            %>                                                                     
                                       <!-- </div> -->                                   
                                    </div>
                                    <!--HISTÓRICO DO CHAMADO-->
                                    <!-- #include virtual="sistema/Demanda/Historico.asp" -->
                                </div>                                                              
                            </form>
                        <!--</div>-->
                    </div>
                </div>
            </div>
        </div>
    </div>      
    <hr />    
</div>

<% call Rodape() %>  