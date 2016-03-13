<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Usuario/ManterUsuario.asp" -->

<% call cabecalho() %>

<%
id = request("id")

txt_acao = request("txt_acao")

set rs = DetalheUsuario(id)  

txt_nome = rs("txt_nome")
txt_email = rs("txt_email")
cod_ativo = rs("cod_ativo")
txt_ativo = LabelAtivo(cod_ativo)

if txt_acao = "excluir" then
    if cod_ativo = 0 then js_go("Listagem.asp")
    txt_titulo = application("lb_excluir")
else
    txt_titulo = application("lb_detalhe")
end if
%>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_usuarios") & " > " & txt_titulo) %>
        <hr />
        <div class="row">
            <div class="col-md-12"> 
                <div class="panel panel-default">
                   <div class="panel-body">
                        <div class="col-md-6">
                            <form role="form" id="form1" name="form1">
                                <input type="hidden" id="id" name="id" value="<% =id %>" />
                                <input type="hidden" id="txt_acao" name="txt_acao" value="<% =txt_acao %>" />
                                <div class="form-group">
                                    <label><% =application("lb_nome") %></label><br />                                     
                                    <% =txt_nome %>
                                    <br /><br />
                                    <label><% =application("lb_email") %></label><br />                                     
                                    <% =txt_email %>
                                    <br /><br />
                                    <label><% =application("lb_ativo") %></label><br />
                                    <% =txt_ativo %>
                                </div>
                                <% call OpcaoAcao(txt_acao, cod_ativo) %>                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>      
    <hr />
</div>

<% 
rs.close() 
set rs = nothing    
%>

<script type="text/javascript">  
    $("#btn_excluir").click(function () {        
        $.ajax({
            type: 'POST',
            url: 'ManterUsuario.asp?acao=excluir',
            data: {
                id: $("#id").val()                
            },
            async: false,
            success: function (data) {
                if (data == 'OK') {
                    self.location.href = '/sistema/Usuario/Listagem.asp';
                }                
            },
            error: function (xhr, status, error) {
                alert(xhr.responseText);
            }
        });
    });    
</script>

<% call Rodape() %>  