<!-- #include virtual="/sgd/include/conexao.asp" -->
<!-- #include virtual="/sgd/sistema/Demanda/ManterDemanda.asp" -->

<% 
call cabecalho() 
    
id = request("id")

if id = "" then js_go("Listagem.asp")
if not PermissaoEncerrar(id) then js_go("Listagem.asp")

%>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_demandas") & " > " & application("lb_encerrar")) %>
        <hr />
        <div class="row">
            <div class="col-md-12"> 
                <div class="panel panel-default">
                   <div class="panel-body"> 
                        <div class="col-md-6">
                            <form role="form" action="IncluirDemanda.asp" id="form1" name="form1" method="post">                                
                                <input type="hidden" id="id" name="id" value="<% =id %>" />
                                <div class="form-group"> 
                                    <div align="center">
                                        <label><% =application("lb_numero") %> - <% =id %></label>
                                    </div><br />                                                                   
                                    <label><% =application("lb_comentario") %></label>
                                    <textarea class="form-control" id="txt_comentario" name="txt_comentario" rows="3" placeholder="<% =application("lb_obrigatorio") %>"></textarea>                                                                                                         
                                </div>
                                <button type="button" id="btn_encerrar" name="btn_encerrar" class="btn btn-default"><b><% =application("lb_encerrar") %></b></button>
                                <button type="reset" id="btn_limpar" name="btn_limpar" class="btn btn-primary"><b><% =application("lb_limpar") %></b></button>
                                <button type="button" id="btn_voltar" name="btn_voltar" class="btn btn-default"><b><% =application("lb_voltar") %></b></button>
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
        $("#txt_comentario").focus();
    });

    $("#btn_voltar").click(function () {
        self.location.href = 'Visualizar.asp?id=' + $("#id").val();
    });

    $("#btn_encerrar").click(function () {
        $.ajax({
            type: 'POST',
            url: 'ManterDemanda.asp?acao=ENCERRAR',
            data: {
                id: $("#id").val(),
                txt_comentario: $("#txt_comentario").val()
            },
            async: false,
            success: function (data) {
                if (data == 'OK') {
                    self.location.href = 'Visualizar.asp?id=' + $("#id").val();
                }               
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
    });    
</script>

<% call Rodape() %>  