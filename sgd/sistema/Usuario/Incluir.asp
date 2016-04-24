<!-- #include virtual="/sgd/include/conexao.asp" -->
<!-- #include virtual="/sgd/sistema/Usuario/ManterUsuario.asp" -->

<% call cabecalho() %>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_usuarios") & " > " & application("lb_incluir")) %>
        <hr />
        <div class="row">
            <div class="col-md-12"> 
                <div class="panel panel-default">
                   <div class="panel-body">
                        <div class="col-md-6">
                            <form role="form" id="form1" name="form1">
                                <div class="form-group">
                                    <label><% =application("lb_nome") %></label>                                     
                                    <input class="form-control" id="txt_nome" name="txt_nome" placeholder="<% =application("lb_obrigatorio") %>" />                               
                                    <br />
                                    <label><% =application("lb_email") %></label>                                     
                                    <input class="form-control" id="txt_email" name="txt_email" placeholder="<% =application("lb_obrigatorio") %>" /> 
                                    <br />
                                    <label><% =application("lb_senha") %></label>                                     
                                    <input class="form-control" id="txt_senha" name="txt_senha" type="password" placeholder="<% =application("lb_obrigatorio") %>" />                                                                                                   
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
    $("#btn_incluir").click(function () {
        //self.location.href = 'ManterUsuario.asp?acao=incluir&txt_nome=' + $("#txt_nome").val() + '&txt_email=' + $("#txt_email").val() + '&txt_senha=' + $("#txt_senha").val();
        //return;
        $.ajax({
            type: 'POST',
            url: 'ManterUsuario.asp?acao=incluir',
            data: {
                txt_nome: $("#txt_nome").val(),
                txt_email: $("#txt_email").val(),
                txt_senha: $("#txt_senha").val()
            },
            async: false,
            success: function (data) {
                if (data == 'OK') {
                    self.location.href = '/sgd/sistema/Usuario/Listagem.asp';
                }                
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
    });    
</script>

<% call Rodape() %>  