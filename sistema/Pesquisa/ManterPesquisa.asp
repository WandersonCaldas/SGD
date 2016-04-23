<!-- #include virtual="sistema/Classes/Situacao/Situacao.asp" -->
<!-- #include virtual="sistema/Classes/Prioridade/Prioridade.asp" -->
<%
Response.Charset = "ISO-8859-1"

dim oSituacao : set oSituacao = new cSituacao
dim oPrioridade : set oPrioridade = new cPrioridade

sub ComboGetSituacao()
    call oSituacao.ComboGetSituacao()
end sub

sub ComboPrioridade()
    call oPrioridade.ComboGetPrioridades()
end sub

sub ComboUsuario()    
    call oUsuario.ComboGetUsuario()
end sub

sub ComboUsuarioAbertura()
    dim rsUsuario

    set rsUsuario = oUsuario.ListaUsuariosAtivos()
    if not rsUsuario.eof then %>                      
        <select id="cod_usuario_abertura" name="cod_usuario_abertura"> 
            <option value=""></option><%
            do while not rsUsuario.eof %>            
                <option value="<% =rsUsuario("id_usuario") %>"><% =rsUsuario("txt_nome") %></option> <%
            rsUsuario.movenext : loop %>
        </select> <%
    end if

    rsUsuario.close()
    set rsUsuario = nothing
end sub

sub ComboUsuarioEncerramento()
    dim rsUsuario

    set rsUsuario = oUsuario.ListaUsuariosAtivos()
    if not rsUsuario.eof then %>                      
        <select id="cod_usuario_encerrar" name="cod_usuario_encerrar"> 
            <option value=""></option><%
            do while not rsUsuario.eof %>            
                <option value="<% =rsUsuario("id_usuario") %>"><% =rsUsuario("txt_nome") %></option> <%
            rsUsuario.movenext : loop %>
        </select> <%
    end if

    rsUsuario.close()
    set rsUsuario = nothing
end sub
%>