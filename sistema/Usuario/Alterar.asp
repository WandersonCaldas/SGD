<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Usuario/ManterUsuario.asp" -->

<% call cabecalho() %>

<%
id = request("id")
    
set rs = DetalheUsuario(id)  

txt_nome = rs("txt_nome")
txt_email = rs("txt_email")
txt_senha = rs("txt_senha")
cod_ativo = rs("cod_ativo")   

if cod_ativo = 0 then js_go("Listagem.asp")
%>

<div id="page-wrapper" >
    <div id="page-inner">        
        <% call Titulo(application("lb_usuarios") & " > " & application("lb_alterar")) %>
        <hr />
        <div class="row">
            <div class="col-md-12"> 
                <div class="panel panel-default">
                   <div class="panel-body">
                        <div class="col-md-6">
                            <form role="form" id="form1" name="form1">
                                <input type="hidden" id="id" name="id" value="<% =id %>" />
                                <div class="form-group">
                                    <label><% =application("lb_nome") %></label>                                     
                                    <input class="form-control" id="txt_nome" name="txt_nome" value="<% =txt_nome %>" placeholder="<% =application("lb_obrigatorio") %>" />                               
                                    <br />
                                    <label><% =application("lb_email") %></label>                                     
                                    <input class="form-control" id="txt_email" name="txt_email" value="<% =txt_email %>" placeholder="<% =application("lb_obrigatorio") %>" /> 
                                    <br />
                                    <label><% =application("lb_senha") %></label>                                     
                                    <input class="form-control" id="txt_senha" name="txt_senha" value="<% =txt_senha %>" type="password" placeholder="<% =application("lb_obrigatorio") %>" />                                                                                                   
                                </div>
                                <button type="button" id="btn_alterar" name="btn_alterar" class="btn btn-default"><b><% =application("lb_alterar") %></b></button>                                
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
    $("#btn_alterar").click(function () {        
        $.ajax({
            type: 'POST',
            url: 'ManterUsuario.asp?acao=alterar',
            data: {
                id: $("#id").val(),
                txt_nome: $("#txt_nome").val(),
                txt_email: $("#txt_email").val(),
                txt_senha: $("#txt_senha").val()
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