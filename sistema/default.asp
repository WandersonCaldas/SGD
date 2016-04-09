<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Usuario/ManterUsuario.asp" -->

<% call Cabecalho() %>
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">                                        
                    <h2><font color="red"><% =application("lb_pesquisa_avancada") %></font></h2>   
                    
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <form role="form" action="PesquisaAvancada.asp" id="form1" name="form1" method="post">
                                    <div class="form-group">

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
</script>
<% call Rodape() %>
