<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Usuario/ManterUsuario.asp" -->
<!-- #include virtual="sistema/Pesquisa/ManterPesquisa.asp" -->

<head>
    <style type="text/css">
        #cod_demanda {
            width: 58px;
        }
        #txt_titulo {
            width: 440px;
        }
    </style>        
</head>

<% call Cabecalho() %>
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">                                        
                    <h2><font color="red"><% =application("lb_pesquisa_avancada") %></font></h2>   
                    
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-6">                                
                                <form role="form" action="Pesquisa/PesquisaAvancada.asp" id="form1" name="form1" method="post">
                                    <div class="form-group">
                                        <table class="table">
                                            <tr>
                                                <th>
                                                    <label><% =application("lb_numero") %></label>                                                    
                                                </th>
                                                <th>
                                                    <label><% =application("lb_titulo") %></label>
                                                </th>     
                                                <th>
                                                    <label><% =application("lb_situacao") %></label>
                                                </th>   
                                                <th>
                                                    <label><% =application("lb_prioridade") %></label>
                                                </th>                                           
                                            </tr>                                           
                                            <tr>
                                                <td>
                                                    <input class="form-control" id="id_demanda" name="id_demanda" />                                                    
                                                </td>
                                                <td>
                                                    <input class="form-control" id="txt_titulo" name="txt_titulo" />
                                                </td>
                                                 <td>
                                                    <% call ComboGetSituacao() %>
                                                </td>   
                                                <td>
                                                    <% call ComboPrioridade() %>  
                                                </td>                                                
                                            </tr>     
                                            <tr>
                                                <th>
                                                    <label><% =application("lb_usuario_responsavel") %></label>
                                                </th>
                                                 <th>
                                                    <label><% =application("lb_usuario_abertura") %></label>
                                                </th>
                                                <th>
                                                    <label><% =application("lb_data_abertura") %></label>
                                                </th>                                               
                                            </tr>  
                                            <tr>
                                                <td>
                                                    <% call ComboUsuario() %>
                                                </td>
                                                <td>
                                                    <% call ComboUsuarioAbertura() %>
                                                </td>
                                                <td>                                                    
                                                    <input class="form-control" id="dt_abertura" name="dt_abertura" />                                                    
                                                </td>
                                                <td><img src="/sistema/Imagens/calendar.gif" id="trigger0" style="cursor: pointer;" alt="Calendário"></td>
                                            </tr>   
                                            <tr>
                                                <th>
                                                    <label><% =application("lb_usuario_encerramento") %></label>
                                                </th>
                                                <th></th>
                                                <th>
                                                    <label><% =application("lb_data_encerramento") %></label>
                                                </th>
                                            </tr>  
                                            <tr>
                                                <td>
                                                    <% call ComboUsuarioEncerramento() %>
                                                </td>
                                                <td></td>
                                                <td>                                                    
                                                    <input class="form-control" id="dt_encerramento" name="dt_encerramento" />                                                    
                                                </td>
                                                <td><img src="/sistema/Imagens/calendar.gif" id="trigger1" style="cursor: pointer;" alt="Calendário"></td>
                                            </tr>                                                                            
                                        </table>                                                                               
                                    </div>
                                    <button type="button" id="btn_pesquisar" name="btn_pesquisar" class="btn btn-default"><b><% =application("lb_pesquisar") %></b></button>
                                    <button type="reset" id="btn_limpar" name="btn_limpar" class="btn btn-primary"><b><% =application("lb_limpar") %></b></button>
                                </form>
                            </div>
                        </div>
                    </div>                                                                     
                </div>
            </div>   
        </div>
    </div>                       
        
    <script type="text/javascript">      
        $("#btn_pesquisar").click(function () {
            $("#form1").submit();
        });
       
        Calendar.setup({ inputField: "dt_abertura", button: "trigger0" });
        Calendar.setup({ inputField: "dt_encerramento", button: "trigger1" });
</script>
<% call Rodape() %>
