<!-- #include virtual="sistema/Demanda/ManterDemanda.asp" -->
<% call cabecalho() %>
        <div id="page-wrapper" >
            <div id="page-inner">                              
                <% cod_usuario = request("cod_usuario")                      
                    if cstr(cod_usuario) = "0" then
                        cod_usuario = ""        
                        txt_label = application("lb_listagem")  
                        txt_redirecionar = "Listagem.asp"  
                        txt_titulo_apresentar = application("lb_listagem")                                       
                    elseif cstr(cod_usuario) = "" then                                            
                        cod_usuario = session("cod_usuario")  
                        txt_label = application("lb_listagem_completa")
                        txt_redirecionar = "Listagem.asp?cod_usuario=0"
                        txt_titulo_apresentar = application("lb_listagem")  & " " & application("lb_pessoal")
                    end if      
                %>
                <% call Titulo(application("lb_demandas") & " > " & txt_titulo_apresentar ) %>
                <hr />               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="Incluir.asp"><b><% =application("lb_incluir") %></b></a>
                            |  
                            <a href="<% =txt_redirecionar %>"><b><% =txt_label %></b></a>                           
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>                                            
                                            <th><% =application("lb_numero") %></th>
                                            <th><% =application("lb_titulo") %></th>
                                            <th><% =application("lb_situacao") %></th>
                                            <th><% =application("lb_usuario_responsavel") %></th>                                            
                                        </tr>
                                    </thead>
                                    <tbody> <%                                                                                                                                                                                
                                        set rs = ListaDemandas(cod_usuario) 
                                        if not rs.eof then %>
                                            <% do while not rs.eof %>
                                                <tr class="odd gradeX">                                                  
                                                    <td><% =rs("id_demanda") %></td>
                                                    <td><a href="Visualizar.asp?id=<% =rs("id_demanda") %>"><% =rs("txt_titulo") %></a></td>
                                                    <td><% =rs("txt_situacao") %></td>
                                                    <td><% =rs("txt_nome") %></td>                                            
                                                </tr>  
                                            <% rs.movenext : loop %>
                                        <% end if %>      
                                        <% rs.close() %>                                                                     
                                        <% set rs = nothing %>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
                <!-- /. ROW  -->
            <div class="row">
                <div class="col-md-6">
                  <!--   Kitchen Sink -->
                     <!-- End  Kitchen Sink -->
                </div>
                
            </div>
              
        
                <!-- /. ROW  -->
        </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
<% call Rodape2() %>        
