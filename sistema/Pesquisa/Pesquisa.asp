<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Pesquisa/ManterPesquisa.asp" -->

<% call cabecalho() %>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_pesquisa") & " > " & application("lb_pesquisa_avancada")) %>
        <hr />
        <div class="row">
            <div class="col-md-12"> 
                <div class="panel panel-default">
                   <div class="panel-body">
                        <div class="col-md-6">
                            <form role="form" action="ManterPesquisa.asp" id="form1" name="form1" method="post">

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<% call Rodape() %>