<!-- #include virtual="sistema/Usuario/ManterUsuario.asp" -->
<% call cabecalho() %>
        <div id="page-wrapper" >
            <div id="page-inner">               
                <% call Titulo(application("lb_usuarios") & " > " & application("lb_listagem")) %>
                 <hr />
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             <a href="Incluir.asp"><b><% =application("lb_incluir") %></b></a>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th><% =application("lb_acao") %></th>
                                            <th><% =application("lb_nome") %></th>
                                            <th><% =application("lb_email") %></th>
                                            <th><% =application("lb_ativo") %></th>                                            
                                        </tr>
                                    </thead>
                                    <tbody> <%                                       
                                        set rs = ListaUsuarios() 
                                        if not rs.eof then %>
                                            <% do while not rs.eof %>
                                                <tr class="odd gradeX">
                                                    <td><% call ComboAcao(rs("id_usuario"), rs("cod_ativo")) %></td>
                                                    <td><% =rs("txt_nome") %></td>
                                                    <td><% =rs("txt_email") %></td>
                                                    <td><% =LabelAtivo(rs("cod_ativo")) %></td>                                            
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
