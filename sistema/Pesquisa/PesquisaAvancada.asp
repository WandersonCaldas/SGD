<!-- #include virtual="include/conexao.asp" -->
<!-- #include virtual="sistema/Pesquisa/ManterPesquisa.asp" -->
    <% call cabecalho() %>
        <div id="page-wrapper" >
            <div id="page-inner">                                            
                <% call Titulo2(application("lb_pesquisa_avancada") & " > " & application("lb_resultado") ) %>
                <hr /> 
<%
    dim sql, tabela, condicao, campo, rs

    id_demanda              = request("id_demanda")
    txt_titulo              = request("txt_titulo")
    cod_situacao            = request("cod_situacao")
    cod_prioridade          = request("cod_prioridade")
    cod_usuario             = request("cod_usuario")
    cod_usuario_abertura    = request("cod_usuario_abertura")
    cod_usuario_encerrar    = request("cod_usuario_encerrar")
    dt_abertura             = request("dt_abertura")
    dt_encerramento         = request("dt_encerramento")

    if id_demanda <> "" then
        condicao = condicao & " AND tbl_demanda.id_demanda = " & id_demanda
    end if

    if txt_titulo <> "" then
        condicao = condicao & " AND UPPER(tbl_demanda.txt_titulo) LIKE ('%" & ucase(trim(txt_titulo)) & "%')"
    end if

    if cod_situacao <> "" then
        condicao = condicao & " AND tbl_demanda.id_situacao = " & cod_situacao
    end if

    if cod_prioridade <> "" then
        condicao = condicao & " AND tbl_demanda.id_prioridade = " & cod_prioridade
    end if

    if cod_usuario <> "" then
        condicao = condicao & " AND tbl_demanda.cod_usuario_responsavel = " & cod_usuario
    end if

    if cod_usuario_abertura <> "" then
        condicao = condicao & " AND tbl_demanda.cod_usuario_abertura = " & cod_usuario_abertura
    end if

    if cod_usuario_encerrar <> "" then
        condicao = condicao & " AND tbl_demanda.cod_usuario_encerramento = " & cod_usuario_encerrar
    end if

    if dt_abertura <> "" then
        condicao = condicao & " AND tbl_demanda.dt_abertura >= '" & trim(dt_abertura) & "'"
    end if

    if dt_encerramento <> "" then
        condicao = condicao & " AND tbl_demanda.dt_encerramento <= '" & trim(dt_encerramento) & " 23:59:59'"
    end if

    campo = campo & " tbl_demanda.id_demanda, tbl_demanda.txt_titulo, txt_situacao, " 
    campo = campo & " tbl_usuario.txt_nome AS txt_nome_responsavel, txt_prioridade"
    
    tabela = tabela & " INNER JOIN tbl_situacao ON tbl_situacao.id_situacao = tbl_demanda.id_situacao"
    tabela = tabela & " INNER JOIN tbl_usuario ON tbl_usuario.id_usuario = tbl_demanda.cod_usuario_responsavel"
    tabela = tabela & " INNER JOIN tbl_prioridade ON tbl_prioridade.id_prioridade = tbl_demanda.id_prioridade"

    Executar("SET DATEFORMAT DMY")
    sql = "SELECT TOP 500 " & campo & " FROM tbl_demanda " & tabela & " WHERE 1 = 1 " & condicao & " ORDER BY id_demanda"  
    'response.Write(sql)
    set rs = oRecordSet(cstr(sql))
    %>

    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="/sistema/Default.asp"><b><% =application("lb_nova_pesquisa") %></b></a>                                            
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>                                            
                                    <th><center><% =application("lb_numero") %></center></th>
                                    <th><center><% =application("lb_titulo") %></center></th>
                                    <th><center><% =application("lb_situacao") %></center></th>
                                    <th><center><% =application("lb_usuario_responsavel") %></center></th>
                                    <th><center><% =application("lb_prioridade") %></center></th>                                            
                                </tr>
                            </thead>
                            <tbody> <%                                
                                if not rs.eof then %>
                                    <% do while not rs.eof %>
                                        <tr class="odd gradeX">                                                  
                                            <td><center><% =rs("id_demanda") %></center></td>
                                            <td>
                                                <center>
                                                    <a href="/sistema/Demanda/Visualizar.asp?id=<% =rs("id_demanda") %>"><% =rs("txt_titulo") %></a>    
                                                </center>                                                
                                            </td>
                                            <td><center><% =rs("txt_situacao") %></center></td>
                                            <td><center><% =rs("txt_nome_responsavel") %></center></td>  
                                            <td><center><% =rs("txt_prioridade") %></center></td>   
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