<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Demanda/ManterDemanda.asp" -->

<% call cabecalho() %>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_demandas") & " > " & application("lb_incluir")) %>
        <hr />
        <div class="row">
            <div class="col-md-12"> 
                <div class="panel panel-default">
                   <div class="panel-body">
                        <div class="col-md-6">
                            <form role="form" action="IncluirDemanda.asp" id="form1" name="form1" method="post" enctype="multipart/form-data">
                                <input type="hidden" id="acao" name="acao" value="incluir" />
                                <input type="hidden" id="txt_extensao" name="txt_extensao" value="" />
                                <div class="form-group">                                  
                                    <label><% =application("lb_titulo") %></label>
                                    <input class="form-control" id="txt_titulo" name="txt_titulo" placeholder="<% =application("lb_obrigatorio") %>" />
                                    <br />
                                    <label><% =application("lb_descricao") %></label>
                                    <textarea class="form-control" id="txt_descricao" name="txt_descricao" rows="3" placeholder="<% =application("lb_obrigatorio") %>"></textarea>
                                    <br />
                                    <% call ComboPrioridade() %>                                    
                                    <br />
                                    <label><% =application("lb_arquivo") %></label>
                                    <input type="file" id="txt_arquivo" name="txt_arquivo" />
                                </div>
                                <button type="button" id="btn_incluir" name="btn_incluir" class="btn btn-default"><b><% =application("lb_incluir") %></b></button>
                                <button type="reset" id="btn_limpar" name="btn_limpar" class="btn btn-primary"><b><% =application("lb_limpar") %></b></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>      
    <hr />
</div>

<script type="text/javascript">  
    $(document).ready(function () {
        $("#txt_titulo").focus();
    });

    $("#btn_incluir").click(function () {        
        $.ajax({
            type: 'POST',
            url: 'ManterDemanda.asp?acao=VALIDAR_INCLUIR',
            data: {
                txt_titulo: $("#txt_titulo").val(),
                txt_descricao: $("#txt_descricao").val(),
                cod_prioridade: $("#cod_prioridade").val()
            },
            async: false,
            success: function (data) {
                if (data == 'OK') {
                    //VALIDAR EXTENSÃO DO ARQUIVO                    
                    if (ValidarExtensaoArquivo($("#txt_arquivo").val()))
                    {
                        $("#acao").val('incluir');
                        $("#txt_extensao").val('pdf');
                        $("#form1").submit();
                    }
                    else
                    {
                        alert('<% =application("msg_erro_extensao_arquivo") %>');
                    }
                }               
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
    });    
</script>

<% call Rodape() %>  